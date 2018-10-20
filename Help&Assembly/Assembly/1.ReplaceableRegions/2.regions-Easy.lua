-- Easy-level regions. 
-- Change the file name to 'regions.lua' and cover the same-name file under this mod's file when using.
-- 简单难度的领地文件.
-- 使用时将该文件改名为'regions.lua'并覆盖该模组文件夹下的同名文件.
{
	totalSize = 400000,
	ident=2,
	color = 0x4d6980,
	fleets =
		{
			{20004,{				{0.2, 7000},{1, 3500}}},
			{20005,{	{0, 5250},	{0.5, 7000},{1, 3500}}},
			{20009,{	{0.2, 5250},{0.5, 7000},{1, 3500}}}
		},
	fleetCount={12, 24},
	unique=
		{
			{
				"20002_DiscophoraSondaicaBoisduval",
				"20002_GonepteryxMahaguru",
				"20002_HebomoiaGlaucippe",
				"20002_TalbotiaNaganum",
				"20002_LampropteraCurius",
			},
			{
				"20004_NielsHenrikDavidBohr",
				"20004_Molecule",
				"20004_Antineutron",
				"20004_Antiproton",
				"20004_ENeutrino",
			},
			{
				"20005_SpiralCord",
				"20005_ButterflyCurve",
				"20005_Nephroid",
				"20005_Astroid",
				"20005_Cissoid",
			},
			{
				"20006_Caph",
				"20006_Denebola",
				"20006_Arcturus",
				"20006_Markab",
				"20006_Spica",
			},
			{
				"20007_Po-210",
				"20007_Ac-227",
				"20007_Ac-228",
				"20007_Pa-231",
				"20007_Pa-234",
			},
			{
				"20009_40661210",
				"20009_17D3A05796F7E",
				"20009_2C4506BE",
				"20009_16BACEBFA",
				"20009_16A65D1A8",
			},
			{
				"20010_BroachingMachine",
				"20010_Strap",
				"20010_Valve",
				"20010_Spline",
				"20010_Redirector",
			},
			{
				"20011_Cori-2",
				"20011_32mb",
				"20011_G3900T",
				"20011_Worm",
				"20011_i5-6300U",
			},
			{
				"20016_Chalcedony",
				"20016_Emerald_I",
				"20016_Emerald_II",
				"20016_Garnet_I",
				"20016_Garnet_II",
			},
			{
				"20050_Lesliei",
				"20050_Cordyceps_cicadicola_Teng",
				"20050_Gyromitra_ambigua_Harmaja",
				"20050_Hygrophorus_pudorinus_Fr",
				"20050_Inocybe_pudica_Kunn",
			},
		},
	uniqueFraction=0.06,
	ambient={ 2, 1, 0 },
	subregions=
	{	
		{
			ident=200,
			count=5,
			position={0.7, 0.9},
			radius={0.05, 0.08},
			type=2,
			fleets=
			{
				{8, { { 0, 15000}, {1, 9000} }},
			},
			fleetCount={{6, 10}},
			ambient={ 0 },
		},

		{
			ident=201,
			count=3,
			position={0.2, 0.5},
			radius={0.07, 0.1},
			type=2,
			fleets={
				{11, { { 0, 22400}, {1, 16000} }},
			},
			fleetCount={10, 14},
			ambient={-1},
			asteroidSize={50, 150},
			asteroidDensity={0.0, 0.2},
		},

		{  
			ident=202,
			count=5,
			color=0xff5000,
			position={0.7, 0.9},
			radius={0.04, 0.07},
			type=1,
			fleets=
			{
				{3, { {0, 12000}, {1, 8000} }},
			},
			fleetCount={16, 24},
			ambient={ 0 },
		},
		
		{  
			ident=203,
			count=4,
			position={0.5, 0.7},
			radius={0.06,0.09},
			type=2,
			fleets=
			{
				{4, { {0, 19800}, {1, 13200} }},
			},
			fleetCount={12, 18},
			unique=
			{
				{"4_pstation02"},
				{"4_pstation01"},
			},
			ambient={ 1 },
			fortress=
			{
				"4_platform0",
				"4_platform1",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
		},
		
		{  
			ident=204,
			count=5,
			position={0.7, 0.9},
			radius={0.03, 0.06},
			type=1,
			fleets=
			{
				{7, { {0, 3640}, {1, 2600} }},
			},
			fleetCount={10, 14},
			ambient={ 1 },
		},
		
		{ 
			ident=205,
			count=3,
			color=0xa0f000,
			position={0.5, 0.7},
			radius={0.07, 0.01},
			type=2,
			fleets=
			{
				{15, { {0, 28000}, {1, 14000} }},
			},
			fleetCount={4, 8},
			ambient={ 0 },
			fortress=
			{
				"15_platform0",
				"15_platform1",
				"15_platform2"
			},
			fortressCount={1, 6},
			fortressRadius={500, 700},
		},
		
		{
			ident=206,
			count=4,
			position={0.2, 0.5},
			radius={0.06, 0.09},
			fleets=
			{
				{12, { {0, 21600}, {1, 14400} }},
			},
			fleetCount={12, 18},
			unique=
			{
				{"12_researchcenter1"},
			},
			fleetFraction=0.6,
			ambient={ -1 },
		},
		
		{
			ident=207,
			count=3,
			position={0.7, 0.9},
			radius={0.03, 0.06},
			type=2,
			asteroidFlags=SQUARE,
			fleets=
			{
				{6, { {0, 4800}, {1, 3200} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.8,
			ambient={ -1 },
		},
		
		{
			ident=209,
			count=4,
			position={0.5, 0.7},
			radius={0.05, 0.08},
			type=1,
			fleets=
			{
				{2, { {0, 15750}, {1, 11250} }},
			},
			fleetCount={15, 21},
			ambient={ 0 },
			unique=
			{
				{"2_researchcenter1", "2_pstation1"},
				{"2_pstation-spiralcircle1"},
				{"2_farmer", "2_farmer", "2_pship_farmer01", "2_pdepot_01big"},
				{"2_farmer", "2_farmer", "2_pship_farmer02", "2_pship_farmer02", "2_pdepot_01"},
			},
			fortress=
			{
				"2_platform0",
				"2_platform1",
				"2_platform3"
			},
			fortressCount={4, 5},
		},
		
		{
			ident=210,
			count=2,
			position={0.5, 0.7},
			radius={0.03, 0.06},
			type=1,
			fleets=
			{
				{13, { {0, 5200}, {1, 3600} }},
			},
			fleetCount={18, 26},
			ambient={ -1 },
			unique=
			{
				{"13_ppod_02big"},
				{"13_ppod_03med"},
				{"13_ppod_01small"},
			},
		},
		
		{
			ident=211,
			color=0xcc009f,
			count=3,
			position={0.7, 0.9},
			radius={0.05, 0.08},
			type=2,
			fleets=
			{
				{10, { {0, 18000}, {1, 12000} }},
			},
			fleetCount={8, 12},
			ambient = { 0 },
		},
		
--原版主领地
-- 人族
		{
			ident=212,
			count=1,
			position={0.7, 0.9},
			radius={0.07, 0.08},
			type=2,
			fleets=
			{
				{8, { { 0, 36000}, {1, 24000} }},
			},
			fleetCount={8, 12},
			ambient={ 0 },
			fortress=
			{
				"8_supercorvette",
				"8_Attackship-1000",
				"8_Attackship-1500",
				"8_Attackship-2000",
				"8_Attackship-2500",
				"8_Attackship-3000",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
			unique=
			{
				{
					"8_teleporter_station",
					"8_supercorvette",
					"8_Attackship-1000",
					"8_Attackship-1500",
				},
				{
					"8_Attackship-4000",
					"8_supercorvette",
					"8_Attackship-1000",
					"8_Attackship-1500",
				},
				{
					"8_station1",
					"8_Attackship-1000",
					"8_Attackship-1500",
					"8_Attackship-2000",
				},
				{
					"8_Attackship-6000",
					"8_Attackship-1000",
					"8_Attackship-1500",
					"8_Attackship-2000",
				},
				{
					"8_station2",
					"8_Attackship-1500",
					"8_Attackship-2000",
					"8_Attackship-2500",
				},
				{
					"8_station3",
					"8_Attackship-1500",
					"8_Attackship-2000",
					"8_Attackship-2500",
				},
			},
			uniqueFraction=0.15,
		},
-- 水晶
		{
			ident=213,
			count=1,
			position={0.2, 0.5},
			radius={0.09, 0.1},
			type=2,
			fleets={
				{11, { { 0, 38400}, {1, 25600} }},
			},
			fleetCount={8, 12},
			ambient={ -1 },
			fortress=
			{
				"11_Scandium",
				"11_pship_01",
				"11_pship_02",
				"11_Barium",
				"11_pship_longskinny1",
				"11_Hafnium",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
			unique=
			{
				{
					"11_pship_longskinny1",
					"11_Scandium",
					"11_pship_01",
					"11_pship_02",
				},
				{
					"11_pship_03",
					"11_Scandium",
					"11_pship_01",
					"11_pship_02",
				},
				{
					"11_Attackship-5000",
					"11_pship_01",
					"11_pship_02",
					"11_Barium",
				},
				{
					"11_station01",
					"11_pship_01",
					"11_pship_02",
					"11_Barium",
				},
				{
					"11_pship_04",
					"11_pship_02",
					"11_Barium",
					"11_pship_longskinny1",
				},
				{
					"11_Attackship-7000",
					"11_pship_02",
					"11_Barium",
					"11_pship_longskinny1",
				},
			},
			uniqueFraction=0.15,
			asteroidSize={50, 150},
			asteroidDensity={0.0, 0.2},
		},
-- 红族
		{  
			ident=214,
			count=1,
			color=0xff5000,
			position={0.7, 0.9},
			radius={0.06, 0.07},
			type=2,
			fleets=
			{
				{3, { {0, 27000}, {1, 18000} }},
			},
			fleetCount={12, 18},
			ambient={ 0 },
			fortress=
			{
				"3_pship-talon2",
				"3_pship_big01",
				"3_trochse",
				"3_Seen",
				"3_cruser",
				"3_researchcenter1",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
			unique=
			{
				{
					"3_cept",
					"3_pship-talon2",
					"3_battleship",
					"3_trochse",
				},
				{
					"3_ioslate",
					"3_pship-talon2",
					"3_battleship",
					"3_trochse",
				},
				{
					"3_posuasdive",
					"3_battleship",
					"3_trochse",
					"3_Seen",
				},
				{
					"3_bassert",
					"3_battleship",
					"3_trochse",
					"3_Seen",
				},
				{
					"3_Alon-C",
					"3_trochse",
					"3_Seen",
					"3_cruser",
				},
				{
					"3_Alon-B",
					"3_trochse",
					"3_Seen",
					"3_cruser",
				},
			},
			uniqueFraction=0.15,
		},
-- 叮当
		{  
			ident=215,
			count=1,
			position={0.5, 0.7},
			radius={0.08,0.09},
			type=2,
			fleets=
			{
				{4, { {0, 28800}, {1, 19200} }},
			},
			fleetCount={12, 18},
			ambient={ 1 },
			fortress=
			{
				"4_'Catastrophe'SpecialFighter",
				"4_Attackship-1500",
				"4_water_ship-D",
				"4_pship_big014_pship_big02",
				"4_pship_big01",
				"4_Attackship-3000",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
			unique=
			{
				{
					"4_pstation01",
					"4_'Catastrophe'SpecialFighter",
					"4_Attackship-1500",
					"4_water_ship-D",
				},
				{
					"4_ovo",
					"4_'Catastrophe'SpecialFighter",
					"4_Attackship-1500",
					"4_water_ship-D",
				},
				{
					"4_carrier",
					"4_Attackship-1500",
					"4_water_ship-D",
					"4_pship_big014_pship_big02",
				},
				{
					"4_pstation02",
					"4_Attackship-1500",
					"4_water_ship-D",
					"4_pship_big014_pship_big02",
				},
				{
					"4_water_ship-E",
					"4_water_ship-D",
					"4_pship_big014_pship_big02",
					"4_pship_big01",
				},
				{
					"4_owo",
					"4_water_ship-D",
					"4_pship_big014_pship_big02",
					"4_pship_big01",
				},
			},
			uniqueFraction=0.15,
		},
-- 哨兵
		{ 
			ident=216,
			count=1,
			color=0xa0f000,
			position={0.5, 0.7},
			radius={0.09, 0.1},
			type=2,
			fleets=
			{
				{15, { {0, 45000}, {1, 27000} }},
			},
			fleetCount={6, 10},
			ambient={ 0 },
			fortress=
			{
				"15_Attackship_1000",
				"15_scythe",
				"15_Attackship_1500",
				"15_dragonfly",
				"15_scyth2",
				"15_Attackship_2500",
			},
			fortressCount={1, 6},
			fortressRadius={500, 700},
			unique=
			{
				{
					"15_Spaceship_4000",
					"15_Attackship_1000",
					"15_scythe",
					"15_Attackship_1500",
				},
				{
					"15_Attackship_4000",
					"15_Attackship_1000",
					"15_scythe",
					"15_Attackship_1500",
				},
				{
					"15_Attackship_4500",
					"15_scythe",
					"15_Attackship_1500",
					"15_dragonfly",
				},
				{
					"15_Spaceship_6000",
					"15_scythe",
					"15_Attackship_1500",
					"15_dragonfly",
				},
				{
					"15_crescent",
					"15_Attackship_1500",
					"15_dragonfly",
					"15_scyth2",
				},
				{
					"15_Attackship_7500",
					"15_Attackship_1500",
					"15_dragonfly",
					"15_scyth2",
				},
			},
			uniqueFraction=0.15,
		},
-- 蜂群
		{
			ident=217,
			count=1,
			position={0.2, 0.5},
			radius={0.08, 0.09},
			type=2,
			fleets=
			{
				{12, { {0, 27000}, {1, 16200} }},
			},
			fleetCount={9, 15},
			fleetFraction=0.6,
			ambient={ -1 },
			fortress=
			{
				"12_bat1",
				"12_bat3",
				"12_Unnamed_Spaceship-459",
				"12_Unnamed_Spaceship-664",
				"12_drones",
				"12_Unnamed_Spaceship-1296",
			},
			fortressCount={3, 4},
			fortressRadius={600, 700},
			unique=
			{
				{
					"12_Unnamed_Spaceship-1296",
					"12_bat3",
					"12_Unnamed_Spaceship-459",
					"12_Unnamed_Spaceship-664",
				},
				{
					"12_pship_x1",
					"12_bat3",
					"12_Unnamed_Spaceship-459",
					"12_Unnamed_Spaceship-664",
				},
				{
					"12_Unnamed_Spaceship-2286",
					"12_Unnamed_Spaceship-459",
					"12_Unnamed_Spaceship-664",
					"12_drones",
				},
				{
					"12_Unnamed_Spaceship-2544",
					"12_Unnamed_Spaceship-459",
					"12_Unnamed_Spaceship-664",
					"12_drones",
				},
				{
					"12_spider",
					"12_Unnamed_Spaceship-664",
					"12_drones",
					"12_Unnamed_Spaceship-1296",
				},
				{
					"12_Unnamed_Spaceship-7002",
					"12_Unnamed_Spaceship-664",
					"12_drones",
					"12_Unnamed_Spaceship-1296",
				},
			},
			uniqueFraction=0.15,
		},
-- 放牧
		{
			ident=218,
			count=1,
			position={0.5, 0.7},
			radius={0.07, 0.08},
			type=2,
			fleets=
			{
				{2, { {0, 36000}, {1, 21600} }},
			},
			fleetCount={9, 15},
			ambient={ 0 },
			fortress=
			{
				"2_sniper",
				"2_t4_sniper",
				"2_spinner",
				"2_dreadnought",
				"2_battleship",
				"2_t4_battleship",
			},
			fortressCount={4, 5},
			unique=
			{
				{
					"2_pdepot_01",
					"2_sniper",
					"2_t4_sniper",
					"2_spinner",
				},
				{
					"2_UnnamedSpaceship-6000",
					"2_sniper",
					"2_t4_sniper",
					"2_spinner",
				},
				{
					"2_pstation-spiralcircle1",
					"2_t4_sniper",
					"2_spinner",
					"2_dreadnought",
				},
				{
					"2_pstation_tree1",
					"2_t4_sniper",
					"2_spinner",
					"2_dreadnought",
				},
				{
					"2_Attackship-7000",
					"2_spinner",
					"2_dreadnought",
					"2_t4_battleship",
				},
				{
					"2_pstation1",
					"2_spinner",
					"2_dreadnought",
					"2_t4_battleship",
				},
			},
			uniqueFraction=0.15,
		},

--取火者殖民区
		{
			ident=300,
			color=0xaaaaaa,
			faction=20004,
			count=4,
			position={0.1, 0.6},
			radius={0.05, 0.07},
			type=1,
			fleets=
			{
				{20004, { {0, 18000}, {1, 12000} }},
			},
			fleetCount={16, 24},
			fleetFraction=0.48,
			fortress=
			{
				"20004_Atom",
				"20004_Photon",
				"20004_Molecule",
				"20004_Antineutron",
				"20004_Antiproton",
				"20004_ENeutrino",
			},
			fortressCount={1, 2},
			ambient={ 0 },
			asteroidSize={50, 200},
		},
--谜族殖民区
		{
			ident=301,
			color=0x9d9d26,
			faction=20005,
			count=6,
			position={0.1, 0.8},
			radius={0.04, 0.06},
			fleets=
			{
				{20005, { {0, 9188}, {1, 6563} }},
			},
			fleetCount={15, 21},
			fleetFraction=0.48,
			fortress=
			{
				"20005_ButterflyCurve",
				"20005_Nephroid",
				"20005_Astroid",
				"20005_PeanoCurve",
				"20005_SerpentineCurve",
				"20005_Oval",
			},
			fortressCount={1, 2},
			ambient={ 0 },
			asteroidSize={40, 160},
			asteroidFlags=UNIFORM_SIZE,
		},
--不朽者殖民区
		{
			ident=302,
			color=0xffa513,
			faction=20007,
			count=4,
			position={0.4, 0.8},
			radius={0.04, 0.06},
			fleets=
			{
				{20007, { {0, 15750}, {1, 10500} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20007_Ra-223",
				"20007_Ra-228",
				"20007_Ac-227",
				"20007_Ac-228",
				"20007_Pa-231",
				"20007_Pa-234",
			},
			fortressCount={1, 2},
			fortressRadius={600, 800},
			ambient={ 0 },
			asteroidSize={40, 100},
		},
--巫族殖民区
		{
			ident=303,
			color=0xd5ff4d,
			faction=20016,
			count=4,
			position={0.4, 0.8},
			radius={0.04, 0.06},
			fleets=
			{
				{20016, { {0, 13500}, {1, 9000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress=
			{
				"20016_Emerald_I",
				"20016_Emerald_II",
				"20016_Garnet_I",
				"20016_Garnet_II",
				"20016_Moonstone_I",
				"20016_Moonstone_II",
			},
			fortressCount={1, 2},
			fortressRadius={400, 500},
			ambient={ -1,0 },
			asteroidSize={100, 200},
			asteroidFlags=UNIFORM_SIZE,
		},
--无心者殖民区
		{
			ident=304,
			color=0xb051ff,
			faction=20009,
			count=4,
			position={0.1, 0.6},
			radius={0.04, 0.06},
			type=1,
			fleets={
				{20009, { {0, 11250}, {1, 6750} }},
			},
			fleetCount={9, 15},
			fleetFraction=0.48,
			fortress={
				"20009_17D3A05796F7E",
				"20009_2C4506BE",
				"20009_16BACEBFA",
				"20009_10704EC86",
				"20009_16A65D1A8",
				"20009_A5B7AA22",
			},
			fortressCount={1, 2},
			fortressRadius={300, 400},
			ambient={ 0 },
			asteroidDensity={0, 0.4},
			asteroidFlags=UNIFORM_SIZE,
		},
--犀族殖民区
		{
			ident=305,
			color=0x003fba,
			faction=20011,
			count=4,
			position={0.1, 0.6},
			radius={0.04, 0.06},
			fleets=
			{
				{20011, { {0, 10125}, {1, 6750} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20011_Uisff",
				"20011_UserBehavior",
				"20011_Gpvs",
				"20011_G4520",
				"20011_DDoS",
				"20011_i5-6300U",
			},
			fortressCount={1, 2},
			ambient={ 0 },
			asteroidSize={40, 160},
			asteroidFlags=UNIFORM_SIZE,
		},

--取火者副领地
		{
			ident=400,
			color=0xaaaaaa,
			faction=20004,
			count=3,
			position={0.5, 0.8},
			radius={0.05, 0.07},
			fleets=
			{
				{20004, { {0, 21000}, {1, 15000} }},
			},
			fleetCount={15, 21},
			fleetFraction=0.48,
			fortress=
			{
				"20004_Molecule",
				"20004_Antineutron",
				"20004_Antiproton",
				"20004_ENeutrino",
				"20004_PElectron",
				"20004_Antineutrino",
			},
			fortressCount={2, 3},
			ambient={ 0 },
			asteroidSize={50, 200},
		},
--谜族副领地
		{
			ident=401,
			color=0x9d9d26,
			faction=20005,
			count=3,
			position={0.1, 0.5},
			radius={0.06, 0.08},
			type=1,
			fleets=
			{
				{20005, { {0, 18375}, {1, 13125} }},
			},
			fleetCount={15, 21},
			fleetFraction=0.48,
			fortress=
			{
				"20005_Astroid",
				"20005_PeanoCurve",
				"20005_SerpentineCurve",
				"20005_Oval",
				"20005_Cissoid",
				"20005_Cochleoid",
			},
			fortressCount={2, 3},
			ambient={ 0 },
			asteroidSize={40, 160},
			asteroidFlags=UNIFORM_SIZE,
		},
--见证者副领地
		{
			ident=402,
			color=0x41c536,
			faction=20006,
			count=2,
			position={0.3, 0.7},
			radius={0.07, 0.09},
			type=2,
			fleets=
			{
				{20006, { {0, 27000}, {1, 18000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20006_Denebola",
				"20006_Arcturus",
				"20006_Markab",
				"20006_Spica",
				"20006_Scheat",
				"20006_Alpheratz",
			},
			fortressCount={2, 3},
			fortressRadius={500, 700},
			asteroidSize={50, 200},
		},
--不朽者副领地
		{
			ident=403,
			color=0xffa513,
			faction=20007,
			count=3,
			position={0.3, 0.7},
			radius={0.07, 0.09},
			type=2,
			fleets=
			{
				{20007, { {0, 22500}, {1, 15000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20007_Ac-227",
				"20007_Ac-228",
				"20007_Pa-231",
				"20007_Pa-234",
				"20007_Fr-223",
				"20007_Fr-224",
			},
			fortressCount={2, 3},
			fortressRadius={600, 800},
			ambient={ 0 },
			asteroidSize={40, 100},
		},
--巫族副领地
		{
			ident=404,
			color=0xd5ff4d,
			faction=20016,
			count=2,
			position={0.1, 0.5},
			radius={0.08, 0.1},
			fleets=
			{
				{20016, { {0, 33750}, {1, 20250} }},
			},
			fleetCount={9, 15},
			fleetFraction=0.48,
			fortress=
			{
				"20016_Garnet_I",
				"20016_Garnet_II",
				"20016_Moonstone_I",
				"20016_Moonstone_II",
				"20016_Olivine_I",
				"20016_Olivine_II",
			},
			fortressCount={2, 3},
			fortressRadius={400, 500},
			ambient={ -1,0 },
			asteroidSize={100, 200},
			asteroidFlags=UNIFORM_SIZE,
		},
--无心者副领地
		{
			ident=405,
			color=0xb051ff,
			faction=20009,
			count=2,
			position={0.5, 0.8},
			radius={0.09, 0.11},
			type=1,
			fleets={
				{20009, { {0, 36000}, {1, 24000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress={
				"20009_16BACEBFA",
				"20009_10704EC86",
				"20009_16A65D1A8",
				"20009_A5B7AA22",
				"20009_12AC8C12C",
				"20009_101C667CC",
			},
			fortressCount={2, 3},
			fortressRadius={500, 600},
			ambient={ 0 },
			asteroidDensity={0, 0.4},
			asteroidFlags=UNIFORM_SIZE,
		},	
--犀族副领地
		{
			ident=406,
			color=0x003fba,
			faction=20011,
			count=3,
			position={0.1, 0.5},
			radius={0.05, 0.07},
			fleets=
			{
				{20011, { {0, 24000}, {1, 16000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress=
			{
				"20011_Gpvs",
				"20011_G4520",
				"20011_DDoS",
				"20011_i5-6300U",
				"20011_G3258-5.0G",
				"20011_Gjwf",
			},
			fortressCount={2, 3},
			ambient={ 0 },
			asteroidSize={50, 200},
		},
--明族副领地
		{
			ident=407,
			color=0x7b9df4,
			faction=20050,
			count=3,
			position={0.5, 0.8},
			radius={0.04, 0.06},
			fleets=
			{
				{20050, { {0, 30000}, {1, 20000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress=
			{
				"20050_Gyromitra_ambigua_Harmaja",
				"20050_Hygrophorus_pudorinus_Fr",
				"20050_Inocybe_pudica_Kunn",
				"20050_Lepista_glaucocana_Singer",
				"20050_Leucopaxillus_albissimus_Singer",
				"20050_Neobulgaria_pura_Petr",
			},
			fortressCount={2, 3},
			ambient={ 0 },
			asteroidSize={50, 200},
		},

--各拓展势力主领地		
		{
			ident=2002,
			color=0x831ae8,
			faction=20002,
			count=1,
			position={0.85, 0.85},
			radius={0.14, 0.14},
			type=2,
			fleets=
			{
				{20002, { {0, 90000}, {1, 60000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20002_TalbotiaNaganum",
				"20002_LampropteraCurius",
				"20002_PolyuraNepenthes",
				"20002_AtrophaneuraAidoneus",
				"20002_StibochionaNicea",
				"20002_PapilioDialisLeech",
			},
			fortressCount={3, 4},
			fortressRadius={500, 800},
			unique=
			{
				{
					"20002_LetheVindhyaFelder",
					"20002_ByasaPolla",
					"20002_KaniskaCanace",
					"20002_PapilioButlerianus",
				},
				{
					"20002_EnispeLunatumLeech",
					"20002_ByasaPolla",
					"20002_KaniskaCanace",
					"20002_PapilioButlerianus",
				},
				{
					"20002_DiscophoraSondaicaBoisduval",
					"20002_ByasaPolla",
					"20002_KaniskaCanace",
					"20002_PapilioButlerianus",
				},
				{
					"20002_SephisaChandra",
					"20002_StibochionaNicea",
					"20002_PapilioButlerianus",
					"20002_AtrophaneuraAidoneus",
				},
				{
					"20002_MycalesisGotamaMoore",
					"20002_StibochionaNicea",
					"20002_PapilioButlerianus",
					"20002_AtrophaneuraAidoneus",
				},
				{
					"20002_MelanitisPhedimaCramer",
					"20002_StibochionaNicea",
					"20002_PapilioButlerianus",
					"20002_AtrophaneuraAidoneus",
				},
			},
			uniqueFraction=0.15,
			ambient={ 1 },
			asteroidFlags=UNIFORM_SIZE,
		},
		
		{
			ident=2004,
			color=0xaaaaaa,
			count=1,
			position={0.7, 0.7},
			radius={0.11, 0.11},
			type=2,
			fleets=
			{
				{20004, { {0, 40500}, {1, 27000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20004_Antiproton",
				"20004_ENeutrino",
				"20004_PElectron",
				"20004_Antineutrino",
				"20004_Muon",
				"20004_Gluon",
			},
			fortressCount={3, 4},
			unique=
			{
				{
					"20004_MaxKarlErnstLudwigPlanck",
					"20004_Antineutrino",
					"20004_PElectron",
					"20004_ENeutrino",
				},
				{
					"20004_Nucleon",
					"20004_Antineutrino",
					"20004_PElectron",
					"20004_ENeutrino",
				},
				{
					"20004_Fermion",
					"20004_Antineutrino",
					"20004_PElectron",
					"20004_ENeutrino",
				},
				{
					"20004_JamesClerkMaxwell",
					"20004_ENeutrino",
					"20004_Antiproton",
					"20004_Antineutron",
				},
				{
					"20004_Mesotron",
					"20004_ENeutrino",
					"20004_Antiproton",
					"20004_Antineutron",
				},
				{
					"20004_Hadron",
					"20004_ENeutrino",
					"20004_Antiproton",
					"20004_Antineutron",
				},
			},
			uniqueFraction=0.15,
			ambient={ 0 },
			asteroidSize={100, 400},
		},

		{
			ident=2005,
			color=0x9d9d26,
			faction=20005,
			count=1,
			position={0.5, 0.5},
			radius={0.13, 0.13},
			type=2,
			fleets=
			{
				{20005, { {0, 75000}, {1, 50000} }},
			},
			fleetCount={16, 24},
			fleetFraction=0.48,
			fortress=
			{
				"20005_SerpentineCurve",
				"20005_Oval",
				"20005_Cissoid",
				"20005_Cochleoid",
				"20005_Cycloid",
				"20005_Conchoid",
			},
			fortressCount={3, 4},
			unique=
			{
				{
					"20005_Strophoid",
					"20005_Cycloid",
					"20005_Cochleoid",
					"20005_Cissoid",
				},
				{
					"20005_Lituus",
					"20005_Cycloid",
					"20005_Cochleoid",
					"20005_Cissoid",
				},
				{
					"20005_LogSpiral",
					"20005_Cycloid",
					"20005_Cochleoid",
					"20005_Cissoid",
				},
				{
					"20005_SphericalHelix",
					"20005_Cissoid",
					"20005_Astroid",
					"20005_Nephroid",
				},
				{
					"20005_Hyperbola",
					"20005_Cissoid",
					"20005_Astroid",
					"20005_Nephroid",
				},
				{
					"20005_SpiralCord",
					"20005_Cissoid",
					"20005_Astroid",
					"20005_Nephroid",
				},
			},
			uniqueFraction=0.15,
			ambient={ 0 },
			asteroidSize={40, 160},
			asteroidFlags=UNIFORM_SIZE,
		},
		
		{
			ident=2006,
			color=0x41c536,
			faction=20006,
			count=1,
			position={0.75, 0.75},
			radius={0.13, 0.13},
			type=2,
			fleets=
			{
				{20006, { {0, 81000}, {1, 54000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress=
			{
				"20006_Markab",
				"20006_Spica",
				"20006_Scheat",
				"20006_Alpheratz",
				"20006_Sirius",
				"20006_Algenib",
			},
			fortressCount={3, 4},
			fortressRadius={500, 700},
			unique=
			{
				{
					"20006_Castor",
					"20006_Alpheratz",
					"20006_Scheat",
					"20006_Spica",
				},
				{
					"20006_Megrez",
					"20006_Alpheratz",
					"20006_Scheat",
					"20006_Spica",
				},
				{
					"20006_Phecda",
					"20006_Alpheratz",
					"20006_Scheat",
					"20006_Spica",
				},
				{
					"20006_Ruchbah",
					"20006_Spica",
					"20006_Markab",
					"20006_Arcturus",
				},
				{
					"20006_Dubhe",
					"20006_Spica",
					"20006_Markab",
					"20006_Arcturus",
				},
				{
					"20006_Caph",
					"20006_Spica",
					"20006_Markab",
					"20006_Arcturus",
				},
			},
			uniqueFraction=0.15,
			asteroidSize={50, 400},
		},
		
		{
			ident=2007,
			color=0xffa513,
			faction=20007,
			count=1,
			position={0.6, 0.6},
			radius={0.11, 0.11},
			type=2,
			fleets=
			{
				{20007, { {0, 48000}, {1, 32000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress=
			{
				"20007_Pa-231",
				"20007_Pa-234",
				"20007_Fr-223",
				"20007_Fr-224",
				"20007_Np-237",
				"20007_Np-239",
			},
			fortressCount={3, 4},
			fortressRadius={600, 800},
			unique=
			{
				{
					"20007_Po-212",
					"20007_Np-239",
					"20007_Fr-224",
					"20007_Fr-223",
				},
				{
					"20007_Po-214",
					"20007_Np-239",
					"20007_Fr-224",
					"20007_Fr-223",
				},
				{
					"20007_Cm-244",
					"20007_Np-239",
					"20007_Fr-224",
					"20007_Fr-223",
				},
				{
					"20007_Cm-242",
					"20007_Fr-223",
					"20007_Pa-234",
					"20007_Pa-231",
				},
				{
					"20007_Cf-254",
					"20007_Fr-223",
					"20007_Pa-234",
					"20007_Pa-231",
				},
				{
					"20007_Cf-251",
					"20007_Fr-223",
					"20007_Pa-234",
					"20007_Pa-231",
				},
			},
			uniqueFraction=0.15,
			ambient={ 0 },
			asteroidSize={50, 200},
		},

		{
			ident=2009,
			color=0xb051ff,
			faction=20009,
			count=1,
			position={0.8, 0.8},
			radius={0.12, 0.12},
			type=2,
			fleets={
				{20009, { {0, 67500}, {1, 45000} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress={
				"20009_16A65D1A8",
				"20009_A5B7AA22",
				"20009_12AC8C12C",
				"20009_101C667CC",
				"20009_3EBF1556",
				"20009_FB9E14D8",
			},
			fortressCount={3, 4},
			fortressRadius={500, 600},
			unique={
				{
					"20009_F6D62A8C",
					"20009_3EBF1556",
					"20009_101C667CC",
					"20009_12AC8C12C",
				},
				{
					"20009_108B02620",
					"20009_3EBF1556",
					"20009_101C667CC",
					"20009_12AC8C12C",
				},
				{
					"20009_5644011",
					"20009_3EBF1556",
					"20009_101C667CC",
					"20009_12AC8C12C",
				},
				{
					"20009_119F0AB",
					"20009_12AC8C12C",
					"20009_A5B7AA22",
					"20009_16A65D1A8",
				},
				{
					"20009_40661210",
					"20009_12AC8C12C",
					"20009_A5B7AA22",
					"20009_16A65D1A8",
				},
				{
					"20009_107B14C6F",
					"20009_12AC8C12C",
					"20009_A5B7AA22",
					"20009_16A65D1A8",
				},
			},
			uniqueFraction=0.15,
			ambient={ 0 },
			asteroidDensity={0, 0.4},
			asteroidFlags=UNIFORM_SIZE,
		},	

		{
			ident=2010,
			color=0x484c56,
			faction=20010,
			count=1,
			position={0, 0},
			radius={0.15, 0.15},
			type=2,
			fleets={
				{20010, { {0, 96000}, {1, 64000} }},
			},
			fleetCount={16, 24},
			fleetFraction=0.48,
			fortress={
				"20010_Washer",
				"20010_Pin",
				"20010_Screw",
				"20010_Spacer",
				"20010_Crank",
				"20010_Rivet",
			},
			fortressCount={3, 4},
			fortressRadius={400, 500},
			unique={
				{
					"20010_Grinder",
					"20010_Spacer",
					"20010_Screw",
					"20010_Pin",
				},
				{
					"20010_Shaper",
					"20010_Spacer",
					"20010_Screw",
					"20010_Pin",
				},
				{
					"20010_BroachingMachine",
					"20010_Spacer",
					"20010_Screw",
					"20010_Pin",
				},
				{
					"20010_Jack",
					"20010_Pin",
					"20010_Washer",
					"20010_Redirector",
				},
				{
					"20010_Hob",
					"20010_Pin",
					"20010_Washer",
					"20010_Redirector",
				},
				{
					"20010_Rough",
					"20010_Pin",
					"20010_Washer",
					"20010_Redirector",
				},
			},
			uniqueFraction=0.15,
			ambient={ 1 },
			asteroidDensity={0, 0.2},
			asteroidSize={10, 100},
		},
		
		{
			ident=2011,
			color=0x003fba,
			faction=20011,
			count=1,
			position={0.7, 0.7},
			radius={0.12, 0.12},
			type=2,
			fleets={
				{20011, { {0, 60750}, {1, 40500} }},
			},
			fleetCount={12, 18},
			fleetFraction=0.48,
			fortress={
				"20011_DDoS",
				"20011_i5-6300U",
				"20011_G3258-5.0G",
				"20011_Gjwf",
				"20011_Tjy",
				"20011_sfc",
			},
			fortressCount={3, 4},
			fortressRadius={400, 500},
			unique={
				{
					"20011_Milkyway-2",
					"20011_sfc",
					"20011_Tjy",
					"20011_Gjwf",
				},
				{
					"20011_Titan-Jaguar",
					"20011_sfc",
					"20011_Tjy",
					"20011_Gjwf",
				},
				{
					"20011_Sequoia",
					"20011_sfc",
					"20011_Tjy",
					"20011_Gjwf",
				},
				{
					"20011_Cori-2",
					"20011_Gjwf",
					"20011_G3258-5.0G",
					"20011_i5-6300U",
				},
				{
					"20011_Ojof",
					"20011_Gjwf",
					"20011_G3258-5.0G",
					"20011_i5-6300U",
				},
				{
					"20011_Fjhiu",
					"20011_Gjwf",
					"20011_G3258-5.0G",
					"20011_i5-6300U",
				},
			},
			uniqueFraction=0.15,
			ambient={ 1 },
			asteroidDensity={0, 0.2},
			asteroidSize={10, 100},
		},

		{
			ident=2016,
			color=0xd5ff4d,
			faction=20016,
			count=1,
			position={0.35, 0.35},
			radius={0.12, 0.12},
			type=2,
			fleets=
			{
				{20016, { {0, 54000}, {1, 36000} }},
			},
			fleetCount={8, 12},
			fleetFraction=0.48,
			fortress=
			{
				"20016_Moonstone_I",
				"20016_Moonstone_II",
				"20016_Olivine_I",
				"20016_Olivine_II",
				"20016_Opal_I",
				"20016_Opal_II",
			},
			fortressCount={3, 4},
			fortressRadius={500, 500},
			unique=
			{
				{
					"20016_Idocrase",
					"20016_Moonstone_I",
					"20016_Moonstone_II",
					"20016_Garnet_I",
				},
				{
					"20016_Chalcedony",
					"20016_Moonstone_I",
					"20016_Moonstone_II",
					"20016_Garnet_I",
				},
				{
					"20016_Spinel_II",
					"20016_Moonstone_I",
					"20016_Moonstone_II",
					"20016_Garnet_I",
				},
				{
					"20016_Spinel_I",
					"20016_Garnet_I",
					"20016_Garnet_II",
					"20016_Emerald_I",
				},
				{
					"20016_Sapphire_II",
					"20016_Garnet_I",
					"20016_Garnet_II",
					"20016_Emerald_I",
				},
				{
					"20016_Sapphire_I",
					"20016_Garnet_I",
					"20016_Garnet_II",
					"20016_Emerald_I",
				},
			},
			uniqueFraction=0.15,
			ambient={ -1,0 },
			asteroidSize={100, 200},
			asteroidFlags=UNIFORM_SIZE,
		},

		{
			ident=2050,
			color=0x7b9df4,
			faction=20050,
			count=1,
			position={0.8, 0.8},
			radius={0.08, 0.08},
			type=2,
			fleets={
				{20050, { {0, 75000}, {1, 50000} }},
			},
			fleetCount={{6, 10}, {8, 12}},
			fleetFraction=0.9,
			fortress={
				"20050_Gyromitra_ambigua_Harmaja",
				"20050_Hygrophorus_pudorinus_Fr",
				"20050_Inocybe_pudica_Kunn",
				"20050_Lepista_glaucocana_Singer",
				"20050_Leucopaxillus_albissimus_Singer",
				"20050_Neobulgaria_pura_Petr",
			},
			fortressCount={3, 4},
			fortressRadius={500, 700},
			unique={
				{
					"20050_Stropharia_semiglobata",
					"20050_Ramaria_mairei_Donk",
					"20050_Leucopaxillus_albissimus_Singer",
					"20050_Neobulgaria_pura_Petr",
				},
				{
					"20050_Lesliei",
					"20050_Ramaria_lutea_Schild",
					"20050_Leucopaxillus_albissimus_Singer",
					"20050_Neobulgaria_pura_Petr",
				},
				{
					"20050_Ruschiorum",
					"20050_Pholiota_terrestris_Overh",
					"20050_Leucopaxillus_albissimus_Singer",
					"20050_Neobulgaria_pura_Petr",
				},
				{
					"20050_Steineckeana",
					"20050_Phallus_fragrans",
					"20050_Leucopaxillus_albissimus_Singer",
					"20050_Neobulgaria_pura_Petr",
				},
				{
					"20050_Terricolor",
					"20050_Peziza_repanda_Wahlenb",
					"20050_Leucopaxillus_albissimus_Singer",
					"20050_Neobulgaria_pura_Petr",
				},
			},
			uniqueFraction=0.2,
			ambient={ 0,1,2 },
			asteroidDensity={0.2, 0.3},
			asteroidSize={240, 300},
			asteroidFlags=HEXAGON|OCTAGON|PENROSE,
		},

--不可选势力
		{
			ident=2052,
			color=0xec9d1e,
			faction=20052,
			count=3,
			position={0.5, 0.8},
			radius={0.03, 0.04},
			type=2,
			fleets={
				{20052, { {0, 67500}, {1, 45000} }},
				{20052, { {0, 54000}, {1, 36000} }},
			},
			fleetCount={{10, 15}, {8, 12}},
			fleetFraction=0.9,
			fortress={
				"20052_Coriaceifolium",
				"20052_Crassum",
				"20052_Fenzelianum",
				"20052_Henryi",
				"20052_Kwangnanense",
				"20052_Kweilinense",
			},
			fortressCount={3, 4},
			fortressRadius={500, 700},
			unique={
				{
					"20052_Wardii",
					"20052_Shirasawanum",
					"20052_Yui",
					"20052_Kungshanense",
				},
				{
					"20052_Wardii",
					"20052_Rubrum",
					"20052_Yui",
					"20052_Kungshanense",
				},
				{
					"20052_Ukurunduense",
					"20052_Pictum",
					"20052_Yui",
					"20052_Kungshanense",
				},
				{
					"20052_Ukurunduense",
					"20052_Pectinatum",
					"20052_Yui",
					"20052_Kungshanense",
				},
				{
					"20052_Tenellum",
					"20052_Paxii",
					"20052_Yui",
					"20052_Kungshanense",
				},
				{
					"20052_Tenellum",
					"20052_Tataricum",
					"20052_Yui",
					"20052_Kungshanense",
				},
			},
			uniqueFraction=0.2,
			ambient={ 0 },
			asteroidDensity={0.2, 0.3},
			asteroidSize={240, 300},
			asteroidFlags=HEXAGON|OCTAGON,
		},

		{
			ident=2054,
			color=0x34bb74,
			faction=20054,
			count=3,
			position={0.5, 0.8},
			radius={0.03, 0.04},
			type=2,
			fleets={
				{20054, { {0, 67500}, {1, 45000} }},
				{20054, { {0, 54000}, {1, 36000} }},
			},
			fleetCount={{4, 8}, {3, 6}},
			fleetFraction=0.8,
			fortress={
				"20054_Crinum Zeylanicum",
				"20054_Curculigo Breviscapa",
				"20054_Curculigo Capitulata",
				"20054_Curculigo Crassifolia",
				"20054_Curculigo Gracilis",
				"20054_Habranthus Caeruleus",
			},
			fortressCount={2, 3},
			fortressRadius={500, 700},
			unique={
				{
					"20054_Lycoris Straminea",
					"20054_Lycoris Squamigera",
					"20054_Leucojum Aestivum",
					"20054_Lycoris Anhuiensis",
				},
				{
					"20054_Miniata Regel Gartenfl",
					"20054_Lycoris Sprengeri",
					"20054_Leucojum Aestivum",
					"20054_Lycoris Anhuiensis",
				},
				{
					"20054_Narcissus Grand Emperor",
					"20054_Lycoris Rosea",
					"20054_Leucojum Aestivum",
					"20054_Lycoris Anhuiensis",
				},
				{
					"20054_Narcissus Jonquilla",
					"20054_Lycoris Longituba",
					"20054_Leucojum Aestivum",
					"20054_Lycoris Anhuiensis",
				},
				{
					"20054_Narcissus Zhangzhou",
					"20054_Lycoris Houdyshelii",
					"20054_Leucojum Aestivum",
					"20054_Lycoris Anhuiensis",
				},
				{
					"20054_Narcissus Zhangzhou",
					"20054_Lycoris Houdyshelii",
					"20054_Lycoris Guangxiensis",
					"20054_Lycoris Caldwellii",
				},
			}
			uniqueFraction=0.3,
			ambient={ 0,1 },
			asteroidDensity={0.3, 0.4},
			asteroidSize={240, 300},
			asteroidFlags=HEXAGON,
		},
	},
}
