@name TARDIS Barge
@inputs TARDIS:entity
@outputs TARDIS:entity Demat Mat Position1:vector Position2:vector Position3:vector
@persist Fairy:entity Holopos1:vector Holopos2:vector Holorad


runOnChat(1)


function holopos(HOLOPOS:vector) {

    HOLOPOS = HOLOPOS + vec(0,0,50)
    
    timer("createholograms",0.5)

if(clk("createholograms")){
    spriteSpawn(1,"sprites/light_glow03.vmt",HOLOPOS,vec(255,255,255),128,2)
    spriteSetRendermode(1,3)
    timer("deleteholograms",14000)
}

if(clk("deleteholograms")){
    holoDelete(1)
    holoDelete(2)
    holoDelete(3)
    holoDelete(4)
    spriteEnable(1,0)
}

}


if((owner():lastSaid()=="!warp")&chatClk(owner())){
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
    print("Excluding: ", OURSELVES)

    findByClass("gmod_tardis_interior")
    TardisFindAll = findSortByDistance(owner():pos())
    TardisCount = findToArray():count()
    Randomchoice = randint(1,TardisCount)
    TardisBarge = findResult(Randomchoice)
    
    print("Count: ", TardisFindAll)
    print("Total: ", +TardisCount)
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


Holopos1 = Holopos1 + vec(0,0,50)
Holopos2 = Holopos1 + vec(0,0,-20)

Fairy = propSpawn("models/props_moonbase/moon_gravel_crystal_red.mdl",Holopos1,1)

Fairy:setMass(40)
Fairy:applyForce(((Holopos1 - Fairy:pos()) * 3 - Fairy:vel()) * Fairy:mass())


# Tube
holoCreate(0, Position4)
holoParent(0, Fairy)
holoModel(0, "icosphere4")
holoMaterial(0, "models/effects/pyro/pilotlight")
holoScale(0, vec(7,7,80))
holoAlpha(0, 255)

# Circle
holoCreate(1, Position1)
holoParent(1, Fairy)
holoModel(1, "sphere3")
holoMaterial(1, "Models/effects/comball_tape")
holoScale(1, vec(20,20,20))
holoAlpha(1, 255)

# Circle
holoCreate(2, Position1)
holoParent(2, Fairy)
holoModel(2, "sphere3")
holoMaterial(2, "Models/effects/comball_tape")
holoScale(2, vec(18,18,18))
holoAlpha(2, 255)

# Circle
holoCreate(3, Position1)
holoParent(3, Fairy)
holoModel(3, "sphere3")
holoMaterial(3, "Models/effects/comball_tape")
holoScale(3, vec(16,16,16))
holoAlpha(3, 255)

# Circle
holoCreate(4, Position1)
holoParent(4, Fairy)
holoModel(4, "sphere3")
holoMaterial(4, "Models/effects/comball_tape")
holoScale(4, vec(14,14,14))
holoAlpha(4, 255)


    #spriteSpawn(2,"sprites/light_glow03.vmt",Position5,vec(255,255,255),128,4)
    #spriteSetRendermode(2,3)
    #spriteEnable(2,1)

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
		              tardisSelfrepair()
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
                holopos(vec(0,0,0))
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
