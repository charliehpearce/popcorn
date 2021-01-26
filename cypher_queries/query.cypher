//given a movie, match movies that other users have the most connections to, **should be weighted by rating value, maybe strength*rating**
MATCH (m1:Movie {title: "Back to the Future Part III (1990)"})<-[r:RATING]-(u)-[RATING]->(m2)
//where m1 isnt m2, rating is above 3.5 and not in given list of films (already seen)
WHERE m1 <> m2 AND r.rating > 3.5 AND NOT m2.title IN ["When Harry Met Sally... (1989)","American Beauty (1999)",'Jaws (1975)']
WITH avg(r.rating) * (count(m2)) AS Strength, m2
RETURN m2.title AS title, Strength
ORDER BY Strength DESC
LIMIT 20;

// perfecto!! Maybe filter by genre  
MATCH (m1:Movie {title: "Parasite (2019)"})<-[RATING]-(u)-[r:RATING]->(m2)
WHERE m1 <> m2 AND r.rating > 3.5 AND NOT m2.title IN [] 
WITH avg(r.rating) AS avg_rating, count(r) AS Count_1, m2, size((m2)<--()) as Count_2
WHERE count(r) > 50
RETURN m2.title AS title, 1.0*avg_rating*Count_1/Count_2 AS agg
ORDER BY agg DESC 
LIMIT 20;

MATCH (m1:Movie {id: "180435"})<-[RATING]-(u)-[r:RATING]->(m2)
WHERE m1 <> m2 AND r.rating > 3.5 AND NOT m2.id IN [] 
WITH avg(r.rating) AS avg_rating, count(r) AS Count_1, m2, size((m2)<--()) as Count_2
WHERE count(r) > 1
RETURN m2.id AS id, 1.0*avg_rating*Count_1/Count_2 AS agg
ORDER BY agg DESC 
LIMIT 20;
