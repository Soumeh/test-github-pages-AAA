# Dummy
scoreboard objectives add theatre.dummy dummy

# Initialise
scoreboard players set #theatre.installed theatre.dummy 1
execute unless data storage theatre:storage root.version{major:1,release:1,semiver:0} run function theatre:technical/first_load/main
