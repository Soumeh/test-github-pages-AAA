from pathlib import Path
from json import load, dump, dumps


def find_type(data, type):
    for subdata in data:
        if subdata['function'] == 'minecraft:set_' + type:
            return subdata
    return ''


items = Path(".").rglob("*.json")
items = sorted(items)

def main():

    final_data = []
    for path in items:

        with open(path, 'r') as file:
            data: dict = load(file)

        item: dict = data['pools'][0]['entries'][0]

        functions: dict = item.get('functions', None)
        if not functions:
            continue

        new_data = {}
        new_data['name'] = item['name']

        nbt = find_type(functions, 'nbt')['tag'].split('{', 1)[1].rsplit('}', 1)[0]
        
        name = find_type(functions, 'name')
        if name:
            name = dumps(name['name'], separators=(',', ':')).replace('"', '\"')

        lore = find_type(functions, 'lore')
        if lore:
            lore = lore['lore']
            lore = [f"{dumps(i, separators=(',', ':'))}" for i in lore]

        display_nbt = f"display:{{Name:'{name}',Lore:{lore}}}"

        new_data['nbt'] = '{' + display_nbt + ',' + nbt + '}'
        final_data.append(new_data)


    with open('result.json', 'w') as file:
        dump(final_data, file, indent=4)

if __name__ == '__main__':
    main()