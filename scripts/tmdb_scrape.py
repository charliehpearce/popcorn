import pandas as pd
import requests as re
import json

# keys etc
tmdb_api_key = '066fd2f276639da2465c0ded06948812'

# Load dataframe
path = '../data/movie_ids.csv'
movies = pd.read_csv(path)

# Get request and parse it into induvidual values, return as result of function
def some_function(film, api_key): 
    film_name = film[0:-7]
    film_year = film[-5:-1]
    result = re.get(f'https://api.themoviedb.org/3/search/movie?api_key={api_key}&query={film_name}&include_adult=false&year={film_year}')
    parsed_result = json.loads(result.text)['results'][0]
    id = parsed_result['id']
    title = parsed_result['original_title']
    summary = parsed_result['overview']
    popularity = parsed_result['popularity']
    poster_path = parsed_result['poster_path']
    backdrop_path = parsed_result['backdrop_path']
    average_vote = parsed_result['vote_average']
    release_date = parsed_result['release_date']
    print(str(result.status_code)+f' for {film}')

    return(id,title,summary,popularity,poster_path,backdrop_path,average_vote, release_date)

# Call request function for every film value and add it lists
id, title, summary, popularity, poster_path, average_vote, backdrop_path, release_date = [],[],[],[],[],[],[],[]
for _, row in movies.iterrows():
    var_id, var_title, var_summary, var_popularity, var_poster_path, var_backdrop_path, var_average_vote, var_release_date = some_function(row[['id']].values,tmdb_api_key)
    id.append(var_id)
    title.append(var_title)
    summary.append(var_summary)
    popularity.append(var_popularity)
    poster_path.append(var_poster_path)
    average_vote.append(var_average_vote)
    backdrop_path.append(var_backdrop_path)
    release_date.append(var_release_date)

# Append lists to dataframe
movies['title'] = title 
movies['summary'] = summary
movies['populatity'] = popularity
movies['poster_path'] = poster_path
movies['backdrop_path'] = backdrop_path
movies['averge_vote'] = average_vote
movies['release_date'] = release_date

# Output dataframe
movies.to_csv('../data/movies.csv')