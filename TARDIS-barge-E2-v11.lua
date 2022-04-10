@name TARDIS Barge
@inputs TARDIS:entity
@outputs TARDIS:entity Demat Mat Position1:vector Position2:vector Position3:vector


runOnChat(1)


if((owner():lastSaid()=="!barge")&chatClk(owner())){
    hideChat(1)
    
    OWNER=TARDIS:owner()
    
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
    findExcludeEntity(OURSELVES)
    #print("Excluding: ", OURSELVES)

    findByClass("gmod_tardis_interior")
    TardisFindAll = findSortByDistance(owner():pos())
    TardisCount = findToArray():count()
    Randomchoice = randint(1,TardisCount)
    TardisBarge = findResult(Randomchoice)
    
    print("Count: ", TardisFindAll)
    print("Array: ", +TardisCount)
    print("Rando: ", +Randomchoice)
    print("Chose: ", +TardisBarge)

    Position7 = TardisBarge:toWorld(vec(0,0,90))
    Position6 = TardisBarge:toWorld(vec(0,0,80))
    Position5 = TardisBarge:toWorld(vec(0,0,70))
    Position4 = TardisBarge:toWorld(vec(0,0,0))
    Position3 = TardisBarge:boxMin()
    Position2 = TardisBarge:boxMax()
    Position1 = TardisBarge:toWorld(vec(-90,-90,0))
    print("Actual: ", Position4)
    print("Upperb: ", Position2)
    print("Lowerb: ", Position3)
    print("Offset: ", Position1)
    TARDIS:tardisSetDestination(Position1, ang(0,0,0))
    chatPrint(OWNER,"Attempting to ram TARDIS: " +Position1)

    TARDIS:tardisDemat(Position1, ang(0,0,0))
    timer("WaitingForDemat", 1000)
    TARDIS:tardisMaterialise()
    timer("WaitingForRemat", 1000)

    if(TARDIS:tardisLocked()==1){
		TARDIS:tardisLock()
    }
    }


elseif((owner():lastSaid()=="!esc")){
    hideChat(1)
    
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
            if(TARDIS:tardisLongflighted()==0){
		              TARDIS:tardisLongflight()
	           }
    TARDIS:tardisFastDemat()
    spriteEnable(1,0)
    spriteEnable(2,0)
    }


elseif((owner():lastSaid()=="!lock")){
    hideChat(1)
            if(TARDIS:tardisLocked()==0){
		              TARDIS:tardisLock()
            }
    }


elseif((owner():lastSaid()=="!mat")){
    hideChat(1)
            if(TARDIS:tardisInVortex()==1){
		              TARDIS:tardisMaterialise()
            }
    }


elseif((owner():lastSaid()=="!health")){
    hideChat(1)
                print("Health: "+TARDIS:tardisHealth()+"%")
    }


elseif((owner():lastSaid()=="!power")){
    hideChat(1)
		              TARDIS:tardisPower()
    }


elseif((owner():lastSaid()=="!hads")){
    hideChat(1)
		              TARDIS:tardisHADS()
                
            if(TARDIS:tardisIsHADS()==1){
		              print("HADS: ON")
            }
            elseif(TARDIS:tardisIsHADS()==0){
		              print("HADS: OFF")
            }
    }


elseif((owner():lastSaid()=="!repair")){
    hideChat(1)
		              TARDIS:tardisSelfrepair()
    }


elseif((owner():lastSaid()=="!where")){
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


elseif((owner():lastSaid()=="!hide")){
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              TARDIS:tardisPower()
            }
            if(TARDIS:tardisLocked()==0){
                TARDIS:tardisLock()
            }
            if(TARDIS:tardisIsomorphic()==0){
		              TARDIS:tardisIsomorph()
            }
            
            
            TARDIS:tardisFastDemat()
    }


elseif((owner():lastSaid()=="!go")){
    hideChat(1)
            if(TARDIS:tardisPowered()==0){
		              print("Power: OFF")
            }
            if(TARDIS:tardisLongflighted()==1){
		              TARDIS:tardisLongflight()
            }
            if(TARDIS:tardisPowered()==1){
                TARDIS:tardisDemat(vec(0,0,0), ang(0,0,0))
            }

    #TARDIS:tardisSetDestination(vec(0,0,0), ang(0,0,0))
    }


elseif((owner():lastSaid()=="!status")){
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


elseif((owner():lastSaid()=="!me")){
    hideChat(1)
            WHEREAMI = owner():pos()
            NEARPLAYER = WHEREAMI + vec(-50,-50,0)
    
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
                TARDIS:tardisSetDestination(NEARPLAYER, ang(0,0,0))
                TARDIS:tardisMaterialise()
            }
            elseif(TARDIS:tardisInVortex()==0){
		              TARDIS:tardisDemat(NEARPLAYER, ang(0,0,0))
            }
    }
