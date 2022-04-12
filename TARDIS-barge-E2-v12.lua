@name TARDIS Barge
@inputs TARDIS:entity DEMAT MAT ESCAPE BARGE REPAIR POWER HADS GPS
@outputs TARDIS:entity Demat Mat Position0:vector Position1:vector Position2:vector Position3:vector Position4:vector Position5:vector
@persist Holo:entity

runOnChat(1)


if (first()) {

function makeItPretty(Index:number, Model:string, Where:vector, Angle:angle, Size:vector, Skin:string)
	{
    holoCreate(Index,Where,Size,Angle,vec(255,255,255),Model)
    holoMaterial(Index,Skin)

	}
}


if (DEMAT&~DEMAT) {
	if(TARDIS:tardisLongflighted()==0){
		TARDIS:tardisLongflight()
	}
		TARDIS:tardisFastDemat()
}

if (MAT&~MAT) {
		TARDIS:tardisMaterialise()
}

if (ESCAPE&~ESCAPE) {

}

if (BARGE&~BARGE) {

}

if (REPAIR&~REPAIR) {
		TARDIS:tardisSelfrepair()
}

if (POWER&~POWER) {
TARDIS:tardisPower()
}

if (HADS&~HADS) {
		TARDIS:tardisHADS()
                
	if(TARDIS:tardisIsHADS()==1){
		print("HADS: ON")
	}
	elseif(TARDIS:tardisIsHADS()==0){
		print("HADS: OFF")
	}
}

if (GPS&~GPS) {

}


### Script for monitoring chat commands


if(chatClk(owner())) {
    LastSaid = owner():lastSaid():lower():explode(" ")
    COMMAND = LastSaid[1,string]
    ARGUMENT1 = LastSaid[2,string]


if(COMMAND=="!barge") {
    hideChat(1)
    OWNER=TARDIS:owner()
            if(TARDIS:tardisPowered()==0){
					TARDIS:tardisPower()
            }
			if(TARDIS:tardisPhyslocked()==0){
					TARDIS:tardisPhyslock()
            }
	if(TARDIS:tardisLongflighted()==1){
		TARDIS:tardisLongflight()
	}
	if(TARDIS:tardisLocked()==0){
		TARDIS:tardisLock()
	}

    OURSELVES=entity():isConstrainedTo()
    #findExcludeEntity(OURSELVES)
    #print("Excluding: ", OURSELVES)

    findByClass("gmod_tardis_interior")
    TardisFindAll = findSortByDistance(owner():pos())
    TardisCount = findToArray():count()
    Randomchoice = randint(1,TardisCount)
    TardisBarge = findResult(Randomchoice)
    
    Position0 = TardisBarge:toWorld(vec())
    Position1 = TardisBarge:toWorld(vec(-90,-90,0))
    Position2 = TardisBarge:toWorld(vec(40,40,20))
    Position3 = TardisBarge:toWorld(vec(-40,-40,20))
    Position4 = TardisBarge:toWorld(vec(40,-40,20))
    Position5 = TardisBarge:toWorld(vec(-40,40,20))
    Position8 = TardisBarge:boxMax()
    Position9 = TardisBarge:boxMin()

    print("TARDIS located. Attempting ram to: " + Position1)

			if(TARDIS:tardisLocked()==1){
					TARDIS:tardisLock()
			}
            if(TARDIS:tardisInVortex()==1){
					TARDIS:tardisSetDestination(Position1, ang(0,0,0))
					TARDIS:tardisMaterialise()
					timer("WaitingForRemat", 1000)
            }
            elseif(TARDIS:tardisInVortex()==0){
					TARDIS:tardisDemat(Position1, ang(0,0,0))
					timer("WaitingForDemat", 1000)
            }

    makeItPretty(1,"models/effects/splodearc.mdl",Position2,ang(0,0,0),vec(1,1,1),"")
    makeItPretty(2,"models/effects/splodearc.mdl",Position3,ang(0,0,0),vec(1,1,1),"")
    makeItPretty(3,"models/effects/splodearc.mdl",Position4,ang(0,0,0),vec(1,1,1),"")
    makeItPretty(4,"models/effects/splodearc.mdl",Position5,ang(0,0,0),vec(1,1,1),"")
    makeItPretty(5,"hqsphere",Position0+vec(0,0,50),ang(0,0,0),vec(8,8,8),"models/props_combine/com_shield001a")
    
	BOOM1 = effect()
	BOOM1:setDamageType(512)
	BOOM1:setScale(20)
	BOOM1:setMagnitude(100)
	BOOM1:setRadius(400)
	BOOM1:setOrigin(Position0)
	BOOM1:play("Explosion")
    
	timer("deleteholo",17000)

}


elseif(COMMAND=="!esc") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisLongflighted()==0){
		              TARDIS:tardisLongflight()
	        }
    TARDIS:tardisFastDemat()
    }


elseif(COMMAND=="!lock") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
    }


elseif(COMMAND=="!mat") {
    hideChat(1)
            if(TARDIS:tardisInVortex()==1){
		              TARDIS:tardisMaterialise()
            }
    }


elseif(COMMAND=="!health") {
    hideChat(1)
                print("Health: "+TARDIS:tardisHealth()+"%")
    }


elseif(COMMAND=="!power") {
    hideChat(1)
		              TARDIS:tardisPower()
    }


elseif(COMMAND=="!hads") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
		          TARDIS:tardisHADS()
                
            if(TARDIS:tardisIsHADS()==1){
		              print("HADS: ON")
            }
            elseif(TARDIS:tardisIsHADS()==0){
		              print("HADS: OFF")
            }
    }


elseif(COMMAND=="!repair") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
		              TARDIS:tardisSelfrepair()
    }


elseif(COMMAND=="!where") {
    hideChat(1)
            if(TARDIS:tardisInVortex()==1){
		              print("Location: Vortex")
            }
            elseif(TARDIS:tardisInVortex()==0){
                print("Location: Materialised at ",TARDIS:pos())
            }
            if(TARDIS:tardisMoving()==1){
		              print("Location: - DEMAT/REMAT -")
            }
    }


elseif(COMMAND=="!hide") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
                TARDIS:tardisLock()
            }
            if(TARDIS:tardisLongflighted()==0){
		              TARDIS:tardisLongflight()
	        }
            if(TARDIS:tardisIsomorphic()==0){
		              TARDIS:tardisIsomorph()
            }

            TARDIS:tardisFastDemat()
    }


elseif(COMMAND=="!return") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            TARDIS:tardisFastReturn()
    }


elseif(COMMAND=="!go") {
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLongflighted()==1){
		              TARDIS:tardisLongflight()
            }
            if(TARDIS:tardisPowered()==1){
                TARDIS:tardisDemat(vec(0,0,0), ang(0,0,0))
            }

    #TARDIS:tardisSetDestination(vec(0,0,0), ang(0,0,0))
    }


elseif(COMMAND=="!gps") {
    hideChat(1)
    FINDGPS = findByClass("gmod_wire_gps")

	if(FINDGPS > 0) {
            if(TARDIS:tardisPowered()==0){
				        TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisPhyslocked()==0){
		          TARDIS:tardisPhyslock()
            }
            if(TARDIS:tardisLongflighted()==1){
		              TARDIS:tardisLongflight()
            }
    GPSFindAll = findSortByDistance(owner():pos())
    GPSCount = findToArray():count()
    Randomchoice = randint(1,GPSCount)
    GPSLOCATION1 = findResult(Randomchoice)
    GPSLOCATION2 = GPSLOCATION1:toWorld(vec(0,0,2))

            if(TARDIS:tardisInVortex()==1){
					TARDIS:tardisSetDestination(GPSLOCATION2, ang(0,0,0))
					TARDIS:tardisMaterialise()
            }
            if(TARDIS:tardisInVortex()==0){
		              TARDIS:tardisDemat(GPSLOCATION2, ang(0,0,0))
            }
	}

	else {
			print("Can't find GPS to lock on to.")
	}

	}


elseif(COMMAND=="!status") {
    hideChat(1)
		          if(TARDIS:tardisInVortex()==1){
		              print("Location: Vortex")
            }
            elseif(TARDIS:tardisInVortex()==0){
		              print("Location: World")
            }
            if(TARDIS:tardisPowered()==1){
		              print("Power: ON")
            }
            elseif(TARDIS:tardisPowered()==0){
		              print("Power: OFF")
            }
            if(TARDIS:tardisVisible()==0){
		              print("Cloak: ON")
            }
            if(TARDIS:tardisIsHADS()==1){
		              print("HADS: ON")
            }
            elseif(TARDIS:tardisIsHADS()==0){
		              print("HADS: OFF")
            }
			if(TARDIS:tardisSelfrepairing()==1){
		              print("* REPAIRING *")
            }

            print("Was at: ", TARDIS:tardisLastPos())
    }


elseif(COMMAND=="!me") {
    hideChat(1)
            WHEREAMI = owner():pos()
            NEARPLAYER = WHEREAMI + vec(-50,-50,0)
    
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            # REQUIRED: Door is first locked (closed) to enable demat because there is no E2 hook to close the exterior door
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisPhyslocked()==0){
		              TARDIS:tardisPhyslock()
            }
	           if(TARDIS:tardisLongflighted()==1){
		              TARDIS:tardisLongflight()
            }
            	if(TARDIS:tardisLocked()==1){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisInVortex()==1){
					TARDIS:tardisSetDestination(NEARPLAYER, ang(0,0,0))
					TARDIS:tardisMaterialise()
            }
            elseif(TARDIS:tardisInVortex()==0){
		              TARDIS:tardisDemat(NEARPLAYER, ang(0,0,0))
            }
    }


elseif(COMMAND=="!target") {
	if(LastSaid[2,string]){
	hideChat(1)
		PERSON = findPlayerByName(ARGUMENT1)
			if(PERSON:isValid()){
			NEARSUBJECT = PERSON:pos()
			NEARSUBJECT = NEARSUBJECT + vec(-50,-50,0)
			print("Going to: "+PERSON:name())

            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisPhyslocked()==0){
		              TARDIS:tardisPhyslock()
            }
	        if(TARDIS:tardisLongflighted()==1){
		              TARDIS:tardisLongflight()
            }
            # REQUIRED: Door is first locked to enable demat, then unlocked in preparation of the player
            if(TARDIS:tardisLocked()==1){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisInVortex()==1){
					TARDIS:tardisSetDestination(NEARSUBJECT, ang(0,0,0))
					TARDIS:tardisMaterialise()
            }
            elseif(TARDIS:tardisInVortex()==0){
		              TARDIS:tardisDemat(NEARSUBJECT, ang(0,0,0))
            }


		}

		else {
            print("Unable to target this person!")
        }

    }

}
}


if(clk("deleteholo")) {
    holoDeleteAll()
}

