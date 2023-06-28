execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function manic:commands/summon/grinn
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s run playsound manic:entity.grinn.ambient ambient @a
advancement revoke @p[advancements={theatre:grinn_spawn_check=true}] only theatre:grinn_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]