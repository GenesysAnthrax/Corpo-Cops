registerForEvent("onInit", function ()
    debugMode = true

    arasakaPassengers = {}
    militechPassengers = {}
    kangtaoPassengers = {}
    traumateamPassengers = {}
    zetatechPassengers = {}
    biotechnicaPassengers = {}
    maxtacPassengers = {}

    avCount = 0
    chimeraBossActive = false

    setCharacterToPrevention = function (characterTweak, factionTag)
        local newChar = characterTweak.."HitSquadUnit"
        TweakDB:CloneRecord(newChar, characterTweak)
        TweakDB:SetFlat(newChar..".baseAttitudeGroup", "police")
        TweakDB:SetFlat(newChar..".contentAssignment", "DeviceContentAssignment.MaxTacPrevention")
        TweakDB:SetFlat(newChar..".minigameInstance", "minigame_v2.DefaultMinigame")
        TweakDB:SetFlat(newChar..".priority", "SpawnableObjectPriority.Quest")
        TweakDB:SetFlat(newChar..".reactionPreset", "ReactionPresets.Police_Aggressive")
        TweakDB:SetFlat(newChar..".sensePreset", "Senses.MaxTac")
        TweakDB:SetFlat(newChar..".tags",{"InActivePoliceChase", "MaxTac_Prevention", "Cyberpsycho", "allow_finisher_threshold"})
        -- TweakDB:SetFlat(newChar..".statModifierGroups", {""})
        TweakDB:SetFlat(newChar..".threatTrackingPreset", "TargetTracking.CyberpsychoPreset")
        TweakDB:SetFlat(newChar..".visualTags", {"Arasaka", "Militech", "KangTao", "TraumaTeam", "Zetatech", "Biotechnica", "MaxTac"})
        if factionTag == "ARASAKA" then
            table.insert(arasakaPassengers, newChar)
        elseif factionTag == "MILITECH" then
            table.insert(militechPassengers, newChar)
        elseif factionTag == "KANGTAO" then
            table.insert(kangtaoPassengers, newChar)
        elseif factionTag == "TRAUMATEAM" then
            table.insert(traumateamPassengers, newChar)
        elseif factionTag == "ZETATECH" then
            table.insert(zetatechPassengers, newChar)
        elseif factionTag == "BIOTECHNICA" then
            table.insert(biotechnicaPassengers, newChar)
        elseif factionTag == "MAXTAC" then
            table.insert(biotechnicaPassengers, newChar)
        end
    end


    setVehicleToPrevention = function (vehicleRecordTweak, bIsBike)
        if bExtraPassengers == nil then
            bExtraPassengers = false
        end
        local newVehicle = vehicleRecordTweak.."HitSquadUnit"
        TweakDB:CloneRecord(newVehicle, vehicleRecordTweak)
        local randomValue = math.random(5)
        local chooseTable = {arasakaPassengers, militechPassengers, kangtaoPassengers, zetatechPassengers, biotechnicaPassengers}
        TweakDB:SetFlat(newVehicle..".preventionPassengers", chooseTable[randomValue])
        if not bExtraPassengers then
            TweakDB:SetFlat(newVehicle..".minVehiclePassengersCount", 3)
            TweakDB:SetFlat(newVehicle..".maxVehiclePassengersCount", 4)
        end
    end

    addBikesToHeatPreventionData = function (heatDataRecord)
        vehiclePool = TweakDB:GetFlat(heatDataRecord..".vehicleRecordPool")
        searchValue = "PreventionData.NCPD_inline13"
        for k in pairs(vehiclePool) do
            if vehiclePool[k] == searchValue then
                return
            end
        end
        table.insert(vehiclePool, "PreventionData.NCPD_inline13")
        TweakDB:SetFlat(heatDataRecord..".vehicleRecordPool", vehiclePool)
    end

    updatePreventionRecord = function (preventionData, newPreventionVehicle)
        local veh = newPreventionVehicle.."HitSquadUnit"
        TweakDB:SetFlat(preventionData..".vehicleRecord", veh)
    end

-- ARASAKA
    setCharacterToPrevention("Character.arasaka_agent_fmelee2rare_katana_ma_rare", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_agent_fmelee2rare_katana_wa_rare", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_agent_franged2_yukimura_wa_rare", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_android_android2_masamune_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_android_android2_shingen_ma", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_cyborg_franged3_shingen_ma_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_cyborg_franged3_shingen_wa_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_cyborg_grenadier3_yukimura_ma_elite", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_netrunner_netrunner2_yukimura_ma_rare", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_netrunner_netrunner2_yukimura_wa_rare", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_ninja_fmelee3_katana_ma_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_ninja_fmelee3_katana_wa_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_ninja_fmelee3_mantis_ma_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_ninja_fmelee3_mantis_wa_elite", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_ranger1_ranged2_masamune_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_ranger1_ranged2_shingen_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_ranger1_ranged2_shingen_wa", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_rare2_hmelee3_fists_mm_elite", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_sniper_sniper3_ashura_ma_elite", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_sniper_sniper3_nekomata_ma_elite", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_soldier1_ranged3_masamune_mah_rare", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_sumo_hmelee2_fists_mb_rare", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_2020agent_ranged3_2020nue_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_2020agent_ranged3_2020nue_wa", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_2020agent_ranged3_2020masamune_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_2020agent_ranged3_2020masamune_wa", "ARASAKA")

    setCharacterToPrevention("Character.arasaka_2020agent_fmelee2_katana_ma", "ARASAKA")
    setCharacterToPrevention("Character.arasaka_2020agent_fmelee2_katana_wa", "ARASAKA")

    setCharacterToPrevention("Character.CorpoManArasaka", "ARASAKA")
    setCharacterToPrevention("Character.CorpoWomanArasaka", "ARASAKA")

    -- MILITECH
    setCharacterToPrevention("Character.militech_officer_officer_omaha_ma", "MILITECH")
    setCharacterToPrevention("Character.militech_ranger1_ranged1_lexington_ma", "MILITECH")
    setCharacterToPrevention("Character.militech_ranger1_ranged1_saratoga_ma", "MILITECH")
    setCharacterToPrevention("Character.militech_ranger2_ranged2_ajax_ma", "MILITECH")
    setCharacterToPrevention("Character.militech_ranger2_ranged2_omaha_ma", "MILITECH")
    setCharacterToPrevention("Character.militech_recon_sniper2_achilles_ma_rare", "MILITECH")
    setCharacterToPrevention("Character.militech_strongarms_hmelee3_fists_mb_elite", "MILITECH")
    setCharacterToPrevention("Character.militech_tech_franged2_omaha_ma_rare", "MILITECH")
    setCharacterToPrevention("Character.militech_tech_grenadier2_omaha_ma_rare", "MILITECH")
    setCharacterToPrevention("Character.hil_militech_soldier3_shotgun3_crusher_mah_elite", "MILITECH")
    setCharacterToPrevention("Character.ina_04_militech_strongarms_hmelee3_fists_mb_elite", "MILITECH")

    -- KANG TAO
    setCharacterToPrevention("Character.kangtao_ranger1_ranged2_dian_ma", "KANGTAO")
    setCharacterToPrevention("Character.kangtao_officer_grenadier3_mah_elite", "KANGTAO")
    setCharacterToPrevention("Character.kangtao_android_android2_dian_ma", "KANGTAO")

    -- TRAUMA TEAM
    setCharacterToPrevention("Character.trauma_soldier_ranged2_dian_ma", "TRAUMATEAM")
    setCharacterToPrevention("Character.trauma_rare_officer_chao_ma", "TRAUMATEAM")

    --ZETATECH
    setCharacterToPrevention("Character.q307_zetatech_guard", "ZETATECH")

    --BIOTECHNICA
    setCharacterToPrevention("Character.q305_nusa_droid_02", "BIOTECHNICA")

    --MAXTAC
    setCharacterToPrevention("Character.maxtac_av_LMG_mb", "MAXTAC")
    setCharacterToPrevention("Character.maxtac_av_netrunner_ma", "MAXTAC")
    setCharacterToPrevention("Character.maxtac_av_riffle_ma", "MAXTAC")
    setCharacterToPrevention("Character.q305_maxtac_droid", "MAXTAC")

    -- NEW PREVENTION VEHICLES
    setVehicleToPrevention("Vehicle.v_sportbike1_yaiba_kusanagi_player", true) -- INLINE13

    setVehicleToPrevention("Vehicle.v_sportbike1_yaiba_kusanagi_tyger")
    setVehicleToPrevention("Vehicle.q112_arasaka_suv")
    setVehicleToPrevention("Vehicle.v_sportbike1_yaiba_muramasa")
    setVehicleToPrevention("Vehicle.v_standard3_makigai_tanishi_player")
    setVehicleToPrevention("Vehicle.v_sport2_herrera_outlaw_player")
    setVehicleToPrevention("Vehicle.v_sport1_rayfield_aerondight_player")
    setVehicleToPrevention("Vehicle.v_sport2_quadra_type66_nomad_tribute")
    setVehicleToPrevention("Vehicle.v_standard3_chevalier_emperor_militech")
    setVehicleToPrevention("Vehicle.v_utility4_militech_behemoth_basic_01")
    setVehicleToPrevention("Vehicle.oranje3_bratsk_akimbo")
    setVehicleToPrevention("Vehicle.v_militech_basilisk_01__basic_01")
    setVehicleToPrevention("Vehicle.v_sport1_rayfield_caliburn_mordred_player")
    setVehicleToPrevention("Vehicle.petii_uarug_cybertruck")
    setVehicleToPrevention("Vehicle.arasaka_hellhound")
    setVehicleToPrevention("Vehicle.oranje3_militech_legatus")
    setVehicleToPrevention("Vehicle.v_sport1_rayfield_caliburn_02_player")
    setVehicleToPrevention("Vehicle.v_sport2_mizutani_shion_player")
    setVehicleToPrevention("Vehicle.v_sport2_mizutani_shion_nomad_02_player")
    setVehicleToPrevention("Vehicle.v_sport2_herrera_outlaw_player")

    -- PREVENTION VEHICLE RECORDS
    updatePreventionRecord("PreventionData.NCPD_inline13", "Vehicle.v_sportbike1_yaiba_kusanagi_tyger") -- BIKE
    updatePreventionRecord("PreventionData.NCPD_inline14", "Vehicle.q112_arasaka_suv") -- HEAT 1 CAR
    updatePreventionRecord("PreventionData.NCPD_inline20", "Vehicle.v_sportbike1_yaiba_muramasa") -- BIKE
    updatePreventionRecord("PreventionData.NCPD_inline21", "Vehicle.v_standard3_makigai_tanishi_player") -- HEAT 2 CAR
    updatePreventionRecord("PreventionData.NCPD_inline22", "Vehicle.v_sport2_herrera_outlaw_player") -- HEAT 2 CAR FROM HEAT 1
    updatePreventionRecord("PreventionData.NCPD_inline23", "Vehicle.v_sport1_rayfield_aerondight_player") -- HEAT 1 CAR
    updatePreventionRecord("PreventionData.NCPD_inline24", "Vehicle.v_sport2_quadra_type66_nomad_tribute") -- HEAT 3 CAR FROM HEAT 2
    updatePreventionRecord("PreventionData.NCPD_inline30", "Vehicle.v_standard3_chevalier_emperor_militech") -- AS ABOVE
    updatePreventionRecord("PreventionData.NCPD_inline31", "Vehicle.v_utility4_militech_behemoth_basic_01") -- HEAT 4 REED CAR
    updatePreventionRecord("PreventionData.NCPD_inline32", "Vehicle.oranje3_bratsk_akimbo") -- HEAT 4 CAR
    updatePreventionRecord("PreventionData.NCPD_inline33", "Vehicle.v_militech_basilisk_01__basic_01") -- HELLHOUND HEAT 5
    updatePreventionRecord("PreventionData.NCPD_inline39", "Vehicle.v_sport1_rayfield_caliburn_mordred_player") -- HEAT 3 CAR
    updatePreventionRecord("PreventionData.NCPD_inline40", "Vehicle.petii_uarug_cybertruck") -- HEAT 4 REED CAR
    updatePreventionRecord("PreventionData.NCPD_inline41", "Vehicle.arasaka_hellhound") -- HELLHOUND HEAT 5
    updatePreventionRecord("PreventionData.NCPD_inline42", "Vehicle.oranje3_militech_legatus") -- HEAT 4 CAR
    updatePreventionRecord("PreventionData.NCPD_inline6", "Vehicle.v_sport1_rayfield_caliburn_02_player") -- HEAT 3 CAR
    updatePreventionRecord("PreventionData.NCPD_inline7", "Vehicle.v_sport2_mizutani_shion_player") -- HEAT 2 CAR
    updatePreventionRecord("PreventionData.NCPD_inline8", "Vehicle.oranje3_m9_project") -- HEAT 4 CAR
    updatePreventionRecord("PreventionData.NCPD_inline9", "Vehicle.v_sport2_mizutani_shion_nomad_02_player") -- HEAT 2 CAR

    -- Add bikes to all heat values
    addBikesToHeatPreventionData("PreventionData.NCPD_inline10")
    addBikesToHeatPreventionData("PreventionData.NCPD_inline15")
    addBikesToHeatPreventionData("PreventionData.NCPD_inline2")
    addBikesToHeatPreventionData("PreventionData.NCPD_inline25")
    addBikesToHeatPreventionData("PreventionData.NCPD_inline34")


    -- TweakDB:SetFlat("PreventionData.NCPD_inline34.vehicleRecordPool",
    -- {
    --     "PreventionData.NCPD_inline39",
    --     "PreventionData.NCPD_inline40",
    --     "PreventionData.NCPD_inline41",
    --     "PreventionData.NCPD_inline42",
    --     "PreventionData.NCPD_inline13",
    --     "PreventionData.NCPD_inline14",
    -- })

    corpoMaxTac =
    {
        easyMaxtacWave =
        {
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit",
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit"
        },

        medMaxTacWave =
        {
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit",
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit"
        },

        toughMaxtacWave =
        {
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit",
            "Character.trauma_soldier_ranged2_dian_ma".."HitSquadUnit",
            "Character.trauma_rare_officer_chao_ma".."HitSquadUnit"
        }
    }

    corpoBossWave = {
        "Character.maxtac_av_LMG_mb".."HitSquadUnit",
        "Character.maxtac_av_netrunner_ma".."HitSquadUnit",
        "Character.maxtac_av_riffle_ma".."HitSquadUnit",
        "Character.q305_maxtac_droid".."HitSquadUnit"
    }

    TweakDB:SetFlat("Vehicle.max_tac_av1.preventionPassengers",
    {
    "Character.Placide".."HitSquadUnit",
    "Character.Kurt_Miniboss_Tests".."HitSquadUnit",
    "Character.Cyberninja_Oda".."HitSquadUnit",
    "Character.q306_black_ops_shotgunner_fast_spotter".."HitSquadUnit"
    })



    TweakDB:SetFlat("Vehicle.max_tac_av1.appearanceName", "zetatech_atlus_trama_team")

    -- toggleWanted = function() msg = " - TOGGLE WANTED BY POLICE: ";
    -- PS = Game.GetScriptableSystemsContainer():Get("PreventionSystem")
    -- PSHS = PS:GetHeatStageAsInt() PS:ChangeHeatStage(EPreventionHeatStage.Heat_5, "")
    -- print(msg.."ON")
    -- end toggleWanted()


    t = TweakDBID
    n = CName

    -- SPAWN ANY CHARACTER, CHIMERA SPAWNER
    -- Game.GetPreventionSpawnSystem():RequestUnitSpawn(t"Character.CorpoManArasaka", GetPlayer():GetWorldTransform())
    -- SPAWN ANY CHARACTER, CHIMERA SPAWNER

    -- local chimeraTransform =  GetPlayer():GetWorldTransform()
    -- local chimeraPosition = GetPlayer():GetWorldPosition()
    -- local chimeraXPos = chimeraPosition.x + 50.0
    -- chimeraPosition.x = chimeraXPos
    -- chimeraTransform.SetPosition(chimeraTransform, chimeraPosition)
    -- Game.GetPreventionSpawnSystem():RequestUnitSpawn(t"Character.main_boss_chimeraHitSquadUnit", chimeraTransform)


    Override('PreventionSystem', 'RequestAVSpawnAtPosition', function(self, position)

        if position == self.Debug_lastAVRequestedSpawnPositionsArray then
            return
        end
        local request = RemoveRecentAvSpawnLocationFromCacheRequest:new()
        PreventionSystemHackerLoop.ForceCarToStop();
        -- print("number of maxtacsquads", self.numberOfMaxTacSquadsSpawned)
        self.numberOfMaxtacSquadsSpawned = self.numberOfMaxtacSquadsSpawned + 1
        local avTweakID
        avTweakID = t"Vehicle.max_tac_av1"
        -- print("number of maxtacsquads", avCount)

        avCount = avCount + 1

        if avCount % 5 == 0 then
            TweakDB:SetFlat("Vehicle.max_tac_av1.preventionPassengers", corpoBossWave)
        else
           local getRand = math.random(3)
           if getRand == 1 then
            TweakDB:SetFlat("Vehicle.max_tac_av1.preventionPassengers", corpoMaxTac.easyMaxtacWave)
           end
           if getRand == 2 then
            TweakDB:SetFlat("Vehicle.max_tac_av1.preventionPassengers", corpoMaxTac.medMaxTacWave)
           end
           if getRand == 3 then
            TweakDB:SetFlat("Vehicle.max_tac_av1.preventionPassengers", corpoMaxTac.toughMaxtacWave)
           end
        end

        -- print("Time to land")

        local ticketID = Game.GetPreventionSpawnSystem():RequestAVSpawnAtLocation(avTweakID, position)
        self.agentRegistry:CreateTicket(ticketID, vehiclePoliceStrategy.NONE)
        table.insert(self.lastAVRequestedSpawnPositionsArray, position)
        self.Debug_lastAVRequestedSpawnPositionsArray = position
        self.shouldPreventionUnitsStartRetreating = true

        PreventionSystem.QueueRequest(request, 60.0)


    end)


    Override('PsychoSquadAvHelperClass', 'GetOffAV;GameObject', function(go)
        local passengers = {}
        local mount_table = Game.GetMountingFacility():GetMountingInfoMultipleWithIds(nil, go:GetEntityID())
        for k = 1, #mount_table do
            local passenger = Game.FindEntityByID(mount_table[k].childId)
            table.insert(passengers, passenger)
        end



       for j = 1, #passengers do
        -- print(passengers[j]:GetRecordID(), "if it exists")
        local jumpDelay = 0.0
        -- if passengers[j]:GetRecordID() == sniper_user_w1 then
        --     -- print("sniper user correct")
        --     jumpDelay = 2.0
        --     end
        -- if passengers[j]:GetRecordID() == reed_w1 then
        --     -- print("reed user correct")
        --     jumpDelay = 1.0
        --  end
        -- if passengers[j]:GetRecordID() == placide_w1 then
        --     -- print("placide user correct")
        --     jumpDelay = 1.0
        -- end
        StatusEffectHelper.ApplyStatusEffect(passengers[j], t"BaseStatusEffect.MaxtacFightStartHelperStatus", 2.0)
        StatusEffectHelper.ApplyStatusEffect(passengers[j], t"BaseStats.CanPerformBluntFinisher", 2.0)
        StatusEffectHelper.ApplyStatusEffect(passengers[j], t"BaseStats.CanPerformCoolFinisher", 2.0)
        StatusEffectHelper.ApplyStatusEffect(passengers[j], t"BaseStats.CanPerformMonowireFinisher", 2.0)
        StatusEffectHelper.ApplyStatusEffect(passengers[j], t"BaseStats.CanPerformReflexFinisher", 2.0)


        Game.GetDelaySystem():DelayEvent(passengers[j], AIEvents.ExitVehicleEvent(), 2.0)
       end

       local evt = PushAnimEventDelayed:new()
       evt.go = go
       evt.eventName = n"close_door_event"
       Game.GetDelaySystem():DelayScriptableSystemRequest(n"PsychoSquadAvHelperClass", evt, 5.0)

    end)


    Override('PreventionSystem', 'CanRequestAVSpawn', function(self)
        local timeSinceLastMaxtacTroopDied;
        local maxAvsAtSameTime = 1
        local preventionTable = Game.GetScriptableSystemsContainer():Get(n"PreventionSystem")
        if Game.GetAgentRegistry():GetMaxTacNPCCount() > 1 then
            self.maxtacTroopBeingAliveTimeStamp = Game.GetTimeSystem():GetSimTime():ToFloat()
            return false
        end
        if #self.lastAVRequestedSpawnPositionsArray >= maxAvsAtSameTime then
            return false
        end
        hStage = Game.GetScriptableSystemsContainer():Get("PreventionSystem")
        hStageValue = hStage:GetHeatStageAsInt()
        if hStageValue < 1 then
            return false
        end
        if self:GetStarState() ~= EStarState.Active then
            return false
        end
        if not PreventionSystemHackerLoop.AVCanBeSpawned() then
            return false
        end
        timeSinceLastMaxtacTroopDied = Game.GetTimeSystem():GetSimTime():ToFloat() - self.maxtacTroopBeingAliveTimeStamp
        if timeSinceLastMaxtacTroopDied < 5 then  -- 5 seconds from 35 flat
            return false
        end
        return true
    end)

    Override('PreventionSystem', 'IsMaxTacDefeated', function(self)
        -- print(self:GetAgentRegistry():GetMaxTacNPCCount())
        return self:GetAgentRegistry():GetMaxTacNPCCount() < 1
    end)







































    -- print(TweakDB:SetFlat("Items.Base_Fists_inline2.attackSubtype", "AttackType.CrouchAttack"))
    -- print(TweakDB:SetFlat("Items.Base_Fists_inline2.attackDirection", "AttackDirections.DownToUp"))
    -- print(TweakDB:SetFlat("Items.Base_Fists_inline2.attackName", "MeleeCrouchAttack0"))

    -- Observe('MeleeCrouchAttackDecisions', 'EnterCondition', function(self, stateContext, scriptInterface)
        -- print(MeleeTransition.WantsToLightAttack(stateContext, scriptInterface), "melee transition light attack value")
        -- if stateContext:IsStateActive(n"Locomotion", n"crouch") == false then
        --     return true
        -- end
        -- if stateContext:IsStateActive(n"Locomotion", n"slide") == false then
        --     return false
        -- end
        -- if MeleeTransition.WantsToLightAttack(stateContext, scriptInterface) == false then
        --     return false
        -- end
        -- if self:HasAttackRecord(scriptInterface) == false then
        --     return false
        -- end
        -- return true


    -- end)

    -- Override('MeleeTransition', 'CheckIfFinalAttack', function(self, scriptInterface, stateContext)
    --     -- print(stateContext:GetPermanentIntParameter(n"totalMeleeAttacksInCombo").value, "value")

    --     if self:CheckIfInfiniteCombo(stateContext, scriptInterface) then
    --         return false
    --     end
    --     local currentValue = stateContext:GetPermanentIntParameter(n"meleeAttackNumber")
    --     local value = currentValue.value + 1
    --     local attacksNumber = scriptInterface:GetStatsSystem():GetStatValue(scriptInterface.ownerEntityID, gamedataStatType.AttacksNumber)
    --     print(value, "punch number")
    --     -- 5 IS SOME FINAL ATTACK WHICH IS PRETTY COOL LOL
    --     if value >= 5  then
    --         print("hey we done")
    --         return true
    --     else
    --         return false
    --     end

    --     -- print(scriptInterface:GetStatsSystem():GetStatValue(scriptInterface.ownerEntityID, gamedataStatType.AttacksNumber), "stats system")


    -- end)



end)


-- registerForEvent("onUpdate", function ()
--     print(Game.GetTargetingSystem():GetLookAtObject(GetPlayer()):GetAffiliation())

-- end)
