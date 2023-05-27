from pathlib import Path
from json import load, dump


map = {}


for path in Path(".").rglob("*.json"):
    with open(path, 'r') as file:
        data: dict = load(file)
        if not data.get('parent', None):
            continue
        parent: str = data['parent']
        if 'insomniacs.' not in parent:
            continue
        data['parent'] = parent.replace('insomniacs.', '')
        map[path] = data
    
for path, data in map.items():
    with open(path, 'w') as file:
        dump(data, file, indent=4)