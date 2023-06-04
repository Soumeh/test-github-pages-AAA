execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function manic:commands/summon/siren
advancement revoke @p[advancements={theatre:siren_spawn_check=true}] only theatre:siren_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]