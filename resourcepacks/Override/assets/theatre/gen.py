from json import dump, dumps

mapped_mobs = {
    "manic": [
        "chitter",
        "corpsecreep",
        "eidolon",
        "grinn",
        "insomniac",
        "lockjaw",
        "mirage",
        "necromorph",
        "paracusia",
        "piglin_monk",
        "residuum",
        "revenant",
        "siren",
        "sorrowhead",
        "spook",
        "zombee",
    ],
    "sanguine": [
        "butcher",
        "carrion",
        "gore_skeleton",
        "gore_zombie",
        "gurgle",
        "maul",
        "offal",
        "reaper",
        "unborn"
    ]
}

final = []
i = 8359000

for origin, mobs in mapped_mobs.items():

    for mob in mobs:

        data = {"predicate": { "custom_model_data": i }}
        data['model'] = f"theatre:item/{mob}_spawn_egg"
        final.append(data)
        i += 1

    #data = {"parent": "minecraft:item/generated"}
    #data["textures"] = {"layer0": f"theatre:item/{mob}_spawn_egg"}
    #with open(f'{mob}_spawn_egg.json', 'w') as file:
    #    dump(data, file, indent=4)

    #final[f'item.theatre.{mob}_spawn_egg'] = f"{mob.title()} Spawn Egg"

print(dumps(final, indent=4))