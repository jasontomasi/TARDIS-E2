This repo contains multiple Garry's Mod (GMOD) Wiremod E2 for Dr Matt's TARDIS addon



# TARDIS-holomap
This E2 shows a hologram of all TARDISes on the map, and colour codes them according to various factors.

### Instructions:
- Spawn it on a flat surface


Hologram colors:

- **FLICKERING**: In vortex/dematerialising/rematerialising

- **BLUE**: Materialised

- **RED**: Low health 


---


# TARDIS-landing-bay
This E2 simulates a TARDIS/SIDRAT landing bay, and allows you to control other TARDISes on the map by making them to materialise on the 'landing bays' (wiremod GPS chips)


### Instructions:
- Manually spawn enough wiremod GPS entities near the E2 chip (one for each TARDIS on the map)
- Issue commands to the E2 by using chat
**OR**
- Issue commands by the wire inputs (wire buttons directly to the chip)


### Chat commands:

**!recall (RECALL button)**
Find all TARDISes in the map, (forecefully) ready them for travel, and send them to the landing bays. If any TARDISes are at <= 20% health, the E2 will start self-repair on them.

**!clear (RETURN button)**
Sends all previously recalled TARDISes into the vortex, in long flight mode, without a destination

---


# TARDIS-E2
This E2 allows you to control the functions of one TARDIS (your main TARDIS)


### Instructions:
- Wire the E2 to the exterior (outside) of your TARDIS
- Issue commands to the E2 by using chat


### Chat commands:

**!barge**
Find all TARDISes in the map, choose one at random, and dematerialise inside it

**!esc**
Closes the front door, turns on vortex mode, and uses fast dematerialisation to escape into the time vortex

**!lock**
Locks the exterior door

**!mat**
Materialises the TARDIS

**!health**
Prints the health percentage of the TARDIS

**!power**
Toggles power on and off

**!hads**
Toggles HADS on and off

**!repair**
Toggles self-repair on and off

**!where**
Prints info about where your TARDIS is (in the vortex, or coordinates of world location, or whether currently in demat/remat process)

**!hide**
Same as the "!esc" command but also enabled isomorphic security on the console

**!go**
Disables vortex mode and dematerialises/rematerialises at location "0,0,0" of the map (will change this in future because on some maps, "0,0,0" is not a desirable place to be!)

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
- Number of TARDISes spawned on the map

**!me**
Enables physlock to prevent it falling through the floor if you are currently in another TARDIS, and comes to you (will replace the relative location offset with bounding box checks in future when I get better at Expression2 scripting)

**!target (playername)**
Targets players by name (again, will replace the relative location offset with bounding box checks in future when I get better at Expression2 scripting)

**!gps**
Targets a random wiremod GPS, travels to it, and materialises on it


----------------------------------

## **Changelog:**

**V11**
- 

