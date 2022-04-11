### TARDIS-E2
GMOD Wiremod E2 for Dr Matt's TARDIS addon


## **Instructions**:
- Wire the E2 to the exterior (outside) of your TARDIS
- Issue commands to the E2 by using chat


## **Chat commands**:

**!barge**
Find all TARDISes in the map, choose one at random, and dematerialise inside it

**!esc**
Closes the front door, turns on vortex mode, and uses fast dematerialisation to escape into the time vortex

**!lock**
Locks the exterior door

**!mat**
Materialises te TARDIS

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
- Location (last known)

**!me**
Enables physlock to prevent it falling through the floor if you are currently in another TARDIS, and comes to you (will replace the relative location offset with bounding box checks in future when I get better at Expression2 scripting)

**!target (playername)**
Targets players by name (again, will replace the relative location offset with bounding box checks in future when I get better at Expression2 scripting)

----------------------

## **Changelog:**

**V11**
- Removed all holograms
- Renamed "!warp" command to "!barge" (because it 'barges' into other TARDISes)
- Added checks to power on TARDIS for all 'active' commands (commands which instruct the TARDIS to do something or go somewhere)

**v10**

