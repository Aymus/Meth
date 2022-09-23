TableConfig = TableConfig or {}

TableConfig.Settings = { 
    
    ['CoreVersion'] = 'newqb', 
    ['CoreExport'] = exports['qb-core']:GetCoreObject(), 
    ['CoreEvent'] = 'QBCore:GetObject', 
    
    ['Tables'] = { 
        ['Meth'] = {
            ['Prop'] = 'bkr_prop_meth_table01a', 
            ['ItemName'] = 'methtable', 
            ['RewardName'] = 'meth',  
            ['Price'] = 2000, 
            ['Account'] = 'cash', 
            ['ForceStage1'] = true, 
        },
    }
}


TableConfig.Locales = { 

    
    ['Meth'] = {
        ['Stage_0'] = "Masa Kuruluyor",
        ['Stage_1'] = "Malzemeler Yerleştiriliyor",
        ['Stage_2'] = "Meth Üretiliyor",
     

    }
}

TableConfig.Timeouts = { 
    ['Meth'] = {
        ['Stage_0'] = 4,
        ['Stage_1'] = 4, 
        ['Stage_2'] = 4, 

    },
}

TableConfig.Minigames = {
    ['Meth'] = {
        ['Stage_1'] = true,
        ['Stage_2'] = true,
        ['Stage_3'] = true,
        ['Stage_4'] = true,
        ['Stage_5'] = true,
        ['Stage_6'] = true,
    },
   
}

TableConfig.Animations = { -- https://wiki.rage.mp/index.php?title=Scenarios - https://wiki.gtanet.work/index.php?title=Animations
    ['Meth'] = { -- Name of Type
        ['Stage_0'] = {
            ['UseScenario'] = false, -- true to use Scenario for Animation
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", -- Animation Dictionary
            ['Name'] = "loop", -- Animation Name
        },
        ['Stage_1'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_2'] = {
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_3'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_4'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "weapon@w_sp_jerrycan", 
            ['Name'] = "fire",
        },
        ['Stage_5'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_6'] = { 
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist",
            ['Name'] = "loop",
        },
    },
   
}

-- Map material hash -> material type !! (Materials the tables can ONLY be placed on. - Default Grass,..) !!
TableConfig.MaterialHashes = {
    [-461750719] = 1,
    [930824497] = 1,
    [581794674] = 2,
    [-2041329971] = 2,
    [-309121453] = 2,
    [-913351839] = 2,
    [-1885547121] = 2,
    [-1915425863] = 2,
    [-1833527165] = 2,
    [2128369009] = 2,
    [-124769592] = 2,
    [-840216541] = 2,
    [-2073312001] = 3,
    [627123000] = 3,
    [1333033863] = 4,
    [-1286696947] = 5,
    [-1942898710] = 5,
    [-1595148316] = 6,
    [435688960] = 7,
    [223086562] = 8,
    [1109728704] = 8
}