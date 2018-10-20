-- tutorial popup definitions
-- format: {name = { { "text to show to user", { highlight_x, highlight_y, highlight_size } } } }
-- the highlight are fractions of the screen (so 0..1) - set to 0 to disable
-- text supports $controlName escapes which will be replaced by the key bound to that control

{
   intro_help = {
      { "相同顏色的飛船是你的盟友， 其餘顏色的飛船都是敵人。", 0},
      { "用’$viewMap’來展開小地圖。", {0.075, 0.125, 0.075} },
      { "用$zoom來縮放遊戲鏡頭。", 0 } }

   intro2_help = {
      { "按照教學任務的指導來獲得進展。", {0.9, 0.1, 0.1} }
      { "用’$escape’來保存/退出。", 0}
      { "用’$viewSelector’來編輯飛船。", 0 } },

   res_full_help = {
      { "飛船^6R^7載荷已滿。增加資源攜帶器以增大荷載量，或靠近空間站飛行，用^6R^7換取^3C^7", {0.05, 0.25, 0.05} } }

   constructor_popup_help = {
      { "從元件板上拖動新模組" , {0.85, 0.6, 0.25} },
      { "’^5P^7’的值限制著飛船的功能", {0.05, 0.95, 0.05} },
      { "在“説明”功能表中查看鍵盤命令", {0.025, 0.025, 0.025} },
      { "完成後退出", {0.875, 0.05, 0.05} } },

   upgrade_help = {
      { "增加^5P^7以建造更大的飛船", { 0.25, 0.75, 0.1 } }, -- overridden in code
   }
}

