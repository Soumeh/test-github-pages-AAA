from json import dump


mapped_mobs = {
    "manic": sorted([
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
        "heretic",
        "zealot",
        "flagellant",
    ]),
    "sanguine": sorted([
        "butcher",
        "carrion",
        "gore_skeleton",
        "gore_zombie",
        "gurgle",
        "maul",
        "offal",
        "reaper",
        "unborn",
        "bruiser",
        "grub",
        "anemone",
    ])
}

i = 8359000

model_data = {
    "parent": "minecraft:item/generated",
    "textures": {
        "layer0": "minecraft:item/item_frame"
    },
    "overrides": []
}


def gen_advancement(mob):

    data = {
        "criteria": {
            "requirement": {
            "trigger": "item_used_on_block",
            "conditions": { "item": { "nbt": f'{{theatre:{{summon:"{mob}"}}}}' } }
            }
        },
        "rewards": { "function": f"theatre:spawn_egg/{mob}" }
    }

    with open(f'advancements/{mob}_spawn_check.json', 'w') as file:
        dump(data, file, indent=4)

def gen_spawn_function(origin, mob):
    
    func = f"""scoreboard players set #persistent manic.dummy 1
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function {origin}:commands/summon/{mob}
advancement revoke @s[advancements={{theatre:{mob}_spawn_check=true}}] only theatre:{mob}_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]"""

    with open(f'functions/spawn_egg/{mob}.mcfunction', 'w') as file:
        file.write(func)

def gen_loot(origin, mob):

    data = {
        "pools": [
            {
            "rolls": 1,
            "entries": [
                {
                "type": "minecraft:item",
                "name": "minecraft:item_frame",
                "functions": [
                    {
                        "function": "minecraft:set_name",
                        "name": {
                            "translate": f"item.theatre.{mob}_spawn_egg",
                            "color": "white",
                            "italic": False
                        }
                    },
                    {
                    "function": "minecraft:set_lore",
                        "lore": [
                            {
                                "translate": f"{origin}.tooltip",
                                "font": f"{origin}:tooltip",
                                "color": "#106050" if origin == 'manic' else "#880f0f",
                                "italic": True,
                                "with": [
                                    {
                                        "translate": "pack.manic",
                                        "font": "minecraft:default",
                                        "color": "#106050",
                                        "italic": True
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "function": "minecraft:set_nbt",
                        "tag": f'{{EntityTag:{{Tags:["theatre.spawn_frame"],Invisible:1,Silent:1}},CustomModelData:{i},theatre:{{summon:"{mob}"}}}}'
                    }
                ]
                }
            ]
            }
        ]
    }

    with open(f'loot_tables/items/{mob}_spawn_egg.json', 'w') as file:
        dump(data, file, indent=4)

def gen_model(mob):

    data = {
        "predicate": {
            "custom_model_data": i
        },
        "model": f"theatre:item/{mob}_spawn_egg"
    }

    model_data['overrides'].append(data)

def finalize_model():

    with open('item_frame.json', 'w') as file:
        dump(model_data, file, indent=4)

for origin, mobs in mapped_mobs.items():
    for mob in mobs:
        gen_advancement(mob)
        gen_spawn_function(origin, mob)
        gen_loot(origin, mob)
        gen_model(mob)
        i += 1
    finalize_model()
