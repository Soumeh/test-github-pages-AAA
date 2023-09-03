# About

**Clothier** is a Figura API which allows you to access Manic and Sanguine data like the world's Blood Moon status or your Sanity value.

# Installation

- Download the [Clothier](Clothier.lua) script and put it in your Figura avatar's folder.
- Download the [GSServerNet](https://github.com/GrandpaScout/GSServerNet/blob/main/client/GSServerNet.lua) script and also put it in the same folder.

> If you are playing in singleplayer, running your own server, or would like to use the API on a server, you have to:
> - [Download](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2FGrandpaScout%2FGSServerNet%2Ftree%2Fmain%2Fserver%2FGSServerNet) the [GSServerNet](https://github.com/GrandpaScout/GSServerNet/tree/main/server/GSServerNet) datapack and put it in your world's `datapacks` folder.
> - [Download](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2FSindercube%2FThe-Theatre%2Ftree%2Fmain%2Fclothier%2FClothier) the [Clothier](https://github.com/Sindercube/The-Theatre/tree/main/clothier/Clothier) datapack and put it in the same folder.

# Usage

> **Important**
> You must enable `Chat Messages` in your Figura Settings tab.

Start by importing the API into your avatar's script file.

`script.lua`
```lua
local clothier = require("Clothier")
```

Using the `clothier` variable you can:

- Run a function when all Manic and Sanguine data has been initialized.
```lua
clothier.event.init(function()
    print(clothier.sanity())
    print(clothier.is_blood_moon())
end)
```
- Run a function every time your Sanity value changes.
```lua
clothier.event.sanity_change(function(value)
    print("Your current Sanity is: " .. value)
end)
```
- Get your current Sanity value.
```lua
print(clothier.sanity())
```
> **Note**
> Sanity values are represented as integers from -10 to 10, with -10 being max Lunacy, and 10 being max Sanity.
- Run a function every time the world's Blood Moon status changes.
```lua
clothier.event.blood_moon_change(function(state)
    print("The world's Blood Moon state is: " .. tostring(state))
end)
```
- Get the world's Blood Moon status.
```lua
print(clothier.is_blood_moon())
```