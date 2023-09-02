execute if score @s manic.sanity matches 10000 run tellraw @s {"text": "", "font": "svnet:sanity/10"}
execute if score @s manic.sanity matches 9000..9999 run tellraw @s {"text": "", "font": "svnet:sanity/9"}
execute if score @s manic.sanity matches 8000..8999 run tellraw @s {"text": "", "font": "svnet:sanity/8"}
execute if score @s manic.sanity matches 7000..7999 run tellraw @s {"text": "", "font": "svnet:sanity/7"}
execute if score @s manic.sanity matches 6000..6999 run tellraw @s {"text": "", "font": "svnet:sanity/6"}
execute if score @s manic.sanity matches 5000..5999 run tellraw @s {"text": "", "font": "svnet:sanity/5"}
execute if score @s manic.sanity matches 4000..4999 run tellraw @s {"text": "", "font": "svnet:sanity/4"}
execute if score @s manic.sanity matches 3000..3999 run tellraw @s {"text": "", "font": "svnet:sanity/3"}
execute if score @s manic.sanity matches 2000..2999 run tellraw @s {"text": "", "font": "svnet:sanity/2"}
execute if score @s manic.sanity matches 1000..1999 run tellraw @s {"text": "", "font": "svnet:sanity/1"}

execute unless score @s manic.lunacy matches 1..3000 if score @s manic.sanity matches 0..999 run tellraw @s {"text": "", "font": "svnet:sanity/0"}

execute if score @s manic.lunacy matches 1..300 run tellraw @s {"text": "", "font": "svnet:sanity/-1"}
execute if score @s manic.lunacy matches 301..600 run tellraw @s {"text": "", "font": "svnet:sanity/-2"}
execute if score @s manic.lunacy matches 601..900 run tellraw @s {"text": "", "font": "svnet:sanity/-3"}
execute if score @s manic.lunacy matches 901..1200 run tellraw @s {"text": "", "font": "svnet:sanity/-4"}
execute if score @s manic.lunacy matches 1201..1500 run tellraw @s {"text": "", "font": "svnet:sanity/-5"}
execute if score @s manic.lunacy matches 1501..1800 run tellraw @s {"text": "", "font": "svnet:sanity/-6"}
execute if score @s manic.lunacy matches 1801..2100 run tellraw @s {"text": "", "font": "svnet:sanity/-7"}
execute if score @s manic.lunacy matches 2101..2400 run tellraw @s {"text": "", "font": "svnet:sanity/-8"}
execute if score @s manic.lunacy matches 2401..2700 run tellraw @s {"text": "", "font": "svnet:sanity/-9"}
execute if score @s manic.lunacy matches 2701..3000 run tellraw @s {"text": "", "font": "svnet:sanity/-10"}
