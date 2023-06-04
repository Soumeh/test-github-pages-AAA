execute as @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest] at @s align xyz positioned ~.5 ~ ~.5 run function sanguine:commands/summon/reaper
advancement revoke @p[advancements={theatre:reaper_spawn_check=true}] only theatre:reaper_spawn_check
kill @e[type=item_frame,tag=theatre.spawn_frame,limit=1,sort=nearest]