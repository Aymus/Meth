Core = TableConfig.Settings['CoreVersion'] == 'newqb' and TableConfig.Settings['CoreExport'] or nil
if TableConfig.Settings['CoreVersion'] == 'oldqb' then 
    Citizen.CreateThread(function()
        while Core == nil do
            TriggerEvent(TableConfig.Settings['CoreEvent'], function(obj) Core = obj end)
            Citizen.Wait(0)
        end
    end)
end

-- [ Code ] --

-- [ Functions ] --

-- Essentials

function TableProgress(Title, Timeout, CanCancel, cb)
    -- Possible to change this with your progressbar.
    local Success = false
    Core.Functions.Progressbar("table_progress", Title, 1000 * Timeout, false, CanCancel, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        Success = true
        cb(Success)
    end, function() -- Cancel
        cb(Success)
    end)
end


function PlayAnimation(Type)
    local UseScenario = TableConfig.Animations[Type][CurrentStage]['UseScenario']
    if UseScenario then
        TaskStartScenarioInPlace(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Scenario'], 0, true)
    else
        RequestAnimationDict(TableConfig.Animations[Type][CurrentStage]['Dict'])
        TaskPlayAnim(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Dict'], TableConfig.Animations[Type][CurrentStage]['Name'], 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end
end

function ClearAnimations(Type)
    local UseScenario = TableConfig.Animations[Type][CurrentStage]['UseScenario']
    if UseScenario then
        ClearPedTasks(PlayerPedId())
    else
        StopAnimTask(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Dict'], TableConfig.Animations[Type][CurrentStage]['Name'], 1.0)
    end
end

function TryMinigame(Type, cb)
    local MinigameEnabled = TableConfig.Minigames[Type][CurrentStage]
    if MinigameEnabled then
        cb(true)
    else
        cb(false)
    end
end

function GoNextStage(TableId, Type)
    local StageNum = tonumber(string.match(CurrentStage, "%d+"))
    local NextStage = StageNum + 1
    TriggerStage(NextStage, TableId, Type) 
end

-- Stages

function TriggerStage(Stage, TableId, Type)
    CurrentStage = "Stage_"..Stage
    if Stage == 1 then
        local Table = getTableById(TableId)
        local TablePrepared = Table.prepared
        local ForcePrepare = TableConfig.Settings['Tables'][Type]['ForceStage1']
        if not TablePrepared or ForcePrepare then
            PlayAnimation(Type)
            TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
                ClearAnimations(Type, UseScenario)
                TryMinigame(Type, function(Enabled)
                    if Enabled then
                
                        Table.prepared = true
                        GoNextStage(TableId, Type)
                  
                    else
                        Table.prepared = true
                        GoNextStage(TableId, Type)
                    end
                end)
            end)
        else
            GoNextStage(TableId, Type)
        end
    elseif Stage == 2 then
            PlayAnimation(Type)
            TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)   
                TryMinigame(Type, function(Enabled)
                    if Enabled then
                        
                        CurrentStage = nil
                        
                        local Table = getTableById(TableId)
                        isActive = true
                        
                        local finished = exports["tgiann-skillbar"]:taskBar(5000,math.random(5,8))
                        if not finished then
                            
                            isActive = false
                            
                    else
                        local finished1 = exports["tgiann-skillbar"]:taskBar(5000,math.random(5,8))
                        if not finished1 then
                            isActive = false
    
                        else
    
                            local finished2 = exports["tgiann-skillbar"]:taskBar(5000,math.random(5,8))
                            if not finished2 then
                                isActive = false
    
                            else
    
                        local finishe3 = exports["tgiann-skillbar"]:taskBar(4000,math.random(5,12))
                        if not finished3 then
    
                            isActive = false
                            
                        CurrentStage = nil
                        
                        Core.Functions.TriggerCallback('mc-drugtables/server/get-reward', function(result) end, Type)
                        isActive = false
                    end
                end
            end
            end
        end
                end)
            end)
        end
    end


    local function DisableDisplayControlActions()
        DisableControlAction(0, 22, true) -- disable escape
        DisableControlAction(0, 22, true) -- disable escape
        DisableControlAction(0, 22, true) -- disable escape
        DisableControlAction(0, 22, true) -- disable escape
    
    end


RegisterNetEvent("mc-drugtables/client/use-table", function(Type)
    if not IsPlacing then
        CreateThread(function()
            while IsPlacing do
                DisableDisplayControlActions()
                Wait(1)
            end
        end)
        PlaceObject(TableConfig.Settings['Tables'][Type]['Prop'], function(pPlaced, pCoords, pHeading)
            if pPlaced then
                CurrentStage = "Stage_0"
                PlayAnimation(Type)
                TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], true, function(Success)
                    ClearPedTasks(PlayerPedId(1))
                    if Success then
                              Core.Functions.TriggerCallback('Core/remove-item', function(DidRemove)
                            if DidRemove then
                                Core.Functions.TriggerCallback('mc-drugtables/server/place-table', function(result) end, pCoords, pHeading, Type)
                            else
                                Core.Functions.Notify(TableConfig.Locales['Error']['Item'], "error")
                            end
                        end, TableConfig.Settings['Tables'][Type]['ItemName'], 1, false)
                    else
                        Core.Functions.Notify(TableConfig.Locales['Error']['Canceled'], 'error')
                    end
                end)
            else
                Core.Functions.Notify(TableConfig.Locales['Error']['Place'], 'error')
            end
            IsPlacing = false
        end)
    else
        Core.Functions.Notify(TableConfig.Locales['Error']['Placing'], 'error')
    end
end)





-- TableEntity is important. It needs to get the entity of the table. (Using Target Eye on Table)
-- Example below is using the Example in README.md
-- If you need help we give support on our Discord. https://dsc.gg/mercy-coll
RegisterNetEvent("mc-drugtables/client/start-cooking", function(CanBeRemoved, TableEntity) -- "CanBeRemoved" could be Removed if TableEntity is first event parameter and not second.
    local TableId = getTableId(TableEntity) -- ['Entity'] Can be removed when not needed
    if not TableId then return end
    local Table = getTableById(TableId)
    TriggerStage(1, TableId, Table.type)
end)

-- TableEntity is important. It needs to get the entity of the table. (Using Target Eye on Table)
-- Example below is using the Example in README.md
-- If you need help we give support on our Discord. https://dsc.gg/mercy-coll
RegisterNetEvent("mc-drugtables/client/pickup-table", function(CanBeRemoved, TableEntity) -- "CanBeRemoved" could be Removed if TableEntity is first event parameter and not second.
    local TableId = getTableId(TableEntity) -- ['Entity'] Can be removed when not needed
    if not TableId then return end
    local Table = getTableById(TableId)
    Core.Functions.TriggerCallback('mc-drugtables/server/return-table', function(result) end, TableId, Table.type)
end)

local targeting = exports['qb-target']

-- parameter = Parameter to send with event
-- type = 'client' or 'server'

Citizen.CreateThread(function()
    local MethTable = {
        `bkr_prop_meth_table01a`,
    }
    targeting:AddTargetModel(MethTable, {
        options = {
            {
                type = "client",
                event = "mc-drugtables/client/start-cooking",
                icon = "fas fa-thermometer-full",
                label = "Meth Yap",
            },
            {
                type = "client",
                event = "mc-drugtables/client/pickup-table",
                icon = "fas fa-arrow-up",
                label = "Masayı al",
            },
        },
        job = {"all"},
        distance = 1.5
    })
    
end)

