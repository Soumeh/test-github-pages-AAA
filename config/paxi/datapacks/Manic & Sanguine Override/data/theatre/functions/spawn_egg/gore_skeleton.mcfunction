execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function sanguine:commands/summon/gore_skeleton
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s run playsound sanguine:entity.gore_skeleton.ambient ambient @a
advancement revoke @p[advancements={theatre:gore_skeleton_spawn_check=true}] only theatre:gore_skeleton_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]