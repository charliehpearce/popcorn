from neo4j import GraphDatabase
from flask import Flask

uri= 'neo4j://localhost:7474/'
driver = GraphDatabase(uri, auth=('neo4j','password'))

