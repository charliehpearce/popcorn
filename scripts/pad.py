import pandas as pd 

df = pd.read_csv('./ml-25m/ratings.csv')
ids = df['userId'].nunique()
print(ids)