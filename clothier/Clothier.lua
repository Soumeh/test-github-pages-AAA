---@module  "Clothier"
---@version v1.0
---@see     The Theatre @ https://github.com/Sindercube/The-Theatre
--- Allows players to access Manic and Sanguine data like Blood Moon status or Sanity values.
---
--- Obviously requires Manic and Sanguine.
--- [!] Important [!] Requires GSServerNet @ https://github.com/GrandpaScout/GSServerNet
--- Download the Datapack @ https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2FGrandpaScout%2FGSServerNet%2Ftree%2Fmain%2Fserver%2FGSServerNet
--- And put it in your world's datapack folder.
--- Download the Figura Script @ https://github.com/GrandpaScout/GSServerNet/blob/main/client/GSServerNet.lua
--- And put it in your Figura avatar's folder.

local SVNet = require("GSServerNet")
--SVNet.await(function(success) end)

local clothierAPI = {}
clothierAPI.event = {}

local blood_moon_change_listeners = {}
local sanity_change_listeners = {}
local is_blood_moon = false
local sanity = 0


function blood_moon_check(_, state)
  is_blood_moon = state
  for i, func in ipairs(blood_moon_change_listeners) do
    func(state)
  end
end
SVNet.receive("blood_moon", blood_moon_check)

function sanity_check(_, state)
  if value == sanity then return end
  sanity = value
  for i, func in ipairs(sanity_change_listeners) do
    func(value)
  end
end
SVNet.receive("sanity", sanity_check)

SVNet.await(function(success)
  if success == false then return end
end)

---Runs a function every time the world's Blood Moon status changes.
---@param func The function to run
function clothierAPI.event.blood_moon_change(func)
  table.insert(blood_moon_change_listeners, func)
end

---Returns whether or not there is a Blood Moon.
---@return boolean
function clothierAPI.is_blood_moon()
  return is_blood_moon
end

---Runs a function every time the player's Sanity value changes.
---@param func The function to run
function clothierAPI.event.sanity_change(func)
  table.insert(sanity_change_listeners, func)
end

---Returns the player's current sanity.
---The output integer is a value from -10 to 10, with -10 being max Lunacy, and 10 being max Sanity.
---@return integer
function clothierAPI.sanity()
  return sanity
end


return clothierAPI