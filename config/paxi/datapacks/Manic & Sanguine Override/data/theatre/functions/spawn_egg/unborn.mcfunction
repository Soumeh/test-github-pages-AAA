execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function sanguine:commands/summon/unborn
advancement revoke @p[advancements={theatre:unborn_spawn_check=true}] only theatre:unborn_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]