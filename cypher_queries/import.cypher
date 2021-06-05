CREATE CONSTRAINT ON (m:Movie) ASSERT m.id is UNIQUE;
CREATE CONSTRAINT ON (u:User) ASSERT u.id is UNIQUE;

//create nodes for movies
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM 'file:///movies.csv' AS row
WITH row.movieId AS movieID, row.title AS title, row.genre_lst AS genres
MERGE (m:Movie {id: movieID})
    SET m.title = title, m.genres = genres
RETURN count(m);

USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM 'file:///ratings.csv' AS row
//drops null vals, cant import null as id
WITH row.userId AS userID WHERE userID IS NOT NULL
// create user nodes
MERGE (u:User {id: userID})
RETURN count(u);

//create relationships between nodes
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM 'file:///ratings.csv' AS row
WITH row.userId AS userID, row.movieId as movieID, row.rating as rating
// match nodes
MATCH(user:User {id:userID})
MATCH(movie:Movie {id:movieID})
//create relationships
MERGE (user)-[:RATING {rating: toFloat(rating)}]->(movie);