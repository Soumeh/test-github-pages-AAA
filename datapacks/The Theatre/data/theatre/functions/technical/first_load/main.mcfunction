data modify storage theatre:storage root.version.major set value 1
data modify storage theatre:storage root.version.release set value 1
data modify storage theatre:storage root.version.semiver set value 0

data modify storage theatre:storage root.gamerules.blood_moon_sleep set value 0b
execute store result score #gamerules.blood_moon_sleep theatre.dummy run data get storage theatre:storage root.gamerules.blood_moon_sleep