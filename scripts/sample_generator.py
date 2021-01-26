import pandas as pd 
import os

base = '/Users/charleshjpearce/Desktop/Projects/movie_recomendation/ml-25m'
movies = pd.read_csv(base+'/movies.csv')
ratings = pd.read_csv(base+'/ratings.csv').drop('timestamp',axis=1)

print(ratings.columns)

print('Input sample size')
sample_size = int(input())

def string_to_list(string):
    lst = string.split('|')
    return lst

movies['genre_lst'] = movies['genres'].apply(lambda x: string_to_list(x))
movies = movies.drop('genres', axis = 1)

#generate a sample of movies from the dataframe
sample_movies = movies.sample(n=sample_size, random_state=123, axis=0)
sample_movies_titles = sample_movies.drop(['title','genre_lst'],axis=1).reset_index(drop=True)
sample_ratings = sample_movies_titles.merge(ratings, how='left', left_on='movieId', right_on='movieId')

#set indexes
sample_movies = sample_movies.set_index('movieId')
sample_ratings = sample_ratings.set_index('userId')

#output to induvidual csvs
sample_movies.to_csv(base+'/sample_movies.csv')
sample_ratings.to_csv(base+'/sample_ratings.csv')

sample_movies_disksize = os.path.getsize(base+'/sample_movies.csv')
sample_ratings_disksize = os.path.getsize(base+'/sample_ratings.csv')
disk_size = sample_movies_disksize + sample_ratings_disksize
disk_size_MB = disk_size/(10**6)

print(f'done for n={sample_size} samples with a combined disk size of {disk_size_MB}MB')