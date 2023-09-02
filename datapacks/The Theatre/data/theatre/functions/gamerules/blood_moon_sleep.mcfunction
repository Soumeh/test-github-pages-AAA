execute if score #gamerules.blood_moon_sleep theatre.dummy matches 1 run data modify storage theatre:storage root.gamerules.blood_moon_sleep set value 0b
execute if score #gamerules.blood_moon_sleep theatre.dummy matches 0 run data modify storage theatre:storage root.gamerules.blood_moon_sleep set value 1b
execute store result score #gamerules.blood_moon_sleep theatre.dummy run data get storage theatre:storage root.gamerules.blood_moon_sleep
