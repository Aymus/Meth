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
                label = "Cook",
            },
            {
                type = "client",
                event = "mc-drugtables/client/pickup-table",
                icon = "fas fa-arrow-up",
                label = "Pickup",
            },
        },
        job = {"all"},
        distance = 1.5
    })
    local WeedTable = {
        `bkr_prop_weed_table_01a`,
    }
    targeting:AddTargetModel(WeedTable, {
        options = {
            {
                type = "client",
                event = "mc-drugtables/client/start-cooking",
                icon = "fas fa-thermometer-full",
                label = "Cook",
            },
            {
                type = "client",
                event = "mc-drugtables/client/pickup-table",
                icon = "fas fa-arrow-up",
                label = "Pickup",
            },
        },
        job = {"all"},
        distance = 1.5
    })
    local CokeTable = {
        `bkr_prop_coke_table01a`,
    }
    targeting:AddTargetModel(CokeTable, {
        options = {
            {
                type = "client",
                event = "mc-drugtables/client/start-cooking",
                icon = "fas fa-thermometer-full",
                label = "Cook",
            },
            {
                type = "client",
                event = "mc-drugtables/client/pickup-table",
                icon = "fas fa-arrow-up",
                label = "Pickup",
            },
        },
        job = {"all"},
        distance = 1.5
    })
end)

