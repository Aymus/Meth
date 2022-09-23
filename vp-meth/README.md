## MERCY COLLECTIVE - DRUG TABLES

## NOTE: NEEDS TABLE ENTITY (EXAMPLE TARGET SCRIPT)
# Start Cooking
TriggerEvent('mc-drugtables/client/start-cooking', TableEntity) -- Send the TableEntity as an Event Parameter.

# Pickup Table
TriggerEvent('mc-drugtables/client/pickup-table', TableEntity) -- Send the TableEntity as an Event Parameter.

# Buy Table
TriggerServerEvent('mc-drugtables/server/buy-table', "Meth") -- Type of Table: "Meth", "Coke", "Weed"

# Example Implementations

# Basic

# Meth Table
[GetHashKey('v_ret_ml_tableb')] = {
    ['Options'] = {
        [1] = {
            ['Job'] = false,
            ['UseDuty'] = false,
            ['Name'] = 'Cook',
            ['EventType'] = 'Client',
            ['Logo'] = '<i class="fas fa-thermometer-full"></i>',
            ['EventName'] = 'mc-drugtables/client/start-cooking', 
            ['Enabled'] = function()
                return true
            end,
        },
        [2] = {
            ['Job'] = false,
            ['UseDuty'] = false,
            ['Name'] = 'Pickup',
            ['EventType'] = 'Client',
            ['Logo'] = '<i class="fas fa-arrow-up"></i>',
            ['EventName'] = 'mc-drugtables/client/pickup-table', 
            ['Enabled'] = function()
                return true
            end,
        },
    },
},

# Buy Table
[GetHashKey('a_m_o_soucent_02')] = {
    ['Options'] = {
        [1] = {
            ['Job'] = false,
            ['UseDuty'] = false,
            ['Name'] = 'Buy ??? ($20000)',
            ['EventType'] = 'Client',
            ['Logo'] = '<i class="fas fa-boxes"></i>',
            ['EventName'] = 'mc-interactions/client/talk-to-npc', 
            ['Enabled'] = function()
                if exports['mercy-interactions']:NearInteractNpc() then
                    return true
                end
            end,
            ['EventParameter'] = '',
        },
    },
},