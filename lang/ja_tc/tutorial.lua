
-- tutorial/objective definitions
-- format is { "Group Name", MinimumP, GateEvent, CompleteEvent,
--             { { "Objective 1 Text", Objective1Event },
--               { "Objective 2 Text", Objective2Event } } }
-- The various events are marked as completed by the game code and are saved per-slot

{
   { "基礎操作", 0, 0, BASIC_TUT,
     {  { "進入世界", SPAWN_INTRO },
        { "使用'$fireMain'發射主要武器", FIRE_CANNON },
        { "使用’$fireAlt’發射次要武器", FIRE_MISSILE },
        { "使用'$viewConstructor'改造你的飛船", USED_EDITOR } } },

   { "資源", 0, BASIC_TUT, RES_TUT,
     {  { "撿起一個^6R 資源包^7", PICKUP_RES_SMALL },
        { "在^2生成點^7附近飛行，以^6R^7換取^3C^7", TRANSFER_RU },
        { "以^6100R^7向^2生成點^7換取^3C^7", TRANSFER_RU_QUANT },
        { "通過探索獲得^3C^7", EXPLORED },
        { "通過摧毀敵方飛船獲得^3C^7和^6R^7", KILL_A_SHIP },
        { "按下’$viewUpgrades’鍵進行升級", UPGRADE_SOMETHING } },
   },

   { "武器組", 400, MULTIPLE_WEAPONS, 0,
     { { "使用’$viewBindings’更改武器組", USED_BINDINGS } } }

   -- binding screen
   -- fleet stuff

   { "任務", 0, BASIC_TUT, 0,
     { { "使用’$viewMap’查看完整地圖", USED_MAP },
        { "靠近^4損壞的空間站^7飛行來重新啟動它", ACTIVATED_STATION } }
   }
   
   { "建造工廠", 500, RES_TUT|MAYBE_FACTORY|FACTORY_ON_SHIP|UNLOCK_FACTORY, 0,
     {
        { "使用’$viewUpgrades’解鎖建造工廠模組", UNLOCK_FACTORY },
        { "為你的飛船附加建造工廠", FACTORY_ON_SHIP },
        { "使用’$viewSelector’在另一存檔位中放置飛船設計", SHIP_IN_CHILD_SLOT},
        { "使用'$activate'來生成一艘飛船", SPAWN_CHILD },
        { "生成一艘有建造工廠的飛船來完成這個迴圈", SPAWN_FACTORY } }
   },

   { "艦隊", 450, LOTS_OF_LC, 0,
     { { "使用'$toggleTractor'進入指揮模式", COMMAND_MODE },
        { "在指揮模式中使用'$fireMain'可招募盟友",  RECRUIT_ALLY },
        { "再次使用'$fireMain'可釋放盟友（並獲得^3C^7）",  RELEASE_ALLY },
        { "使用’$viewSelector’編輯目標盟友的飛船和建造次序", EDIT_COMMAND_TARGET },
     }
   },
   
   { "發電機", 0, NO_POWER, 0,
      {{ "在你的飛船上安裝發電機以增加電力", GENERATOR_ON_SHIP }}
   },

   { "目標", 800, RES_TUT, 0,
     {{ "使用地圖定位並摧毀一個^1特種艦隊^7", DESTROYED_TARGET },
        { "若要解鎖新種族，請摧毀該種族超過^51000P+^7的飛船。", UNLOCKED_FACTION }}
   },

   { "蟲洞", 1000, RES_TUT, 0,
     { { "使用蟲洞可上傳你的艦隊且不改變世界。", WORMHOLE_UPLOAD },
        { "通過蟲洞穿越至一個新的世界", ENTER_WORMHOLE } }
   },
}

