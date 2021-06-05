import sqlite3 
from sqlite3 import Error
import requests as re
import json
import pandas as pd
from concurrent.futures import ThreadPoolExecutor, as_completed
import numpy as np
from queue import Queue

# Create database schema and add each of the movie ids to the table
def create_sql_connection(db_file):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_file, check_same_thread=False)
        print(sqlite3.version)
    except Error as e:
        print(e)
    return conn

def create_table(conn, create_table_sql):
    try:
        c = conn.cursor()
        c.execute(create_table_sql)
    except Error as e:
        print(e)

def get_from_tmdb(movie_id, api_key):
    result = re.get(f'https://api.themoviedb.org/3/movie/{movie_id}?api_key={api_key}')
    parsed_result = json.loads(result.text)
    print(str(result.status_code)+f' for {movie_id}')
    return parsed_result

def get_movie_ids(movie_file_csv):
    data = np.genfromtxt(movie_file_csv, delimiter=',', dtype='int')[:,2]
    return data

def insert_movie_to_db(conn, pr):
    params = (pr['id'],pr['original_title'],pr['overview'],pr['popularity'],pr['poster_path'],pr['backdrop_path'],pr['vote_average'],str(pr['release_date']))
    sql = f'''INSERT INTO movies (id,name,summary,popularity,poster_path,backdrop_path,average_vote,release_date) VALUES(?,?,?,?,?,?,?,?);'''
    cur = conn.cursor()
    cur.execute(sql, params)
    conn.commit()
    return cur.lastrowid

def main():
    # Create db table with schema
    db = './db/movies.db'
    sql_create_movies_table = """ CREATE TABLE IF NOT EXISTS movies(
        id integer PRIMARY KEY,
        name text,
        summary text,
        popularity float,
        poster_path text,
        backdrop_path text,
        average_vote float,
        release_date date);"""

    conn = create_sql_connection(db)
    if conn is not None:
        create_table(conn, sql_create_movies_table)
    else:
        print('invalid connection')
    conn.close()

def get_film_add_to_db(conn, m_id, api_key):
    try:
        resp = get_from_tmdb(m_id,tmdb_api_key)
        insert_movie_to_db(conn, resp)
    except Exception as e:
        print(e)
    

if __name__ == '__main__':
    main()
    tmdb_api_key = '066fd2f276639da2465c0ded06948812'  
    conn = create_sql_connection('./db/movies.db') 
    movie_ids = list(get_movie_ids('../data/movie_ids.csv')[:1000])

    procs = []
    with ThreadPoolExecutor(max_workers=20) as exec:
        for m_id in movie_ids:
            procs.append(exec.submit(get_film_add_to_db, conn, m_id, tmdb_api_key))

    print('done')
