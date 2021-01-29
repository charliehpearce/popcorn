import pandas as pd

frame = pd.read_json('../data/movie_ids_01_29_2021.json', lines=True)
dropped = frame.drop(columns=['original_title','popularity','video'],axis=1)
no_porn = dropped[dropped['adult'] != 'True']
print(len(no_porn))
print(len(dropped))
