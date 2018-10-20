-- -*- fill-column: 55 -*-
-- game text definitions
-- text here appears in various places in the game
-- text supports $controlName escapes which will be replaced by the key bound to that control

{
wormhole = "空間異常能連接多個平行宇宙。
進入蟲洞的物體會被分裂成無數
個量子態，同時遊歷所有宇宙。
你一次只能經歷一個宇宙：
你想要去哪裡？",

wormhole_upload = "你當前艦隊的複製品將穿過
蟲洞並會分享給其他玩家，
但你的意識會和艦隊一起留
在這邊，而且蟲洞會關閉",

wormhole_regen = "你的意識將被傳送至一個
新區域，永遠無法返回。",

wormhole_login = "登錄來追蹤你在平行宇宙中的艦隊",

constructor_help = "\
從右側的元件版上拖動模組

’^5P^7’的值會限制飛船功能
可以在升級介面增加它（按下’$viewUpgrades’）

通過拖動功能來選定多個模組

基本編輯
滑鼠左鍵：         拖動並附著模組
按下Shift鍵點擊滑鼠：        選擇/取消選擇模組
按兩下滑鼠左鍵：選中所有已附著模組
按下Alt鍵拖動滑鼠：           複製
滑鼠右鍵：$rotateLeft, $rotateRight：旋轉
$destroy：         刪除

高級編輯
$undo, $redo：                     撤銷，重做
$cut, $copy, $paste：                  剪切，複製，粘貼
$mirror, 按兩下滑鼠右鍵：鏡像
$scaleDown, $scaleUp, Alt鍵+滑鼠滑輪：縮小/放大模組

遊戲鏡頭控制
$forward, $left, $back, $right：        搖移鏡頭
滑鼠滾輪：縮放鏡頭",

constructor_help_gamepad = "\
從右側的元件版上拖動模組

‘^5P^7’ 的值會限制飛船功能
可以在升級介面增加它（按下’$viewUpgrades’）

通過拖動功能來選定多個模組

基本編輯
右搖杆 + $gpLeftClick:     拖動並附著模組
$gpLeftClick:           選中所有已附著模組
右搖杆 + $gpRightClick:     複製
$rotateLeft, $rotateRight: 旋轉
$destroy:          刪除

高級編輯
$undo, $redo:    撤銷，重做
$mirror:         鏡像
$scaleUp:        縮小/放大模組

遊戲鏡頭控制
左搖杆：搖移鏡頭
$zoomOut, $zoomIn:       縮放鏡頭",

contested_spawner = "\
這個友方飛船或空間站有建造工廠，可以生成友軍飛船。
由於你仍處於敵方控制區內，無法在此重生。",

station_map = "\
這個友方飛船或空間站有建造工廠，
可以把它當作生成點。",

deactivated = "\
藍色鑽石代表已損毀、不再是啟動狀態的空間站。
在其附近飛行可再次啟動它們。空間站一旦被
啟動便可作為生成點。",

wormhole_map = "\
蟲洞連接著多個平行宇宙。穿越蟲洞
可開啟全新地圖，或可複製你的艦隊，
與其他玩家展開戰鬥。",

agent_map = "\
特種艦隊是由其他玩家設計的，
它們通常都是強大的對手。",

map_objectives = "\
越接近地圖中心，難度越高。
不要害怕探險。

地圖上每個圖元格代表一個區域，圖元
格的顏色代表控制這一區域的派系。

藍色鑽石代表著已損毀、不處於啟動狀態的空間站。
靠近空間站飛行可啟動它們。
正常運轉的空間站可以使你重生。

綠色鑽石代表著生成點——正常運轉的
空間站、友方飛船和你創建的生成點。

你可以在升級介面解鎖建造工廠，並可以通過生成
一艘帶有建造工廠的飛船來創建你自己的生成點。
只要有足夠的R，友方生成點就會生成子飛船。

用你自己的派系驅趕原住民，以佔領地圖上
的區域。若要生產更多的飛船，你可以使用
建造工廠，或向友方生成點提供R。",

resource_hover = "\
^6R - 資源^7
植物會生成資源，摧毀的飛船也會掉落資源。資源儲存在了你的飛船中。資源會在飛船摧毀後丟失。

^3C - 積分^7
幫助你的派系可獲得積分。摧毀敵方飛船，向友方生成點提供R，生成並釋放飛船，或探索新區域。

^5P - 飛船積點^7
它決定著飛船功能的數量。可通過上方的^5+P^7按鈕花費^3C^7來增加它。",

tournament_help = "\
$skip：宣佈領隊勝利
$slower：放慢時間
$faster：加快時間
$pause：暫停
$toggleHUD：隱藏控制台
ESC鍵：放棄比賽
$next：自動鏡頭
",

web_header = '\
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title>Reassembly Tournament</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/wp-content/themes/anisoptera/style.css">
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body id="page">
<p>
[<a href="/">Anisoptera Games<a/>]
[<a href="/contest">Contest Page</a>] <br />
[<a href="../probe/index.html">probe</a>]
[<a href="../interceptor/index.html">interceptor</a>]
[<a href="../cruiser/index.html">cruiser</a>]
[<a href="../dreadnought/index.html">dreadnought</a>]
[<a href="../proton/index.html">proton</a>]
[<a href="../tanks/index.html">tanks</a>]
</p>
'

web_footer = '</body></html>'

}

