execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function manic:commands/summon/revenant
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s run playsound manic:entity.revenant.ambient ambient @a
advancement revoke @p[advancements={theatre:revenant_spawn_check=true}] only theatre:revenant_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]