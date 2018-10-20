{
	volume	= 1,
	pitch	= 1,
	pitchRandomize	= 0.0,
	rolloff	= 0.8,
	minDist	= 100,
	maxDist	= 9999999999,
	priority	= 0,
	flags	= 0
}
{
	-- 按钮点击音效
	ButtonPress = {
		samples =
		{
			"ui\button_02.ogg"
		},
		pitch = 1,
		pitchRandomize = 0.0,
		volume = 0.2,
	},
    -- 按钮悬停音效
	ButtonHover = {
		samples =
		{
			"ui\button_03.ogg"
		},
		pitchRandomize = 0.0,
		volume = 0.15,
	},
    -- 发射器发射音效
	Launcher = {
		samples =
		{
			"world\missile\missile_new_00.ogg",
			"world\missile\missile_new_01.ogg",
			"world\missile\missile_new_02.ogg",
			"world\missile\missile_new_03.ogg",
			"world\missile\missile_new_04.ogg",
			"world\missile\missile_new_05.ogg"
		},
		flags = cluster|cull_vol|cull3d_vol,
		volume = 0.5,
		pitchRandomize = 0.05,
	},
}