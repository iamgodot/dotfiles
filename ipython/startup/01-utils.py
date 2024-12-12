import json


def load_json(path):
    with open(path) as f:
        return json.load(f)


print("Preloaded json module")
print("Preloaded load_json function for reading a json file")
