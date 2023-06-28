scoreboard players set #persistent manic.dummy 1
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function manic:commands/summon/spook
advancement revoke @s[advancements={theatre:spook_spawn_check=true}] only theatre:spook_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]