execute unless score #blood_moon_phase_cache theatre.dummy = #sanguine.blood_moon.phase sanguine.dummy if score #sanguine.blood_moon.phase sanguine.dummy matches 1..2 run tellraw @s {"text": "", "font": "svnet:blood_moon/true"}
execute unless score #blood_moon_phase_cache theatre.dummy matches 0 unless score #sanguine.blood_moon.phase sanguine.dummy matches 1..2 run tellraw @s {"text": "", "font": "svnet:blood_moon/false"}

execute store result score #blood_moon_phase_cache theatre.dummy run scoreboard players get #sanguine.blood_moon.phase sanguine.dummy
