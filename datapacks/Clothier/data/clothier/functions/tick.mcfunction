scoreboard players add #timer clothier.dummy 1 

# Send Blood Moon Data
execute as @a if score @s svnet_connected matches 1 run function clothier:send/blood_moon

# Send Sanity Data
execute as @a if score #timer clothier.dummy matches 200.. if score @s svnet_connected matches 1 if score @s svnet_connected matches 1 run function clothier:send/sanity

execute if score #timer clothier.dummy matches 200.. run scoreboard players set #timer clothier.dummy 0