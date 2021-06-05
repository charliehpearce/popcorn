from neo4j import Driver, GraphDatabase
import pandas as pd 
from tqdm import tqdm, tqdm_pandas

class get_movie_reccomendation:
    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user,password))
    
    def close(self):
        self.driver.close()
    
    def getMovie(self,movieID,noresults):
        session = self.driver.session()
        result = session.run(
            'MATCH (m1:Movie {id: $movieID})<-[RATING]-(u)-[r:RATING]->(m2) '
            'WHERE m1 <> m2 AND r.rating > 3.5 AND NOT m2.id IN [] '
            'WITH avg(r.rating) AS avg_rating, count(r) AS Count_1, m2, size((m2)<--()) as Count_2 '
            'WHERE count(r) > 50 '
            'RETURN m2.id AS id, 1.0*avg_rating*Count_1/Count_2 AS agg '
            'ORDER BY agg DESC '
            'LIMIT $noresults',noresults=noresults, movieID=movieID
        )
        records = []
        for record in result:
            records.append({"id": record['id'], "score": record['agg']})
        return records

if __name__ == '__main__':
    movies = pd.read_csv('../data/movie_head.csv')
    getter = get_movie_reccomendation(uri='bolt://localhost:7687', user='neo4j',password='password')
    tqdm.pandas()
    movies['rec_movies'] = movies['movieId'].progress_apply(lambda x: getter.getMovie(movieID=str(x),noresults=150))
    movies.to_csv('../data/head_output.csv')
    
# Maybe split dataframe into thousands for better processing 

