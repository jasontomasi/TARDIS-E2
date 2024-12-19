My repo for Garry's Mod (GMOD) Wiremod E2's, to control Dr Matt's TARDIS addon

These E2's utilise the wiremod E2 functions which are documented here:
https://github.com/MattJeanes/TARDIS/blob/dev/lua/entities/gmod_wire_expression2/core/custom/cl_tardis.lua



# TARDIS-holomap
This E2 shows a hologram of all TARDISes on the map, and colour codes them according to various factors.

### Instructions:
- Spawn it on a flat surface


Hologram colors:

- **WHITE**: In vortex

- **YELLOW**: Dematerialising/Rematerialising

- **BLUE**: Materialised

- **RED**: Low health / damaged


---


# TARDIS-landing-bay
This E2 simulates a TARDIS/SIDRAT landing bay, and allows you to control all TARDISes on the map by making them to materialise on the 'landing bays' (wiremod GPS chips)


### Instructions:
- In multiplayer, the functionality will depend on prop protection permissions
- Manually spawn enough wiremod GPS entities near the E2 chip (one GPS for each TARDIS on the map)
- Issue commands to the E2 by using chat
**OR**
- Issue commands by wiring a button/level/console/(whatever) to the wire inputs on the E2 chip


### Chat commands:

**!recall**
Find all TARDISes in the map, prepares them for travel, and brings them to the landing bays. If any TARDISes are at <= 20% health, the E2 will start self-repair on them.

**!clear**
Clears all TARDISes from the landing bays and sends them, without a destination, into the vortex

---


# TARDIS-E2
This E2 allows you to control the functions of one TARDIS (your main TARDIS)


### Instructions:
- Wire the E2 to the exterior (outside) of your TARDIS
- Issue commands to the E2 by using chat


### Chat commands:

**NOTE: most of these commands will first check whether the TARDIS power is on, then turn it on**

**!barge**
Find all TARDISes in the map, target one of them at random, and materialise inside it

**!esc**
Closes the front door, turns on vortex mode, and uses fast dematerialisation to escape into the time vortex

**!lock**
Locks the exterior door

**!phys**
Toggles the physical lock

**!mat**
Materialises the TARDIS

**!health**
Prints the health percentage of the TARDIS

**!power**
Toggles power on and off

**!brake**
Toggles handbrake on and off

**!hads**
Toggles HADS on and off

**!repair**
Toggles self-repair on and off

**!where**
Prints info about where your TARDIS is (in the vortex, or coordinates of world location, or whether currently in demat/remat process)

**!return**
Does the fast-return process on the TARDIS

**!hide**
Same as the "!esc" command but also enables isomorphic security on the console

**!go <PLAYERNAME>**
Targets players by name and demats/mats the TARDIS at their location

**!status**
Prints info on the TARDIS:
- Location (world or time vortex)
- Power (on or not)
- Cloak (on or not)
- HADS (on or not)
- Repairing (on or not)
- Health %
- Location (last known)
- TARDIS size (dimensions of exterior shell)
- Number of TARDISes spawned on the map (including other people's)

**!me**
Enables physlock to prevent it falling through the floor if you are currently in another TARDIS, and comes to you (will replace the relative location offset with bounding box checks in future when I get better at Expression2 scripting)

**!gps**
Targets a random wiremod GPS, travels to it, and materialises on it

**!death**
When player dies, TARDIS will mat at player's spawn location

**!fly**
Toggles Flight mode on and off

**!drift**
(Testing) Just making this as a demat/mat loop, to deliberately waste fuel


----------------------------------

## **Changelog:**

**V11**
- 

