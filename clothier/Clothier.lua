---@module  "Clothier"
---@version v1.1
---@see     The Theatre @ https://github.com/Sindercube/The-Theatre
--- Allows players to access Manic and Sanguine data like Blood Moon status or Sanity values.
---
--- Obviously requires Manic and Sanguine.
--- [!] Important [!] Requires GSServerNet @ https://github.com/GrandpaScout/GSServerNet
--- For information on how to set up the script, read the readme.

local SVNet = require("GSServerNet")

local clothierAPI = {}
clothierAPI.event = {}

local event_listeners = {}
event_listeners.blood_moon_change = {}
event_listeners.sanity_change = {}
event_listeners.init = {}

local is_blood_moon = false
local sanity = 0
sanity = 0 -- ???


function confirm_data(_)
  for i, func in ipairs(event_listeners.init) do
    func()
  end
end
SVNet.receive("clth_init", confirm_data)

function blood_moon_check(_, state)
  is_blood_moon = state
  for i, func in ipairs(event_listeners.blood_moon_change) do
    func(is_blood_moon)
  end
end
SVNet.receive("clth_blood_moon", blood_moon_check)

function sanity_check(_, value)
  if value == sanity then return end
  sanity = value
  for i, func in ipairs(event_listeners.sanity_change) do
    func(sanity)
  end
end
SVNet.receive("clth_sanity", sanity_check)


---Runs a function when the client connects to the SVNet server.
---This guarantees that all values are synced with the server.
---@param func The function to run
function clothierAPI.event.init(func)
  table.insert(event_listeners.init, func)
end

---Runs a function every time the world's Blood Moon status changes.
---@param func The function to run
function clothierAPI.event.blood_moon_change(func)
  table.insert(event_listeners.blood_moon_change, func)
end

---Returns whether or not there is a Blood Moon.
---@return boolean
function clothierAPI.is_blood_moon()
  return is_blood_moon
end

---Runs a function every time the player's Sanity value changes.
---Actually runs every 10 seconds, but only if the player's Sanity value is changed.
---@param func The function to run
function clothierAPI.event.sanity_change(func)
  table.insert(event_listeners.sanity_change, func)
end

---Returns the player's current sanity.
---The output integer is a value from -10 to 10, with -10 being max Lunacy, and 10 being max Sanity.
---@return integer
function clothierAPI.sanity()
  return sanity
end


return clothierAPI