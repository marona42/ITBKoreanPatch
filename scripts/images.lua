
OUTLINE_PATTERN = "(.*combat.*mountain.*)|(.*units.*)|(.*combat.*structures.*)|(.*strategy.*structures.*)|(.*islands/island.*)|(.*combat.*building_sheet.*)|(.*combat/icon.*icon.*)|(.*combat/tile_icon.*)|(.*strategy/island.*)|(.*victory_.*)"

local combat_folders = {"buildings", "pod", "structures", "tiles_acid", "tiles_grass", "tiles_lava", "tiles_volcano", "tiles_sand", "tiles_snow"}

GRAY_PATTERN = "(.*achievements.*)"

function InitializeImageList()

	local screenCenter = Point(ScreenSizeX()/2, ScreenSizeY()/2)
	
	---- main menu
	
	Location["menu_board"] = Point(ScreenSizeX()/2-386,ScreenSizeY()/2-177)
	--Texts["menu_name"] = Text("Kaiju Battle",Point(screenCenter.x,ScreenSizeY()/2-260),20,ALIGN_CENTER)
		
	
	--- squad select_mission
	
	Buttons["victory_quit"] = Button(Rect2D(0, 0, 145,45),"Button_Victory_Quit",12)
	Buttons["victory_pilot"] = Button(Rect2D(0, 0, 145,45),"Button_Victory_Pilot",12)
	
	
	Boxes["menu_squad_select"] = Rect2D(ScreenSizeX()/2-550,ScreenSizeY()/2-365/2,300,365)
	
	Location["menu_squad_units"] = Point(75,75)
	Values["menu_squad_gaps"] = 110
		
	local profile_size = Point(420, 300)
	Boxes["profile_window"] = Rect2D(Point(ScreenSizeX()/2-profile_size.x/2,ScreenSizeY()/2-profile_size.y/2),profile_size)
	
	profile_size.x = 470
	profile_size.y = 160
	Boxes["new_profile"] = Rect2D(Point(ScreenSizeX()/2-profile_size.x/2,ScreenSizeY()/2-profile_size.y/2),profile_size)
	
	---------- HANGAR ------------------
	
	Buttons["hangar_color"] = Button(Rect2D(0,0,45,45),"",12)
	Buttons["hangar_rename"] = Button(Rect2D(0,0,35,24),"",12)
	Buttons["hangar_info"] = Button(Rect2D(0,0,20,15),"",12)
	local diff = (ScreenSizeY() - 720)/2
	Buttons["hangar_left"] = Button("ui/hangar/small_arrow_left",Point(0,0))
	Buttons["hangar_right"] = Button("ui/hangar/small_arrow_right",Point(0,0))
	Buttons["hangar_start"] = Button(Rect2D(ScreenSizeX()-280-(ScreenSizeX()-1024)/2, ScreenSizeY()-100 - diff,225,65),"Button_Hangar_Start",18)
	
	Buttons["hangar_squad"] = Button(Rect2D(ScreenSizeX()-450-(ScreenSizeX()-1024)/2, ScreenSizeY()-112 - diff,412,40),"Button_Hangar_Squad",12)
	
	Buttons["hangar_back"] = Button(Rect2D(0,0,120,65),"Button_Hangar_Back",18)
	
	Buttons["hangar_random_pilot"] = Button(Rect2D(0,0,412,40),"Button_Hangar_Random_Pilot",12)
	Buttons["hangar_pilots"] = Button(Rect2D(0,0,412,40),"Button_Hangar_Pilot",12)
	
	Buttons["hangar_ach"] = Button(Rect2D(0,0,300,40),"Button_Hangar_Ach",15)
	
	Buttons["hangar_secret"] = Button(Rect2D(0,0,400,40),"Button_Hangar_Secret",15)
	
	Buttons["hangar_reroll_chaos"] = Button(Rect2D(0,0,205,40),"Button_Hangar_RandomRoll",12)
	Buttons["hangar_reroll_small"] = Button(Rect2D(0,0,205,40),"Button_Hangar_Reroll",12)
	Buttons["hangar_recustom"] = Button(Rect2D(0,0,412,40),"Button_Hangar_Recustom",12)
	
	local select_size = Point(975,530)
	Boxes["hangar_select_button_box"] = Rect2D(0,0,450,40)
	Boxes["hangar_custom_button_box"] = Rect2D(0,0,450,50)
	Boxes["hangar_random_button_box"] = Rect2D(0,0,450,50)
	Buttons["hangar_custom"] = Button(Boxes["hangar_custom_button_box"],"",12)
	Buttons["hangar_random"] = Button(Boxes["hangar_random_button_box"],"",12)
	Buttons["hangar_select"] = Button(Boxes["hangar_select_button_box"],"",12)
	Buttons["hangar_mech"] = Button(Rect2D(0,0,333,95),"",12)
	Buttons["hangar_pilot"] = Button(Rect2D(0,0,130,130),"",12)
	Buttons["hangar_timetravel"] = Button(Rect2D(0,0,285,130),"",12)
	Boxes["hangar_select"] = Rect2D(ScreenSizeX()/2-select_size.x/2, ScreenSizeY()/2-select_size.y/2 - 15, select_size.x, select_size.y)
	Boxes["hangar_select_big"] = Rect2D(ScreenSizeX()/2-select_size.x/2, ScreenSizeY()/2-select_size.y/2-75/2 + 25, select_size.x, select_size.y + 75)
	Boxes["hangar_select_big_custom"] = Rect2D(ScreenSizeX()/2-select_size.x/2, ScreenSizeY()/2-select_size.y/2-40/2 + 5, select_size.x, select_size.y + 40)
	
	Boxes["hangar_confirm_button"] = Rect2D(0,0,200,40)
	
	local achievement_size = Point(select_size.x + 35, select_size.y + 55)
	Boxes["hangar_ach_display"] = Rect2D(ScreenSizeX()/2-achievement_size.x/2, ScreenSizeY()/2-achievement_size.y/2 + 23, achievement_size.x, achievement_size.y)
	
	local ach_headers = Point(Boxes["hangar_ach_display"].x, Boxes["hangar_ach_display"].y)
	Texts["ach_squad_title"] = Text("Ach_Squad", ach_headers + Point(0,2),12,ALIGN_CENTER)
	Texts["ach_global_title"] = Text("Ach_Global", ach_headers + Point(562,2),12,ALIGN_CENTER)
	
	achievement_size.x = achievement_size.x/2 - 50
	achievement_size.y = achievement_size.y - 15
	Boxes["hangar_ach_display_small"] = Rect2D(ScreenSizeX()/2-achievement_size.x/2, ScreenSizeY()/2-achievement_size.y/2, achievement_size.x, achievement_size.y)
	
	local stat_size = Point(975,580)
	Boxes["stat_screen"] = Rect2D(ScreenSizeX()/2-stat_size.x/2, ScreenSizeY()/2-stat_size.y/2, stat_size.x, stat_size.y) 
	Buttons["stat_button"] = Button(Rect2D(0,0,100,100),"",12)
	
	Buttons["stats_list_button"] = Button(Rect2D(0,0,200,40),"Stats_ListButton",12)
	Buttons["stats_squad_button"] = Button(Rect2D(0,0,220,40),"Stats_SquadButton",12)
	Buttons["stats_pilot_button"] = Button(Rect2D(0,0,200,40),"Stats_PilotButton",12)
	
	
	Buttons["hangar_travelmech"] = Button(Rect2D(0,0,50,65),"",12)
	Buttons["hangar_custommech"] = Button(Rect2D(0,0,110,45),"",12)
	
	Buttons["achievement"] = Button(Rect2D(-100,-100,64,64),"",15)
	
	-------------------------------------
	
	
	---- in game menu
	
	local menuSize = Point(275,500)
	local gameMenu = Point((ScreenSizeX()-menuSize.x)/2 - 150,(ScreenSizeY()-menuSize.y)/2)
	Boxes["escape_box"] = Rect2D(gameMenu,menuSize)
	
	local buttonSizeX = 175
	local buttonSizeY = 50
	local buttonY = gameMenu.y + 87
	local buttonX = gameMenu.x + menuSize.x/2 - buttonSizeX/2
	
	Buttons["escape_exit_editmode"] = Button(Rect2D(buttonX, buttonY,buttonSizeX,buttonSizeY),"Button_Escape_Exit_Editmode",12)
	Buttons["escape_exit_editor"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+10),buttonSizeX,buttonSizeY),"Button_Escape_Exit_Editor",12)
	
	local gap = 14
	Buttons["escape_continue"] = Button(Rect2D(buttonX, buttonY,buttonSizeX,buttonSizeY),"Button_Escape_Continue",12)
	Buttons["escape_options"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+gap),buttonSizeX,buttonSizeY),"Button_Escape_Options",12)
	Buttons["escape_ach"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+gap)*2,buttonSizeX,buttonSizeY),"Button_Escape_Ach",12)
	Buttons["escape_menu"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+gap)*3,buttonSizeX,buttonSizeY),"Button_Escape_Menu",12)
	Buttons["escape_quit"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+gap)*4,buttonSizeX,buttonSizeY),"Button_Escape_Quit",12)
	
	Lines["escape_abandon_line"] = {Point(gameMenu.x+75,buttonY + (buttonSizeY+gap)*5 + 4), Point(gameMenu.x+menuSize.x-75,buttonY + (buttonSizeY+gap)*5 + 4)}
	Buttons["escape_abandon"] = Button(Rect2D(buttonX, buttonY + (buttonSizeY+gap)*5 + 20,buttonSizeX,buttonSizeY), "Button_Escape_Abandon", 12)
	
	--Texts["escape_title"] = Text("Escape_Title",Point(gameMenu.x+menuSize.x/2,gameMenu.y + 20),18,ALIGN_CENTER)
	Lines["escape_line"] = {Point(gameMenu.x+75,gameMenu.y + 65), Point(gameMenu.x+menuSize.x-75,gameMenu.y + 65)}
	
	
	local info_gap = 300
	local info = gameMenu + Point(info_gap,0)
	Boxes["escape_info_box"] = Rect2D(info,Point(275,500))
	--Texts["escape_info_title"] = Text("Escape_Info",Point(gameMenu.x+menuSize.x/2+info_gap,gameMenu.y + 18),18,ALIGN_CENTER)
	Lines["escape_info_line"] = {Point(gameMenu.x+75+info_gap,gameMenu.y + 55), Point(gameMenu.x+menuSize.x-75+info_gap,gameMenu.y + 55)}
	
  ---- language menu
  local languageMenuSize = Point(350,550)
  local languageMenuPos = Point((ScreenSizeX() - languageMenuSize.x)/2,(ScreenSizeY() - languageMenuSize.y)/2 + 20)
    
  Texts["escape_language"] = Text("Language_Title",Point(languageMenuPos.x+languageMenuSize.x/2,languageMenuPos.y + 20),18,ALIGN_CENTER)
  Boxes["escape_language_box"] = Rect2D(languageMenuPos,languageMenuSize)
  
  local languageGap = 7
  local languageButtonSizeX =200
  local languageButtonSizeY = 40
  local languageButtonX = languageMenuPos.x + languageMenuSize.x/2 - languageButtonSizeX/2
  local languageButtonY = languageMenuPos.y + 40
  
  Buttons["English"] = Button(Rect2D(languageButtonX, languageButtonY,languageButtonSizeX,languageButtonSizeY),"Language_English",12)
  Buttons["Chinese_Simplified"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap),languageButtonSizeX,languageButtonSizeY),"Language_Chinese_Simplified",102)
  Buttons["French"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*2,languageButtonSizeX,languageButtonSizeY),"Language_French",12)
  Buttons["German"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*3,languageButtonSizeX,languageButtonSizeY),"Language_German",12)
  --Buttons["Italian"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*4,languageButtonSizeX,languageButtonSizeY),"Language_Italian",12)
  Buttons["Polish"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*5,languageButtonSizeX,languageButtonSizeY),"Language_Polish",12)
  Buttons["Portuguese_Brazil"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*6,languageButtonSizeX,languageButtonSizeY),"Language_Portuguese_Brazil",12)
  Buttons["Russian"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*7,languageButtonSizeX,languageButtonSizeY),"Language_Russian",12)
  Buttons["Spanish"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*8,languageButtonSizeX,languageButtonSizeY),"Language_Spanish",12)
  Buttons["Japanese"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*9,languageButtonSizeX,languageButtonSizeY),"Language_Japanese",202)
  Buttons["Italian"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*4,languageButtonSizeX,languageButtonSizeY),"Language_Korean",12)
  --Buttons["Korean"] = Button(Rect2D(languageButtonX, languageButtonY + (languageButtonSizeY+languageGap)*10,languageButtonSizeX,languageButtonSizeY),"Language_Korean",202)

  ---- HDR menu
  local hdrMenuSize = Point(760,520)
  local hdrMenuPos = Point((ScreenSizeX() - hdrMenuSize.x)/2,(ScreenSizeY() - hdrMenuSize.y)/2 + 20)
  
  Texts["escape_hdr"] = Text("HDR",Point(hdrMenuPos.x+hdrMenuSize.x/2,hdrMenuPos.y + 20),18,ALIGN_CENTER)
  Boxes["escape_hdr_box"] = Rect2D(hdrMenuPos,hdrMenuSize)
  
	---- options menu
	local options = Point(ScreenSizeX()/2-300,ScreenSizeY()/2-250)
	
	menuSize.x = 300
	Boxes["escape_options_box"] = Rect2D(options,Point(600,520))
	Boxes["escape_hotkeys_box"] = Rect2D(options + Point(-250,0), Point(1100,450))
	Texts["escape_gameplay"] = Text("Escape_Gameplay", Point(options.x + 50, options.y+3),12,ALIGN_CENTER)
	
	local curr_y = 67
	local options_gap = 45
	local toggle_loc = 50
	Buttons["escape_language"] = Button(Rect2D(options.x + 10, options.y + curr_y, 260,30),"Button_Options_Language",12)
	Texts["escape_speed"] = Text("Escape_Speed",Point(options.x + menuSize.x/2, options.y - 25 + curr_y),12,
	ALIGN_CENTER)
	Location["escape_speed"] = Point(options.x + 50, options.y + curr_y)
	Texts["escape_speed"] = Text("Escape_Speed",Point(options.x + menuSize.x/2, options.y - 25 + curr_y),12,
	ALIGN_CENTER)
	Location["escape_speed_tip"] = Location["escape_speed"] + Point(230,-55)
	Location["escape_tips"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_confirm"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_coord"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_timer"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_colorblind"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_large"] = Point(options.x + toggle_loc, options.y + curr_y)
	curr_y = curr_y + options_gap
	Location["escape_shake"] = Point(options.x + toggle_loc, options.y + curr_y)

	curr_y = curr_y + 50
	Buttons["escape_hotkeys"] = Button(Rect2D(options.x + 10, options.y + curr_y, 260,30),"Button_Options_Hotkeys",12)
	
	curr_y = 40
	options.x = options.x + 300
	Texts["escape_video"] = Text("Escape_Video", Point(options.x+68, options.y+3),12,ALIGN_CENTER)
	Texts["escape_controls"] = Text("Escape_Controls", Point(options.x+48, options.y+3),12,ALIGN_CENTER)
	Texts["escape_soundheader"] = Text("Escape_SoundHeader", Point(options.x+36, options.y+230),12,ALIGN_CENTER)
	
	
	
	options_gap = 50
	toggle_loc = toggle_loc + 25
	Location["escape_fullscreen"] = Point(options.x + toggle_loc , options.y + curr_y)	
	curr_y = curr_y + options_gap - 5
	Location["escape_stretch"] = Point(options.x + toggle_loc , options.y + curr_y)	
	curr_y = curr_y + options_gap - 5
	Location["escape_limit"] = Point(options.x + toggle_loc , options.y + curr_y)	
	curr_y = curr_y + options_gap - 5
	Buttons["escape_default"] = Button(Rect2D(options.x + 35, options.y + curr_y, 240,30),"Button_Options_Default",12)
	curr_y = curr_y + options_gap
	Buttons["escape_scale"] = Button(Rect2D(options.x + 35, options.y + curr_y, 230,30),"",12)
	curr_y = curr_y + options_gap
	Buttons["escape_hdr"] = Button(Rect2D(options.x + 10, options.y + curr_y, 120,30),"HDR",12)
	curr_y = curr_y + 85
	Location["escape_soundbar"] = Point(options.x + 50 , options.y + curr_y)
	Texts["escape_sound"] = Text("Escape_Sound",Point(options.x  + menuSize.x/2, options.y + curr_y - 25),12,ALIGN_CENTER)
	curr_y = curr_y + 75
	Location["escape_musicbar"] = Point(options.x + 50 , options.y + curr_y)
	Texts["escape_music"] = Text("Escape_Music",Point(options.x  + menuSize.x/2, options.y + curr_y - 25),12,ALIGN_CENTER)
	curr_y = curr_y + options_gap
	Location["escape_mute"] = Point(options.x + menuSize.x/2, options.y + curr_y)	
	curr_y = curr_y + 80

	
	
	---------------
	
	Location["xp_start"] = Point(-12,-12)
	Values["xp_dist"] = 20
	Values["xp_gap"] = 15
	Location["xp_rand"] = Point(20,20)
	
	---Board Space Art, all points are local to center
	
	Location["units/mission/bomb_lights.png"] = Point(-19,-2)
	
	Location["population_popup"] = Point(0,-12)
	
	Location["combat/map_shadow.png"] = Point(30,65)
	Location["combat/map_shadow_final.png"] = Point(30,65)
	
	Location["combat/icons/radio.png"] = Point(-17,-10)
	
	Location["combat/deployment_arrow.png"] = Point(-13,15)
	Location["combat/deployment_swap.png"] = Point(-16,35)
	Location["combat/deployment_x.png"] = Point(-13,35)
	Location["deployment_icon"] = Point(0,20) -- actual mech image
	
	Location["combat/pod/crashed_pod.png"] = Point(-21,10)
	Location["combat/pod/crashed_pod_ftl.png"] = Point(-21,10)
	Location["combat/pod/crashed_pod_empty.png"] = Point(-21,10)
	
	Location["combat_crash_"..DIR_DOWN] = Point(-31,15)
	Location["combat_crash_"..DIR_LEFT] = Point(-31,-6)
	Location["combat_crash_"..DIR_RIGHT] = Point(-5,13)
	Location["combat_crash_"..DIR_UP] = Point(-5,-5)
	
	Location["combat/icons/movearrow_corner1.png"] = Point(-27,0)
	Location["combat/icons/movearrow_corner2.png"] = Point(-27,0)
	Location["combat/icons/movearrow_corner3.png"] = Point(-27,0)
	Location["combat/icons/movearrow_corner4.png"] = Point(-27,0)
	
	Location["ui/strategy/people.png"] = Point(-11,-8)
	
	Location["combat/emerge_crack.png"] = Point(-23, 6)
	
	Location["combat/icons/icon_supply_board.png"] = Point(-21, 0)
	
	Location["combat/icons/icon_xbox_glow.png"] = Point(-5,40)
	Location["combat/icons/icon_ps4_glow.png"] = Point(0,8)
	Location["combat/icons/icon_switch_glow.png"] = Point(-5,40)
	
	Location["combat/icons/icon_shifty_glow.png"] = Point(0,8)
	Location["combat/icons/icon_kickoff_glow.png"] = Point(0,8)
	Location["combat/icons/icon_hp_glow.png"] = Point(0,8)
	Location["combat/icons/icon_armor_glow.png"] = Point(0,8)
	Location["combat/icons/icon_regen_glow.png"] = Point(0,8)
	Location["combat/icons/icon_explode_glow.png"] = Point(0,8)
	Location["combat/icons/icon_explode_leader_glow.png"] = Point(0,8)
	Location["combat/icons/icon_psionboss_glow.png"] = Point(0,8)
	Location["combat/icons/icon_tentacle_glow.png"] = Point(0,8)
	Location["combat/icons/icon_armor_leader_glow.png"] = Point(0,8)
	Location["combat/icons/icon_armor_degraded_glow.png"] = Point(0,8)
	
	Location["combat/icons/icon_boss_glow.png"] = Point(0,8)
	Location["combat/icons/icon_purple_glow.png"] = Point(0,8)
	
	Location["combat/shield_back.png"] = Point(-23, -4)
	Location["combat/shield_front.png"] = Location["combat/shield_back.png"]
	Location["combat/shield2_back.png"] = Point(-26, -15)
	Location["combat/shield2_front.png"] = Location["combat/shield2_back.png"]
	Location["combat/shieldtrain_back.png"] = Point(-51, -6)
	Location["combat/shieldtrain_front.png"] = Location["combat/shieldtrain_back.png"]
	Location["combat/shielddam_back.png"] = Point(-25, -8)
	Location["combat/shielddam_front.png"] = Location["combat/shielddam_back.png"]
	
	Location["combat/shieldhq_back.png"] = Point(-23, -33)
	Location["combat/shieldhq_front.png"] = Point(-23, -33)
	
	
	Location["combat/iceblock.png"] = Point(-27, -14)
	
	Location["combat/arrow_left.png"] = Point(-44, -11)
	Location["combat/arrow_guard_left.png"] = Location["combat/arrow_left.png"]
	Location["combat/arrow_off_left.png"] = Location["combat/arrow_left.png"]
	Location["combat/arrow_hit_left.png"] =  Location["combat/arrow_left.png"]
	
	Location["combat/arrow_down.png"] = Point(-42, 14)
	Location["combat/arrow_guard_down.png"] = Location["combat/arrow_down.png"]
	Location["combat/arrow_off_down.png"] = Location["combat/arrow_down.png"]
	Location["combat/arrow_hit_down.png"] =  Location["combat/arrow_down.png"]
	
	Location["combat/arrow_up.png"] = Point(-11,-10)
	Location["combat/arrow_guard_up.png"] = Location["combat/arrow_up.png"]
	Location["combat/arrow_off_up.png"] = Location["combat/arrow_up.png"]
	Location["combat/arrow_hit_up.png"] =  Location["combat/arrow_up.png"]
	
	Location["combat/arrow_right.png"] = Point(-10,14)
	Location["combat/arrow_guard_right.png"] = Location["combat/arrow_right.png"]
	Location["combat/arrow_off_right.png"] = Location["combat/arrow_right.png"]
	Location["combat/arrow_hit_right.png"] =  Location["combat/arrow_right.png"]
	
	Location["combat/arrow_hit.png"] = Point(-3,-5)
	
	Location["combat/turn_icon_1.png"] = Point(-13,-14)
	Location["combat/turn_icon_2.png"] = Location["combat/turn_icon_1.png"] + Point(8,3)
	
	Location["combat/melee_0.png"] = Point(3,2)
	Location["combat/melee_1.png"] = Point(3,25)
	Location["combat/melee_2.png"] = Point(-20,25)
	Location["combat/melee_3.png"] = Point(-20,2)
	
	local conveyor_point = Point(-18,7)
	Location["combat/icons/icon_arrow_0_glow.png"] = conveyor_point
	Location["combat/icons/icon_arrow_1_glow.png"] = conveyor_point
	Location["combat/icons/icon_arrow_2_glow.png"] = conveyor_point
	Location["combat/icons/icon_arrow_3_glow.png"] = conveyor_point
	
	
	local structures = { research1 = Point(-20,0), factory1 = Point(-21,-1), radar1 = Point(-13,-7),
	timelab1 = Point(-18,-9), shield1 = Point(-27,-15), tower1 = Point(-15,-28), bar1 = Point(-18,0), 
	power1 = Point(-22,-13), hospital1 = Point(-24,-5), airfield1 = Point(-24,-14),
	--new ones
	solar1 = Point(-24,0), wind1 = Point(-21,-23),
	energy1 = Point(-26,-16), battery1 = Point(-21,-10),
	recycle1 = Point(-18,-2)}
	
	local extensions = {"_holo.png", "_on.png", "_off.png", "_broken.png"}
	
	for struct, p in pairs(structures) do
		for j, ext in ipairs(extensions) do
			Location["combat/structures/str_"..struct..ext] = p
		end
	end
		
	local tilesets = {"tiles_grass", "tiles_volcano", "tiles_acid","tiles_lava", "tiles_sand", "tiles_snow"}
	local waterPos = Point(-28,1)
	local mountainLoc = Point(-28, -21)
	
	Location["combat/tiles_grass/supervolcano.png"] = Point(-58,-58)
	
	Location["strategy/city/warning_1.png"] = waterPos
	
	Location["combat/tiles_grass/acid_0.png"] = waterPos
	Location["combat/tiles_grass/acid_1.png"] = waterPos
	Location["combat/tiles_grass/acid_2.png"] = waterPos
	Location["combat/tiles_grass/acid_3.png"] = waterPos
	
	Location["combat/tiles_grass/lava_0.png"] = waterPos
	
	for i,v in ipairs(tilesets) do
		Location["combat/"..v.."/ice.png"] = waterPos
		Location["combat/"..v.."/ice_1.png"] = waterPos
		Location["combat/"..v.."/ice_1_crack.png"] = waterPos
		Location["combat/"..v.."/ice_2.png"] = waterPos
		Location["combat/"..v.."/ice_2_crack.png"] = waterPos

		Location["combat/"..v.."/water.png"] = waterPos
		Location["combat/"..v.."/water_0.png"] = waterPos
		Location["combat/"..v.."/water_1.png"] = waterPos
		Location["combat/"..v.."/water_2.png"] = waterPos
		Location["combat/"..v.."/water_3.png"] = waterPos
		
		Location["combat/"..v.."/building_1_tile.png"] = Point(-28,-15)
		Location["combat/"..v.."/building_2_tile.png"] = Point(-28,-15)
		Location["combat/"..v.."/building_3_tile.png"] = Point(-28,-15)
		
		Location["combat/"..v.."/mountain.png"] = mountainLoc
		Location["combat/"..v.."/mountain_0.png"] = mountainLoc
		Location["combat/"..v.."/mountain_0_broken.png"] = mountainLoc
		Location["combat/"..v.."/mountain_1.png"] = mountainLoc
		Location["combat/"..v.."/mountain_2.png"] = mountainLoc
		
		Location["combat/"..v.."/forest_0.png"] = Point(-25,5)
		Location["combat/"..v.."/forest_0_front.png"] = Point(-25,5)
		Location["combat/"..v.."/sand_0_front.png"] = Point(-28,1)
		Location["combat/"..v.."/sand_1_front.png"] = Point(-28,1)
		Location["combat/"..v.."/sand_0.png"] = Point(-28,1)
		Location["combat/"..v.."/sand_1.png"] = Point(-28,1)
	end
	
	Location["units/aliens/scorpion_1d.png"] = Point(-20,10)
	Location["units/aliens/bones_1.png"] = Point(-18,6)
	Location["units/aliens/bones_1.png"] = Point(-18,6)
	
	local start = Point(-14,-16)
	Location["building_4_0"] = start
	Location["building_4_1"] = start + Point(-12,8)
	Location["building_4_2"] = start + Point(12,8)
	Location["building_4_3"] = start + Point(0,16)
	
	Location["building_3_0"] = Point(-13,-17)
	Location["building_3_2"] = Point(-10,-3)
	Location["building_3_1"] = Point(-27,-8)
	
	Location["building_2_0"] = Point(-25,-10)
	Location["building_2_1"] = Point(-4,-7)
	
	Location["building_1_0"] = Point(-25,-7)
		
	Location["combat/infection_tower_1.png"] = Point(-25, -22)
	Location["strategy/city/infection_tower_1.png"] = Point(-27, -24)
	
	Location["units/guard.png"] = Point(5,20)
	
	Location["combat/icons/icon_emerge.png"] = Point(-10,16)
	Location["combat/icons/icon_emerge_glow.png"] = Point(-13,13)
	Location["combat/icons/icon_emerge_cb.png"] = Point(-10,16)
	Location["combat/icons/icon_emerge_cb_glow.png"] = Point(-13,13)
	Location["combat/icons/icon_mine_glow.png"] = Point(-13,13)
	Location["combat/icons/icon_frozenmine_glow.png"] = Point(-13,13)
	
	Location["combat/icons/text_fire.png"] = Point(-18,-20)
	Location["combat/icons/text_acid.png"] = Point(-18,-20)
	Location["combat/icons/text_blocked.png"] = Point(-28,-20)
	
	Location["combat/icons/warn_spawn_tilewhite.png"] = Point(-26,1)
	Location["combat/icons/warn_spawn_warning.png"] = Point(-5,-32)
	
	Location["combat/icons/warning_power_damage.png"] = Point(-38,-22)
	Location["combat/icons/warning_power_resist.png"] = Point(-38,-22)
	
	Location["combat/icons/warn_pod_incoming.png"] = Point(-5,-32)
	
	Location["combat/icons/warn_acid.png"] = Point(1,-32)
	Location["combat/icons/warn_electric.png"] = Point(1,-32)
	Location["combat/icons/warn_blocked.png"] = Point(0,-32)
	Location["combat/icons/warn_fire.png"] = Point(0,-32)
	Location["combat/icons/warn_unit_healed.png"] = Point(0,-32)
	Location["combat/icons/warning_actionavailable.png"] = Point(0,-32)
	Location["combat/icons/warn_pod_destroyed.png"] = Point(0,-32)
	Location["combat/icons/warn_pod_secured.png"] = Point(0,-32)
	Location["combat/icons/warn_pod_destroyed.png"] = Point(0,-32)
	Location["combat/icons/warn_pilot_effect.png"] = Point(0,-32)
	Location["combat/icons/warn_asset_effect.png"] = Point(0,-17)
	
	Location["combat/icons/warn_not_attacking.png"] = Point(0,-32)
	
	
	Location["combat/icons/warn_threatened.png"] = Point(-5,-20)
	
	Location["combat/icons/warn_threatened.png"] = Point(-5,-20)
	
	Location["combat/icons/warning_levelup.png"] = Point(0,-32)
	Location["combat/icons/warn_plus2_move.png"] = Point(0,-25)
	
	
	Location["combat/mine.png"] = Point(-14,-4)
	Location["combat/freeze_mine.png"] = Point(-14,-4)
	
	---these are technically in the strategy map
	Location["ui/strategy/warning_coresavailable.png"] = Point(0,-33)
	Location["ui/strategy/warning_reactoravailable.png"] = Point(0,0)
	Location["ui/strategy/warning_regionlost.png"] = Point(0,-33)
	Location["ui/strategy/warning_regionsecured.png"] = Point(0,-33)
	--------------------------------------------
	
	Location["combat/rift.png"] = Point(-23,-36)
	Location["combat/tile_icon/tile_lightning.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_snowstorm.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_crack.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_hightide.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_airstrike.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_fireball.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_lava.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_rock.png"] = Point(-27,2)
	Location["combat/tile_icon/tile_tentacle.png"] = Point(-27,2)
	
	Location["effects/poweron_back.png"] = Point(-29,0)
	Location["effects/poweron_front.png"] = Point(-29,0)
	
	for i = 0, 3 do
		Location["combat/projectile_arrow_"..i..".png"] = Point(-27,0)
	end
	
	Location["proj_close_down1"] = Point(12,-5)
	Location["proj_close_down2"] = Point(2,3)
	
	Location["proj_close_left1"] = Point(-27,-5)
	Location["proj_close_left2"] = Point(-17,3)
	
	Location["combat/artillery_arrow.png"] = Point(-11,-35)
	Location["combat/artillery_arrow_down.png"] = Point(-11,-35)
	
	--leftN
	Location["combat/artillery_icon_up_3"] = Point(-22,-11)
	Location["combat/artillery_icon_down_3"] = Point(4,10)
	--down
	Location["combat/artillery_icon_up_2"] = Point(-22,11)
	Location["combat/artillery_icon_down_2"] = Point(4,-10)
	-- up (mirrored image)
	Location["combat/artillery_icon_up_0"] = Point(5,-10)
	Location["combat/artillery_icon_down_0"] = Point(-22,11)
	--right(mirrored image)
	Location["combat/artillery_icon_up_1"] = Point(5,12)
	Location["combat/artillery_icon_down_1"] = Point(-22,-11)
	
	Location["ui/strategy/repairing.png"] = Point(-13,7)
	
	for i = 1, 4 do
		Location["combat/icons/damage_"..i..".png"] = Point(-9,9)
	end
	
	Location["combat/icons/icon_turnbar.png"] = Point(-30,-3)
	Location["turnbar_circle1"] = Location["combat/icons/icon_turnbar.png"] + Point(7,7)
	Location["turnbar_circle2"] = Location["combat/icons/icon_turnbar.png"] + Point(7,18)
	
	Location["combat/icons/icon_healthbar_shadow.png"] = Point(-15,-12)
	
	local lasers = {"laser1", "laser_fire", "laser_freeze", "laser_elec", "laser_push"}
	for i,v in ipairs(lasers) do
		Location["effects/"..v.."_U.png"] = Point(-12,3)
		Location["effects/"..v.."_U1.png"] = Point(-12,3)
		Location["effects/"..v.."_U2.png"] = Point(-12,3)
		Location["effects/"..v.."_R.png"] = Point(-12,3)
		Location["effects/"..v.."_R1.png"] = Point(-12,3)
		Location["effects/"..v.."_R2.png"] = Point(-12,3)
		Location["effects/"..v.."_hit.png"] = Point(-12,3)
		Location["effects/"..v.."_start.png"] = Point(-12,3)
	end
	
	Location["effects/fence_1.png"] = Point(-1,5)
	Location["effects/fence_0.png"] = Point(-28,4)
	
	Location["fence_pole_down"] = Point(-5,29)
	Location["fence_pole_left"] = Point(-33,8)
	Location["fence_pole_right"] = Point(23,8)
	
	Location["effects/hold_0.png"] = Point(-7,2)--up
	Location["effects/hold_1.png"] = Point(-7,22)--right
	Location["effects/hold_2.png"] = Point(-34,22)--down
	Location["effects/hold_3.png"] = Point(-31,-1)--left
	Location["effects/hold_back.png"] = Point(-17,12)
	Location["effects/hold_front.png"] = Point(-17,12)
	
	Location["effects/acid_pool0.png"] = Point(-22,7)
	Location["effects/acid_pool1.png"] = Point(-22,7)
	Location["effects/acid_pool2.png"] = Point(-22,7)
	Location["effects/acid_pool3.png"] = Point(-22,7)
	
	-----------------------------------------------------------------------
	
	----------------- Battle Map Positions--------------------------------

	local base_x = ScreenSizeX()
	
	local base_y = ScreenSizeY()
	
	--LOG("Screen res = "..base_x.." x "..base_y)
--	
	local BoardScale = GetBoardScale()
	
	--LOG("Board Scale = "..BoardScale)
	
	local UI_Box = Rect2D()
	local Default_UI_Box = Rect2D()-- UI_Box is affected when player changes max Combat Board scale, but we sometimes still need the default
	
	for i = 0, 1 do 
		local curr_scale = BoardScale
		if i == 1 then 
			curr_scale = GetDefaultScale()
		end
	
		if curr_scale == 2 then
			base_x = 1350
			base_y = 800
		elseif curr_scale == 3 then
			base_x = 1800
			base_y = 900
		elseif curr_scale == 4 then
			base_x = 2300
			base_y = 1240
		end
	
		local UI_x = math.max(0,ScreenSizeX() - base_x)/2
		local UI_y = math.max(0,ScreenSizeY() - base_y)/2
		
		if i == 0 then
			UI_Box = Rect2D(UI_x,UI_y,ScreenSizeX()-UI_x, ScreenSizeY()-UI_y)
		else
			Default_UI_Box = Rect2D(UI_x,UI_y,ScreenSizeX()-UI_x, ScreenSizeY()-UI_y)
		end
	end
	
	
	
	--LOG("UI Borders = "..UI_x.." x "..UI_y)
	
	Boxes["ui_box"] = UI_Box
	-- Options Button
	
	Buttons["options"] = Button(Rect2D(0,0,40,40),"",9)
	Location["options_menu"] = Point(18,8)--Point(ScreenSizeX()-50,15)
	Location["options_battle"] = Point(UI_Box.x + 18,UI_Box.y + 10)	
	---dialog box
	
	--Boxes["voice_box"] = Rect2D(UI_Box.x+81,UI_Box.y+10,200,82-20)
	--Buttons["voice_choice1"] = Button(Rect2D(83,90,80,40),"",9)
	--Buttons["voice_choice2"] = Button(Rect2D(83+100,90,80,40),"",9)
	
	Location["voice_portrait"] = Point(ScreenSizeX()/2,UI_Box.y+25)
	
	Boxes["tip_box"] = Rect2D(0,0,200,130)
	Buttons["tip_confirm"] = Button(Rect2D(0,0,50,25),"",10)
	Location["tip_confirm"] = Point(65,90)
	
	---
	
	Location["ui/combat/turn_box.png"] = Point(ScreenSizeX()/2-1139/2, ScreenSizeY()/2 - 40)
	Texts["turn_box"] = Text("", Point(ScreenSizeX()/2, ScreenSizeY()/2 - 20),20,ALIGN_CENTER)
	Texts["turn_box_alt"] = Text("", Point(ScreenSizeX()/2, ScreenSizeY()/2 - 12),18,ALIGN_CENTER)
	Texts["sub_turn_box"] = Text("", Point(ScreenSizeX()/2, ScreenSizeY()/2 + 26),15,ALIGN_CENTER)
	
  local warn_enemy_activity_loc = Point(UI_Box.x + 65,UI_Box.y + 55)
	Location["combat/icons/warn_enemy_activity.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_ch.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_fr.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_ge.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_it.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_pl.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_pt.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_ru.png"] = warn_enemy_activity_loc
  Location["combat/icons/warn_enemy_activity_es.png"] = warn_enemy_activity_loc
		
	Location["battle_event"] = Point(screenCenter.x-200,screenCenter.y-100)
	

	--selected unit info
	local pawn_width = 130
	local pawn_box = Point(UI_Box.x+15, UI_Box.h-15)--bottom corner
	Location["mech_box"] = pawn_box
	
	--Location["pawn_box_hotkey"] = Point(54,34)
	
	Texts["pawn_box_water"] = Text("Pawn_Box_Water", Point(64,20),12,ALIGN_CENTER)
	Location["pawn_box_water"] = Point(0,46)
	
	Location["pawn_box_portrait"] = Point(1,36)
	
	local pawn_box_skill = Point(0,0)
	Buttons["pawn_box_skill"] = Button(Rect2D(pawn_box_skill.x, pawn_box_skill.y, 130, 55),"")
	
--	Buttons["pawn_box_undo"] = Button(Rect2D(0,0, 125, 35),"UNDO MOVE",12)
--	Location["pawn_box_undo"] = Point(0,-45)--relative to top of skill boxes
	
	Values["pawn_box_skill_gap"] = 7
		
	--Buttons["pawn_box_upgrade_0"] = Button(Rect2D(0,0, 100, 25), "")
	--Buttons["pawn_box_upgrade_1"] = Button(Rect2D(0,0, 100, 25), "")
				
	--- status boxes
	Boxes["pawn_status"] = Rect2D(0,0,50,50)
	Location["pawn_status_gap"] = Point(25, 0)
	Buttons["repair_button"] = Button(Rect2D(Point(0,0), Point(0,0)), "",12)
	
	
	Location["pawn_list"] = Point(UI_Box.x+18, UI_Box.y+127)
	Buttons["button_pawnlist"] = Button(Rect2D(Location["pawn_list"],Point(169,30)),"Button_Button_Pawnlist",12)
	Buttons["button_collapse"] = Button(Rect2D(Point(0,0), Point(30,20)),"",12)
	---escape button
	
	Location["undo_loc"] = Point(UI_Box.x+195,UI_Box.y+58)
	Buttons["undo"] = Button(Rect2D(Location["undo_loc"],Point(75,60)), "Button_Undo", 12)
	Buttons["done_testing"] = Button(Rect2D(UI_Box.x+70, UI_Box.y+10, 250, 40), "Button_Done_Testing", 15)
	
	
		---timeline stuffs
	
	local context = math.min(ScreenSizeY()-60, UI_Box.h + 15*BoardScale)
	Location["gamepad_context"] = Point(ScreenSizeX()/2, context)
	
	Location["action_end"] = Point(UI_Box.x+18, UI_Box.y+58)
	Buttons["action_end"] = Button(Rect2D(Location["action_end"],225,60),"",18)
	
	Boxes["deploy_box"] = Rect2D(UI_Box.x + 15, UI_Box.y + 10, 100, 80)
	Boxes["deploy_remaining"] = Rect2D(UI_Box.x + 15, UI_Box.y + 115, 200, 20)
	Texts["deploy_remaining"] = Text("Deploy_Remaining", Point(UI_Box.x + 20, UI_Box.y + 117), 10, ALIGN_LEFT)
	Location["deploy_remaining"] = Point(UI_Box.x + 150, UI_Box.y + 124)
	
	local done = Point(screenCenter.x - 400, 75)
	Location["deployment_done"] = Point(UI_Box.x+15, UI_Box.y+105)
	Buttons["deployment_done"] = Button(Rect2D(Location["deployment_done"],Point(181,60)),"Button_Deployment_Done",18)
	Boxes["combat_deployment"] = Rect2D(UI_Box.x+14, UI_Box.y+15,208,40)
	Texts["combat_deployment"] = Text("Combat_Deployment", Point(UI_Box.x+14+108, UI_Box.y+18), 15, ALIGN_CENTER)
	
	--Location["ui/combat/box_turnbar.png"] = Location["action_timeline"]
	
	Boxes["space_info"] = Rect2D(UI_Box.w-395,UI_Box.h-110,380,95)
	Location["space_info_tile"] = Point(42,18)
	
	local objective_loc = Point(UI_Box.w-270,UI_Box.y+15)
	
	Boxes["objective_turncount"] = Rect2D(objective_loc,Point(260,55))
	
  local warn_enemy_activity_small_loc = Point(objective_loc.x - 300,objective_loc.y)
	Location["combat/icons/warn_enemy_activity_small.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_ch.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_fr.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_ge.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_it.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_pl.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_pt.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_ru.png"] = warn_enemy_activity_small_loc
  Location["combat/icons/warn_enemy_activity_small_es.png"] = warn_enemy_activity_small_loc
	
	Texts["objective_enemyretreat"] = Text("Objective_EnemyRetreat", objective_loc + Point(52, 20), 10, ALIGN_LEFT)
	Texts["objective_enemyretreat2"] = Text("Objective_EnemyRetreat2", objective_loc + Point(160, 20), 10, ALIGN_LEFT)
	Texts["objective_enemyretreat3"] = Text("Objective_EnemyRetreat3", objective_loc + Point(160, 20), 10, ALIGN_LEFT)
	Texts["objective_turncount"] = Text("", objective_loc + Point(142, 8), 20, ALIGN_CENTER)
	Boxes["order_info"] = Rect2D(objective_loc,Point(260,200))
	
	objective_loc.y = objective_loc.y + 70
	Buttons["button_objectives"] = Button(Rect2D(objective_loc,Point(260,35)),"Button_Button_Objectives",12)
	Location["button_objectives"] = objective_loc
	
	Boxes["objective_info"] = Rect2D(objective_loc,Point(260,75))
	
	
	Texts["objective_title"] = Text("Objective_Title", objective_loc + Point(130, 9), 9, ALIGN_CENTER)
	
	Buttons["editor_exit"] = Button(Rect2D(ScreenSizeX()/2 + 125, 15, 125, 35), "Button_Editor_Exit",12) 
	
	Buttons["combat_order"] = Button("ui/combat/attackorder", Point(UI_Box.w - 370, UI_Box.y + 15), false)
	Location["combat_order"] = Buttons["combat_order"].pos + Point(0,90)
	
	Location["environment_info"] = Buttons["combat_order"].pos + Point(-60,31)
	
	----------- environment stuffs
	
	--Buttons["environment_info"] = Button(Rect2D(1000,200,115,40),"ENVIRONMENT",12)
	
	
	---------- Confirm Box Positions -------------------
	
	local confirm_width = 360
	local confirm_height = 210
	local confirm_point = Point(screenCenter - Point(confirm_width/2,confirm_height/2))
	Boxes["confirm_box"] = Rect2D(confirm_point,confirm_width,confirm_height)
	Boxes["confirm_small"] = Rect2D(confirm_point,confirm_width,confirm_height-40)
	Buttons["confirm_yes"] = Button(Rect2D(confirm_point + Point(60,100),95,45),"Button_Confirm_Yes",12)
	Buttons["confirm_ok"] = Button(Rect2D(confirm_point + Point(130,100),95,45),"Button_Confirm_Ok",12)
	Buttons["confirm_no"] = Button(Rect2D(confirm_point + Point(200, 100),95,45),"Button_Confirm_No",12)
	Texts["confirm_text"] = Text("",confirm_point + Point(confirm_width/2, 25),12,ALIGN_CENTER)
	Texts["confirm_text"].width = confirm_width-20
	
	Texts["confirm_text_image"] = Text("",confirm_point + Point(confirm_width/2 + 40, 25),12,ALIGN_CENTER)
	Texts["confirm_text_image"].width = confirm_width-90
	
	Location["confirm_never"] = confirm_point + Point(45,165)
	
		---------- Victory Box
	
	local victory_width = 500
	local victory_mapwidth = 441
	local victory_screen = Point((ScreenSizeX() - victory_width - victory_mapwidth)/2,ScreenSizeY()/2 - 270/2)
	local victory_box1 = victory_screen + Point(0,120)
	local victory_box2 = victory_screen + Point(439, 45)
	
	Location["victory_ceo_portrait"] = victory_box1 + Point((victory_width+victory_mapwidth)/2,-250)
	
	local pod_width = victory_width
	local pod_box = victory_box2
	local pod_rewards = pod_box + Point(25,88)
	Boxes["pod_box"] = Rect2D(pod_rewards, Point(180,275))
	pod_rewards = pod_rewards + Point(10,0)
	
	Texts["pod_title"] = Text("Pod_Title", pod_box + Point(pod_width/2,25),18,ALIGN_CENTER)
	Texts["pod_contains"] = Text("Pod_Contents", pod_rewards + Point(80,10),10,ALIGN_CENTER)
	Lines["pod_line"] = {pod_box + Point(150,65), pod_box + Point(pod_width-150,65)}
	
	Boxes["pod_door"] = Rect2D(pod_box + Point(307,190), Point(78,96))
	
	Location["ui/strategy/warning_openpod.png"] = Point(150,25)
	
	Location["pod_image"] = pod_box + Point(25,85)
	Location["ui/combat/pod_base.png"] = Point(0,0)
	Location["ui/combat/pod_base_ftl.png"] = Point(0,-5)
	Location["ui/combat/pod_back.png"] = Point(142,51)
	Location["ui/combat/pod_door_ftl.png"] = Location["ui/combat/pod_back.png"]
	Location["ui/combat/pod_door.png"] = Location["ui/combat/pod_back.png"]
	Location["ui/combat/pod_door_OL.png"] = Location["ui/combat/pod_back.png"]
	Location["ui/combat/pod_door_selected.png"] = Location["ui/combat/pod_back.png"]
	
	Location["pod_reward"] = Point(pod_rewards + Point(15,47))
	Location["pod_reward2"] = Point(pod_rewards + Point(15,168))
	
	
	Boxes["victory_map"] = Rect2D(victory_box1, Point(victory_mapwidth,175))
	
	Location["victory_map"] = victory_screen + Point(-50,0)
	
	Texts["victory_title"] = Text("Victory_Title",victory_box2 + Point(victory_width/2,45),18,ALIGN_CENTER_ALL)
	Location["victory_reputation"] = victory_box2 + Point(victory_width/2,85)	
	
	Location["star_start"] = Location["victory_reputation"]
	
	Boxes["victory_stats"] = Rect2D(victory_box2, Point(victory_width,330))
	victory_box2.y = victory_box2.y + 170
	Location["victory_pilot"] = victory_box2 + Point(15,32)
	Texts["victory_xp_solo"] = Text("",Point(45,83),12,ALIGN_CENTER_ALL)
	
	Lines["victory_horizontal"] = {victory_box2 + Point(10,0), victory_box2 + Point(victory_width,0)}
	
	Lines["victory_vertical"] = {victory_box2 + Point(victory_width/2 + 25,0), victory_box2 + Point(victory_width/2 + 25,160)}
	
--	Lines["victory_horizontal2"] = {victory_box2 + Point(victory_width/2,82), victory_box2 + Point(victory_width-4,82)}
	
	Buttons["victory_done"] = Button(Rect2D(Point(0,0), Point(245,49)),"Button_Victory_Done", 18)
	
	Texts["victory_civilians"] = Text("Victory_Civilians",victory_box2 + Point(392,55),12,ALIGN_CENTER)
	Location["victory_civilians"] = victory_box2 + Point(392,90)
	
	--Texts["victory_tech"] = Text("",victory_box2 + Point(380,97),12,ALIGN_CENTER)
	--Texts["victory_tech_desc"] = Text("",victory_box2 + Point(375,155),10,ALIGN_CENTER_ALL)
	--Texts["victory_tech_desc"].width = 250
	--Location["victory_asset"] = victory_box2 + Point(315,125)
--	Texts["victory_asset_condition"] = Text("Damaged!", victory_box2 + Point(510,120), 10, ALIGN_CENTER)
	--Texts["victory_asset_condition"].width = 150
	
	------------------ Strategy map positions -----------------------------
	
	Location["strategy/strat_base.png"] = Point(0,0)	
	
	Location["mechs"] = Point(220,ScreenSizeY()-140)
	
	Location["upgrade_info"] = Point(800,150)
	Location["upgrade_portrait"] = Point(645,175)
	
	Location["supports"] = Point(450,ScreenSizeY()-140) 
		
	---------- Corporation Store ------
	
	
	------- MISSION Select
						
	Boxes["mission_box"] = Rect2D(ScreenSizeX()/2-665/2, ScreenSizeY()/2-455/2, 665, 455)
	
	local missionInfo = Point(ScreenSizeX()/2-780/2,ScreenSizeY()/2-200/2)
	
	MAP_BUTTON = { Point(564,-3), Point(791,168), Point(791,202), Point(564,373), Point(336, 202), Point(336, 168)}
	
	Location["mission_ceo_portrait"] = Point(380,-135)
	
	Location["mission_info_location"] =  missionInfo
		
	local box_center = 175
	local box_width = box_center*2
	Boxes["map_hologram"] = Rect2D(box_width-1,85,430,190)
	
	Location["ui/env_line.png"] = Point(box_width - 40, 375)
	Location["mission_env_warning"] = Location["ui/env_line.png"] + Point(35, -30)
	
	Location["mission_map_shift"] = Point(box_width-25+256, -30+202)
	Location["strategy/minimap_outline.png"] = Point(28,19)
	Texts["mission_map_deploy"] = Text("Mission_Map_Deploy", Point(265,170), 18, ALIGN_CENTER)
	
	Boxes["map_info"] = Rect2D(0, 0, box_width + 1, 290)
	Boxes["map_info_small"] = Rect2D(0, 0, box_width, 130)
	
	Location["map_info_gamepad"] = Point(-50,340)

	--Texts["map_mission_title"] = Text("TBA", Point(box_center,20), 18, ALIGN_CENTER)
	--Location["map_mission_prime"] = Point(box_center,60)

	--Location["map_mission_line1"] = Point(25,105)
	Location["map_mission_line2"] = Point(25+box_width-50,105)
	
	Location["map_mission_secondary"] = Point(box_center,140)
	
	Location["map_mission_line3"] = Point(25,205)
	Location["map_mission_line4"] = Point(25+box_width-50,205)
	Location["map_mission_asset"] = Point(box_center-105,275)
	
	Boxes["map_mission_tech"] = Rect2D(0,0,225,35)
	
	box_center = 125
	box_width = box_center*2
	
	------ ASSET, NO MISSION, LOCATIONS
	
	Boxes["select_mission_holder"] = Rect2D(Rect2D(ScreenSizeX()/2-200, ScreenSizeY() - 150, 400, 200))
	Buttons["select_mission_leave"] = Button(Rect2D(ScreenSizeX()/2-115, ScreenSizeY() - 65, 225, 40), "Button_Select_Mission_Leave", 15)
	Buttons["select_mission_store"] = Button(Rect2D(ScreenSizeX()/2-175, ScreenSizeY() - 125, 350, 50), "Button_Select_Mission_Store", 18)
	Buttons["select_mission_reward"] = Button(Rect2D(ScreenSizeX()/2-175, ScreenSizeY() - 75, 350, 50), "Button_Select_Mission_Reward", 18)
				
	----island warnings
	
	local warning_width = 350
	Location["island_warning_0"] = Point(ScreenSizeX() - warning_width - 25,100)
	Location["island_warning_1"] = Point(ScreenSizeX() - warning_width- 25,100)
	Location["island_warning_2"] = Point(ScreenSizeX() - warning_width- 25,80)
	Location["island_warning_3"] = Point(ScreenSizeX() - warning_width- 25,100)
	
	Boxes["map_offensive"] = Rect2D(0,0,warning_width,75)
	Texts["map_offensive_title"] = Text("Boss_Title", Point(warning_width/2,8), 12, ALIGN_CENTER)
	Texts["map_offensive_text"] = Text("Boss_Text", Point(warning_width/2,29), 10, ALIGN_CENTER)

	----TOP RESOURCE BAR
	local bar_width = 750
	Boxes["top_bar"] = Rect2D(0,0,bar_width,50)
	
	Location["morale_bar"] = Point(285, 8)
	Location["combat_morale_bar"] = Point(UI_Box.x + 65, UI_Box.y + 15)
	Location["undo_turn"] = Location["combat_morale_bar"] + Point(349+38,-5)
	
	Boxes["undo_turn_rect"] = Rect2D(Location["undo_turn"],Point(140,40))
	Boxes["undo_turn_rect_touch"] = Rect2D(Location["undo_turn"],Point(75,60))
	Buttons["undoTurn"] = Button(Boxes["undo_turn_rect"], "Button_UndoTurn", 12)
	
	Location["morale_combat_text"] = Point(75,50)
	
	Location["morale_text"] = Point(35,50)
	
	local bankPos = Point(20,11)
	Location["ui/strategy/icon_money.png"] = bankPos
--	Location["ui/strategy/icon_cores.png"] = bankPos + Point(130,3)
	--Location["money"] = bankPos + Point(45,12)
	
	Location["bank_rep_meter"] = bankPos + Point(50,13)
	Location["bankline2"] = Location["bank_rep_meter"]  + Point(72,0)
	
	Location["cores"] = bankPos + Point(190,13)
	Location["bankline1"] = Location["cores"] + Point(60, -13)
	
	Location["repair"] = bankPos + Point(225,13)
	Location["bankline3"] = Location["repair"] + Point(45, -13)
	
	
	Location["ui/strategy/bar_income.png"] = Point(-400, 80)
	Location["ui/strategy/bar_bones.png"] = Point(ScreenSizeX() - 161, 140)	
		
	Location["peopleline1"] = Point(510, 11)
	Location["peopleline2"] = Point(510, 36)
			
	Location["top_people"] = Point(600, 25)
	Buttons["top_people"] = Button(Rect2D(Location["top_people"] - Point(95,15),180,45),"",12)
	Location["top_people_tip"] = Location["top_people"] - Point(145,-45)
	
	Location["top_timer"] = Point(780, 25)
	Buttons["top_timer"] = Button(Rect2D(Location["top_timer"] - Point(95,15),160,45),"",12)
	Location["top_timer_tip"] = Location["top_timer"] - Point(265,-45)
	
	Location["strategy_ceo_portrait"] = Point(screenCenter.x, 100)

	----- Pilot Dead / Leveled window
	
	local pilot_news = Point(ScreenSizeX()/2 - 400/2, ScreenSizeY()/2 - 250/2)
	Boxes["pilot_news"] = Rect2D(pilot_news,Point(430,200))
	Location["pilot_news_port"] = pilot_news + Point(25,35)
	Texts["pilot_news_pilot"] = Text("", pilot_news + Point(290,15), 9, ALIGN_CENTER)
	Texts["pilot_news_headline"] = Text("", pilot_news + Point(290,32), 18, ALIGN_CENTER)
	Texts["pilot_news_flavor"] = Text("", pilot_news + Point(290,75), 10, ALIGN_CENTER)
	Texts["pilot_news_flavor"].width = 225
	
	--Buttons["pilot_news_skill"] = Button(Rect2D(pilot_news+Point(290-72,100),Point(145,35)),"",12)
	Location["pilot_news_skill_tip"] = pilot_news+Point(375,80)
	
	Buttons["pilot_news_done"] = Button(Rect2D(pilot_news + Point(290-63,150), Point(125, 30)), "Button_Pilot_News_Done", 12)
		
	----------------- Research Screen positions ---------------------------------
			
	local mech_loc = 55 + (ScreenSizeY()-55)/2 - (370)/2 - 25
	local mech_loc_x = math.min(12 + (ScreenSizeX() - 1024),45)
	if GetDefaultScale() > 2 then
		mech_loc_x = mech_loc_x + Default_UI_Box.x
	end
	local upgrade_box = Point(mech_loc_x + 150, mech_loc)
	Boxes["upgrade_box"] = Rect2D(upgrade_box.x, upgrade_box.y,660,370)
	
	Boxes["reactor_box_gamepad"] = Rect2D(upgrade_box.x, upgrade_box.y,117,370)
	Location["reactor_header_gamepad"] = upgrade_box + Point(0,2)
	
	local top_corner = upgrade_box + Point(20,0)
	local mech_box = top_corner + Point(0,35)
	
	local nameSize = 165
	Buttons["upgrade_rename"] = Button(Rect2D(0,0,25,15),"")
	
	local stats = mech_box + Point(125,61)
		
	Texts["inventory_new"] = Text("Inventory_New",Point(75,75),12,ALIGN_CENTER)	
	
	Location["upgrade_classTip"] = mech_box + Point(270,-80) + Point(365,0)

	
	Buttons["slide_close"] = Button("ui/upgrade/upgrade_close",Point(0,0))
	Buttons["upgrade_skill"] = Button("ui/upgrade/upgrade_skillbox",Point(0,0))
	Boxes["upgrade_skill_big"] = Rect2D(0,0,122,113)
	
	Location["upgrade_skillimage"] = Point(1,32)
	
	Boxes["upgrade_upgrade_0"] = Rect2D(0,0, 122, 32)
	Location["upgrade_upgrade_0"] = Point(0,125)
	Location["upgrade_upgrade_1"] = Point(0,175)
	
	local weapons = Point(top_corner.x+315,top_corner.y+100)
	Location["weapon_header"] = weapons + Point(-5,11)
	
	------------- MOVE / HEALTH UPGRADE AREA ----------------------------
	local upgrades = Point(top_corner.x+315,top_corner.y)
	Location["upgrades_header"] = upgrades + Point(-5, 2)
	
	local upgrade_y = 20
	local health_loc = upgrades + Point(17,upgrade_y)
	Buttons["upgrade_health"] = Button(Rect2D(health_loc,Point(122, 32)),"",12)
	Location["upgrade_health_loc"] = health_loc + Point(0,35)
	--Boxes["upgrade_health_button"] = Rect2D(health_loc + Point(0,35),Point(122, 32))
	Texts["upgrade_health"] = Text("Upgrade_Health", health_loc + Point(22,10),11,ALIGN_LEFT)
	Texts["upgrade_health_num"] = Text("",  health_loc + Point(72,10),12,ALIGN_LEFT)
	
	local move_loc = upgrades + Point(167+19,upgrade_y)
	Buttons["upgrade_move"] = Button(Rect2D(move_loc,Point(122, 32)),"",12)
	Location["upgrade_movement_loc"] = move_loc + Point(0,35)
--	Boxes["upgrade_movement_button"] = Rect2D(Location["upgrade_movement_loc"],Point(122, 32))
	Texts["upgrade_move"] = Text("Upgrade_Move", move_loc + Point(26,10),11,ALIGN_LEFT)
	--Texts["upgrade_move_num"] = Text("", move_loc + Point(70,11),12,ALIGN_LEFT)
	
	Location["upgrade_moveTip"] = move_loc + Point(140,-10)
	Location["upgrade_healthTip"] = health_loc + Point(140,-10)
	
	
	--Lines["upgrade_divider_stats"] = {weapons + Point(265,-33), weapons + Point(265,232)}
	Lines["upgrade_divider_1"] = {Point(upgrades.x + 162, upgrades.y+30), Point(upgrades.x + 162, upgrades.y+100)}
	Lines["upgrade_divider_4"] = {Point(upgrades.x - 5,upgrades.y + 110),Point(upgrades.x+325,upgrades.y+110)}
	
	Lines["upgrade_divider_weapons"] = {weapons + Point(162,55), weapons + Point(162,225)}
	
	Location["upgrade_skillbutton0"] = weapons + Point(15,45)
	Location["upgrade_skillbutton1"] = weapons + Point(186,45)
		
	-----------------------Pilot location------------------------------
	local pilot_loc = top_corner + Point(8,0)
	Location["pilot_header"] = pilot_loc + Point(-26,2)
	Location["upgrade_skillbutton2"] = pilot_loc + Point(15,65) -- Pilot Portrait
	Texts["upgrade_pilotName"] = Text("", pilot_loc + Point(65,35),13,ALIGN_CENTER) -- Pilot Name
	Buttons["upgrade_pilotName"] = Button(Rect2D(0,0,39,35),"")
	
	Buttons["upgrade_pilotskill1"] = Button(Rect2D(Point(0,0),Point(122, 32)),"",9)
	Buttons["upgrade_pilotskill2"] = Button(Rect2D(Point(0,0),Point(122, 32)),"",9)
	Buttons["upgrade_pilotskill3"] = Button(Rect2D(Point(0,0),Point(122, 32)),"",9)
	
	local skill_x = 0
	local skill_y = 185
	
	local rankLoc = pilot_loc + Point(skill_x + 75,skill_y + 15)
	Texts["upgrade_pilotRank"] = Text("", rankLoc, 10,ALIGN_CENTER)
	
	Location["upgrade_renameTip"] = pilot_loc + Point(80 + 65,25)
	
	pilot_loc.x = pilot_loc.x + 17
	Location["upgrade_pilotskill1_2"] = pilot_loc+Point(skill_x,skill_y+70)
	Location["upgrade_pilotskill2_2"] = pilot_loc+Point(skill_x,skill_y+115)
	
	Location["upgrade_pilotskill3_3"] = pilot_loc+Point(skill_x,skill_y+45)
	Location["upgrade_pilotskill1_3"] = pilot_loc+Point(skill_x,skill_y+90)
	Location["upgrade_pilotskill2_3"] = pilot_loc+Point(skill_x,skill_y+135)
	
	
	Location["upgrade_pilotTip1"] = Buttons["upgrade_pilotskill1"].pos + Point(165,-25)
	Location["upgrade_pilotTip2"] = Buttons["upgrade_pilotskill2"].pos + Point(165,-25)
	
	Location["upgrade_xpTip"] = rankLoc + Point(100,-35)
	Boxes["upgrade_xp"] = Rect2D(rankLoc + Point(-100,0),Point(200,25))
	
	
	----------- ARMORY LOCATIONS------------
	
	local armory = Point(top_corner.x + Boxes["upgrade_box"].w + 10,top_corner.y + 5)
	Boxes["upgrade_armory"] = Rect2D(armory,Point(125,Boxes["upgrade_box"].h - 10))
	Location["armory_header"] = armory + Point(0,2)
	
	Location["upgrade_storage_up"] = armory + Point(42,30)
	Location["upgrade_storage_down"] = armory + Point(42,307)
	Buttons["upgrade_storage_up"] = Button("ui/upgrade/arrow_up",Location["upgrade_storage_up"])
	Buttons["upgrade_storage_down"] = Button("ui/upgrade/arrow_down",Location["upgrade_storage_down"])
	
	Buttons["upgrade_armory_left"] = Button("ui/upgrade/arrow2",armory + Point(10,80))
	Buttons["upgrade_armory_right"] = Button("ui/upgrade/arrow",armory + Point(430,80))
	
	Boxes["upgrade_skill_small"] = Rect2D(0,0,62,43)
	armory.x = armory.x + 32
	armory.y = armory.y + 65
	Location["upgrade_armory0"] = armory
	Location["upgrade_armory1"] = armory + Point(0,85)
	Location["upgrade_armory2"] = armory + Point(0,85)*2
	Location["upgrade_armory3"] = armory + Point(0,85)*3
	Location["upgrade_armory4"] = armory + Point(0,85)*4
	
	local tab = 130
	Location["upgrade_tab_portrait"] = Point(150,15)
	Location["upgrade_tab1"] = Point(mech_loc_x+1,mech_loc+1)
	Location["upgrade_tab2"] = Point(mech_loc_x+1,mech_loc+tab+1)
	Location["upgrade_tab3"] = Point(mech_loc_x+1,mech_loc+tab*2+1)
	
	Location["ceo_po"] = Point(mech_loc_x+1,mech_loc+tab*2+1)
	
	Location["upgrade_gamepad"] = Point(mech_loc_x+1,mech_loc+tab*3)
	
	Buttons["upgrade_tab1"] = Button(Rect2D(Location["upgrade_tab1"],Point(tab,tab)),"",12)
	Buttons["upgrade_tab2"] = Button(Rect2D(Location["upgrade_tab2"],Point(tab,tab)),"",12)
	Buttons["upgrade_tab3"] = Button(Rect2D(Location["upgrade_tab3"],Point(tab,tab)),"",12)
	Location["upgrade_platform"] = Point(-55,-29)
	Location["upgrade_platform_unit"] = Point(0,-5)
	
	------------ REACTOR INFO ----------------------
	local upgrade_reactor = top_corner + Point(190, 0)
	Lines["upgrade_divider_2"] = {upgrade_reactor,Point(upgrade_reactor.x,upgrade_reactor.y+Boxes["upgrade_box"].h)} -- LEFT LINE
	Lines["upgrade_divider_3"] = {upgrade_reactor + Point(120,0),Point(upgrade_reactor.x + 120,upgrade_reactor.y+Boxes["upgrade_box"].h)}-- RIGHT LINE
	Location["reactor_header"] = upgrade_reactor + Point(0,2)
	Location["upgrade_reactor_bubbles"] = upgrade_reactor + Point(45, 225)
	Location["upgrade_reactor_gap"] = Point(0,-21)
	Location["reactor_tooltip"] = Point(upgrade_reactor + Point(120,180))
	
	Location["reactor_undoTip"] = Point(upgrade_reactor + Point(120,320))
	
	Boxes["reactor_box"] = Rect2D(upgrade_reactor + Point(30,25),Point(58,235))
	
	local upgrade_button = upgrade_reactor + Point(17,255)
	Location["upgrade_button"] = upgrade_button
	Boxes["upgrade_reactor_box"] = Rect2D(upgrade_button,Point(85,55))
	Buttons["upgrade_reactor"] = Button(Boxes["upgrade_reactor_box"], "",12)
	Boxes["upgrade_undo_box"] = Rect2D(upgrade_button + Point(0,65),Point(85,35))
	Buttons["upgrade_undo"] = Button(Boxes["upgrade_undo_box"], "Button_Upgrade_Undo",12)
	Location["upgrade_cost"] = Point(upgrade_button.x + 43, upgrade_button.y + 9)
	Location["upgrade_cost_image"] = Location["upgrade_cost"] + Point(-11,20)
	
	------------ TEST INFO --------------
	
	local test_box = Point(top_corner.x + 330,top_corner.y +390)
	Boxes["upgrade_test"] = Rect2D(test_box, Point(310, 50))
	Location["upgrade_test_button"] = test_box + Point(184,7)
	Boxes["upgrade_test_button"] = Rect2D(Location["upgrade_test_button"],Point(115,35))
	Buttons["upgrade_test"] = Button(Boxes["upgrade_test_button"], "Button_Upgrade_Test",12)
	Texts["upgrade_test_text"] = Text("Upgrade_Test", test_box + Point(95, 7), 11, ALIGN_CENTER)
	Texts["upgrade_test_text"].width = 175	
	
				
	Location["skill_info"] = Point(155,-65)
	
	
	Location["pilot_info"] = Point(215,-25)
	
	--for i,v in pairs(Buttons) do
		--LOG("Button_"..i.." = ".."\""..v.label.."\",")
	--end
end

InitializeImageList()

RetrievedThings = {}


function GetShiftSpeed(distance)
	local speed = 0
	if distance > 200 then
		speed = 20
	else
		speed = 20 - (1.0-distance/200)*16
	end
	return speed*5
end

function GetLine(name)
	if Lines[name] ~= nil then
		return Lines[name]
	else
		return {Point(0,0),Point(0,0)}
	end
end

function GetImageLoc(image)
	RetrievedThings[image] = true
	if Location[image] ~= nil then
		return Location[image]
	else
		return Point(INT_MAX,INT_MAX)
	end
end

function GetButton(button)
	RetrievedThings[button] = true
	if Buttons[button] ~= nil then
		return Buttons[button]
	else
		LOG("Did not find lua defined button: "..button)
		return Button()
	end
end

function GetValue(value)
	RetrievedThings[value] = true
	if Values[value] ~= nil then
		return Values[value]
	else
		LOG("Did not find lua defined value: "..value)
		return 0
	end
end

function GetTextData(text)
	RetrievedThings[text] = true
	if Texts[text] ~= nil then
		return Texts[text]
	else
		LOG("Did not find lua defined text: "..text)
		return Text("NULL TEXT", Point(0,0), 12)
	end
end

function GetBox(name)
	RetrievedThings[name] = true
	if Boxes[name] ~= nil then
		return Boxes[name]
	else
		LOG("Did not find lua defined box: "..name)
		return Rect2D(0,0,0,0)
	end
end

function GetColor(name)
	RetrievedThings[name] = true
	if Colors[name] ~= nil then
		return Colors[name]
	else
		LOG("Did not find lua defined color: "..name)
		return GL_Color()
	end
end

function CheckRetrieved()
	local ret = {}
	for i,v in pairs(Boxes) do
		if RetrievedThings[i] == nil then
			ret[#ret+1] = i
		end
	end
	
	table.sort(ret)
	
	for i,v in ipairs(ret) do
		LOG(v)
	end
	
end

























