MATCH (m1:Movie {title: "Iron Man (2008)"})<-[RATING]-(u)-[r:RATING]->(m2)
WHERE m1 <> m2 AND r.rating > 3.5 AND NOT m2.title IN [] 
WITH avg(r.rating) AS avg_rating, count(r) AS Count_1, m2, size((m2)<--()) as Count_2
WHERE count(r) >= 50
RETURN m2.title AS title, 1.0*avg_rating*Count_1/Count_2 AS agg
ORDER BY agg DESC 
LIMIT 20;