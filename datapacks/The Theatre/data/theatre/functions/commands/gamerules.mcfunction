tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",{"text":"\ua000","font":"theatre:tooltip","color":"white"}," ",{"translate":"pack.theatre.prefix","bold":true,"color":"#ffff00"},{"text":" "},{"translate":"pack.theatre","bold":true,"color":"#00ffff"},{"text":" >> ","color":"#0077bb"},{"translate":"gamerules.manic.title","color":"#ffff00"},"\n","\n"]

# Blood Moon Sleeping
execute store result score #blood_moon_sleep theatre.dummy run data get storage theatre:storage root.gamerules.blood_moon_sleep
execute if score #blood_moon_sleep theatre.dummy matches 0 run tellraw @s {"color":"#0077bb","translate":"gamerules.manic.entry","with":[{"translate":"gamerules.theatre.blood_moon_sleep"},{"translate":"gamerules.manic.false","color":"#ffff00"}],"hoverEvent":{"action":"show_text","contents":[{"translate":"gamerules.theatre.blood_moon_sleep.description","color":"gray"},"\n\n",{"translate":"gamerules.manic.default","color":"yellow","with":[{"translate":"gamerules.manic.false"}]}]},"clickEvent":{"action":"run_command","value":"/function theatre:gamerules/blood_moon_sleep"}}
execute if score #blood_moon_sleep theatre.dummy matches 1 run tellraw @s {"color":"#0077bb","translate":"gamerules.manic.entry","with":[{"translate":"gamerules.theatre.blood_moon_sleep"},{"translate":"gamerules.manic.true","color":"#00ffff"}],"hoverEvent":{"action":"show_text","contents":[{"translate":"gamerules.theatre.blood_moon_sleep.description","color":"gray"},"\n\n",{"translate":"gamerules.manic.default","color":"yellow","with":[{"translate":"gamerules.manic.false"}]}]},"clickEvent":{"action":"run_command","value":"/function theatre:gamerules/blood_moon_sleep"}}

tellraw @s ["\n",{"translate":"gamerules.manic.reset","color":"#ffff00","clickEvent":{"action":"run_command","value":"/function theatre:technical/first_load/main"}}]

function nucleus:entity/player/commands/no_feedback/main
playsound minecraft:block.wooden_button.click_on block @s