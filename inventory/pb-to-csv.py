import json
import csv

keys = []

with open('./pbexport.json') as f:
    data = json.load(f)
    for part in data["parts"]:
        id = part["id"]
        description = part["description"]
        mfg = part["manufacturer"]
        stock = part["stock"]
        name = part["name"]
        if stock != None:
            stock = stock[0]
            if stock != None:



print(keys)

#  !uv run pb-to-csv.py
