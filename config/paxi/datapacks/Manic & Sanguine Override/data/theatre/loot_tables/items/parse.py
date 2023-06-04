# { "name": "minecraft:warped_fungus_on_a_stick", "nbt": "{ display: {Name: '{\"italic\":false,\"translate\":\"item.manic.anima_shackles\"}', Lore: ['{\"italic\":true,\"color\":\"#106050\",\"translate\":\"pack.manic\"}']}, Unbreakable: 1, CustomModelData: 8360009, HideFlags: 37, manic: {id: 'anima_shackles', shackle_data: {pos: [0.0, 0.0, 0.0], dimension: 'minecraft:overworld'}, shackles_bound: 0} }" }

from pathlib import Path
from json import load, dump, dumps


def find_type(data, type):
    for subdata in data:
        if subdata['function'] == 'minecraft:set_' + type:
            return subdata
    return ''

final_data = []

items = Path(".").rglob("*.json")
items = sorted(items)

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
    
with open('!result.json5', 'w') as file:
    dump(final_data, file, indent=4)
