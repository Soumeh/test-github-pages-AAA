execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function manic:commands/summon/corpsecreep
execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s run playsound manic:entity.corpsecreep.ambient ambient @a
advancement revoke @p[advancements={theatre:corpsecreep_spawn_check=true}] only theatre:corpsecreep_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]