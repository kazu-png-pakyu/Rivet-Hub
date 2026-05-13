================================================================
  EXOTIC HUB SCRIPT - FORMATTED
  PART 1 -- INITIALIZATION, SERVICES & GAME EVENTS
================================================================

if not game:IsLoaded()then
 game.Loaded:Wait()end
 
task.wait(1)
local G=game.GameId if tostring(G)~="7436755782"then
 
return end
 if _G.is_running_gag then
 
warn("Already running x")
return end
 _G.is_running_gag=true 
print("exo start > ")
print("Place Id ",game.PlaceId)
local V={}V.UserInputService=game:GetService("UserInputService")V.HttpService=game:GetService("HttpService")V.ReplicatedStorage=game:GetService("ReplicatedStorage")V.Workspace=game:GetService("Workspace")V.TeleportService=game:GetService("TeleportService")V.Players=game:GetService("Players")V.RunService=game:GetService("RunService")V.MarketplaceService=game:GetService("MarketplaceService")V.Modules=V.ReplicatedStorage:WaitForChild("Modules")V.LocalPlayer=V.Players.LocalPlayer V.Character=V.LocalPlayer.Character or V.LocalPlayer.CharacterAdded:Wait()V.Backpack=V.LocalPlayer:WaitForChild("Backpack")V.PlayerGui=V.LocalPlayer:WaitForChild("PlayerGui")V.player_humanoid=V.Character:FindFirstChildOfClass("Humanoid")V.GameEvents=V.ReplicatedStorage:WaitForChild("GameEvents")V.petsServiceRemote=V.GameEvents:WaitForChild("PetsService")V.PetEggService=V.GameEvents:WaitForChild("PetEggService")V.BuyGearStock=V.GameEvents:FindFirstChild("BuyGearStock")V.BuySeedStock=V.GameEvents.BuySeedStock V.BuyDailySeedShopStock=V.GameEvents:FindFirstChild("BuyDailySeedShopStock")V.BuyPetEgg=V.GameEvents:FindFirstChild("BuyPetEgg")V.BuyTravelingMerchantShopStock=V.GameEvents:WaitForChild("BuyTravelingMerchantShopStock")V.SellPetRemote=V.GameEvents:WaitForChild("SellPet_RE")V.SellAllPetsRemote=V.GameEvents:WaitForChild("SellAllPets_RE")V.Sell_Inventory=V.GameEvents.Sell_Inventory V.DataStream=V.GameEvents.DataStream V.PlantRemote=V.GameEvents:WaitForChild("Plant_RE")V.collectEvent=(V.GameEvents:WaitForChild("Crops")):WaitForChild("Collect")V.FavItem=V.GameEvents:WaitForChild("Favorite_Item")V.BuyEventShopStock=V.GameEvents:WaitForChild("BuyEventShopStock")V.BoostService=V.GameEvents:WaitForChild("PetBoostService")V.TrowelRemote=V.GameEvents:WaitForChild("TrowelRemote")V.MutationService=V.GameEvents:WaitForChild("PetMutationMachineService_RE")V.ActivePetService=V.GameEvents:WaitForChild("ActivePetService")V.SellPetShopSelected=V.GameEvents:WaitForChild("SellPetShopSelected")
print("Loading m1")V.SprayService_RE=V.GameEvents:WaitForChild("SprayService_RE")V.CookingPotService_RE=V.GameEvents:WaitForChild("CookingPotService_RE")V.CraftingGlobalObjectService=V.GameEvents:WaitForChild("CraftingGlobalObjectService")V.SprinklerService=V.GameEvents:WaitForChild("SprinklerService")V.Water_RE=V.GameEvents:WaitForChild("Water_RE")V.BonfireService=V.GameEvents:WaitForChild("BonfireService")V.Remove_Item=V.GameEvents.Remove_Item V.DeleteObject=V.ReplicatedStorage.GameEvents.DeleteObject V.PetLeadService_RE=V.GameEvents.PetLeadService_RE V.PetCooldownsUpdated=V.GameEvents.PetCooldownsUpdated V.TryUseGear=V.GameEvents.TryUseGear V.TryMapleSyrup=V.GameEvents.TryMapleSyrup V.Reclaimer=V.GameEvents.ReclaimerService_RE V.BuySeasonPassStock=V.GameEvents:FindFirstChild("SeasonPass")and V.GameEvents.SeasonPass:FindFirstChild("BuySeasonPassStock")V.petsContainer=V.Workspace:WaitForChild("PetsPhysical")V.GearShopUI=V.PlayerGui:WaitForChild("Gear_Shop")V.SeedShopUI=V.PlayerGui:WaitForChild("Seed_Shop")V.PetShopUI=V.PlayerGui:WaitForChild("PetShop_UI")V.TravelingMerchantShop_UI=V.PlayerGui:WaitForChild("TravelingMerchantShop_UI")V.DigRemote=(V.GameEvents:WaitForChild("DiggingMiniGame")):WaitForChild("DigRemoteEvent")V.fails=0 
function V.safeRequire(G)
local y,Z=
pcall(require,G)if not y or Z==nil then
 
warn("[SafeRequire] Failed to load:",G)V.fails=V.fails+1 
return nil end
 
return Z end
 V.DataService=V.safeRequire(V.ReplicatedStorage.Modules.DataService)
print("Loading m2")V.mod_load={LoadAllModules=
function()
local G=V.Modules 
local y=G:FindFirstChild("PetServices")if y then
 
local G=y:FindFirstChild("ActivePetsService")if G then
 V.ActivePetsService=G end
 end
 end
}V.mod_load.LoadAllModules()
print("Loading m3")V.RebirthShared=V.safeRequire(V.ReplicatedStorage.Modules.RebirthShared)V.SeedData=V.safeRequire(V.ReplicatedStorage.Data.SeedData)V.PetUtilities=V.safeRequire(V.ReplicatedStorage.Modules.PetServices.PetUtilities)V.PlantTraitsData=V.safeRequire(V.ReplicatedStorage.Modules.PlantTraitsData)V.CraftingData_CraftingRecipeRegistry=V.safeRequire(V.ReplicatedStorage.Data.CraftingData.CraftingRecipeRegistry)V.FoodRecipeData=V.safeRequire(V.ReplicatedStorage.Data.FoodRecipeData)V.GearData=V.safeRequire(V.ReplicatedStorage.Data.GearData)V.SeasonPassShop=nil V.EventShopData=V.safeRequire(V.ReplicatedStorage.Data.EventShopData)V.PetList=V.safeRequire(V.ReplicatedStorage.Data.PetRegistry.PetList)V.PetRegistry=V.safeRequire(V.ReplicatedStorage.Data.PetRegistry)V.InventoryService=V.safeRequire(V.Modules.InventoryService)V.GetSessionPassModule=
function()
local G=V.ReplicatedStorage 
local y=G:FindFirstChild("Data")if not y then
 
return nil end
 
local Z=y:FindFirstChild("SeasonPass")if not Z then
 
return nil end
 
local j=Z:FindFirstChild("SeasonPassShopData")if not j then
 
return nil end
 
local i,c=
pcall(require,j)if i then
 V.SeasonPassShop=c 
return c 
else
 
warn("[SeasonPassShopData] require failed:",c)
return nil end
 end
 V.GetSessionPassModule()V.PetMutationRegistry=V.safeRequire(V.ReplicatedStorage.Data.PetRegistry.PetMutationRegistry)V.TravelingMerchantData=V.safeRequire(V.ReplicatedStorage.Data.TravelingMerchant.TravelingMerchantData)
print("Loading m4")V.FindItemImage=V.safeRequire(V.ReplicatedStorage.Modules.ItemImageFinder)V.DailySeedShopData=V.safeRequire(V.ReplicatedStorage.Data.DailySeedShopData)V.SeedPackData=V.safeRequire(V.ReplicatedStorage.Data.SeedPackData)V.VariantsEnums=V.safeRequire(V.ReplicatedStorage.Data.EnumRegistry.VariantsEnums)V.PetGiftingModule=V.safeRequire(V.ReplicatedStorage.Modules.PetServices.PetGiftingService)V.CalculatePlantValue=V.safeRequire(V.ReplicatedStorage.Modules.CalculatePlantValue)V.SeedShopData=V.safeRequire(V.ReplicatedStorage.Data.SeedShopData)V.GearShopData=V.safeRequire(V.ReplicatedStorage.Data.GearShopData)V.PetEggData=V.safeRequire(V.ReplicatedStorage.Data.PetEggData)
print("Loading m5")
function Addcantsleep()if(getconnections or get_signal_cons)then
 for G,V in pairs(((getconnections or get_signal_cons))(V.LocalPlayer.Idled))do
 if V.Disable then
 V.Disable(V)
elseif V.Disconnect then
 V.Disconnect(V)end
 end
 end
 end
 
pcall(
function()Addcantsleep()end
)V.ReplicatedStorageSharedFolder=V.ReplicatedStorage:WaitForChild("Shared")
task.wait(.2)
print("Loading m6")V.WEBHOOK_URL=""V.PROXY_URL="https://exotichub.app/p"V.invite_link_url="https://exotichub.app/join"V.invite_link_short="exotichub.app/join"
local y=(loadstring(game:HttpGet("https://exotichub.app/live_mskmb7a2p8dj.lua",true)))()V.AppName="Exotic Hub"V.CurentV="v1.46.3"
local Z={}Z.dev_tools=true Z.is_pro=true Z.mark_save_disabled=false Z.max_priorityx=7 Z.Notify=
function(G,V)if not G or not y then
 
return end
 
local Z=V or 2.5 y:Notify(G,tiemr)end
 
print("Loading m7")_G.exoprov=false if isfile("780ad941-1694-4f37-8e81-2fd6cde9785b.d")then
 
local G=readfile("780ad941-1694-4f37-8e81-2fd6cde9785b.d")if G=="true"then
 Z.is_pro=true end
 delfile("780ad941-1694-4f37-8e81-2fd6cde9785b.d")end
 Z.allowpro={HexaFlame99=true,topguy713=true,tinybloxi33=true;rizzyt9=true;goforit887=true,MrRizzy90=true;TurboSpade67=true}Z.AllTradeWorld=
function()
local G={BlazeTopUpPet5=true}if Z.allowpro[V.LocalPlayer.Name]or G[V.LocalPlayer.Name]then
 
return true end
 
return true end
 if Z.allowpro[V.LocalPlayer.Name]then
 Z.is_pro=true end
 if Z.is_pro then
 _G.exoprov=true end
 if V.LocalPlayer.Name=="goforit887"then
 end
 Z.HATCH_STATES={NORMAL="NORMAL",EGG_PHASE="EGG_PHASE",EGG_PLACE_PHASE="egg_place",EGG_HATCH_PHASE="egg_hatchphase"}Z.TEXT_TRADE_WORLD=""Z.TEXT_HATCH_SYSTEM=""Z.TEXT_ENHANCE_PRO=""Z.TEXT_AGEBREAK=""Z.TEXT_CRAFT_TEAMS=""Z.TEXT_TEAM_SYSTEM=""Z.event_seeding_active=false Z.event_seeding_list={}Z.alt_Plants_Physical=Z.alt_Plants_Physical or{}Z.RNG_EGG_OVERRIDE=0 Z.WAS_PRO_END=false Z.is_dc=false Z.seen_pets={}Z.is_hatch_stage_koi=false Z.hatch_state=Z.HATCH_STATES.NORMAL Z.show_expire_key=false Z.expire_key_text=""Z.was_enhancerpro_success=false V.LocalPlayer.CameraMaxZoomDistance=350 Z.player_userid=V.LocalPlayer.UserId Z.ItemTypes={Pet="Pet";Egg="Egg";Fruit="Fruit";Seed="Seed"}Z.AssetCache={}Z.EggsNoIcons={["Premium Night Egg"]=75473533691044;["Night Egg"]=110540585737631}Z.GetAssetId=
function(G,y)if not G or not y then
 
return 0 end
 
local j=y..(":"..G)
local i=Z.AssetCache[j]if i then
 
return i end
 
local c=Z.EggsNoIcons[G]if c then
 
return c end
 
local J,T=
pcall(
function()
return V.FindItemImage(G,y)end
)if not J or not T then
 Z.AssetCache[j]=0 
return 0 end
 
local d=tonumber(string.match(T,"%d+"))or 0 if d==6937742258 then
 d=0 end
 Z.AssetCache[j]=d 
return d end
 Z.MakeAltFolder=
function(G)if not G then
 
warn("MakeAltFolder requires a userId!")
return nil end
 
local y=tostring(G).."_Plants"
local j=V.ReplicatedStorage:FindFirstChild(y)if j then
 Z.alt_Plants_Physical[G]=j 
return j end
 
local i=Instance.new("Folder")i.Name=y i.Parent=V.ReplicatedStorage Z.alt_Plants_Physical[G]=i 
return i end
 Z.MakeAltFolder(Z.player_userid)Z.GetCheckIfPro=
function()
return Z.is_pro end
 if V.fails>0 then
 
warn("[EXO] --<> Important data not loaded. Please rejoin!")end
 
local j={lbl_home_info=nil;lbl_pet_mutation_status=nil;lbl_mutation_machine_status=nil;lbl_market_item_info=nil;lbl_stats=nil;lbl_fruit_collect_live=nil;lbl_fruit_shovel_live=nil;lbl_pet_system_live=nil,lbl_craftinggear_stats=nil,lbl_crafting_timeleft=nil,lbl_cooking_display_time=nil,lbl_cooking_stats=nil,lbl_ascenstats=nil,lbl_ascen_current_requirement=nil;lbl_ascen_cd=nil,lbl_selected_team1_count=nil,lbl_selected_team2_count=nil;lbl_selected_team3_count=nil;lbl_selected_team4_count=nil;lbl_reclaimer_stats=nil,lbl_smithman_status=nil,lbl_enhancerpro1=nil;lbl_tradeevent_status=nil;lbl_craftteams_status=nil,lbl_agebreak_status=nil,lbl_pet_level_status=nil,lbl_pet_level_info=nil,lbl_marmot_information=nil;lbl_chubby_chipmunk_information=nil;lbl_redpanda_information=nil;lbl_elephant_booster_status=nil,lbl_trowel_stats=nil;lbl_trowel_cframe=nil;lbl_trowel_progress=nil,lbl_watering_stats=nil,lbl_watering_information=nil;lbl_shovel_status=nil,lbl_shovel_information=nil,MultiDropdownSellTeam=nil,MultiDropdownHatchTeam=nil,MultiDropdownEggReductionTeam=nil;MultiDropdownEggPetSizeTeam=nil,lbl_seed_information=nil,lbl_seed_location=nil;lbl_seed_status=nil;lbl_fallevent_stats=nil,lbl_fallevent_progress=nil;lbl_fallevent_required_fruits=nil;lbl_fallevent_fall_bloom=nil,lbl_fallevent_fruit_ls=nil;lbl_jungle_stats=nil,lbl_jungle_information=nil,lbl_questline_status=nil,lbl_questline_info=nil,lbl_farm_plants_counts=nil,lbl_sell_inventory_pets=nil}Z.UI_Buttons={ButtonAutoCook=nil}
local i={DropDownMarket=nil;ShovelDropDown=nil;PetLevelDropDown=nil;PetBoostSelectDropdown=nil;dd_playertargets_giftpets=nil,dropdown_support_team=nil;dropdown_target_team=nil;dropdown_mut_cd_team=nil,dropdown_claimpet_team=nil,customteams_team1=nil,customteams_team2=nil;customteams_team3=nil;customteams_team4=nil;dd_reduction_teamfirst=nil,dd_reduction_teamafter=nil;dd_enhance_targets=nil,dd_bypass_teamsactive=nil,agebreaktarget_team=nil;agebreakdup_team=nil;agebreakidle_team=nil;agebreakclaim_team=nil;agebreaksubmit_team=nil;craftteam_claim=nil,craftteam_submit=nil,craftteam_idle=nil;dropdown_petmutation_maxlevelteam=nil,dropdown_petmut_xpteam=nil,dropdown_petfiller_team=nil,dropdown_pettargetteam=nil,dropdown_petmutationteam=nil;dropdown_petbaseweightteam=nil,dropdown_sell_inventory_pets=nil}Z.UI_Toggles={ToggleUnlockStore=nil}Z.FruitCollectPause={paused_until=0,reason="";Pause=
function(G,V)G=tonumber(G)or 0 if G<=0 then
 
return false end
 Z.FruitCollectPause.paused_until=os.clock()+G Z.FruitCollectPause.reason=V or"Paused"
return true end
;Resume=
function()Z.FruitCollectPause.paused_until=0 Z.FruitCollectPause.reason=""end
;IsPaused=
function()
return os.clock()<Z.FruitCollectPause.paused_until end
;GetTimeLeft=
function()
local G=Z.FruitCollectPause.paused_until-os.clock()if G<=0 then
 
return 0 end
 
return G end
;CanCollect=
function()
return not Z.FruitCollectPause.IsPaused()end
}Z.max_required_weight_elephant=2.1 Z.pickplace_disable_delay=0 Z.SetDisablePickPlaceFor=
function(G)if Z.pickplace_disable_delay<1 then
 Z.pickplace_disable_delay=G end
 end
 
local c={hop_enabled=false;hop_maxtries=10;hop_currenttries=0;hop_targetversion=0;egg_priority1="None";egg_priority2="None";egg_priority3="None",egg_priority4="None";egg_priority5="None",egg_priority6="None";egg_priority7="None";autofavfruits_enabled=false,autofavminweight=70;autofavmaxweight=500;autofavplantlist={};enhance_cooldown=.35;swap_enchancer=false;farmfav_fruit_enhancer=false;egg_override={};egg_override_enabled=false;shop_stocks={enabled_seedshop=true,enabled_gearshop=true;enabled_eggshop=true;seed_shop_avoid={},gear_shop_avoid={};egg_shop_avoid={}},petpp_overrides={},petpp_selected="";rmplants={mut_whitelist={},mut_blacklist={},variants_list={},max_mut_count=0,fruit_list={},fruit_remove_enabled=false},max_eggs_to_place=0,easterbunnyeggrewardcollect=true;merrybear_collect=true,mut_max_level_successfulpets=false,mut_batch_process_enable=false;mut_pet_mode_enable=false,mut_batch_process_turn="levelteam";mut_target_pets_uuid={},mut_target_mutations={};mut_support_team={},mut_mutation_machineteam={};mut_claimpet_team={};mut_required_level=50;mut_required_level_item=40;mut_pet_inside_mutation="",mut_was_running=false,max_mutation_count=0;mutation_hatch_petfilter={},mutation_hatch_mutlist={},mutation_hatch_pet_enabled=false,chubby_chipmunk_amount_collected=0,chubby_chipmunk_auto_collect=true;chubby_chipmunk_item_watering_can=0,chubby_chipmunk_item_event_lantern=0;chubby_chipmunk_item_godly_sprinkler=0,chubby_chipmunk_item_legendary_egg=0;chubby_chipmunk_item_reclaimer=0;chubby_chipmunk_item_nutty_crate=0,chubby_chipmunk_item_silver_fertilizer=0;chubby_chipmunk_item_nutty_chest=0;chubby_chipmunk_item_master_sprinkler=0;chubby_chipmunk_item_medium_treat=0;chubby_chipmunk_item_medium_toy=0;chubby_chipmunk_item_mythical_egg=0,chubby_chipmunk_item_grandmaster_sprinkler=0;chubby_chipmunk_item_rainbow_fertilizer=0;chubby_chipmunk_item_petshardnutty=0,marmot_amount_collected=0;marmot_auto_collect=true;marmot_item_firefly=0;marmot_item_maple_leaf_kite=0;marmot_item_sky_lantern=0,marmot_item_leaf_blower=0;marmot_item_maple_syrup=0;marmot_item_maple_sprinkler=0;marmot_item_golden_acorn=0;magie_enabled_auto=false,magpie_status={};magpie_recordstatus=true;bear_merrygift_status={};bearded_dragon_egg_status={},bearded_dragon_recordstatus=true;is_auto_jungle=false;feeding_auto_collectfruits=true,feed_food_insteadoffruits=false,feeding_pets_timer=120;feeding_pets_auto=false;force_feed_all_pets=false,feeding_list_pets={};feeding_list_plants={};pet_level_boost_list="-",pet_auto_level_auto=false,pet_auto_level_max=1;pet_auto_level_min=0,pet_level_selected_pets={},feeding_exlude_food_list={};g_fruit_weight_max=99,g_fruit_weight_min=0,is_fall_event_running=false;is_fall_event_fastmode=false,is_autoeasterteams=true,hive_esp_eggs=true;hive_esp_showhatched=false,is_auto_plantseedEvent=false;event_automiddle_tp=true;autocraftcandyevent=false,autocraftcandymaxcrafts=1;autobuyeventeggsamount=19,autoplacesprinklers={};enable_autoplacesprinklers=false,newyear_dailyclaim=false,is_fall_questline_auto=false;is_fall_questline_reroll=false;is_fall_questline_spin=false,is_playerstats_running=true,hatch_rare_withbigsizetm=false;web_api_key="";ascension_max_seeds=1;auto_ascension=false,auto_sellbackpack=false,is_collect_fruit=false,pet_override_weight={};mutation_whitelist={};mutation_blacklist={};fruit_variants_select={},fruit_collector_turbo=false;fruit_instant_collect=false,collection_plants={};sell_mutation_whitelist={},sell_mutation_blacklist={};sell_fruit_list={},auto_sell_backpack_time=false;auto_sell_backpack_every=60;season_pass_shop_items={},cook_potone_item1="-",cook_potone_item2="-";cook_potone_item3="-";cook_potone_item4="-";cook_potone_item5="-",is_auto_cook=false;cooking_autocollect_required=true,cooking_autoplant_required=true;trowel_plants_list={},trowel_saved_cframe="0,0,0",shovel_plants_list={},shovel_keep_amount=0,is_auto_shovel=false;watering_list_plants={};watering_is_auto=false;watering_amount_to_water=2,watering_speed_time=.3;fall_pets_shop={};fall_seeds_shop={},fall_cosmetic_shop={};fall_gear_shop={};jungle_seed_stages1={};jungle_auto_plants_list={},boost_auto_team_placed_koi=false,boost_koi_team_list={};boost_sprinkler_koi_team=false,is_auto_place_sprinkler_hatch=false,list_gear_event_workbench={};is_auto_craft=false;craft_autoplant_workbench=true,craft_autofruit_workbench=true,quest_recoll_max_cost="1.6M",seed_placement_list={},is_auto_seed=false;seed_keep_amount=0;seed_speed_timer1=.5,is_seed_random=true,is_seedplace_center=true,seed_location_vector="0,0,0",show_better_fruitnames=false;remove_visuals_weather=false}
local J={is_trading_world_mode=false,trade_worldtp_delay=60;was_dc=false,LevelTimer={times={},startTime=0},test_a={};farm={delete_plants=true,delete_fruits=true;change_parent=false;enable_delete_fruits=false},timerecording={};oldtest={},fruitesp={show_mutations=false;show_esp=false,enable_esp=false,plants_list={}},is_highperformance_mode=true}
local T={petfav={allow_pet_list={},allow_mutation_list={};min_age=1;max_age=100;min_weight=.8;max_weight=2.86};valentines={enabled_event=false;claim_rewards=true,plant_exclude={}},feedevent={feed_birds_enabled=false,feed_plant_list={}},max_web_count=7;giftpets={allow_pet_list={},allow_mutation_list={};custom_pets_list={},allow_player_targets={},send_trading_ticket_auto=false;enabled_gift_pets=false;enabled_auto_trade=false,auto_confirm_accept=false;trade_auto_accept=false,allow_fav=false;min_age=1,max_age=2;min_weight=.8,max_weight=2.86,custom_mode=false,delay_between_gift=9.9},clean_mut_list={},clean_pet_type={};clean_system_enabled=false,honeymachine_autoclaim=true,honeymachine_autosubmit=true;honeymachine_enabled=true,bee_autobuyshop,bee_whitelisteggs={};bee_hiveautohatch=false;bee_hiveautoupgrade=false,autoshowuisc=true;sellallunfav=true;sellinventorytpback=true,remove_farms=false,is_pc_mode=false;fast_ascen=false;nice_fruit=false,hide_log_ui=false;sell_mode_hatch_selected=false,auto_fav_after_hatch=true;eggs_center_mode1=false,clover_method=false;onlyplaceeggswhenempty=false;delay_between_sell_seal=0;delay_between_hatch_koi=0;rng_use_system=false,rng_auto_rejoin=false;rng_egg_lowers_up=false,char_farm_middle=false,fav_fruit_enhancer=false;enhancer_auto_sellfruit=false,enhancer_auto_favallow=true,fav_fruit_enhance_sell=false;is_running_custom_teams=false,customteams_team1={};customteams_team2={},customteams_team3={};customteams_team4={},customteams_boost_teamunits={};customteams_boosts={};customteams_boosts_enabled={},customteams_team1_delay=30;customteams_team2_enabled=false;customteams_team2_delay=30,customteams_team3_enabled=false;customteams_team3_delay=30,customteams_team4_enabled=false;customteams_team4_delay=30;pause_systems=false;disable_event_notify_button=false;auto_claim_season_points=false,only_show_baseweight=false;use_noti=false,fast_egg_placement=false;safe_fruits={},is_auto_accept_gift=false;tradeevent={enable_trade_event=false;fruit_collect=true,seed_place=false},overridepets={selected_pets={},is_enabled=false,delay_amount=.9},craftevent={smith_auto=false,egg_list={},gear_list={},fruit_list={}},agebreak={is_active_agebreak=false;target_team={},dup_team={},claim_team={},submit_team={};idle_team={},max_level=125;use_filters=false,avoid_age_filter=false;avoid_weight_filter=true;auto_skip_tokens=false},allcraft={auto_craft_event=false;teams_enabled=false,receipe_data={},team_claim={};team_submit={};team_idle={}};reclaim={plants={},keep_amount=0};elephant={boost_list={},pet_list={};delay_before_unequip=.4;delay_before_place=.2,boost_amount=1};seedpack={is_active=false,selected_packs={}};auto_restartjoin_server=false;auto_rejoin_after_hatchcount=30;halloween={shops={},auto_dig=true;auto_reaper=true},sellingpets={manual_sell_fav=false,auto_pet_sell=false;auto_sell_weight_min=0;auto_sell_age=0,auto_sell_override_fav=false,auto_sell_selected={}};mut_system={gm_sprinkler=false;level=40,lvl_baseweight=40,required_weight=2.1;turbo_max_level=25;custom_max_level=100,only_level_mode=false,is_ruuning=false,maxlevel_team={},xpteam={};mut_team={},baseweight_team={},targetteam={},filler_team={};wanted={},state="level";max_level_enable=true,max_lvl_batch=true,continue_enable=true,elephant_hotswap=true;single_unit_allowed=false;is_baseweight_mode=false;turbo_xp_teams=false,realtime_monitor_system=true;timeout_system=true,disable_horseman=false},show_activepets_ui=true;auto_switchgarden_fast=false,auto_remove_sprinklers=false,auto_remove_sprinklers_nearexpire=true;auto_remove_sp_list={};mutation_boost_team_claim={};mutation_boost_claim_enabled=false,mutation_boost_level_team={},mutation_boost_level_team_enabled=false;mutation_boost_cd_team={};mutation_boost_cd_team_enabled=false;red_panda_restock={},red_panda_restock_total=0;red_panda_record_items=true;pet_mutation_boost_list={},pet_mutation_team_boost_enabled=false,pet_mutation_team_list={};pet_mut_xpteam_boosts={},pet_mut_xpteam_boost_enabled=false,pet_mut_xpteam_petlist={};ui_rescale_val=100;hatch_boost_seal_team={},hatch_boost_seal_enabled=false,hatch_boost_bron_team={},hatch_boost_bron_enabled=false,hatch_boost_eggcd_team={},hatch_team_boost_targets={},hatch_boost_eggcd_enabled=false,always_active_boosts=true,restart_hatching_system=false,sync_pingmode=false;merchant_shop_data={},disconnect_rejoin=false,is_sell_only_hatch_pet=true;is_auto_hatch_enabled=false,is_egg_esp=true;is_fairy_scanner_active=false;buy_merchant=false,gearshop_items={};seedshop_items={},eggshop_items={};is_test=false;is_hatch_in_batch=true,hatch_sell_delayed=false;rejoin_server_bugged=false,is_session_based=true,is_first_time=true,is_auto_rejoin=false;is_running=false;is_age_hatch_mode=false;hatch_mode_age_to_keep=75;sell_weight=3,sell_age=0,pet_team_size=8,pets_hatched_total=0;eggs_hatched_in_10_min_session=0;eggs_hatched_in_hourly_session=0,last_10min_report_time=0;last_hourly_report_time=0,disable_team1=false;disable_team2=false;disable_team3=false;disable_team4=false,disable_team5=false,disable_team6=false;disable_team7=false,auto_hatch_big_pets=true,send_everyhatch_alert=true;send_rare_pet_alert=true,send_big_pet_alert=true;auto_remove_plants_folder=false;webhook_url=V.WEBHOOK_URL;mut_webhook_url="";team1={},team2={},team3={};team4={},team5={};team6={},team7={};team_reduction_placefirst={},team_reduction_placeafter={};team_bypass_alwaysactive={},team_bypass_enabled=false;team_enhance_targets={};enhance_targets_enabled=false,team_reduction_timer=16.5,team_reduction_enabled_teams=false,hatch_fast_mode=false;hatch_ultramode=false;hatch_slow_mode=false,pet_pickplacehatchingstage={};pet_pickplace_enabled=false;pet_pickplace_anywhere=false;pet_pickplace_threading=true,pet_pickplace_random=true;pet_pickplace_random_equip=true;pet_pickplace_cooldownsecs=1;pet_pickplace_activactiondelay=.67,pet_pickplace_equipe_delay=.13;sell_pets={["Rainbow Premium Hive Egg"]={["Rainbow Elemental Bee"]=false,["Rainbow Nurse Bee"]=false;["Rainbow Bumblebee"]=false,["Rainbow Empress Bee"]=false,["Rainbow Gardener Bee"]=false};["Hive Egg"]={Bumblebee=true;["Nurse Bee"]=true,["Gardener Bee"]=true,["Elemental Bee"]=true;["Empress Bee"]=false},["Gilded Choc Springtide Egg"]={["Gilded Choc Jerboa"]=false;["Gilded Choc Spring Bee"]=false,["Gilded Choc Peryton"]=false;["Gilded Choc Nyala"]=false};["Springtide Egg"]={["Spring Bee"]=true,Nyala=true;Jerboa=true,Peryton=false};["Gilded Choc Golden Egg"]={["Gilded Choc Easter Egg Chick"]=false;["Gilded Choc Marshmallow Lamb"]=false;["Gilded Choc Easter Bunny"]=false,["Gilded Choc Chocolate Bunny"]=false};["Golden Egg"]={["Easter Egg Chick"]=true;["Chocolate Bunny"]=true;["Marshmallow Lamb"]=false;["Easter Bunny"]=false},["Rainbow Premium Bird Egg"]={["Rainbow Brown Owl"]=false;["Rainbow Black Bird"]=false,["Rainbow Birb"]=false;["Rainbow Cuckoo"]=false;["Rainbow Gold Finch"]=false};["Bird Egg"]={["Gold Finch"]=true,["Black Bird"]=true,["Brown Owl"]=true,Birb=false;Cuckoo=true};["Rainbow Premium Carnival Egg"]={["Rainbow Show Pony"]=false,["Rainbow Performer Seal"]=false,["Rainbow Bear on Bike"]=false;["Rainbow Unicycle Monkey"]=false;["Rainbow Carnival Elephant"]=false};["Carnival Egg"]={["Bear on Bike"]=true;["Unicycle Monkey"]=true;["Carnival Elephant"]=false,["Show Pony"]=true;["Performer Seal"]=true},["Rainbow Premium New Year\'s Egg"]={["Rainbow New Year\'s Bird"]=false;["Rainbow Firework Sprite"]=false,["Rainbow Celebration Puppy"]=false;["Rainbow New Year\'s Chimp"]=false;["Rainbow Star Wolf"]=false,["Rainbow New Year\'s Dragon"]=false},["New Year\'s Egg"]={["New Year\'s Bird"]=true,["Firework Sprite"]=true;["Celebration Puppy"]=true,["New Year\'s Chimp"]=true,["Star Wolf"]=true;["New Year\'s Dragon"]=false};["Winter Egg"]={Partridge=true;["Santa Bear"]=true,Moose=true;["Frost Squirrel"]=false;Wendigo=false};["Festive Premium Winter Egg"]={["Festive Partridge"]=false;["Festive Santa Bear"]=false,["Festive Moose"]=false;["Festive Frost Squirrel"]=false,["Festive Wendigo"]=false},["Christmas Egg"]={["Turtle Dove"]=true;Reindeer=true,Nutcracker=true,Yeti=false,["Ice Golem"]=false};["Festive Premium Christmas Egg"]={["Festive Turtle Dove"]=false,["Festive Reindeer"]=false,["Festive Nutcracker"]=false;["Festive Yeti"]=false,["Festive Ice Golem"]=false},["Gem Egg"]={["Topaz Snail"]=true,["Amethyst Beetle"]=true;["Emerald Snake"]=true,["Sapphire Macaw"]=true;["Diamond Panther"]=false;["Ruby Squid"]=false};["Safari Egg"]={Oxpecker=true,Zebra=true;Giraffe=true,Rhino=true,Elephant=false};["Spooky Egg"]={Bat=true,["Bone Dog"]=true;Spider=true,["Black Cat"]=true,["Headless Horseman"]=false};["Jungle Egg"]={["Tree Frog"]=true;Hummingbird=true,Iguana=true,Chimpanzee=true;Tiger=false};["Fall Egg"]={Robin=true,Badger=true;["Grizzly Bear"]=true;["Barn Owl"]=true,Swan=false};["Common Summer Egg"]={Starfish=true,Seagull=true,Crab=true};["Uncommon Egg"]={["Black Bunny"]=true,Chicken=true;Cat=true;Deer=true};["Mythical Egg"]={["Grey Mouse"]=true,["Brown Mouse"]=true;Squirrel=true;["Red Giant Ant"]=true;["Red Fox"]=false};["Legendary Egg"]={Cow=true;["Silver Monkey"]=true;["Sea Otter"]=true,Turtle=true;["Polar Bear"]=false};["Rainbow Premium Primal Egg"]={["Rainbow Parasaurolophus"]=false;["Rainbow Iguanodon"]=false,["Rainbow Pachycephalosaurus"]=false,["Rainbow Dilophosaurus"]=false,["Rainbow Ankylosaurus"]=false;["Rainbow Spinosaurus"]=false};["Enchanted Egg"]={Ladybug=true;Pixie=true,Imp=true,["Glimmering Sprite"]=true;Cockatrice=false},["Rare Egg"]={["Orange Tabby"]=true;["Spotted Deer"]=true;Pig=true;Rooster=true,Monkey=true},["Common Egg"]={Dog=true,["Golden Lab"]=true;Bunny=true},["Sprout Egg"]={["Dairy Cow"]=true,Jackalope=true,Seedling=true,Golem=true;["Golden Goose"]=false},["Bee Egg"]={Bee=true,["Honey Bee"]=true;["Bear Bee"]=true,["Petal Bee"]=true,["Queen Bee"]=false},["Anti Bee Egg"]={Wasp=true;["Tarantula Hawk"]=true,Moth=true;Butterfly=false,["Disco Bee"]=false},["Oasis Egg"]={Meerkat=true;["Sand Snake"]=true,Axolotl=true,["Hyacinth Macaw"]=true,["Fennec Fox"]=false};["Gourmet Egg"]={["Bagel Bunny"]=true;["Pancake Mole"]=true,["Sushi Bear"]=true;["Spaghetti Sloth"]=true;["French Fry Ferret"]=false};["Paradise Egg"]={Ostrich=true,Peacock=true,Capybara=true;["Scarlet Macaw"]=true,["Mimic Octopus"]=false},["Bug Egg"]={Caterpillar=true,Snail=true,["Giant Ant"]=true,["Praying Mantis"]=true;Dragonfly=false};["Zen Egg"]={["Shiba Inu"]=true,Nihonzaru=true;Tanuki=true;Tanchozuru=true,Kappa=true;Kitsune=false},["Primal Egg"]={Parasaurolophus=true;Iguanodon=true;Pachycephalosaurus=true,Dilophosaurus=true;Ankylosaurus=true;Spinosaurus=false},["Dinosaur Egg"]={Raptor=true;Triceratops=true;Stegosaurus=true;Pterodactyl=true,Brontosaurus=false;["T-Rex"]=false},["Rare Summer Egg"]={Flamingo=true;Toucan=true,["Sea Turtle"]=true;Orangutan=true,Seal=true};["Night Egg"]={Hedgehog=true;Mole=true,Frog=true;["Echo Frog"]=true,["Night Owl"]=true;Raccoon=false}}}Z.egg_custom_place_array={["Hive Egg"]=true;["Premium Hive Egg"]=true;["Rainbow Premium Hive Egg"]=true;["Springtide Egg"]=true;["Premium Springtide Egg"]=true,["Gilded Choc Springtide Egg"]=true,["Gilded Choc Premium Springtide Egg"]=true;["Golden Egg"]=true;["Premium Golden Egg"]=true,["Gilded Choc Golden Egg"]=true,["Gilded Choc Premium Golden Egg"]=true,["Bird Egg"]=true;["Premium Bird Egg"]=true,["Rainbow Premium Bird Egg"]=true,["Carnival Egg"]=true,["Premium Carnival Egg"]=true;["Rainbow Premium Carnival Egg"]=true;["New Year\'s Egg"]=true;["Premium New Year\'s Egg"]=true,["Rainbow Premium New Year\'s Egg"]=true,["Winter Egg"]=true,["Premium Winter Egg"]=true;["Festive Premium Winter Egg"]=true,["Christmas Egg"]=true;["Premium Christmas Egg"]=true,["Festive Premium Christmas Egg"]=true,["Gem Egg"]=true;["Safari Egg"]=true;["Spooky Egg"]=true;["Jungle Egg"]=true;["Fall Egg"]=true,["Common Egg"]=true;["Anti Bee Egg"]=true,["Enchanted Egg"]=true;["Paradise Egg"]=true,["Premium Primal Egg"]=true,["Rainbow Premium Primal Egg"]=true,["Zen Egg"]=true;["Night Egg"]=true,["Rare Egg"]=true,["Oasis Egg"]=true;["Rare Summer Egg"]=true;["Primal Egg"]=true;["Dinosaur Egg"]=true,["Gourmet Egg"]=true;["Sprout Egg"]=true,["Bee Egg"]=true;["Bug Egg"]=true;["Premium Night Egg"]=true;["Common Summer Egg"]=true;["Exotic Bug Egg"]=true;["Legendary Egg"]=true;["Mythical Egg"]=true;["Premium Anti Bee Egg"]=true,["Premium Oasis Egg"]=true,["Uncommon Egg"]=true}Z.logs={}Z.user_s_key=""
local d={}
local u={}
local q={}
local g={}
local E={}
local a={}
local H={}
local r={}
local Y={}
local e={}
local s={}
local N={}
local W={}
local X={}
local h={}
local l={}
local B={}
local L={}
local m={}
local K={}
local b={}
local S={}
local z={}
local f={}
local t={}Z.InventoryDataBind={}W.PetDataLocal={}z.is_running=false K.shutdown_event_jungle_event=true Z.RequireDataSync_Save=false Z.RequireDataSync_SaveOther=false Z.DisablePickPlace=false W.GetFooterInfo=
function(G)
local y=string.format("%s (%s)",V.invite_link_short,V.CurentV)if not G then
 y=string.format("<b><font color=\'#FFFB03\'>%s</font></b> (%s)",V.invite_link_short,V.CurentV)end
 
return y end
 Z.GetProMessage=
function()
local G=string.format("\240\159\148\146 <stroke th=\'0.1\' joins=\'round\' sizing=\'fixed\' color=\'#8C1600\'><font color=\'#FA2B00\'> Premium Feature - Join discord server to get Key.</font></stroke>")
return G end
 f.PriceListReroll={"1.6M";"6.4M","25.6M";"102.4M";"409.6M";"1.6B";"6.6B","26.2B","104.9B","419.4B","1.7T";"6.7T";"26.8T","126.8T";"207.3T","998.9T";"90.88SX"}f.AvoidQuests={}X.TimeDisplayPots={}X.SpeedOffset=.25 Z.all_pets_data_list={}Z.all_pets_names_list={}Z.craft_data_GearEventWorkbench={}Z.egg_hatch_time_left=0 Z.map_event_item_added=false Z.IS_HIGH_TASK=false Z.IS_CRAFTING=false Z.IS_COOKING=false Z.IS_HATCHING=false Z.IS_GIFT=false Z.IS_FEEDING=false Z.IS_SEEDING=false Z.QUEST_TASK_RUNNING=false Z.IS_SHOVELING=false Z.IS_JUNGLE_RUNNING=false Z.IS_LEVELUP_RUNNING=false Z.IS_WATERING=false Z.IS_Sprinkler=false Z.IS_MUTATION_RUNNING=false Z.IS_PET_MUTATION_RUNNING=false Z.IS_DIG=false Z.IS_PACKOPEN=false Z.IS_EVENT_TASK=false Z.BigData={}Z.sell_selected_pets={}N.Current_Recipe_Name=""N.Current_Recipe_MissingItemName=""a.trowel_is_running=false Z.st_rng_detector_stable="afk"Z.rng_found_stable_tools=false Z.GetIsRNGStable=
function()if not Z.GetCheckIfPro()then
 
return false end
 if Z.st_rng_detector_stable=="good"then
 
return true end
 if Z.st_rng_detector_stable=="bald"then
 
return true end
 
return Z.rng_found_stable_tools end
 H.Boost_Types={PASSIVE_BOOST=true;PET_XP_BOOST=true,ABILITY_REFRESH=true}H.boosts_list={["Small Pet Toy [Passive Boost]"]=true,["Medium Pet Toy [Passive Boost]"]=true;["Large Pet Toy [Passive Boost]"]=true,["Small Pet Treat [XP Boost]"]=true;["Medium Pet Treat [XP Boost]"]=true}H.ItemAmounts={["Small Pet Toy [Passive Boost]"]=.1,["Medium Pet Toy [Passive Boost]"]=.2;["Large Pet Toy [Passive Boost]"]=.3,["Small Pet Treat [XP Boost]"]=.5,["Medium Pet Treat [XP Boost]"]=2}H.GetTypeFromItemName=
function(G)if string.find(G,"Passive Boost")then
 
return"PASSIVE_BOOST"
elseif string.find(G,"XP Boost")then
 
return"PET_XP_BOOST"end
 
return nil end
 W.IsPrivateServer=
function()if game.PrivateServerId==""then
 
return false 
else
 
return true end
 end
 Z.recent_bloom_fall_notfi=false Z.max_pet_inventory_space=false Z.target_max_inventory=false Z.JungleSeedStage1={["Evo Beetroot I"]=false,["Evo Blueberry I"]=false,["Evo Pumpkin I"]=false,["Evo Mushroom I"]=false}Z.FallEvent_Pet_Shop_ItemList={["Fall Egg"]=false;Chipmunk=false;Marmot=false,["Red Squirrel"]=false;["Space Squirrel"]=false,["Sugar Glider"]=false;Mallard=false;["Red Panda"]=false;Salmon=false,Woodpecker=false}Z.FallEvent_Seeds_Shop_ItemList={["Carnival Pumpkin"]=false;["Golden Peach"]=false,Kniphofia=false,["Maple Resin"]=false;["Meyer Lemon"]=false,Parsley=false,Turnip=false,["Fall Seed Pack"]=false}Z.FallEvent_Cosmetic_Shop_ItemList={["Fall Crate"]=false;["Fall Fountain"]=false,["Fall Leaf Chair"]=false;["Flying Kite"]=false;["Maple Flag"]=false,["Fall Hay Bale"]=false,["Fall Wreath"]=false;["Maple Crate"]=false,["Pile Of Leaves"]=false}Z.FallEvent_Gear_Shop_ItemList={Bonfire=false;["Firefly Jar"]=false;["Golden Acorn"]=false;["Harvest Basket"]=false;["Leaf Blower"]=false;["Maple Leaf Charm"]=false,["Maple Leaf Kite"]=false;["Maple Sprinkler"]=false;["Maple Syrup"]=false,["Sky Lantern"]=false;["Acorn Bell"]=false,["Acorn Lollipop"]=false,Rake=false,["Super Leaf Blower"]=false}W.JsonPrint=
function(G)if V.HttpService then
 
warn(V.HttpService:JSONEncode(G))end
 end
 W.log=
function(G)if G then
 
print(G)
else
 
warn("(log) error passed val nil")end
 end
 Z.webhook_category={mut="mut";agebreak="agebreak"}Z.All_Variants={}Z.LoadVariants=
function()for G,V in pairs(V.VariantsEnums)do
 Z.All_Variants[G]=true end
 end
 Z.LoadVariants()W.canReroll=
function(G,V)
local y,Z=
pcall(
function()
local y={K=1000.0,M=1000000.0;B=1000000000.0;T=1000000000000.0,Q=1e+015,QA=1e+018,SX=1e+021;SP=1e+024,O=1e+027,N=1e+030}
local 
function Z(G)
local V,Z=G:match("([%d%.]+)(%a*)")V=tonumber(V)if not V then
 
return 0 end
 if Z~=""and y[Z]then
 
return V*y[Z]end
 
return V end
 
local j=Z(G)
local i=Z(V)
return j<=i end
)if y then
 
return Z 
else
 
return false end
 end
 Z.GetMinsToSecs=
function(G)
local V=tonumber(G)or 0 
return V*60 end
 W.formatShecklesNumber=
function(G)G=tonumber(G)if not G then
 
return"0"end
 
local V={"K";"M","B","T";"Qa";"Qi";"Sx";"Sp","Oc","No";"Dc"}
local y=math.abs(G)if y<1000 then
 
return string.format("%.2f",G)end
 
local Z=math.log10(y)
local j=math.floor(Z/3)if j>#V then
 
return string.format("%.2e",G)end
 
local i=10^((j*3))
local c=G/i 
return string.format("%.2f%s",c,V[j])end
 W.GetProgressLeft=
function(G)if not G or type(G)~="string"then
 
return 0,0,0 end
 
local V,y=string.match(G,"(%d+)/(%d+)")if not V or not y then
 
return 0,0,0 end
 V=tonumber(V)y=tonumber(y)if y==0 then
 
return V,y,0 end
 
local Z=((V/y))*100 
return V,y,Z end
 W.Vector3ToCFrame=
function(G)if not G then
 
return nil end
 
return CFrame.new(G)end
 W.StringToVector3=
function(G)if not G then
 
return nil end
 
local V,y,Z=G:match("([^,]+),([^,]+),([^,]+)")if not V or not y or not Z then
 
return nil end
 
return Vector3.new(tonumber(V),tonumber(y),tonumber(Z))end
 W.StringToColor3=
function(G)
local V="#FFFF00"if type(G)~="string"then
 
return V end
 
local y,Z=
pcall(
function()
local V=0 for y=1,#G,1 do
 
local Z=string.byte(G,y)V=((V*31+Z))%16777216 end
 
local y=math.floor(V/65536)%256 
local Z=math.floor(V/256)%256 
local j=V%256 
local i=110 y=math.max(y,i)Z=math.max(Z,i)j=math.max(j,i)
return string.format("#%02X%02X%02X",y,Z,j)end
)
return y and Z or V end
 W.StringToColor3Light=
function(G)
local V="#FFFF00"if type(G)~="string"then
 
return V end
 
local y,Z=
pcall(
function()
local V=5381 for y=1,#G,1 do
 
local Z=string.byte(G,y)V=(((V*33)+Z))%4294967296 end
 
local y=.6180339887499 
local Z=((V*y))%1 
local j=.85 
local i=.65 
local 
function c(G,V,y)if y<0 then
 y=y+1 end
 if y>1 then
 y=y-1 end
 if y<.16666666666667 then
 
return G+(((V-G))*6)*y end
 if y<.5 then
 
return V end
 if y<.66666666666667 then
 
return G+(((V-G))*((.66666666666667-y)))*6 end
 
return G end
 
local J,T,d 
local u=i<.5 and i*((1+j))or(i+j)-i*j 
local q=2*i-u J=c(q,u,Z+.33333333333333)T=c(q,u,Z)d=c(q,u,Z-.33333333333333)
return string.format("#%02x%02x%02x",math.floor(J*255),math.floor(T*255),math.floor(d*255))end
)
return y and Z or V end
 W.AllPetPassiveData={}W.PetDataAll={}W.GetAllPetDataPassives=
function()for G,V in pairs(V.PetList)do
 
local y=V.Passives or{}W.AllPetPassiveData[G]=y W.PetDataAll[G]=V end
 end
 W.GetAllPetDataPassives()W.GetPetPassivesTable=
function(G)
return W.AllPetPassiveData[G]end
 W.GetPetDataInfo=
function(G)
return W.PetDataAll[G]end
 W.AllEggNamesList={}W.PetToEggNames={}W.FakeEgg={}W.EggNameToPet={}W.PassiveBio={}W.CompilePassiveBio=
function(G,V,y)if not V or not V.Description then
 
return"No description available."end
 
local 
function Z(G,V)
local y=10^((V or 2))
return math.floor(G*y+.5)/y end
 
local 
function j(G)if not G then
 
return"0:00"end
 
local V=math.abs(G)
local y=math.floor(V/60)
local Z=math.floor(V%60)
local j=G<0 and"-"or""
return string.format("%s%d:%02d",j,y,Z)end
 
local 
function i(G,V)if not G then
 
return"nil"end
 if V=="ColonTime"then
 
return j(G)
elseif V=="Percentage"then
 
return Z(G*100,1).."%"
elseif V=="NoPrecision"then
 
return math.floor(G)
else
 
return Z(G,2)end
 end
 
local c=V.Description 
local J=V.States or{}
local T=y or 1 
local d=c:gsub("<([%w_]+)>",
function(G)
local V=J[G]if not V then
 
return"<"..(G..">")end
 
local y=((V.Base or 0))+(((V.Scale or 0))*T)if V.Scale and(V.Scale>0 and V.Max)then
 y=math.min(y,V.Max)end
 if V.Scale and(V.Scale<0 and V.Min)then
 y=math.max(y,V.Min)end
 
local Z=i(y,V.Formatter)if V.Formatter=="Percentage"then
 
return string.sub(Z,1,-2)end
 
return Z end
)
local u={}
local q={}for G in pairs(J)do
 table.insert(q,G)end
 table.sort(q)for G,V in ipairs(q)do
 
local y=J[V]
local Z={}if y.Base then
 table.insert(Z,"Base: "..i(y.Base,y.Formatter))end
 if y.Scale and y.Scale~=0 then
 table.insert(Z,"Scale: "..i(y.Scale,y.Formatter))end
 if y.Min then
 table.insert(Z,"Min: "..i(y.Min,y.Formatter))end
 if y.Max then
 table.insert(Z,"Max: "..i(y.Max,y.Formatter))end
 if#Z>0 then
 table.insert(u,string.format("<b>%s</b>: [%s]",V,table.concat(Z," | ")))end
 end
 
local g=string.format("<b><font size=\'16\'>%s</font></b>\n%s",G,d)if#u>0 then
 
local G=table.concat(u,"\n")g=g..("\n\n<font color=\'#AAAAAA\' size=\'14\'>-- Technical Stats --\n"..(G.."</font>"))end
 
return g end
 W.GetPassivePetData=
function()for G,V in pairs(V.PetRegistry.PassiveRegistry)do
 
local y=W.CompilePassiveBio(G,V,1)W.PassiveBio[G]=y end
 end
 W.GetPassivePetData()W.GetAllEggNames=
function()for G,V in pairs(V.PetRegistry.PetEggs)do
 table.insert(W.AllEggNamesList,G)
local y=V.RarityData if y then
 
local V=y.Items if G=="Fake Egg"then
 if V then
 for V,y in pairs(V)do
 W.FakeEgg[V]=G end
 end
 continue end
 if V then
 
local y={}for V,Z in pairs(V)do
 W.PetToEggNames[V]=G 
local j=Z.ItemOdd or 0 
local i=W.GetPetDataInfo(V)
local c=""if i then
 c=i.Icon end
 
local J={petname=V,odds=j;icon=c}table.insert(y,J)end
 W.EggNameToPet[G]=y end
 end
 end
 
return W.AllEggNamesList end
 W.GetAllEggNames()W.GetEggNameUsingPetName=
function(G)if W.PetToEggNames[G]then
 
return W.PetToEggNames[G]end
 if W.FakeEgg[G]then
 
return W.FakeEgg[G]end
 
return"Unknown"end
 W.GetAllPetsUsingEggNameUi=
function(G)
return W.EggNameToPet[G]end
 W.GetPassiveInfo=
function(G)
local V=""
local y=W.GetPetPassivesTable(G)if not y then
 
return""end
 
local Z="\n"for G,V in ipairs(y)do
 
local y=W.PassiveBio[V]Z=""..(Z..(y.."\n\n"))end
 
return Z end
 Z.CopyEggDataString=
function(G)
local V=W.GetAllPetsUsingEggNameUi(G)if not V or#V==0 then
 
return 
print("No data to copy for "..G)end
 
local y="[\""..(G.."\"] = {")
local Z={}
local j={}for G,V in ipairs(V)do
 table.insert(Z,"[\""..(V.petname.."\"] = true"))
local y=V.icon or""
local i=string.match(y,"%d+")or"0"table.insert(j,V.petname..(", "..i))end
 y=y..("\n "..(table.concat(Z,", ").."\n},"))
local i=string.lower(G)i=i:gsub("[^%w%s]","")i=i:gsub("%s+","_")y=y..("\n\n"..(i..("\n"..table.concat(j,"\n"))))if setclipboard then
 setclipboard(y);(game:GetService("StarterGui")):SetCore("SendNotification",{Title="Data Copied!",Text="Formatted data for "..(G.." copied."),Duration=3})
else
 
print(y)end
 end
 Z.GetEggDetails=
function(G)
local V=W.GetAllPetsUsingEggNameUi(G)if not V or#V==0 then
 
return"No data for this egg."end
 
local 
function y(G,V)
return"<font color=\""..(V..("\">"..(G.."</font>")))end
 
local Z={}
local j="\240\159\165\154 "..string.upper(G)table.insert(Z,"<b>"..(y(j,"#FFD700").."</b>"))table.insert(Z,y("----------------","#444444"))for G,V in ipairs(V)do
 
local j=V.odds 
local i=V.petname 
local c=string.format("%s %s%%",i,j)table.insert(Z,y("\226\128\162 "..c,"#FFFFFF"))end
 
return table.concat(Z,"\n")end
 W.CopyToClipBoard=
function(G)setclipboard(G);(game:GetService("StarterGui")):SetCore("SendNotification",{Title="Text";Text=" Copied to clipboard!";Duration=2})end
 Z.GetPetDetails=
function(G)
local V=W.GetPetDataInfo(G)
local y=W.GetEggNameUsingPetName(G)if not V then
 
return"<font color=\'#FF5555\'>\226\157\140 Pet not found: "..(tostring(G).."</font>")end
 
local Z="#FFD700"
local j="#B4B4B4"
local i="#FFFFFF"
local c="#55FF55"
local J="#55AAFF"
local 
function T(G)
return((((tostring(G)):reverse()):gsub("%d%d%d","%1,")):reverse()):gsub("^,","")end
 
local 
function d(G,V)
return"<font color=\""..(V..("\">"..(G.."</font>")))end
 
local u={}table.insert(u,"<b>"..(d("\240\159\144\190 "..string.upper(G),Z).."</b>"))table.insert(u,d("----------------","#444444"))if y then
 table.insert(u,d("\226\128\162 Found in: ",j)..d(y,J))end
 if V.Rarity then
 
local G=i if V.Rarity=="Mythical"then
 G="#FF55FF"end
 if V.Rarity=="Legendary"then
 G="#FFAA00"end
 table.insert(u,d("\226\128\162 Rarity: ",j)..d(V.Rarity,G))end
 if V.Description and V.Description~=""then
 table.insert(u,d("\226\128\162 Desc: ",j)..d(V.Description,i))end
 if V.Passives and(type(V.Passives)=="table"and#V.Passives>0)then
 
local G=table.concat(V.Passives,", ")table.insert(u,d("\226\128\162 Passives: ",j)..d(G,i))end
 if V.SellPrice then
 
local G="$"..T(V.SellPrice)table.insert(u,d("\226\128\162 Sell Price: ",j)..d(G,c))end
 if V.MovementSpeed then
 table.insert(u,d("\226\128\162 Speed: ",j)..d(V.MovementSpeed,i))end
 if V.DefaultHunger then
 table.insert(u,d("\226\128\162 Max Hunger: ",j)..d(V.DefaultHunger,i))end
 table.insert(u,W.GetPassiveInfo(G))
return table.concat(u,"\n")end
 Z.AscensionFruitName=nil Z.AscensionFruitMutations={}Z.PlantsCategoryData={}Z.garden_coins=0 Z.honey_coins=0 Z.sleep_ascend=3 Z.is_garden_full_seed=false Z.found_pet_data={}Z.found_crate_data={}Z.big_pets_hatch_models={}Z.hatch_history_list={}Z.pets_sold_count=0 Z.pets_fav_count=0 Z.found_pets_to_sell_count=0 Z.has_koi_repaint=false Z.has_seal_sold_happen=false Z.is_forced_stop=false Z.is_max_eggs_reached=false 
local M 
local A 
local x 
local C=nil Z.tracked_bonus_egg_recovery=0 Z.tracked_bonus_egg_sell_refund=0 Z.shops_can_function=false 
local D={}Z.HatchingWebhookData={}if not Z.player_userid then
 
warn("Invalid player detected.")
return end
 W.formatDuration=
function(G)if not G then
 
return 0 end
 
local V=86400 
local y=3600 
local Z=60 G=tonumber(G)or 0 
local j=math.floor(G/V)
local i=G%V 
local c=math.floor(i/y)i=i%y 
local J=math.floor(i/Z)
local T=math.floor(i%Z)if j>0 then
 
return string.format("%dd:%dh:%dm:%ds",j,c,J,T)
elseif c>0 then
 
return string.format("%dh:%dm:%ds",c,J,T)
elseif J>0 then
 
return string.format("%dm:%ds",J,T)
else
 
return string.format("%ds",T)end
 end
 Z.PlayerSecrets={EggRecoveryChance=0,PetSellEggRefundChance=0;PetEggHatchAgeBonus=0,PetEggHatchSizeBonus=0,PetPassiveBonus=0;SessionTime=0,SellSilverFruitRewardChance=0;Grow_Amount=0}Z.egg_counts={}for G,V in ipairs(W.AllEggNamesList)do
 Z.egg_counts[V]={current_amount=0;new_amount=0}end
 
local P={}Z.all_seed_pack_names={}Z.seed_stock_list_array={}Z.seed_stock_list_key={}Z.seed_stock_price_map={}Z.seed_stock_dailyprice_map={}Z.gear_stock_list_array={}Z.gear_stock_list_key={}Z.gear_stock_price_map={}Z.egg_stock_list_array={}Z.egg_stock_list_key={}Z.egg_stock_price_map={}E.cache_objects={}E.FindObjectInWorkSpace=
function(G,y,Z)
local j=string.lower(G)if E.cache_objects[j]then
 
return E.cache_objects[j]end
 for G,V in ipairs(V.Workspace:GetDescendants())do
 if string.lower(V.Name)==j and V:IsA(y)then
 if Z then
 E.cache_objects[j]=V end
 
return V end
 end
 
return nil end
 t.GetDataDailySeeds=
function()if not V.DailySeedShopData then
 
return end
 for G,V in pairs(V.DailySeedShopData)do
 Z.seed_stock_dailyprice_map[G]={price=V.Price or 0,currency=V.SpecialCurrencyType or"Sheckles"}end
 end
 Z.GetDailySeedPrice=
function(G)
local V=Z.seed_stock_dailyprice_map[G]if V then
 
return V.price,V.currency end
 
return nil,nil end
 t.GetDataSeedShop=
function()if not V.SeedShopData then
 
return end
 for G,V in pairs(V.SeedShopData)do
 table.insert(Z.seed_stock_list_array,G)Z.seed_stock_list_key[G]=true Z.seed_stock_price_map[G]={price=V.Price or 0;currency=V.SpecialCurrencyType or"Sheckles"}end
 end
 Z.GetLowestSeedPrice=
function()
local G=math.huge for V,y in pairs(Z.seed_stock_price_map)do
 if y.price and y.price<G then
 G=y.price end
 end
 if G==math.huge then
 
return 0 end
 
return G end
 Z.GetSeedPrice=
function(G)
local V=Z.seed_stock_price_map[G]if V then
 
return V.price,V.currency end
 
return nil,nil end
 t.GetDataGearShop=
function()if not V.GearShopData then
 
return end
 if not V.GearShopData.Gear then
 
return end
 for G,V in pairs(V.GearShopData.Gear)do
 table.insert(Z.gear_stock_list_array,G)Z.gear_stock_list_key[G]=true Z.gear_stock_price_map[G]={price=V.Price or 0;currency=V.SpecialCurrencyType or"Sheckles"}end
 end
 Z.GetGearPrice=
function(G)
local V=Z.gear_stock_price_map[G]if V then
 
return V.price,V.currency end
 
return nil,nil end
 t.GetDataEggShop=
function()if not V.PetEggData then
 
return end
 for G,V in pairs(V.PetEggData)do
 table.insert(Z.egg_stock_list_array,G)Z.egg_stock_list_key[G]=true Z.egg_stock_price_map[G]={price=V.Price or 0;currency=V.SpecialCurrencyType or"Sheckles"}end
 end
 Z.GetLowestEggPrice=
function()
local G=math.huge for V,y in pairs(Z.egg_stock_price_map)do
 if y.price and y.price<G then
 G=y.price end
 end
 if G==math.huge then
 
return 10 end
 
return G end
 Z.GetEggPrice=
function(G)
local V=Z.egg_stock_price_map[G]if V then
 
return V.price,V.currency end
 
return nil,nil end
 t.GetDataDailySeeds()t.GetDataSeedShop()t.GetDataGearShop()t.GetDataEggShop()t.GetAllSeedPackNames=
function()
local G={}for V,y in pairs(V.SeedPackData.Packs)do
 if y.DisplayName then
 table.insert(G,y.DisplayName)end
 end
 
return G end
 Z.all_seed_pack_names=t.GetAllSeedPackNames()W.CloneArray=
function(G)
local V={}for G,y in ipairs(G)do
 V[G]=y end
 
return V end
 Z.SeedRarity={}
local 
function O()
local G={}for V,y in pairs(V.SeedData)do
 if y.SeedName then
 
local j=y.SeedName 
local i=y.SeedRarity if V=="Easter Chocolate Coconut"and j=="Chocolate Coconut"then
 j=V end
 j=j:gsub("%s+Seed$","")Z.SeedRarity[j]=i table.insert(G,j)end
 end
 for G,V in ipairs(G)do
 P[V]=false end
 end
 O()
local 
function F(G)
local V={}for G,y in pairs(G)do
 table.insert(V,G)end
 table.sort(V,
function(G,V)
return G:lower()<V:lower()end
)
return V end
 Z.TeleportLocations={GetLocationSellShopV3=
function()
local G=Vector3.new(0,0,0)
local V="Sell Stands"
local y="Model"
local Z=E.FindObjectInWorkSpace(V,y)if not Z then
 
return G end
 
local j=Z:FindFirstChild("Shop Stand")if not j then
 
return G end
 
local i=((j.CFrame*CFrame.new(0,0,3))).Position 
return i end
}
local 
function v(G)
local y=V.LocalPlayer 
local 
function Z(V)
local y=V:FindFirstChild("HumanoidRootPart")if y then
 y.CFrame=G end
 end
 if y.Character then
 Z(y.Character)end
 y.CharacterAdded:Connect(
function(G)G:WaitForChild("HumanoidRootPart")Z(G)end
)end
 Z.IsPaused=
function()
return T.pause_systems end
 
local 
function k(G,y)if not V.PetUtilities then
 
return G end
 
local Z=V.PetUtilities:CalculateWeight(G or 1,y or 1)
return Z end
 W.getEggAmounts=
function(G)
local V=Z.egg_counts[G]if V then
 
return V.current_amount,V.new_amount end
 
return 0,0 end
 W.UpdatePlayerStats=
function()if not V.LocalPlayer then
 
return end
 for G,y in pairs(Z.PlayerSecrets)do
 
local j=V.LocalPlayer:GetAttribute(G)if j~=nil then
 Z.PlayerSecrets[G]=j 
else
 Z.PlayerSecrets[G]=0 end
 end
 end
 W.GetAllPets=
function()
local G={}for V,y in pairs(T.sell_pets)do
 for V,y in pairs(y)do
 if y then
 G[V]=false end
 end
 end
 
return G end
 t.Clicker={ClickButton=
function(G)if not G then
 
return false end
 
pcall(
function()
local V=getconnections(G.Activated)if#V>0 then
 for G,V in pairs(V)do
 V:Fire()end
 end
 
local y=getconnections(G.MouseButton1Down)if#y>0 then
 for G,V in pairs(y)do
 V:Fire()end
 end
 end
)end
}t.ProximityPrompt={ActivateProximityPrompt=
function(G)if not G or not G:IsA("ProximityPrompt")then
 
return end
 
local V=G.HoldDuration 
local y=G.MaxActivationDistance G.HoldDuration=0 G.MaxActivationDistance=10000 fireproximityprompt(G)G.HoldDuration=V G.MaxActivationDistance=y end
,FindProximityPrompt=
function(G,V)
local y=V or"ProximityPrompt"for G,V in ipairs(G:GetDescendants())do
 if V.Name==y and V:IsA("ProximityPrompt")then
 
return V end
 end
 
return nil end
}
local p t.Teleport={isAtLocation=
function(G,y)
local Z,j=
pcall(
function()
local Z=V.LocalPlayer 
local j=Z.Character 
local i=y or 30 if not j then
 
return false end
 
local c=j:FindFirstChild("HumanoidRootPart")if not c then
 
return false end
 
local J=((c.Position-G.Position)).Magnitude 
return J<=i end
)if Z then
 
return j 
else
 
warn("Error isAtLocation ",j)end
 end
;isAtLocationIgnoreY=
function(G,V)
local y,Z=
pcall(
function()
local G=(game:GetService("Players")).LocalPlayer if not G or not G.Character then
 
return false end
 
local y=G.Character:FindFirstChild("HumanoidRootPart")if not y then
 
return false end
 
local Z=nil if typeof(target)=="CFrame"then
 Z=target.Position 
elseif typeof(target)=="Vector3"then
 Z=target 
elseif typeof(target)=="Instance"then
 if target:IsA("Model")then
 Z=(target:GetPivot()).Position 
elseif target:IsA("BasePart")then
 Z=target.Position end
 end
 if not Z then
 
warn("isAtLocationIgnoreY: Invalid target passed! Pass a CFrame, Vector3, Model, or Part.")
return false end
 
local j=Vector3.new(y.Position.X,0,y.Position.Z)
local i=Vector3.new(Z.X,0,Z.Z)
local c=((j-i)).Magnitude 
local J=V or 20 
return c<=J end
)if y then
 
return Z 
else
 
warn("Error in isAtLocation check:",Z)
return false end
 end
,GetCurrentPosition=
function()
local G=V.LocalPlayer 
local y=G.Character if not y then
 
return nil end
 
local Z=y:FindFirstChild("HumanoidRootPart")if Z then
 
return Z.CFrame end
 if y.PrimaryPart then
 
return y.PrimaryPart.CFrame end
 
local j=y:FindFirstChildWhichIsA("BasePart")if j then
 
return j.CFrame end
 
return nil end
;TeleportToCFrame=
function(G,y)
local Z,j=
pcall(
function()
local Z=V.LocalPlayer if not Z then
 error("LocalPlayer is nil")end
 if y then
 G=G+Vector3.new(0,10,0)end
 
local 
function j(V)
local y=V:FindFirstChild("HumanoidRootPart")if not y then
 error("HumanoidRootPart not found")end
 y.CFrame=G end
 if Z.Character then
 j(Z.Character)end
 Z.CharacterAdded:Connect(
function(G)G:WaitForChild("HumanoidRootPart")j(G)end
)end
)if not Z then
 
warn("[TeleportToCFrame ERROR]",j)end
 end
;TeleportTo=
function(G,y)if not G then
 
warn("Teleport: invalid model")
return end
 
local Z=V.LocalPlayer 
local j if G:IsA("Model")then
 j=G:GetPivot()
else
 j=G.CFrame end
 
local i=j if y then
 i=i+Vector3.new(0,10,0)end
 
local 
function c(G)
local V=G:FindFirstChild("HumanoidRootPart")if V then
 V.CFrame=i end
 end
 if Z.Character then
 c(Z.Character)end
 if p then
 p:Disconnect()end
 p=Z.CharacterAdded:Connect(
function(G)G:WaitForChild("HumanoidRootPart")c(G)end
)end
}W.HudUIModify=
function()
pcall(
function()
local G=(game:GetService("Players")).LocalPlayer if not G then
 
return end
 
local V=G:FindFirstChild("PlayerGui")if not V then
 
return end
 
local y=V:FindFirstChild("Version_UI")if y then
 
local G=y:FindFirstChild("Version")if G and G:IsA("TextLabel")or G:IsA("TextButton")then
 G.TextXAlignment=Enum.TextXAlignment.Right end
 end
 
local Z=V:FindFirstChild("Hud_UI")if Z then
 
local G=Z:FindFirstChild("SideBtns")if G then
 
local V=G:FindFirstChildOfClass("UIScale")if V then
 V.Scale=.85 end
 end
 end
 end
)end
 W.ShopTeleportButtons=
function()
local G=V.LocalPlayer.PlayerGui.Teleport_UI.Frame if not G then
 
return end
 
local y=G:FindFirstChildOfClass("UIAspectRatioConstraint")if y then
 y.AspectRatio=9 end
 
local Z={Easter_Garden=true,Easter_Seeds=true;Easter_Sell=true}for G,V in ipairs(G:GetChildren())do
 if V:IsA("GuiButton")then
 if Z[V.Name]then
 V.Visible=false continue end
 V.Visible=true end
 end
 end
 W.ShopTeleportButtons()W.HudUIModify()if _G.EggDataStreamListener then
 _G.EggDataStreamListener:Disconnect()end
 if _G.EggEspUiRunning then
 _G.EggEspUiRunning=false 
task.wait()end
 _G.EggEspUiRunning=true if _G.GearShopLoopRunning then
 _G.GearShopLoopRunning=false _G.SeedShopLoopRunning=false _G.EggShopLoopRunning=false _G.MerchantShopLoopRunning=false 
task.wait(.1)end
 _G.GearShopLoopRunning=true _G.SeedShopLoopRunning=true _G.EggShopLoopRunning=true _G.MerchantShopLoopRunning=true K.AllTravelingMerchantData={}q.GetCandyCornCount=
function()
local G,y=
pcall(
function()
return V.PlayerGui.CandyCornCurrency_UI.Frame.TextLabel1.val.Value end
)
return tonumber(G and y)or 0 end
 
local 
function U()
local G,y=
pcall(
function()
return V.PlayerGui.GardenCoinCurrency_UI.Frame.TextLabel1.val.Value end
)Z.garden_coins=tonumber(G and y)or 0 end
 
local 
function Q()
local G,y=
pcall(
function()
return V.PlayerGui.Honey_UI.Frame.TextLabel1.val.Value end
)Z.honey_coins=tonumber(G and y)or 0 end
 K.TravelingMerchantBuy=
function()
local G,y=
pcall(
function()
return V.PlayerGui.TravelingMerchantShop_UI.Frame.Frame.ShopTitle.ContentText end
)if not G or type(y)~="string"then
 
return end
 for G,Z in pairs(K.AllTravelingMerchantData)do
 
local j=Z.Title if string.find(string.lower(y),string.lower(j))then
 
local y=Z.Chance 
local j=T.merchant_shop_data[G]or{}for G,y in pairs(j)do
 V.BuyTravelingMerchantShopStock:FireServer(G)end
 end
 end
 end
 if not K.task_buy_merc then
 K.task_buy_merc=
task.spawn(
function()while true do
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(2)
pcall(
function()K.TravelingMerchantBuy()end
)
task.wait(20)end
 end
)end
 
local o={}Z.AllFruitMutations={}
local 
function I(G)
local V={}for G,y in pairs(G)do
 table.insert(V,G)end
 
return V end
 Z.GetAllPlantsWithCategory=
function()Z.PlantsCategoryData=V.PlantTraitsData.Traits end
 Z.GetAllPlantsWithCategory()Z.GetPlantsUsingTrait=
function(G)
local V={}if not Z.PlantsCategoryData then
 
return V end
 
local y=Z.PlantsCategoryData[G]if not y then
 
return V end
 for G,y in ipairs(y)do
 V[y]=true end
 
return V end
 Z.GetAllMutations=
function()
local G=require(game.ReplicatedStorage.Modules.MutationHandler)
local V=G.GetMutations()for G,V in pairs(V)do
 o[G]=false Z.AllFruitMutations[G]=true end
 end
 Z.GetAllMutations()h.save_fname="a_acssave_v15.json"h.save_fname_other="a_acssave_v15_other.json"h.save_s_data="p_sessioondf.json"if not isfile(h.save_fname)then
 
local G="exotichub99"if not isfolder(G)then
 makefolder(G)end
 h.save_fname=G..("/"..(Z.player_userid.."file1.json"))h.save_fname_other=G..("/"..(Z.player_userid.."file2.json"))h.save_s_data=G..("/"..(Z.player_userid.."filesession.json"))end
 Z.ConfigDeleter=
function()
local G={"a_acssave_v15.json";"a_acssave_v15_other.json","p_sessioondf.json"}for G,V in ipairs(G)do
 if isfile(V)then
 delfile(V)end
 end
 
local V="exotichub99"if isfolder(V)then
 
local G=tostring(Z.player_userid)
local y={V..("/"..(G.."file1.json"));V..("/"..(G.."file2.json"));V..("/"..(G.."filesession.json"))}for G,V in ipairs(y)do
 if isfile(V)then
 delfile(V)end
 end
 end
 end
 h.SaveSessionSettings={SaveFile=
function()if Z.mark_save_disabled then
 
return end
 
local G,y=
pcall(
function()
local G=V.HttpService:JSONEncode(J)writefile(h.save_s_data,G)end
)if not G then
 
warn("\226\157\140 Failed to save settings: "..tostring(y))
return false end
 
return true end
;LoadFile=
function()if not isfile(h.save_s_data)then
 
return end
 
local G=readfile(h.save_s_data)if not G or G==""then
 end
 
local y,Z=
pcall(V.HttpService.JSONDecode,V.HttpService,G)if not y then
 
return end
 
local 
function j(G,V)for V,y in pairs(V)do
 
local Z=G[V]if type(y)=="table"and type(Z)=="table"then
 j(Z,y)
else
 G[V]=y end
 end
 
return G end
 j(J,Z)end
}h.SaveSessionSettings.LoadFile()h.SyncSaveData=
function()if Z.mark_save_disabled then
 
return end
 
local G,y=
pcall(
function()
return V.HttpService:JSONEncode(T)end
)if G then
 writefile(h.save_fname,y)
else
 end
 end
 
local 
function R(G)if G then
 h.SyncSaveData()
return end
 Z.RequireDataSync_Save=true end
 h.SyncSaveDataOther=
function()if Z.mark_save_disabled then
 
return end
 
local G,y=
pcall(
function()
return V.HttpService:JSONEncode(c)end
)if G then
 writefile(h.save_fname_other,y)
else
 end
 end
 
local 
function n(G)if G then
 h.SyncSaveDataOther()
return end
 Z.RequireDataSync_SaveOther=true end
 
local 
function w()if not isfile(h.save_fname_other)then
 
return end
 
local G=readfile(h.save_fname_other)if not G or G==""then
 
return end
 
local y,Z=
pcall(V.HttpService.JSONDecode,V.HttpService,G)if not y then
 
return end
 
local 
function j(G,V)for V,y in pairs(V)do
 
local Z=G[V]if type(y)=="table"and type(Z)=="table"then
 j(Z,y)
else
 G[V]=y end
 end
 
return G end
 j(c,Z)end
 
local 
function GJ()if not isfile(h.save_fname)then
 
return end
 
local G=readfile(h.save_fname)if not G or G==""then
 
return end
 
local y,Z=
pcall(V.HttpService.JSONDecode,V.HttpService,G)if not y then
 
return end
 
local 
function j(G,V)for V,y in pairs(V)do
 
local Z=G[V]if type(y)=="table"and type(Z)=="table"then
 j(Z,y)
else
 G[V]=y end
 end
 
return G end
 j(T,Z)end
 GJ()w()
task.wait(.1)
print("Loading complete.")Z.shops_can_function=true if T.is_first_time then
 T.is_first_time=false R(true)n(true)
task.wait(.1)GJ()w()end
 if T.sell_pets and T.sell_pets["Premium Christmas Egg"]then
 
print("Found data for Premium Christmas Egg")T.sell_pets["Premium Christmas Egg"]=nil R(true)
print("removed data")
task.wait(3)end
 if tostring(game.PlaceId)=="129954712878723"then
 if Z.GetCheckIfPro()and Z.AllTradeWorld()then
 
print("Sending to trade world.");(loadstring(game:HttpGet("https://exotichub.app/6ba7b811-9dad-11d1-80b4-00c04fd430c8.lua")))()
return 
else
 
warn("Not allowed to access.")
return end
 end
 Z.rare_pets={["Empress Bee"]=true;["Rainbow Elemental Bee"]=true,["Rainbow Nurse Bee"]=true;["Rainbow Bumblebee"]=true,["Rainbow Empress Bee"]=true,["Rainbow Gardener Bee"]=true,Peryton=true,["Gilded Choc Jerboa"]=true,["Gilded Choc Spring Bee"]=true,["Gilded Choc Peryton"]=true;["Gilded Choc Nyala"]=true;["Marshmallow Lamb"]=true;["Easter Bunny"]=true,["Gilded Choc Easter Egg Chick"]=true;["Gilded Choc Marshmallow Lamb"]=true;["Gilded Choc Easter Bunny"]=true,["Gilded Choc Chocolate Bunny"]=true,Birb=true,["Rainbow Brown Owl"]=true;["Rainbow Black Bird"]=true,["Rainbow Birb"]=true;["Rainbow Cuckoo"]=true;["Rainbow Gold Finch"]=true,["Carnival Elephant"]=true,["Rainbow Show Pony"]=true;["Rainbow Performer Seal"]=true;["Rainbow Bear on Bike"]=true,["Rainbow Unicycle Monkey"]=true,["Rainbow Carnival Elephant"]=true,["New Year\'s Dragon"]=true;["Rainbow New Year\'s Bird"]=true;["Rainbow Firework Sprite"]=true,["Rainbow Celebration Puppy"]=true;["Rainbow New Year\'s Chimp"]=true,["Rainbow Star Wolf"]=true,["Rainbow New Year\'s Dragon"]=true;["Frost Squirrel"]=true;Wendigo=true,["Festive Partridge"]=true,["Festive Santa Bear"]=true,["Festive Moose"]=true,["Festive Frost Squirrel"]=true,["Festive Wendigo"]=true,["Ice Golem"]=true,Yeti=true,["Festive Turtle Dove"]=true;["Festive Reindeer"]=true,["Festive Nutcracker"]=true;["Festive Yeti"]=true;["Festive Ice Golem"]=true;["Diamond Panther"]=true,["Ruby Squid"]=true;Elephant=true,["Headless Horseman"]=true,Tiger=true;Swan=true;["T-Rex"]=true,Brontosaurus=true;Spinosaurus=true,Kitsune=true;["Mimic Octopus"]=true;["Red Fox"]=true;["French Fry Ferret"]=true;["Fennec Fox"]=true;Dragonfly=true;Raccoon=true;["Queen Bee"]=true,["Golden Goose"]=true;Butterfly=true,["Disco Bee"]=true,Cockatrice=true,Ankylosaurus=true}
local 
function VJ(G)
local y=V.Character:FindFirstChildOfClass("Humanoid")if not y then
 
return false end
 
local Z,j=
pcall(
function()y:EquipTool(G)end
)if not Z then
 
warn("\226\157\140 Failed to equip tool:",j)
return false end
 
task.wait(.2)
return true end
 
local 
function yJ()
local G=V.Character:FindFirstChildOfClass("Humanoid")if not G then
 
return end
 G:UnequipTools()end
 if W.task_data_sync then
 task.cancel(W.task_data_sync)W.task_data_sync=nil end
 W.task_data_sync=
task.spawn(
function()while true do
 
task.wait(1)if Z.RequireDataSync_Save then
 Z.RequireDataSync_Save=false h.SyncSaveData()end
 if Z.RequireDataSync_SaveOther then
 Z.RequireDataSync_SaveOther=false h.SyncSaveDataOther()end
 end
 end
)q.HalloweenShopData={}q.Halloween={GetShopItems=
function()
local G={}for V,y in pairs(V.EventShopData)do
 G[V]={}for y,Z in pairs(y)do
 table.insert(G[V],y)end
 table.sort(G[V])end
 
return G end
,BuyItems=
function()
local G=V.GameEvents.BuyEventShopStock for V,y in pairs(T.halloween.shops)do
 for y,Z in pairs(y)do
 for Z=1,3,1 do
 G:FireServer(y,V)
task.wait(.1)end
 end
 end
 end
}q.HalloweenShopData=q.Halloween.GetShopItems()s.GetAllPetData=
function()for G,V in pairs(V.PetList)do
 table.insert(Z.all_pets_names_list,G)Z.all_pets_data_list[G]={hunger=tonumber(V.DefaultHunger),rarity=V.Rarity}end
 end
 s.GetAllPetData()s.GetPetDataUsingName=
function(G)if not G then
 
return nil end
 
return Z.all_pets_data_list[G]end
 Z.BringBackStuff=
function()
local G,y 
pcall(
function()
local G=V.ReplicatedStorage.Modules.UpdateService.AdventPlatformOld if G then
 G.Parent=V.Workspace end
 
local y=V.ReplicatedStorage.Modules.UpdateService.LumberjackPlatformOld if y then
 y.Parent=V.Workspace end
 end
)if not G then
 
warn("bringback ",y)end
 end
 N.AllReceipeData={}N.BenchModels={}N.FindAllBenchModels=
function()for G,V in ipairs(V.Workspace:GetDescendants())do
 
local y=V:GetAttribute("CraftingObjectType")if y and N.AllReceipeData[y]then
 if V:IsA("Model")then
 N.BenchModels[y]=V end
 end
 end
 end
 N.GetWorkBenchModelUsingName=
function(G)if not N.BenchModels[G]then
 N.FindAllBenchModels()
return N.BenchModels[G]end
 
return N.BenchModels[G]end
 N.GetRecipeUsingBenchName=
function(G)if N.AllReceipeData[G]then
 
return{}end
 
local V=N.AllReceipeData[G]
local y={}for G,V in pairs(V)do
 
local Z=V.inputs 
local j=V.name y[j]=true end
 
return y end
 N.LoadCraftData=
function()
local G,y=
pcall(
function()
local G=V.CraftingData_CraftingRecipeRegistry.RecipiesSortedByMachineType for G,V in pairs(G)do
 
local y={}for G,V in pairs(V)do
 
local Z={}for G,V in ipairs(V.Inputs)do
 
local y={Name=V.ItemData.ItemName;Type=V.ItemType}table.insert(Z,y)end
 
local j={inputs=Z}y[G]=j end
 N.AllReceipeData[G]=y end
 end
)if not G then
 
warn("Error GearEventWorkbench: ",y)end
 end
 N.LoadCraftData()
task.wait(.2)N.FindAllBenchModels()N.LoadCraftData_GearEventWorkbench=
function()
local G,y=
pcall(
function()
local G=V.CraftingData_CraftingRecipeRegistry.RecipiesSortedByMachineType 
local y=G.GearEventWorkbench for G,V in pairs(y)do
 
local y={}for G,V in ipairs(V.Inputs)do
 
local Z={Name=V.ItemData.ItemName,Type=V.ItemType}table.insert(y,Z)end
 Z.craft_data_GearEventWorkbench[G]={Inputs=y}end
 end
)if not G then
 
warn("Error GearEventWorkbench: ",y)end
 end
 N.LoadCraftData_GearEventWorkbench()N.GetCraftItemsGearEventWorkbench=
function()
local G={}if not Z.craft_data_GearEventWorkbench then
 
return G end
 for V,y in pairs(Z.craft_data_GearEventWorkbench)do
 G[V]=true end
 
return G end
 
local ZJ={}for G,V in pairs(T.sell_pets)do
 for V,y in pairs(V)do
 ZJ[V]=G end
 end
 
local 
function jJ(G)if G==nil or(type(G)=="string"and G:match("^%s*$"))then
 
return nil end
 
local V=tonumber(G)if not V then
 
return nil end
 if V%1~=0 then
 
return nil end
 
return V end
 
local 
function iJ(G)if G==nil or(type(G)=="string"and G:match("^%s*$"))then
 
return nil end
 
local V=tonumber(G)if not V then
 
return nil end
 
return V end
 
local 
function cJ(G)if G==nil or(type(G)=="string"and G:match("^%s*$"))then
 
return nil end
 
local V=tonumber(G)if not V then
 
return nil end
 
return tonumber(string.format("%.2f",V))end
 
local 
function JJ(G)if not G then
 
return false end
 for V,y in pairs(T.sell_pets)do
 if y[G]~=nil then
 
return true end
 end
 
return false end
 
local 
function TJ(G)
return ZJ[G]or"Unknown Egg"end
 W.ShortName=
function(G,V)V=V or 5 if#G>V then
 
return G:sub(1,V).."..."
else
 
return G end
 end
 W.ShortNameNoDots=
function(G,V)V=V or 3 if#G>V then
 
return G:sub(1,V)
else
 
return G end
 end
 W.CountTable=
function(G)
local V=0 for G in pairs(G)do
 V=V+1 end
 
return V end
 
local dJ={}
local uJ=false 
local qJ=0 
local gJ=0 
local EJ=0 
local aJ=0 
local HJ={}Z.hatched_pets={}
local rJ=false 
local YJ=false 
local eJ=false 
local sJ=false Z.otherfarms={}E.findMyFarm=
function()
local G=nil for y,j in ipairs((V.Workspace:WaitForChild("Farm")):GetChildren())do
 
local i=j:FindFirstChild("Important")and(j.Important:FindFirstChild("Data")and j.Important.Data:FindFirstChild("Owner"))if i and(i:IsA("StringValue")and i.Value==V.LocalPlayer.Name)then
 G=j 
else
 table.insert(Z.otherfarms,j)end
 end
 
return G end
 E.mFarm=E.findMyFarm()if not E.mFarm then
 
warn("Farm not found")
return end
 E.important=E.mFarm:FindFirstChild("Important")E.mObjects_Physical=E.important and E.important:FindFirstChild("Objects_Physical")E.Cosmetic_Physical=E.important and E.important:FindFirstChild("Cosmetic_Physical")E.Plants_Physical=(E.mFarm:FindFirstChild("Important")):WaitForChild("Plants_Physical")if not E.Plants_Physical then
 
return 
warn("Could not start script: Plants_Physical folder not found.")end
 
task.wait(.3)if not E.mObjects_Physical then
 
warn("Not found mObjects_Physical")
return end
 E.Get_Plants_Physical_Objects=
function()
local G={}if not E.Plants_Physical then
 
return G end
 for V,y in ipairs(E.Plants_Physical:GetChildren())do
 table.insert(G,y)end
 
local V=Z.alt_Plants_Physical[Z.player_userid]if V then
 for V,y in ipairs(V:GetChildren())do
 table.insert(G,y)end
 end
 
return G end
 t.GetPlayerEggRecovery=
function()
return V.LocalPlayer:GetAttribute("EggRecoveryChance")or 0 end
 t.GetPlayerPetSellEggRefundChance=
function()
return V.LocalPlayer:GetAttribute("PetSellEggRefundChance")or 0 end
 t.PlayerData={GetSealChance=
function()
local G=V.LocalPlayer:GetAttribute("PetSellEggRefundChance")or 0 
return tonumber(G)end
,GetKoiChance=
function()
local G=V.LocalPlayer:GetAttribute("EggRecoveryChance")or 0 
return tonumber(G)end
,GetBrontoChance=
function()
local G=V.LocalPlayer:GetAttribute("PetEggHatchSizeBonus")or 0 
return tonumber(G)end
,GetUnfairTradeWarning=
function()
local G=V.LocalPlayer:GetAttribute("UnfairTradeWarning")or nil if not G then
 
return false end
 if G and G==true then
 
return true end
 
return false end
}W.UserDevice={IsMobile=
function()
return V.UserInputService.TouchEnabled end
;IsPC=
function()
return V.UserInputService.KeyboardEnabled and(V.UserInputService.MouseEnabled and not V.UserInputService.TouchEnabled)end
,IsConsole=
function()
return V.UserInputService.GamepadEnabled and not V.UserInputService.KeyboardEnabled end
;Get=
function()if V.UserInputService.TouchEnabled then
 
return"Mobile"end
 if V.UserInputService.GamepadEnabled and not V.UserInputService.KeyboardEnabled then
 
return"Console"end
 
return"PC"end
;Raw=
function()
return{Touch=V.UserInputService.TouchEnabled,Keyboard=V.UserInputService.KeyboardEnabled;Mouse=V.UserInputService.MouseEnabled;Gamepad=V.UserInputService.GamepadEnabled}end
}
print("Platform : ",W.UserDevice.Get())E.IsFarmFullyLoaded=
function()if V.LocalPlayer:GetAttribute("FarmFullyLoaded")then
 
return true end
 
return false end
 E.IsDataFullyLoaded=
function()if V.LocalPlayer:GetAttribute("DataFullyLoaded")then
 
return true end
 
return false end
 
local NJ={UpdateSetLblStats=
function(G)if j.lbl_stats then
 j.lbl_stats:SetText(G)end
 Z.TEXT_HATCH_SYSTEM=G end
,UpdateReclaimStatus=
function(G)if j.lbl_reclaimer_stats then
 j.lbl_reclaimer_stats:SetText(G)end
 end
;UpdateEnhancerPro=
function(G)if j.lbl_enhancerpro1 then
 j.lbl_enhancerpro1:SetText(G)end
 Z.TEXT_ENHANCE_PRO=G end
}E.GetPetsUUIDFromUI=
function()
local G={}
pcall(
function()
local y=V.PlayerGui.ActivePetUI.Frame.Main.PetDisplay.ScrollingFrame if not y then
 
return end
 for V,y in ipairs(y:GetChildren())do
 if y:IsA("Frame")and y.Name~="PetTemplate"then
 
local V=y.Name if V then
 table.insert(G,V)end
 end
 end
 end
)
return G end
 E.GetActivePetsUUIDS=
function()
local G={}if not V.petsContainer then
 
return G end
 
local y={}
local Z=V.LocalPlayer.Name for V,y in ipairs(V.petsContainer:GetChildren())do
 if y:IsA("Part")and y:GetAttribute("OWNER")==Z then
 if not y:FindFirstChildWhichIsA("Model")then
 continue end
 
local V=y:GetAttribute("UUID")if V then
 G[V]=true end
 end
 end
 
local j=E.GetPetsUUIDFromUI()for V,y in ipairs(j)do
 G[y]=true end
 for G,V in pairs(G)do
 table.insert(y,G)end
 
return y end
 E.GetActivePetsParts=
function()
local G={}if not V.petsContainer then
 
return G end
 for y,Z in ipairs(V.petsContainer:GetChildren())do
 if Z:IsA("Part")and Z:GetAttribute("OWNER")==V.LocalPlayer.Name then
 if not Z:FindFirstChildWhichIsA("Model")then
 continue end
 table.insert(G,Z)end
 end
 
return G end
 E.GetActivePetsPetMoverObject=
function(G)if not V.petsContainer then
 
return nil end
 for y,Z in ipairs(V.petsContainer:GetChildren())do
 if Z:IsA("Part")and Z:GetAttribute("OWNER")==V.LocalPlayer.Name then
 if not Z:FindFirstChildWhichIsA("Model")then
 continue end
 
local V=Z:GetAttribute("UUID")if V and V==G then
 
return Z end
 end
 end
 
return nil end
 E.GetSprinklerOnFarm=
function(G)
local V,y=
pcall(
function()
local V=E.mObjects_Physical:GetChildren()for V,y in ipairs(V)do
 
local Z=y:GetAttribute("OBJECT_TYPE")
local j=y:GetAttribute("OBJECT_UUID")
local i=y:GetAttribute("READY")if Z and j then
 if Z==G then
 
return y end
 end
 end
 
return nil end
)if V then
 
return y 
else
 
warn("[FarmManager] GetSprinklerOnFarm failed:",y)
return nil end
 end
 E.GetObjectCountByName=
function(G)
local V,y=
pcall(
function()
local V=E.mObjects_Physical:GetChildren()
local y=0 for Z=1,#V,1 do
 if V[Z].Name==G then
 y=y+1 end
 end
 
return y end
)if V then
 
return y 
else
 
warn("[FarmManager] GetObjectCountByName failed:",y)
return 0 end
 end
 E.GetNameCountByName=
function(G)
local V,y=
pcall(
function()
local V=E.Get_Plants_Physical_Objects()
local y=0 for Z=1,#V,1 do
 if V[Z].Name==G then
 y=y+1 end
 end
 
return y end
)if V then
 
return y 
else
 
warn("[FarmManager] GetObjectCountByName failed:",y)
return 0 end
 end
 E.GetSinglePlantsObjectUsingName=
function(G)
local V=nil 
local y,Z=
pcall(
function()
local y=E.Get_Plants_Physical_Objects()for V,y in ipairs(y)do
 if y.Name==G then
 
return y end
 end
 
return V end
)if y then
 
return Z 
else
 
return V end
 end
 E.GetAllPlantsInFarmAsKeyVal=
function()
local G={}
local V,y=
pcall(
function()for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if y:IsA("Model")then
 G[y.Name]=true end
 end
 end
)
return G end
 E.GetAllPlantsObjectUsingName=
function(G)
local V={}
local y,Z=
pcall(
function()
local y=E.Get_Plants_Physical_Objects()for y,Z in ipairs(y)do
 if Z.Name~=G then
 continue end
 
local j={}
local i=Z:FindFirstChild("Fruits")if i and#i:GetChildren()>0 then
 for G,V in ipairs(i:GetChildren())do
 table.insert(j,V)end
 
else
 table.insert(j,Z)end
 
local c=true for G,V in ipairs(j)do
 if u.IsFavoriteFruitOnFarm(V)then
 c=false break end
 end
 if c then
 table.insert(V,Z)end
 end
 
return V end
)if y then
 
return Z 
else
 
return V end
 end
 E.GetPlantCountBySeed=
function(G)
local V=0 
local y,Z=
pcall(
function()
local y=E.Get_Plants_Physical_Objects()for y,Z in ipairs(y)do
 if Z.Name==G then
 V=V+1 end
 end
 
return V end
)if y then
 
return Z 
else
 
warn("Failed to count plants:",Z)
return V end
 end
 E.GetPlantCountBySeedAndWeightMutations=
function(G,V)
local y=0 
local Z,j=
pcall(
function()
local Z=E.Get_Plants_Physical_Objects()for Z,j in ipairs(Z)do
 if j.Name==G then
 
local G,Z,i,c=u.GetFruitMutationsVariantAndWeight(j)if G then
 if Z>=V then
 y=y+1 end
 end
 end
 end
 
return y end
)if Z then
 
return j 
else
 
warn("Failed to count plants:",j)
return y end
 end
 E.GetPlantCountBySeedNamesPairs=
function(G)
local V={}
local y={}for G,Z in pairs(G)do
 V[G]=true y[G]=0 end
 
local Z,j=
pcall(
function()
local G=E.Get_Plants_Physical_Objects()for G,Z in ipairs(G)do
 if not V[Z.Name]then
 continue end
 y[Z.Name]=y[Z.Name]+1 end
 
return y end
)if Z then
 
return j 
else
 
warn(" failed:",j)
return y end
 end
 E.GetPlantCountByNameArrayTable=
function(G)
local V={}
local y={}for G,Z in ipairs(G)do
 if not Z.Name then
 continue end
 V[Z.Name]=true y[Z.Name]=0 end
 
local Z,j=
pcall(
function()
local G=E.Get_Plants_Physical_Objects()for G,Z in ipairs(G)do
 if not V[Z.Name]then
 continue end
 y[Z.Name]=y[Z.Name]+1 end
 
return y end
)if Z then
 
return j 
else
 
warn(" failed:",j)
return y end
 end
 K.LoadMerchantData=
function()
local G={}for V,y in pairs(V.TravelingMerchantData)do
 
local Z={}
local j=y.ShopData 
local i=y.AppearanceChance 
local c=y.ShopName 
local J=y.Title for G,V in pairs(j)do
 table.insert(Z,G)end
 
local T={ShopItems=Z;Chance=i,Title=J}G[V]=T end
 
return G end
 K.AllTravelingMerchantData=K.LoadMerchantData()W.GetPetDataUsingUUID=
function(G,V)
local y=V.Data[G]
return y end
 W.cache_recent_pet_data={}
local 
function WJ(G)
local V,y=
pcall(
function()
local V 
local y=m.GetBigDataUsingKey("PetsData")if y and y.PetInventory.Data[G]then
 V=y.PetInventory.Data[G]
else
 end
 if not V then
 
return nil end
 
local Z=V.UUID 
local j=V.PetData 
local i=j.HatchedFrom 
local c=j.IsFavorite 
local J=j.Boosts 
local T=j.Name 
local d=j.LevelProgress 
local u=j.EggName 
local q=j.Level 
local g=j.Hunger 
local E=j.BaseWeight 
local a=V.PetType 
local H=V.PetAbility 
return V end
)if V then
 
return y end
 
warn("Error",y)
return nil end
 Y.is_running=false Y.AllMutationsList={}Y.AllMutationListEnum={}Y.MaxLevelReachedWantedPets_webhook={}Y.AgeBreakWebHook={}Y.ResetPetSavedUUID=
function()c.mut_pet_inside_mutation=""n()end
 Y.SavePetUUID=
function(G)
local V,y=
pcall(
function()c.mut_pet_inside_mutation=tostring(G or"")n()end
)if not V then
 
warn("\226\154\160\239\184\143 Failed to save pet UUID:",tostring(y))end
 end
 Y.GetUUID_PetInMachine=
function()
local G,V=
pcall(
function()
local G=c.mut_pet_inside_mutation if not G or G==""then
 
return""end
 if not WJ(G)then
 
return tostring(G)end
 Y.ResetPetSavedUUID()
return""end
)
return G and V or""end
 Y.GetAllMutationsNoneMachine_KeyPair=
function()
local G={}for V,y in pairs(V.PetMutationRegistry.PetMutationRegistry)do
 if not y.AvaliableFromMutationMachine then
 G[V]=false end
 end
 
return G end
 Y.GetAllMutationAsKeyPair=
function()for G,V in pairs(V.PetMutationRegistry.PetMutationRegistry)do
 if V.AvaliableFromMutationMachine then
 end
 Y.AllMutationsList[G]=false 
local y=V.EnumId Y.AllMutationListEnum[y]=G end
 
return Y.AllMutationsList end
 Y.GetAllMutationAsKeyPair()
local 
function XJ(G)
local V={}
local y=70 
local Z=50 
local j=14 
local i=60 
local c=1.5 
local J=y/2 
local T=Z/2 
local d=j/2 
local u=i/2 for y=G.X-J,G.X+J,c do
 for Z=G.Z-T,G.Z+T,c do
 if math.abs(y-G.X)>d or math.abs(Z-G.Z)>u then
 table.insert(V,Vector3.new(y,G.Y,Z))end
 end
 end
 
return V end
 
local 
function hJ(G)
local V={}
local y=70 
local Z=50 
local j=14 
local i=60 
local c=5 
local J=y/2 
local T=Z/2 
local d=j/2 
local u=i/2 for y=G.X-J,G.X+J,c do
 for Z=G.Z-T,G.Z+T,c do
 if math.abs(y-G.X)>d or math.abs(Z-G.Z)>u then
 table.insert(V,Vector3.new(y,G.Y,Z))end
 end
 end
 
return V end
 Z.DeleteOtherFarms=
function()if not T.remove_farms then
 
return end
 
pcall(
function()for G,y in ipairs(Z.otherfarms)do
 if y then
 y.Parent=V.ReplicatedStorageSharedFolder end
 end
 Z.otherfarms={}end
)end
 Z.DeleteOtherFarms()
local 
function lJ(G,V)
local y={}
local Z=4 
local j=Z*Z 
local i=55 
local c=14 
local J=3 
local T=i/2 
local d=c/2 
local 
function u(G)if not V then
 
return false end
 for V,y in ipairs(V)do
 
local Z=G.X-y.X 
local i=G.Z-y.Z if(Z*Z+i*i)<=j then
 
return true end
 end
 
return false end
 for V=-T,T,J do
 for Z=-T,T,J do
 if math.abs(V)>d then
 
local j=Vector3.new(G.X+V,G.Y,G.Z+Z)if not u(j)then
 table.insert(y,j)end
 end
 end
 end
 table.sort(y,
function(V,y)
local Z=((V-G)).X^2+((V-G)).Z^2 
local j=((y-G)).X^2+((y-G)).Z^2 
return Z<j end
)
return y end
 
local 
function BJ(G)if not G then
 
return nil end
 
local V=G:gsub("x%d+","")V=((V:gsub("%s+"," ")):gsub("^%s+","")):gsub("%s+$","")
return V end
 
local 
function LJ(G)if not G or#G==0 then
 
return end
 for G,y in ipairs(G)do
 if not y then
 continue end
 V.FavItem:FireServer(y)end
 end
 
local 
function mJ(G)if not G then
 
return end
 V.FavItem:FireServer(G)end
 W.FavItemCustom=
function(G,y)if not G then
 
return end
 
local Z=G:GetAttribute("d")if Z and y then
 
return end
 V.FavItem:FireServer(G)end
 W.IsSafeFruit=
function(G)if not G then
 
return false end
 if T.safe_fruits[G]then
 
return true end
 
return false end
 W.SafeFruitsProccess=
function()
local G=false for G,V in pairs(T.safe_fruits)do
 
local y=r.GetFruitUsingToolName(G)if y then
 W.FavItemCustom(y,G)end
 end
 if G then
 
task.wait(1.5)end
 end
 
function IsPreventAscensionFruitRequirement(G)if not G then
 
return false end
 if not Z.AscensionFruitName then
 
return false end
 if G.Name~=Z.AscensionFruitName then
 
return false end
 for V in pairs(Z.AscensionFruitMutations)do
 if not G:GetAttribute(V)then
 end
 end
 
return true end
 
function IsOverridePetWeight(G)if not G then
 
return false,false,0 end
 
local V=c.pet_override_weight[G]if not V then
 
warn("overrideData is false,false, 0 for "..G)
return false,false,0 end
 
local y=V.override 
local Z=tonumber(V.weight)
local j=V.is_big 
return y,j,Z end
 
local 
function KJ(G)
local V=G:match("%d+")
return tonumber(V)or 0 end
 
local 
function bJ()
local G,y=
pcall(
function()
local G=V.Character if not G or not G:IsA("Model")then
 
return false end
 
local y=G:FindFirstChildOfClass("Tool")if not y then
 
return false end
 
local Z=y:GetAttribute("b")if not Z then
 
return false end
 
local j=y:GetAttribute("f")if j then
 if Z=="d"then
 
return true end
 end
 
return false end
)if not G then
 
warn("[IsSprinklerHeld] 
pcall error:",y)
return false end
 
return y end
 
local 
function SJ()
local G,y=
pcall(
function()
local G=V.LocalPlayer.Character if not G or not G:IsA("Model")then
 
return false end
 
local y=G:FindFirstChildOfClass("Tool")if not y then
 
return false end
 
local Z=(y:GetAttribute("b")=="j")
local j=y:GetAttribute("f")if Z and j then
 
return true,j end
 
return false end
)if not G then
 
warn("[IsFruitToolHeld] 
pcall error:",y)
return false end
 
return y end
 r.GetHeldTool=
function()
local G=V.LocalPlayer.Character if not G or not G:IsA("Model")then
 
return nil end
 
local y=G:FindFirstChildOfClass("Tool")if not y then
 
return nil end
 
return y end
 r.IsToolHeldAny=
function()
local G,y=
pcall(
function()
local G=V and V.Character if not G or not G:IsA("Model")then
 
return false end
 
return G:FindFirstChildOfClass("Tool")~=nil end
)if not G then
 
warn("[IsToolHeldAny] Error:",y)
return false end
 
return y end
 
local 
function zJ(G)
local y,Z=
pcall(
function()if not G or typeof(G)~="Instance"then
 
warn("[IsToolHeld] Invalid tool passed:",G)
return false end
 
local y=V.Character if not y or not y:IsA("Model")then
 
return false end
 
local Z=G.Name if not Z or type(Z)~="string"then
 
return false end
 for V,y in ipairs(y:GetChildren())do
 if y:IsA("Tool")then
 if y==G then
 
return true end
 if string.find(y.Name,Z,1,true)then
 
return true end
 end
 end
 
return false end
)if not y then
 
warn("[IsToolHeld] 
pcall error:",Z)
return false end
 
return Z end
 
local 
function fJ(G)
local y=V.Character if not y or not G then
 
return false end
 for V,y in ipairs(y:GetChildren())do
 if y:IsA("Tool")then
 if string.find(y.Name,G.Name,1,true)then
 
return true end
 if y==G then
 
return true end
 end
 end
 
return false end
 Z.EquipTool=
function(G)
local y,Z=
pcall(
function()V.player_humanoid:EquipTool(G)
task.wait()end
)if not y then
 
warn("\226\157\140 Failed to equip tool fast:",Z)
return false end
 
return true end
 W.ContainsWords=
function(G,V)
local y={}for G in string.gmatch(V,"%S+")do
 table.insert(y,G)end
 for V,y in ipairs(y)do
 if not string.find(G,y,1,true)then
 
return false end
 end
 
return true end
 W.FormatTime=
function(G)if not G or type(G)~="number"then
 
return"0:00:00"end
 if G<0 then
 G=0 end
 G=math.floor(G+.5)
local V=math.floor(G/3600)
local y=math.floor(((G%3600))/60)
local Z=G%60 
return string.format("%d:%02d:%02d",V,y,Z)end
 W.UI={updateHomeStats=
function(G)if j.lbl_home_info then
 j.lbl_home_info:SetText(G)end
 end
}W.fmt_time=
function(G)
local V=math.floor(G/60)
local y=math.floor(G%60)
return string.format("%02d:%02d",V,y)end
 W.GetTime=
function()
return(DateTime.now()).UnixTimestampMillis/1000 end
 W.GetTimerData=
function(G)if not J.timerecording[G]then
 J.timerecording[G]={times={};startTime=0}end
 
return J.timerecording[G]end
 W.StartTimer=
function(G)
local V=W.GetTimerData(G)if V.startTime~=0 then
 
local y=W.GetTime()-V.startTime if y<.5 then
 
return end
 W.StopTimer(G)end
 V.startTime=W.GetTime()end
 W.StopTimer=
function(G,V)V=V or 4 
local y=W.GetTimerData(G)if y.startTime==0 then
 
return 0 end
 
local Z=W.GetTime()-y.startTime y.startTime=0 
local j=y.times table.insert(j,Z)while#j>V do
 table.remove(j,1)end
 h.SaveSessionSettings.SaveFile()
return Z end
 W.GetLiveTime=
function(G)
local V=W.GetTimerData(G)if not V or V.startTime==0 then
 
return 0 end
 
return W.GetTime()-V.startTime end
 W.GetAvgTime=
function(G)
local V=W.GetTimerData(G)if not V or#V.times==0 then
 
return 0 end
 
local y=V.times 
local Z=0 for G,V in ipairs(y)do
 Z=Z+V end
 
return Z/#y end
 W.GetPreviousTime=
function(G)
local V=W.GetTimerData(G)if not V or not V.times or#V.times==0 then
 
return 0 end
 
return V.times[#V.times]end
 W.GetTimerFormatted=
function(G)
local V=W.GetAvgTime(G)
local y=W.GetLiveTime(G)
local Z=W.GetPreviousTime(G)
local j=string.format("<font color=\'#00FF88\'>\226\143\177\239\184\143 %s</font> <font color=\'#FFDD55\'>(avg %s) (last %s)</font>",W.fmt_time(y),W.fmt_time(V),W.fmt_time(Z))
return j end
 L.CurrentSelectedProductId=""L.UI={UpdateDropDown=
function()if i.DropDownMarket then
 if next(L.Market.products)~=nil then
 i.DropDownMarket:SetValues(I(L.Market.products))
else
 end
 
else
 end
 end
}L.Products={}V.GiftController=require((game:GetService("ReplicatedStorage")).Modules.GiftController)L.Market={products={},UiMarketText=
function(G)if j.lbl_market_item_info then
 
local V=L.Products[G]if V then
 
local G=V.Name or"Unknown Product"
local y=V.PriceInRobux or 0 
local Z=V.ProductId or 0 
local i=string.format("<b><font color=\'#FDFF00\'>%s</font></b>\nPrice: <font color=\'#55FF55\'>%d Robux</font>\nProduct ID: <font color=\'#AAAAAA\'>%d</font>",G,y,Z)if V.Description and V.Description~=""then
 i=i..string.format("\n\n<i><font color=\'#CCCCCC\'>%s</font></i>",V.Description)end
 j.lbl_market_item_info:SetText(i)end
 end
 end
,BuySelected=
function()if L.CurrentSelectedProductId==0 or L.CurrentSelectedProductId==""then
 Z.Notify("Invalid id: "..L.CurrentSelectedProductId)
return end
 
local G=L.Market.products[L.CurrentSelectedProductId]if not G then
 Z.Notify("Select id not valid ")
return end
 
warn("Buy: "..tostring(G))Z.Notify("Buying.. Make sure to use right executors ")V.MarketplaceService:PromptProductPurchase(V.LocalPlayer,G)end
;GiftSelected=
function()if L.CurrentSelectedProductId==0 or L.CurrentSelectedProductId==""then
 Z.Notify("Invalid id: "..L.CurrentSelectedProductId)
return end
 
local G=L.Market.products[L.CurrentSelectedProductId]if not G then
 Z.Notify("Select id not valid ")
return end
 
warn("Gift: "..tostring(G))Z.Notify("Process via pop up. if not shown means this can\'t be sent as gift.")
local y=tonumber(G)or 0 V.GiftController:PromptGiftFromGiftId(y)V.GiftController:PromptGiftFromNormalId(y)end
;BuySelectedToken=
function()if L.CurrentSelectedProductId==0 or L.CurrentSelectedProductId==""then
 Z.Notify("Invalid id: "..L.CurrentSelectedProductId)
return end
 
local G=L.Market.products[L.CurrentSelectedProductId]if not G then
 Z.Notify("Select id not valid ")
return end
 
warn("Buy: "..tostring(G))Z.Notify("Buying.. check your inventory if you got anything.")
local y=tonumber(G)or 0 V.GameEvents.TradeEvents.TradeTokens.Purchase:InvokeServer(y)end
,LoadProducts=
function()L.Market.products={}
local G=V.MarketplaceService:GetDeveloperProductsAsync()while true do
 for G,V in ipairs(G:GetCurrentPage())do
 L.Market.products[V.Name]=V.ProductId W.JsonPrint(V)L.Products[V.Name]=V end
 if G.IsFinished then
 break end
 G:AdvanceToNextPageAsync()end
 Z.Notify("Products Loaded",2)L.UI.UpdateDropDown()end
}W.GetSealTeam=
function()
return T.team1 end
 W.GetKoiTeam=
function()
return T.team2 end
 W.GetBronoTeam=
function()
return T.team4 end
 W.GetEggReductionTeam=
function()
return T.team3 end
 W.GetDelaySealSell=
function()if not Z.GetCheckIfPro()then
 
return 0 end
 
return tonumber(T.delay_between_sell_seal)or 0 end
 W.GetDelayKoiSell=
function()if not Z.GetCheckIfPro()then
 
return 0 end
 
return tonumber(T.delay_between_hatch_koi)or 0 end
 r.SellPetsUsingTools=
function(G)yJ()
local y=W.GetDelaySealSell()for G,Z in ipairs(G)do
 V.SellPetShopSelected:FireServer(Z)if y>0 then
 
task.wait(y)end
 end
 
return true end
 r.GetFoodCategoryNames=
function()if not V or not V.FoodRecipeData or type(V.FoodRecipeData.Recipes)~="table"then
 
return{}end
 
local G={}for V,y in pairs(V.FoodRecipeData.Recipes)do
 table.insert(G,V)end
 
return G end
 r.IsFruitAndNotFav=
function(G)
local V,y=
pcall(
function()
return G and(G:IsA("Tool")and(G:GetAttribute("b")=="j"and not G:GetAttribute("d")))end
)
return V and y end
 r.IsFruit=
function(G)
local V,y=
pcall(
function()
return G and(G:IsA("Tool")and G:GetAttribute("b")=="j")end
)
return V and y end
 r.IsFavFruit=
function(G)
local V=G:GetAttribute("d")if V then
 
return true end
 
return false end
 r.GetFruitCount=
function()
local G=0 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(y)then
 G=G+1 end
 end
 
local y=V.LocalPlayer.Character:FindFirstChildOfClass("Tool")if y then
 if r.IsFruit(fruit)then
 G=G+1 end
 end
 
return G end
 r.GetFruitCountUsingNameFromData=
function(G)
local V=0 if not Z.InventoryDataBind or not G then
 
return V end
 for y,Z in pairs(Z.InventoryDataBind)do
 
local j=Z.ItemType if j~="Holdable"then
 continue end
 
local i=Z.ItemData if not i then
 continue end
 
local c=i.ItemName if c==G then
 V=V+1 end
 end
 
return V end
 r.SprayFruit=
function(G)V.SprayService_RE:FireServer("TrySpray",G)
task.wait(.1)end
 r.IsMutationSpray=
function(G)if not G or not G:IsA("Tool")then
 
return false end
 
local V=G:GetAttribute("l")
local y=G:GetAttribute("b")if not V or not y then
 
return false end
 if y~="s"then
 
return false end
 
return V=="Mutation Spray"end
 r.GetPetAnyBoostUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if y:GetAttribute("b")~="z"then
 continue end
 if W.ContainsWords(y.Name,G)then
 
return y end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 if V.Character then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y then
 if y:GetAttribute("b")~="z"then
 
return nil end
 if W.ContainsWords(y.Name,G)then
 
return y end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 end
 
return nil end
 r.IsPetFav=
function(G)
local V,y=
pcall(
function()if G:IsA("Tool")and G:GetAttribute("PetType")then
 
local V=G:GetAttribute("d")if V then
 
return true end
 end
 end
)if V then
 
return y 
else
 
return false end
 end
 r.GetIsFavPetUsingUUID=
function(G)
local y,Z=
pcall(
function()for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("PetType")then
 
local V=y:GetAttribute("PET_UUID")if V and V==G then
 
local G=y:GetAttribute("d")if G then
 
return true end
 end
 end
 end
 if V.Character then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y and(y:IsA("Tool")and y:GetAttribute("PetType"))then
 
local V=y:GetAttribute("PET_UUID")if V and V==G then
 
local G=y:GetAttribute("d")if G then
 
return true end
 end
 end
 end
 
return false end
)if y then
 
return Z 
else
 
return false end
 end
 r.GetPetUsingName=
function(G)
local y=
function(V)if V:IsA("Tool")and V:GetAttribute("PetType")then
 
local y=V:GetAttribute("PET_UUID")if y then
 
local V=WJ(y)if not V then
 
return nil end
 
local Z=V.PetData 
local j=Z.IsFavorite if j then
 
return nil end
 
local i=Z.Level 
local c=Z.BaseWeight 
local J=V.PetType if J==G then
 
return true end
 end
 
return nil end
 end
 
local Z,j=
pcall(
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if y(V)then
 
return V end
 end
 if V.Character then
 
local G=V.Character:FindFirstChildOfClass("Tool")if G then
 if y(G)then
 
return G end
 end
 end
 
return nil end
)if Z then
 
return j 
else
 
warn("Error in GetPetUsingName:",j)
return nil end
 end
 r.GetPetUsingNameForCraft=
function(G)
local y=
function(V)if V:IsA("Tool")and V:GetAttribute("PetType")then
 
local y=V:GetAttribute("PET_UUID")if y then
 
local V=WJ(y)if not V then
 
return nil end
 
local Z=V.PetData 
local j=Z.IsFavorite if j then
 
return nil end
 
local i=Z.Level 
local c=Z.BaseWeight 
local J=k(c,1)if J>3 then
 
return nil end
 if i>=100 then
 
return nil end
 
local T=V.PetType if T==G then
 
return true end
 end
 
return nil end
 end
 
local Z,j=
pcall(
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if y(V)then
 
return V end
 end
 if V.Character then
 
local G=V.Character:FindFirstChildOfClass("Tool")if G then
 if y(G)then
 
return G end
 end
 end
 
return nil end
)if Z then
 
return j 
else
 
warn("Error in GetPetUsingNameForCraft:",j)
return nil end
 end
 r.GetPetUsingUUID=
function(G)
local y,Z=
pcall(
function()for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("PetType")then
 
local V=y:GetAttribute("PET_UUID")if V and V==G then
 
return y end
 end
 end
 if V.Character then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y and(y:IsA("Tool")and y:GetAttribute("PetType"))then
 
local V=y:GetAttribute("PET_UUID")if V and V==G then
 
return y end
 end
 end
 
return nil end
)if y then
 
return Z 
else
 
warn("Error in GetPetUsingUUID:",Z)
return nil end
 end
 r.GetPetBoostUsingName=
function(G)
local y={PASSIVE_BOOST=true;PET_XP_BOOST=true,ABILITY_REFRESH=true}for V,Z in ipairs(V.Backpack:GetChildren())do
 if not Z:IsA("Tool")then
 continue end
 if Z:GetAttribute("b")~="z"then
 continue end
 
local j=Z:GetAttribute("q")if not y[j]then
 continue end
 if W.ContainsWords(Z.Name,G)then
 
return Z end
 if string.find(Z.Name,G,1,true)then
 
return Z end
 end
 
local Z=V.Character and V.Character:FindFirstChildOfClass("Tool")if Z then
 if Z:GetAttribute("b")~="z"then
 
return nil end
 
local V=Z:GetAttribute("q")if not y[V]then
 
return nil end
 if W.ContainsWords(Z.Name,G)then
 
return Z end
 if string.find(Z.Name,G,1,true)then
 
return Z end
 end
 
return nil end
 r.IsFood=
function(G)if not G then
 
return false end
 if not G:IsA("Tool")then
 
return false end
 if not G:GetAttribute("f")then
 
return false end
 
local V=G:GetAttribute("b")if V and V=="u"then
 
return true end
 
return false end
 r.GetCleansingPetShard=
function()
local G="Cleansing Pet Shard"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="A"then
 continue end
 
local j=y:GetAttribute("u")if not j then
 continue end
 if j==G then
 
return y end
 end
 
return nil end
 r.GetFoodRandomAny=
function()
local G=r.GetHeldTool()if r.IsFood(G)then
 
return G end
 for G,V in ipairs(V.Backpack:GetChildren())do
 if r.IsFood(V)then
 
return V end
 end
 
return nil end
 r.GetFoodUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="u"then
 continue end
 
local j=y:GetAttribute("f")if not j then
 continue end
 if j==G then
 
return y end
 end
 
return nil end
 r.UseAnyToolOnScreen=
function()
local G={true,CFrame.new(-106.47234344482,0,35.128082275391,-0.65522706508636,-0.2765785753727,.702980697155,-1.4901161193848e-008,.93056786060333,.36611974239349,-0.75543200969696,.23989154398441,-0.6097332239151)};(((game:GetService("Players")).LocalPlayer.Character:WaitForChild("InputGateway")):WaitForChild("Activation")):FireServer(unpack(G))end
 r.TryUseGear=
function(G)
pcall(
function()V.TryUseGear:FireServer(G)end
)end
 r.TryUseGearBoost=
function(G,y)
pcall(
function()V.TryUseGear:FireServer(G,y)end
)end
 r.TryUseSyrup=
function(G)
pcall(
function()V.TryMapleSyrup:FireServer(G)end
)end
 r.TryReclaim=
function(G)
pcall(
function()V.Reclaimer:FireServer("TryReclaim",G)end
)end
 r.CurrentToolEquipped=
function()
local G=V.Character and V.Character:FindFirstChildOfClass("Tool")
return G end
 r.OpenSeedPackFast=
function(G)if not G or type(G)~="string"then
 
return 
print("Invalid pack name")end
 
local y,Z=
pcall(
function()
local y=V.GameEvents.SeedPack if y and(y.Open and y.SpinFinished)then
 y.Open:FireServer(G)
task.wait(.1)y.SpinFinished:FireServer()end
 end
)if not y then
 
warn(" Failed to open SeedPack: "..tostring(Z))end
 end
 r.OpenSeedPack=
function(G)if not G or type(G)~="string"then
 
return 
warn("Invalid pack name")end
 
local y,Z=
pcall(
function()
local y=V.GameEvents.SeedPack if y and(y.Open and y.SpinFinished)then
 y.Open:FireServer(G)
task.wait(2)y.SpinFinished:FireServer()end
 end
)if not y then
 
warn(" Failed to open SeedPack: "..tostring(Z))end
 end
 r.GetSeedPackUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="a"then
 continue end
 
local j=y:GetAttribute("n")if not j then
 continue end
 if j==G then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 
local V=y:GetAttribute("b")if V and V~="a"then
 
return nil end
 
local Z=y:GetAttribute("n")if not Z then
 
return nil end
 if Z==G then
 
return y end
 end
 
return nil end
 r.UseWateringCan=
function(G)
local y=Vector3.new(G.X,0,G.Z)V.Water_RE:FireServer(y)end
 r.GetWateringCan=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if not y:GetAttribute("b")then
 continue end
 if y:GetAttribute("b")~="o"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 if not y:GetAttribute("b")then
 
return nil end
 if y:GetAttribute("b")~="o"then
 
return nil end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetTradingTicket=
function()
local G="Trading Ticket"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if not y:GetAttribute("b")then
 continue end
 if y:GetAttribute("b")~="v"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 if not y:GetAttribute("b")then
 
return nil end
 if y:GetAttribute("b")~="v"then
 
return nil end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetPetTeamData=
function(G)
local V={}for G,y in ipairs(G)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.PetData 
local i=Z.PetType or""
local c=j.EggName or""
local J=j.Level or 1 
local T=j.BaseWeight or 0 
local d=k(T,J)
local u=tonumber(string.format("%.2f",d))
local q=j.MutationType or""
local g=Y.AllMutationListEnum[q]or""
local E={petname=i;weight=u,mutation=g,level=J,eggname=TJ(i)}table.insert(V,E)end
 
return V end
 r.GetToolUsingName=
function(G)if G=="Watering Can"then
 
return r.GetWateringCan(G)end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if string.find(y.Name,G)then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 if string.find(y.Name,G)then
 
return y end
 end
 
return nil end
 r.GetToolUsingNameNormalised=
function(G)if not G then
 
return nil end
 if G=="Watering Can"then
 
return r.GetWateringCan(G)end
 
local y=(G:gsub("%s+","")):lower()for G,V in ipairs(V.Backpack:GetChildren())do
 if V:IsA("Tool")then
 
local G=(V.Name:gsub("%s+","")):lower()if string.find(G,y,1,true)then
 
return V end
 end
 end
 
local Z=V.Character and V.Character:FindFirstChildOfClass("Tool")if Z then
 
local G=(Z.Name:gsub("%s+","")):lower()if string.find(G,y,1,true)then
 
return Z end
 end
 
return nil end
 r.GetSeedCountQuantity=
function(G)if not G then
 
return 0 end
 
local V=G:GetAttribute("Quantity")if V then
 
return V end
 
return 0 end
 r.GetSeedUsingName=
function(G)
local y,Z=
pcall(
function()for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="n"then
 continue end
 
local j=y:GetAttribute("f")if not j then
 continue end
 
local i=y:GetAttribute("Seed")if(i and i==G)or(j and j==G)then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 
local V=y:GetAttribute("b")if not V or V=="n"then
 
local V=y:GetAttribute("f")
local Z=y:GetAttribute("Seed")if(Z and Z==G)or(V and V==G)then
 
return y end
 end
 end
 
return nil end
)if y then
 
return Z 
else
 
warn("Error in GetSeedUsingName:",Z)
return nil end
 end
 r.GetSeedCountUsingName=
function(G)
local V=r.GetSeedUsingName(G)if V then
 
local G=r.GetSeedCountQuantity(V)
return G end
 
return 0 end
 r.IsBackpackFull=
function()
return V.InventoryService:IsMaxInventory()end
 r.GetRandomFruitUsingFilters=
function(G)
local V=G.ignore_plants or{}
local y=G.mut or{}
local Z=false 
local j=false if next(V)~=nil then
 Z=true end
 if next(y)~=nil then
 j=true end
 
local i=r.GetAllFruitsInBackpack()
local c={}for G,i in ipairs(i)do
 
local J=i:GetAttribute("f")or"-"
local T=i:GetAttribute("d")if T then
 continue end
 if Z then
 if V[J]then
 continue end
 end
 if j then
 if not r.HasMutationFruit(y,i)then
 continue end
 end
 table.insert(c,i)end
 if#c==0 then
 
return nil end
 
return c[math.random(1,#c)]end
 r.GetFruitRandomOrHeld=
function()
local G=V.LocalPlayer.Character and V.LocalPlayer.Character:FindFirstChildOfClass("Tool")if G then
 if r.IsFruit(G)then
 
return G end
 end
 for G,V in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(V)then
 
return V end
 end
 
return nil end
 r.GetFruitUsingToolName=
function(G)
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 if r.IsFruit(y)then
 if y.Name==G then
 
return y end
 end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(y)then
 if y.Name==G then
 
return y end
 end
 end
 
return ls end
 r.GetTableFruitToolNames=
function()
local G={}
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 if r.IsFruit(y)then
 table.insert(G,y.Name)end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(y)then
 table.insert(G,y.Name)end
 end
 
return G end
 r.GetFruitRandom=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(V)then
 
return V end
 end
 
return nil end
 r.HasMutationFruit=
function(G,V)
local y=V:GetAttributes()or{}for G,V in pairs(G)do
 if y[G]then
 
return true end
 end
 
return false end
 r.GetFruitCountUsingMutation=
function(G)if not G or next(G)==nil then
 
return 0 end
 
local y=0 for V,Z in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(Z)and r.HasMutationFruit(G,Z)then
 y=y+1 end
 end
 
local Z=V.Character and V.Character:FindFirstChildOfClass("Tool")if Z and(r.IsFruit(Z)and r.HasMutationFruit(G,Z))then
 y=y+1 end
 
return y end
 r.GetFruitUsingMutation=
function(G)
local y=
function(V)for G,y in pairs(G)do
 if V:GetAttribute(G)then
 
return true end
 end
 
return false end
 for G,V in ipairs(V.Backpack:GetChildren())do
 if not V:IsA("Tool")then
 continue end
 if V:GetAttribute("d")then
 continue end
 if V:GetAttribute("b")~="j"then
 continue end
 
local Z=V:GetAttribute("f")if y(V)then
 
return V end
 end
 
return nil end
 r.GetFruitUsingNameWeightAndMutation=
function(G,y,Z)
local j=
function(G)if next(Z)==nil then
 
return true end
 for V,y in pairs(Z)do
 if G:GetAttribute(V)then
 
return true end
 end
 
return false end
 for V,Z in ipairs(V.Backpack:GetChildren())do
 if not Z:IsA("Tool")then
 continue end
 if Z:GetAttribute("d")then
 continue end
 if Z:GetAttribute("b")~="j"then
 continue end
 
local i=Z:GetAttribute("f")
local c=0 
local J=Z:FindFirstChild("Weight",true)if J then
 c=J.Value or 0 end
 if j(Z)and i==G then
 if c>=y then
 
return Z end
 end
 end
 
return nil end
 r.GetFruitUsingNameAndMutation=
function(G,y)
local Z=
function(G)if next(y)==nil then
 
return true end
 for V,y in pairs(y)do
 if G:GetAttribute(V)then
 
return true end
 end
 
return false end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if y:GetAttribute("d")then
 continue end
 if y:GetAttribute("b")~="j"then
 continue end
 
local j=y:GetAttribute("f")if Z(y)and j==G then
 
return y end
 end
 
return nil end
 r.GetFruitUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 if y:GetAttribute("d")then
 continue end
 if y:GetAttribute("b")~="j"then
 continue end
 
local Z=y:GetAttribute("f")if Z==G then
 
return y end
 end
 
return nil end
 r.GetFruitUsingUUID=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not r.IsFood(y)then
 continue end
 
local Z=y:GetAttribute("c")if Z==G then
 
return y end
 end
 
return nil end
 r.GetHoldableUsingName=
function(G)
local y=
function(V)if not V:IsA("Tool")then
 
return nil end
 
local y=V:GetAttribute("b")if y and y~="j"then
 
return nil end
 
local Z=V:GetAttribute("d")if Z then
 
return nil end
 
local j=V:GetAttribute("f")if not j then
 
return nil end
 if j==G then
 
return V end
 
return nil end
 for G,V in ipairs(V.Backpack:GetChildren())do
 
local Z=y(V)if not Z then
 continue end
 
return V end
 
local Z=V.Character and V.Character:FindFirstChildOfClass("Tool")if Z then
 
local G=y(Z)if G then
 
return Z end
 end
 
return nil end
 r.IsEggTool=
function(G)if not G or not G:IsA("Tool")then
 
return false end
 
local V=G:GetAttribute("b")
local y=G:GetAttribute("h")if V=="c"and y then
 
return true end
 
return false end
 r.GetEggToolCount=
function(G)if not G then
 
return 0 end
 
local V=G:GetAttribute("e")or 0 
return V end
 r.GetBeeEggAndCountUsingName=
function(G)if typeof(G)~="string"or G==""then
 
return nil,0 end
 
local 
function y(V)if not V or not V:IsA("Tool")then
 
return false end
 if tostring(V:GetAttribute("b")or"")~="P"then
 
return false end
 
local y=V:GetAttribute("B")if typeof(y)~="string"then
 
return false end
 
return string.find(y,G,1,true)~=nil end
 
local 
function Z(G)
local V=tonumber(G:GetAttribute("e"))if V and V>0 then
 
return V end
 
return 1 end
 
local j=r.GetHeldTool()if y(j)then
 
return j,Z(j)end
 if V.Backpack then
 for G,V in ipairs(V.Backpack:GetChildren())do
 if y(V)then
 
return V,Z(V)end
 end
 end
 
local i=V.LocalPlayer and V.LocalPlayer.Character if i then
 for G,V in ipairs(i:GetChildren())do
 if y(V)then
 
return V,Z(V)end
 end
 end
 
return nil,0 end
 r.GetEggCountUsingName=
function(G)if typeof(G)~="string"or G==""then
 
print("fail not a string")
return 0 end
 
local y=r.GetHeldTool()if y then
 
local V=y:GetAttribute("h")if V and string.find(V,G,1,true)then
 
return r.GetEggToolCount(y)end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsEggTool(y)then
 
local V=y:GetAttribute("h")if V and string.find(V,G,1,true)then
 
return r.GetEggToolCount(y)end
 end
 end
 
return 0 end
 r.GetEggUsingNameNew=
function(G)if typeof(G)~="string"or G==""then
 
return nil end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y and r.IsEggTool(y)then
 
local V=y:GetAttribute("h")or"-"if V==G then
 
return y end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsEggTool(y)then
 
local V=y:GetAttribute("h")or"-"if V==G then
 
return y end
 end
 end
 
return nil end
 r.GetEggUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="c"then
 continue end
 
local j=y:GetAttribute("h")if not j then
 continue end
 if j==G then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 
local V=y:GetAttribute("b")if V and V~="c"then
 
return nil end
 
local Z=y:GetAttribute("h")if not Z then
 
return nil end
 if Z==G then
 
return y end
 end
 
return nil end
 r.GetCosmeticCrateUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="r"then
 continue end
 
local j=y:GetAttribute("i")if not j then
 continue end
 if j==G then
 
return y end
 end
 
return nil end
 r.PlaceBonfire=
function(G)V.BonfireService:FireServer("Create",W.Vector3ToCFrame(G))end
 r.GetBonfire=
function()
local G="Bonfire"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("f")if not Z then
 continue end
 if Z==G then
 
return y end
 end
 
return nil end
 r.GetShovel=
function()
local G,y=
pcall(
function()
local G="Shovel [Destroy Plants]"
local y="SHOVEL"if V.Backpack then
 for V,Z in ipairs(V.Backpack:GetChildren())do
 if not Z:IsA("Tool")then
 continue end
 
local j=Z:GetAttribute("UUID")if j==y then
 
return Z end
 if string.find(Z.Name,G,1,true)then
 
return Z end
 end
 end
 
local Z=V.Character if Z and Z:IsA("Model")then
 for V,Z in ipairs(Z:GetChildren())do
 if not Z:IsA("Tool")then
 continue end
 
local j=Z:GetAttribute("UUID")if j==y then
 
return Z end
 if string.find(Z.Name,G,1,true)then
 
return Z end
 end
 end
 
return nil end
)if not G then
 
warn("[InventoryManager.GetShovel] Error:",y)
return nil end
 
return y end
 r.GetFavouriteTool=
function()
local G="Favorite Tool"
local 
function y(V)if not V:IsA("Tool")then
 
return false end
 if V:GetAttribute("b")~="h"then
 
return false end
 
return string.find(V.Name,G,1,true)~=nil end
 if V.Backpack then
 for G,V in ipairs(V.Backpack:GetChildren())do
 if y(V)then
 
return V end
 end
 end
 
local Z=V.Character if Z and Z:IsA("Model")then
 for G,V in ipairs(Z:GetChildren())do
 if y(V)then
 
return V end
 end
 end
 
return nil end
 r.GetLightningRod=
function()
local G="Lightning Rod"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="i"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetRecallWrench=
function()
local G="Recall Wrench"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="q"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetSmithHammerofHarvest=
function()
local G="Smith Hammer Harvest"
local y=
function(G,V)if not G:IsA("Tool")then
 
return false end
 if string.find(G.Name,V)then
 
return true end
 
return false end
 
local Z=r.CurrentToolEquipped()if Z then
 if y(item,G)then
 
return Z end
 end
 for V,Z in ipairs(V.Backpack:GetChildren())do
 if y(Z,G)then
 
return Z end
 end
 
return nil end
 r.GetHarvestTool=
function()
local G="Harvest Tool"for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="f"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetCleaningSpray=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not V:IsA("Tool")then
 continue end
 
local y=V:GetAttribute("b")if y and y~="s"then
 continue end
 
local Z=V:GetAttribute("l")if Z and Z=="Cleaning Spray"then
 
return V end
 end
 
return nil end
 r.GetSprayBottleUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="s"then
 continue end
 if string.find(y.Name,G,1,true)then
 
return y end
 end
 
return nil end
 r.GetSprinklerUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("b")if Z and Z~="d"then
 continue end
 
local j=y:GetAttribute("f")if j and j==G then
 
return y end
 end
 
return nil end
 W.IsTimeUp=
function(G,V)if not G or not V then
 
return true end
 
return(os.clock()-G)>=V end
 r.GetMutSprayChilled=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not r.IsMutationSpray(V)then
 continue end
 
local y=V:GetAttribute("m")if y and y=="Chilled"then
 
return V end
 end
 
return nil end
 r.GetMutSprayWindstruck=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not r.IsMutationSpray(V)then
 continue end
 
local y=V:GetAttribute("m")if y and y=="Windstruck"then
 
return V end
 end
 
return nil end
 r.ApplySpray=
function(G,V,y)if not G or not V then
 
return false end
 VJ(V)
task.wait(.1+y)r.SprayFruit(G)
task.wait(.2+y)yJ()
return true end
 r.PlaceSprinkler=
function(G)
local y,Z=
pcall(
function()V.SprinklerService:FireServer("Create",W.Vector3ToCFrame(G))end
)if not y then
 
warn("Failed to place Sprinkler "..tostring(Z))
return false end
 
return true end
 r.FavAllFruitsInBackpack=
function(G,y)if not y then
 yJ()end
 
local Z={}for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(y)then
 
local V=y:GetAttribute("d")if not((V and G))then
 table.insert(Z,y)end
 end
 end
 
local j=V.Character and V.Character:FindFirstChildOfClass("Tool")if j then
 if r.IsFruit(j)then
 
local V=j:GetAttribute("d")if not((V and G))then
 table.insert(Z,j)end
 end
 end
 if#Z>0 then
 LJ(Z)end
 if not y then
 
task.wait(.5)end
 end
 r.GetAllPetsUUIDS_Backpack=
function()
local G={}for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("PetType")then
 
local V=y:GetAttribute("PET_UUID")
local Z=y:GetAttribute("d")if V then
 table.insert(G,V)end
 end
 end
 if V.Character then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y and(y:IsA("Tool")and y:GetAttribute("PetType"))then
 
local V=y:GetAttribute("PET_UUID")
local Z=y:GetAttribute("d")if V then
 table.insert(G,V)end
 end
 end
 
local y=E.GetActivePetsUUIDS()for V,y in ipairs(y)do
 table.insert(G,y)end
 
return G end
 r.GetAllPetsInInventoryNoneFav=
function()
local G={}for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("PetType")then
 
local V=y:GetAttribute("PET_UUID")
local Z=y:GetAttribute("d")if V and not Z then
 table.insert(G,y)end
 end
 end
 if V.Character then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y and(y:IsA("Tool")and y:GetAttribute("PetType"))then
 
local V=y:GetAttribute("PET_UUID")
local Z=y:GetAttribute("d")if V and not Z then
 table.insert(G,y)end
 end
 end
 
return G end
 r.Gear={GetGearBoosts=
function()
local G={}for V,y in pairs(V.GearData)do
 if string.find(V,"Chew",1)then
 table.insert(G,V)end
 end
 
return G end
,GetAllGearData=
function()
local G={}for V,y in pairs(V.GearData)do
 table.insert(G,V)end
 
return G end
,GetAllGearItems=
function()
local G={}for V,y in pairs(V.GearData)do
 if string.find(V,"Lollipop",1)then
 table.insert(G,V)continue end
 if string.find(V,"Syrup",1)then
 table.insert(G,V)continue end
 if string.find(V,"Jelly",1)then
 table.insert(G,V)continue end
 end
 
return G end
;GetAllSprinklers=
function()
local G={}for V,y in pairs(V.GearData)do
 if string.find(V,"Sprinkler",1)then
 table.insert(G,V)end
 end
 
return G end
}E.GetTotalFarmPlantCount=
function()if not E.Plants_Physical then
 
warn("FarmManager.Plants_Physical is nil")
return 0 end
 
local G=#E.Get_Plants_Physical_Objects()Z.is_garden_full_seed=G>=800 
return G end
 Z.IsSingleHarvest=
function(G)if string.find(G,"Evo")then
 end
 
local V={["Aloe Vera"]=true;Artichoke=true;Bamboo=true,Bendboo=true;Boneboo=true;Buttercup=true,["Candy Sunflower"]=true,Carrot=true,["Chocolate Carrot"]=true;Crocus=true,Daffodil=true,Dandelion=true,Delphinium=true;Dezen=true,["Firework Flower"]=true;["Fissure Berry"]=true,["Golden Egg"]=true;Horsetail=true;Lavender=true;Mandrake=true,["Manuka Flower"]=true;Monoblooma=true;Mushroom=true;Nectarshade=true,Nightshade=true;Onion=true,["Orange Tulip"]=true;["Parasol Flower"]=true,["Peace Lily"]=true,["Pink Tulip"]=true;Pumpkin=true;Radish=true,Rafflesia=true;["Red Lollipop"]=true,["Spring Onion"]=true,Stonebite=true,["Taro Flower"]=true;Watermelon=true,["Wild Carrot"]=true;["Zen Rocks"]=true}if V[G]then
 
return true end
 
return false end
 Z.GetEfficientEventFruits=
function()
local G=Z.PlantsCategoryData if not G then
 
warn("PlantsCategoryData not loaded.")
return{}end
 
local V={Berry=true;Flower=true,Fruit=true;Leafy=true,Tropical=true,Vegetable=true;Woody=true;Prickly=true;Stalky=true}
local y={Common=5;Uncommon=4,Rare=3;Legendary=2;Mythical=1;Divine=1,Prismatic=1}
local j={}
local i={}for V,y in pairs(V)do
 
local i=G[V]if y and i then
 for G,V in ipairs(i)do
 if not Z.IsSingleHarvest(V)then
 
local G=Z.SeedRarity[V]if G then
 j[V]=((j[V]or 0))+1 end
 end
 end
 end
 end
 for G,V in pairs(j)do
 
local j=Z.SeedRarity[G]
local c=j and y[j]or 1 
local J=r.GetSeedCountUsingName(G)or 0 
local T=J*1.5 i[G]=T+(V*c)end
 
local c={}for V,y in pairs(V)do
 if y then
 
local y=G[V]c[V]={}if y then
 
local G={}for V,y in ipairs(y)do
 if not Z.IsSingleHarvest(y)then
 
local V=i[y]if V then
 
local Z=r.GetSeedCountUsingName(y)or 0 table.insert(G,{name=y;score=V,count=Z})end
 end
 end
 table.sort(G,
function(G,V)if G.count==V.count then
 
return G.score>V.score end
 
return G.count>V.count end
)for y=1,3,1 do
 
local Z=G[y]if not Z then
 break end
 table.insert(c[V],{seed=Z.name;count=Z.count})end
 end
 end
 end
 
return c end
 Z.GetSeedsToPlaceBalanced=
function(G,V)
local y={}
local Z=E.GetTotalFarmPlantCount()
local j=800 if V then
 if V<=1 then
 
return y end
 j=V end
 if j<=0 then
 
return y end
 
local i={}for G,V in pairs(G)do
 table.insert(i,G)end
 
local c=#i if c==0 then
 
return y end
 
local J=math.floor(j/c)
local T=j-(J*c)
local d={}for G,V in pairs(G)do
 for G,V in ipairs(V)do
 d[V.seed]=V.count end
 end
 for V,Z in ipairs(i)do
 
local j=G[Z]if j and#j>0 then
 
local G=J while G>0 do
 
local V=false for Z,j in ipairs(j)do
 
local i=j.seed 
local c=d[i]-((y[i]and y[i].placeamount or 0))if c>0 and G>0 then
 y[i]=y[i]or{placeamount=0}y[i].placeamount=y[i].placeamount+1 G=G-1 V=true end
 end
 if not V then
 break end
 end
 end
 end
 
local u=1 while T>0 do
 
local V=false for Z=1,c,1 do
 
local j=i[u]
local J=G[j]if J and#J>0 then
 for G,Z in ipairs(J)do
 
local j=Z.seed 
local i=d[j]-((y[j]and y[j].placeamount or 0))if i>0 then
 y[j]=y[j]or{placeamount=0}y[j].placeamount=y[j].placeamount+1 T=T-1 V=true break end
 end
 end
 u=u+1 if u>c then
 u=1 end
 if V or T==0 then
 break end
 end
 if not V then
 break end
 end
 
return y end
 Z.BuildEventSeedText=
function(G)
local 
function V(G,V)
return"<font color=\'"..(V..("\'>"..(G.."</font>")))end
 
local y={}
local Z="#43B581"
local j="#FEE75C"
local i="#99AAB5"for G,c in pairs(G)do
 table.insert(y,V("<b>"..(G.."</b>"),Z))if#c==0 then
 table.insert(y,V(" \226\128\162 No seeds available","#FF5555"))
else
 for G,Z in ipairs(c)do
 table.insert(y," \226\128\162 "..(V(Z.seed,j)..V(" (x"..(Z.count..")"),i)))end
 end
 table.insert(y,"")end
 
return table.concat(y,"\n")end
 W.compactStatusContainer=nil W.compactStatusLabel=nil W.updateCompactStatus=
function(G)
local y=20 
local Z=.35 
local j=18 
local i=14 
local c=1000 
local J=j 
local T=workspace.CurrentCamera if T then
 if T.ViewportSize.X<c then
 J=i end
 end
 if not W.compactStatusContainer or not W.compactStatusContainer.Parent then
 
local G=V.LocalPlayer if not G then
 
return end
 
local j=V.PlayerGui 
local i=j:FindFirstChild("CompactStatusGui")if not i then
 i=Instance.new("ScreenGui")i.Name="CompactStatusGui"i.ZIndexBehavior=Enum.ZIndexBehavior.Sibling i.ResetOnSpawn=false i.Parent=j i.DisplayOrder=0 end
 W.compactStatusContainer=i:FindFirstChild("CompactStatusContainer")if not W.compactStatusContainer then
 W.compactStatusContainer=Instance.new("Frame")W.compactStatusContainer.Name="CompactStatusContainer"W.compactStatusContainer.Parent=i W.compactStatusContainer.BackgroundTransparency=1 W.compactStatusContainer.AnchorPoint=Vector2.new(1,.5)W.compactStatusContainer.Position=UDim2.new(1,-y,.5,0)W.compactStatusContainer.Size=UDim2.new(Z,0,0,0)W.compactStatusContainer.AutomaticSize=Enum.AutomaticSize.Y end
 W.compactStatusLabel=W.compactStatusContainer:FindFirstChild("CompactStatusDisplay")if not W.compactStatusLabel then
 for G,V in ipairs(W.compactStatusContainer:GetChildren())do
 if V:IsA("TextLabel")then
 V:Destroy()end
 end
 W.compactStatusLabel=Instance.new("TextLabel")W.compactStatusLabel.Name="CompactStatusDisplay"W.compactStatusLabel.Parent=W.compactStatusContainer W.compactStatusLabel.Size=UDim2.new(1,0,1,0)W.compactStatusLabel.AutomaticSize=Enum.AutomaticSize.Y W.compactStatusLabel.BackgroundTransparency=1 W.compactStatusLabel.RichText=true W.compactStatusLabel.Font=Enum.Font.SourceSansBold W.compactStatusLabel.TextColor3=Color3.new(1,1,1)W.compactStatusLabel.TextSize=J W.compactStatusLabel.TextStrokeTransparency=.5 W.compactStatusLabel.TextWrapped=true W.compactStatusLabel.ZIndex=1 W.compactStatusLabel.TextXAlignment=Enum.TextXAlignment.Left W.compactStatusLabel.TextYAlignment=Enum.TextYAlignment.Top end
 
elseif not W.compactStatusLabel or not W.compactStatusLabel.Parent then
 W.compactStatusLabel=W.compactStatusContainer:FindFirstChild("CompactStatusDisplay")if not W.compactStatusLabel then
 W.compactStatusContainer=nil 
return end
 end
 
local d=table.concat(G,"\n")W.compactStatusLabel.Text=d end
 
local tJ=nil W.updateStatusList=
function(G)
local y=18 
local Z=14 
local j=1000 
local i=y 
local c=workspace.CurrentCamera if c then
 if c.ViewportSize.X<j then
 i=Z end
 end
 if not tJ or not tJ.Parent then
 
local G=V.LocalPlayer if not G then
 
return end
 
local y=V.PlayerGui 
local Z=y:FindFirstChild("StatusGui")if not Z then
 Z=Instance.new("ScreenGui")Z.Name="StatusGui"Z.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Z.ResetOnSpawn=false Z.Parent=y Z.DisplayOrder=3 end
 tJ=Z:FindFirstChild("StatusDisplay")if not tJ then
 tJ=Instance.new("TextLabel")tJ.Name="StatusDisplay"tJ.Parent=Z tJ.Size=UDim2.new(.3,0,.4,0)tJ.AnchorPoint=Vector2.new(0,.5)tJ.Position=UDim2.new(0,120,.65,0)tJ.BackgroundTransparency=1 tJ.RichText=true tJ.Font=Enum.Font.SourceSansBold tJ.TextColor3=Color3.new(1,1,1)tJ.TextSize=i tJ.TextStrokeTransparency=.5 tJ.TextXAlignment=Enum.TextXAlignment.Left tJ.TextYAlignment=Enum.TextYAlignment.Top end
 end
 
local J=table.concat(G,"\n")tJ.Text=J end
 q.Season={ClaimSeasonPoints=
function()if not T.auto_claim_season_points then
 
return end
 
pcall(
function()
local G=V.ReplicatedStorage.GameEvents.SeasonPass.ClaimSeasonPassInfReward G:FireServer(51,false)end
)end
;GetAllSeasonShopItems=
function()
local G={}if not V.SeasonPassShop then
 
return G end
 
local y,Z=
pcall(
function()for V in pairs(V.SeasonPassShop.ShopItems)do
 table.insert(G,V)end
 end
)if not y then
 
warn("Failed to get season shop items:",Z)end
 
return G end
;BuySeasonShopItem=
function()if not V.BuySeasonPassStock then
 
return end
 
local G=c.season_pass_shop_items for G,y in pairs(G)do
 if y then
 for y=1,3,1 do
 V.BuySeasonPassStock:FireServer(G)
task.wait(.7)end
 end
 end
 end
}q.FallBuyPetsShop=
function()
local G=3 
local y,Z=
pcall(
function()for y,Z in pairs(c.fall_pets_shop)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if y then
 
return true 
else
 
return false end
 end
 q.FallBuySeedsShop=
function()
local G=1 
local y,Z=
pcall(
function()for y,Z in pairs(c.fall_seeds_shop)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if y then
 
return true 
else
 
return false end
 end
 q.FallBuyCosmeticsShop=
function()
local G=4 
local y,Z=
pcall(
function()for y,Z in pairs(c.fall_cosmetic_shop)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if y then
 
return true 
else
 
return false end
 end
 q.FallBuyGearsShop=
function()
local G=2 
local y,Z=
pcall(
function()for y,Z in pairs(c.fall_gear_shop)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if y then
 
return true 
else
 
return false end
 end
 H.GetBoostAmounts=
function(G)
return H.ItemAmounts[G]or 0 end
 H.GetBoostTimeLeft=
function(G,V,y)if not G then
 
return 0 end
 for G,Z in pairs(G)do
 if Z.BoostType==V then
 if y then
 if Z.BoostAmount and Z.BoostAmount==y then
 
return Z.Time end
 
else
 
return Z.Time end
 end
 end
 
return 0 end
 H.FindBoostToolUsingName=
function(G)if not G then
 
return nil end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if not y:IsA("Tool")then
 continue end
 
local Z=y:GetAttribute("q")if not Z then
 continue end
 if not H.Boost_Types[Z]then
 continue end
 
local j=y.Name 
local i=BJ(j)if i and i==G then
 
return y end
 end
 
local y=V.Character and V.Character:FindFirstChildOfClass("Tool")if y then
 
local V=y:GetAttribute("q")if V and H.Boost_Types[V]then
 
local V=y.Name 
local Z=BJ(V)if Z and Z==G then
 
return y end
 end
 end
 
return nil end
 H.ApplyBoostToPet=
function(G)V.BoostService:FireServer("ApplyBoost",G)end
 H.ApplyBoostHeldKoi=
function()
local G=E:GetActivePetsUUIDS()if not G then
 
return nil end
 for y,Z in pairs(c.boost_koi_team_list)do
 if Z then
 
local Z=H.FindBoostToolUsingName(y)if not Z then
 continue end
 yJ()
task.wait(.1)VJ(Z)
task.wait(.3)for G,y in ipairs(G)do
 V.BoostService:FireServer("ApplyBoost",y)end
 
task.wait(1)end
 end
 yJ()
task.wait(.1)end
 H.ApplyBoostSelected=
function(G)
local y=E:GetActivePetsUUIDS()if not y then
 
return false end
 if not G then
 
return false end
 for G,Z in pairs(G)do
 if Z then
 
local Z=H.FindBoostToolUsingName(G)if not Z then
 continue end
 yJ()
task.wait(.1)if not VJ(Z)then
 continue end
 
task.wait(.3)for G,y in ipairs(y)do
 V.BoostService:FireServer("ApplyBoost",y)end
 
task.wait(.9)end
 end
 
task.wait(.1)yJ()end
 H.ApplyBoostSelectedWithPetNames=
function(G,y)
local Z=E:GetActivePetsUUIDS()if not Z then
 
return false end
 if not G then
 
return false end
 if not y then
 
return false end
 
local j=false if next(y)==nil then
 j=true end
 
local i={}for V,Z in pairs(Z)do
 
local c=WJ(Z)if not c then
 continue end
 if c==nil then
 continue end
 
local J=c.PetData 
local T=J.Boosts 
local d=c.PetType 
local u=c.PetAbility 
local q=false 
local g=0 for G,V in pairs(G)do
 
local y=H.GetTypeFromItemName(G)
local Z=H.GetBoostAmounts(G)
local j=H.GetBoostTimeLeft(T,y,Z)if j<2 then
 q=true break end
 end
 if not q then
 continue end
 if j then
 table.insert(i,Z)
else
 if y[d]then
 table.insert(i,Z)end
 end
 end
 if#i==0 then
 
return false end
 for G,y in pairs(G)do
 if y then
 
local y=H.FindBoostToolUsingName(G)if not y then
 continue end
 yJ()
task.wait(.3)if not VJ(y)then
 continue end
 
task.wait(.6)for G,y in ipairs(i)do
 V.BoostService:FireServer("ApplyBoost",y)end
 
task.wait(1.5)end
 end
 
task.wait(.1)
return true end
 H.elephant={UpdateStatus=
function(G)if j.lbl_elephant_booster_status then
 j.lbl_elephant_booster_status:SetText(G)end
 end
}H.ApplyBoostSelectedWithTargetPetsElephant=
function(G,y)if not G then
 
return false end
 if not y then
 
return false end
 
local Z={}for G,V in pairs(y)do
 table.insert(Z,G)end
 for G,y in pairs(G)do
 
local j=H.FindBoostToolUsingName(G)if not j then
 continue end
 if not zJ(j)then
 yJ()if not VJ(j)then
 continue end
 end
 for G,y in ipairs(Z)do
 V.BoostService:FireServer("ApplyBoost",y)end
 end
 end
 t.IsAllowedPackOpen=
function()if Z.IS_DIG or Z.QUEST_TASK_RUNNING or Z.IS_COOKING or Z.IS_HATCHING or Z.IS_CRAFTING or Z.IS_LEVELUP_RUNNING or Z.IS_SEEDING or Z.IS_WATERING or Z.IS_Sprinkler or Z.IS_SHOVELING then
 
return false end
 
return true end
 t.IsAllowedSellPet=
function()if Z.IS_DIG or Z.QUEST_TASK_RUNNING or Z.IS_COOKING or Z.IS_HATCHING or Z.IS_CRAFTING or Z.IS_LEVELUP_RUNNING or Z.IS_SEEDING or Z.IS_WATERING or Z.IS_Sprinkler or Z.IS_SHOVELING then
 
return false end
 
return true end
 Z.TEXT_PACK_REWARD=""t.PackOpen={GetSeedPackRewardFromResult=
function(G)
local V=game:GetService("ReplicatedStorage")
local y=require(V.Data.SeedPackData)if type(G)~="table"then
 
return nil end
 
local Z=G.seedPackType 
local j=G.resultIndex if not Z or not j then
 
return nil end
 
local i=y.Packs[Z]if not i or not i.Items then
 
return nil end
 
local c=i.Items[j]if not c then
 
return nil end
 
return{packName=Z,index=j,type=c.Type;rewardId=c.RewardId;name=y:GetTextDisplayForItem(c),raw=c}end
,BypassSeedAnimations=
function()
local G=.1 
local V,y=
pcall(
function()
local V=game:GetService("ReplicatedStorage")
local y=game:GetService("Players")
local j=require(V.Modules.SeedPackController)if j.__BypassHooked then
 
return true end
 j.__OriginalSpin=j.Spin j.Spin=
function(V,i)
local c=t.PackOpen.GetSeedPackRewardFromResult(i)if c then
 
local G=c.name or""
local V=c.packName or""
local y=string.format("[%s] <b><font color=\'#00FF7F\'>Got:</font></b> <font color=\'#FFFFFF\'>%s</font>",V,G)Z.TEXT_PACK_REWARD=y end
 
task.spawn(
function()
task.wait(G)
local V=y.LocalPlayer 
local Z=V and V:FindFirstChild("PlayerGui")
local j=Z and Z:FindFirstChild("RollCrate_UI")
local i=j and j:FindFirstChild("Frame")
local c=i and i:FindFirstChild("Skip")if c and getconnections then
 for G,V in ipairs(getconnections(c.Activated))do
 
pcall(
function()V:Fire()end
)end
 end
 
task.wait(.05)if j then
 j.Enabled=false end
 if i then
 i.Visible=false end
 end
)
return j.__OriginalSpin(V,i)end
 j.__BypassHooked=true end
)if not V then
 
warn("SeedPack animation bypass failed: "..tostring(y))
return false end
 
return true end
,OpenPack=
function(G)if not G or type(G)~="string"then
 
return 
print("Invalid pack name")end
 
local y,Z=
pcall(
function()
local y=V.GameEvents.SeedPack if y and(y.Open and y.SpinFinished)then
 y.Open:FireServer(G)
task.wait(.3)y.SpinFinished:FireServer()end
 end
)if not y then
 
warn(" Failed to open SeedPack: "..tostring(Z))end
 end
;MainLoopPacks=
function()if not T.seedpack.is_active then
 
return false end
 
local G=T.seedpack.selected_packs if next(G)==nil then
 
return false end
 t.PackOpen.BypassSeedAnimations()for G,V in pairs(G)do
 if not T.seedpack.is_active then
 break end
 
local y=r.GetSeedPackUsingName(G)if not y then
 continue end
 if not fJ(y)then
 if not VJ(y)then
 
return continue end
 end
 for V=1,10,1 do
 if not fJ(y)then
 break end
 t.PackOpen.OpenPack(G)
task.wait(.1)end
 end
 
return true end
}u.avoid_category_names={Summer=true;Zen=true;Magical=true,Prehistoric=true;Root=true;Toxic=true;Fungus=true}u.IsAnyPlantsSelected=
function()for G,V in pairs(c.collection_plants)do
 if V then
 
return true end
 end
 
return false end
 u.GetRandomFoodWithExcluded=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not r.IsFood(V)then
 continue end
 
local y=V:GetAttribute("f")if c.feeding_exlude_food_list[y]then
 continue end
 if r.GetFoodUsingName(y)then
 
return V end
 end
 
return nil end
 u.GetRandomFood=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not r.IsFood(V)then
 continue end
 
local y=V:GetAttribute("f")if r.GetFoodUsingName(y)then
 
return V end
 end
 
return nil end
 u.GetRandomFruitForFeed=
function()
local G={}
local y=r.CurrentToolEquipped()if y then
 if r.IsFruitAndNotFav(y)then
 table.insert(G,y)end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruitAndNotFav(y)then
 table.insert(G,y)end
 end
 for G,V in ipairs(G)do
 if T.safe_fruits[V.Name]then
 continue end
 
local y=V:GetAttribute("f")if c.feeding_list_plants[y]then
 continue end
 
return V end
 
return nil end
 u.GetFoodForFeedUsingName=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if y:GetAttribute("b")~="u"then
 continue end
 
local Z=y:GetAttribute("f")if Z and Z==G then
 
return y end
 end
 
return nil end
 u.HasPlantByName=
function(G)for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if y:IsA("Model")and y.Name==G then
 
local G=y:GetAttribute("Favorited")if G then
 continue end
 
return true end
 end
 
return false end
 u.HasPlantByNameAndMutationOnFarm=
function(G,V)
local y=
function(G)if next(V)==nil then
 
return true end
 for V,y in pairs(V)do
 if G:GetAttribute(V)then
 
return true end
 end
 
return false end
 for V,Z in ipairs(E.Get_Plants_Physical_Objects())do
 if Z:IsA("Model")and Z.Name==G then
 
local G=Z:GetAttribute("Favorited")if G then
 continue end
 if not y(Z)then
 continue end
 
return true end
 end
 
return false end
 u.PlantSeed=
function(G,y)
local Z,j=
pcall(
function()V.PlantRemote:FireServer(G,y)end
)end
 u.PlaceSeedSmart=
function(G,y,j,i)if not i then
 if not E.Garden.GetIsNormalGarden()then
 
return false end
 end
 
local c=r.GetSeedUsingName(G)if not c then
 
return false end
 if Z.IS_HATCHING then
 
return false end
 
local J=E.mFarm.Center_Point.Position 
local T=XJ(J)
local d=T[math.random(1,#T)]if j then
 d=j end
 
local q=V.Character:WaitForChild("HumanoidRootPart")
local g=q.CFrame Z.IS_SEEDING=true 
task.wait(.3)
local a=false if r.IsToolHeldAny()then
 yJ()
task.wait(.4)end
 if not VJ(c)then
 Z.IS_SEEDING=false 
return false end
 v(W.Vector3ToCFrame(d))
task.wait(2)for V=1,y,1 do
 if zJ(c)then
 u.PlantSeed(d,G)a=true 
else
 break end
 
task.wait(.1)if Z.IS_HATCHING then
 break end
 end
 Z.IS_SEEDING=false v(g)if a then
 yJ()end
 
return true end
 u.GetSeedForTree=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="n"then
 
local V=y:GetAttribute("d")
local Z=y:GetAttribute("c")
local j=y:GetAttribute("f")
local i=y:GetAttribute("Variant")
local c=y:GetAttribute("Seed")
local J=y:GetAttribute("Quantity")if j==G or c==G then
 
return y end
 end
 end
 for V,y in ipairs(V.Character:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="n"then
 
local V=y:GetAttribute("f")
local Z=y:GetAttribute("Seed")if V==G or Z==G then
 
return y end
 end
 end
 
return nil end
 u.PlantsTrees=
function(G)if not G or#G==0 then
 
return false end
 if Z.is_garden_full_seed then
 
return false end
 
local V=1 
local y=E.mFarm.Center_Point.Position 
local j=XJ(y)for G=#j,2,-1 do
 
local V=math.random(G)j[G],j[V]=j[V],j[G]end
 
local i={}for G,V in ipairs(G)do
 if not i[V]then
 i[V]=0 end
 i[V]=i[V]+1 end
 for G,y in pairs(i)do
 
local i=u.GetSeedForTree(G)if not i then
 continue end
 if Z.is_garden_full_seed then
 yJ()
task.wait(.1)
return false end
 yJ()
task.wait(.3)VJ(i)
task.wait(.9)
local c=y*V for V=1,c,1 do
 if#j==0 then
 break end
 
local y=j[math.random(1,#j)]if y then
 u.PlantSeed(y,G)
task.wait(.2)
else
 end
 end
 end
 yJ()
task.wait(.1)
return true end
 u.GetPlantPosition=
function(G)if not G or not G.Parent then
 
return nil end
 
local V,y=
pcall(
function()
return(G:GetPivot()).Position end
)if V then
 
return y 
else
 
warn("Could not get fruit position:",tostring(G),"| Error:",y)
return nil end
 end
 u.IsFruitGrown=
function(G)if typeof(G)~="Instance"then
 
return false end
 
local V=G:FindFirstChildWhichIsA("ProximityPrompt",true)
return V~=nil and V.Enabled==true end
 u.GetFruitVariant=
function(G)if typeof(G)~="Instance"then
 
return"Normal"end
 
local V=G:FindFirstChild("Variant")if V and V:IsA("ValueBase")then
 
return V.Value end
 
return"Normal"end
 u.GetFruitWeight=
function(G)if typeof(G)~="Instance"then
 
return 0 end
 
local V=G:FindFirstChild("Weight")if V and V:IsA("ValueBase")then
 
return tonumber(V.Value)or 0 end
 
return 0 end
 u.GetFruitItemSeed=
function(G)if typeof(G)~="Instance"then
 
return 0 end
 
local V=G:FindFirstChild("Item_Seed")if V and V:IsA("ValueBase")then
 
return V.Value end
 
return 0 end
 u.GetFruitMutationsVariantAndWeight=
function(G)if not G then
 
return false,0,{},{}end
 
local V=u.GetFruitWeight(G)
local y={}for G,V in pairs(G:GetAttributes())do
 if type(V)=="boolean"and V==true then
 y[G]=true end
 end
 
local Z={}
local j=G:GetAttribute("Variant")if j and(type(j)=="string"and j~="")then
 Z[j]=true 
else
 Z.Normal=true end
 
return true,V,y,Z end
 u.IsFavoriteFruitOnFarm=
function(G)if not G then
 
return false end
 
local V=G:GetAttribute("Favorited")if V and V==true then
 
return true end
 
return false end
 u.IsFruitReadyToCollect=
function(G,V)if not G then
 
return false end
 
local y=G:GetAttribute("Favorited")if y==true then
 
return false end
 
local Z=G:GetAttribute("MaxAge")
local j=G:FindFirstChild("Weight",true)
local i,J=
pcall(
function()
return tonumber(G.Weight.Value)end
)
local T=0 if j then
 T=j.Value or 0 
else
 
warn("Could not get weight:")
return false end
 
local d=tonumber(c.g_fruit_weight_min)
local u=tonumber(c.g_fruit_weight_max)if T>u or T<d then
 
return false end
 if V then
 
return true end
 
local q,g=
pcall(
function()
local V=G:FindFirstChildWhichIsA("ProximityPrompt",true)
return V and V.Enabled end
)if q and g then
 
return true 
elseif q and not g then
 
return false 
else
 
return false end
 
return true end
 u.HarvestFruitsUsingNames=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j={}
local i={}
local c=2 if y then
 c=y end
 
local J=1 
local T={}
local d={}for G,V in ipairs(G)do
 if not d[V]then
 d[V]=c 
else
 d[V]=d[V]+c end
 end
 for G,V in ipairs(E.Get_Plants_Physical_Objects())do
 if not V:IsA("Model")then
 continue end
 if not V.Name then
 continue end
 if not d[V.Name]then
 continue end
 
local y={}
local Z=V:FindFirstChild("Fruits")if Z and#Z:GetChildren()>0 then
 for G,V in ipairs(Z:GetChildren())do
 table.insert(y,V)end
 
else
 table.insert(y,V)end
 for G,y in ipairs(y)do
 
local Z=V.Name T[Z]=T[Z]or 0 i[Z]=i[Z]or 0 if i[Z]>=d[Z]then
 continue end
 if not u.IsFruitReadyToCollect(y)then
 continue end
 
local c=IsPreventAscensionFruitRequirement(y)if not c then
 table.insert(j,y)i[Z]=i[Z]+1 
else
 T[Z]=T[Z]+1 if T[Z]>J then
 table.insert(j,y)i[Z]=i[Z]+1 end
 end
 end
 end
 if#j>0 then
 V.collectEvent:FireServer(j)
task.wait(.3)
return true end
 
return false end
 u.CollectFruitByNamesBatchMode=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j={}
local i=y or 15 
local c=2 
local J=0 for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 if y.Name and not G[y.Name]then
 continue end
 
local Z={}
local T=y:FindFirstChild("Fruits")if T and#T:GetChildren()>0 then
 for G,V in ipairs(T:GetChildren())do
 table.insert(Z,V)end
 
else
 table.insert(Z,y)end
 for G,V in ipairs(Z)do
 if#j>=i then
 break end
 if not u.IsFruitReadyToCollect(V)then
 continue end
 
local y=IsPreventAscensionFruitRequirement(V)if not y then
 table.insert(j,V)
else
 J=J+1 if J>c then
 table.insert(j,V)end
 end
 end
 end
 if#j>0 then
 
task.spawn(
function()V.collectEvent:FireServer(j)end
)
task.wait(.1)
return true end
 
return false end
 
local MJ={Common=1;Uncommon=2,Rare=3,Legendary=4;Mythical=5,Divine=6;Prismatic=7,Transcendent=8}u.CountMutationOnFruitFast=
function(G)if not G then
 
return 0 end
 
local V=G:GetAttributes()if not V then
 
return 0 end
 
local y=0 for G,V in pairs(V)do
 if o[G]~=nil then
 y=y+1 end
 end
 
return y end
 u.CountMutationOnFruit=
function(G,V)
local y=tonumber(V)or 0 if y<=0 then
 
return true end
 
local Z=0 
local j=G:GetAttributes()if not j then
 
return false end
 if type(o)~="table"then
 
print("Error: list_mutations table not found")
return false end
 for G,V in pairs(j)do
 if o[G]~=nil then
 Z=Z+1 if Z>=y then
 
return true end
 end
 end
 
return Z>=y end
 r.GetAllEggsInBackpack=
function()
local G={}for V,y in ipairs(V.Backpack:GetChildren())do
 if not r.IsEggTool(y)then
 continue end
 table.insert(G,y)end
 
local y=r.GetHeldTool()if r.IsEggTool(y)then
 table.insert(G,y)end
 
return G end
 r.GetAllFruitsInBackpack=
function()
local G={}for V,y in ipairs(V.Backpack:GetChildren())do
 if not r.IsFruit(y)then
 continue end
 table.insert(G,y)end
 
local y=r.GetHeldTool()if r.IsFruit(y)then
 table.insert(G,y)end
 
return G end
 r.GetFruitOfRarity=
function(G,V,y)
local j={}
local i=r.GetAllFruitsInBackpack()
local c=0 
local J=true if y then
 J=false end
 for y,i in ipairs(i)do
 if i:IsA("Tool")and r.IsFruit(i)then
 
local y=i:GetAttribute("f")
local T=Z.SeedRarity[y]or"Common"if J then
 if G[T]then
 table.insert(j,i)c=c+1 end
 
else
 table.insert(j,i)c=c+1 end
 if c>=V then
 break end
 end
 end
 if#j==0 then
 
local G=r.GetFruitRandom()table.insert(j,G)end
 
return j end
 r.GetFruitsFromBackpackSorted=
function()
local G={}
local V=r.GetAllFruitsInBackpack()for V,y in ipairs(V)do
 if y:IsA("Tool")and r.IsFruit(y)then
 
local V=y:GetAttribute("f")
local j=Z.SeedRarity[V]or"Common"
local i=MJ[j]or 1 table.insert(G,{Tool=y;Name=V,Weight=i})end
 end
 table.sort(G,
function(G,V)if G.Weight==V.Weight then
 
return G.Name<V.Name end
 
return G.Weight>V.Weight end
)
local y={}for G,V in ipairs(G)do
 table.insert(y,V.Tool)end
 
return y end
 u.GetValidFruitsFromPlant=
function(G)if not G then
 
return{}end
 
local V=G:FindFirstChild("Fruits")
local y=V and V:GetChildren()or{}if#y>0 then
 
return y 
else
 
return{G}end
 end
 u.CheckMutationUsingLists=
function(G,V,y)for V,y in pairs(V)do
 if y and G:GetAttribute(V)then
 
return false end
 end
 
local Z=false for V,y in pairs(y)do
 Z=true if G:GetAttribute(V)then
 
return true end
 end
 if Z then
 
return false end
 
return true end
 u.GetFruitObjectsSortedRarityConfig=
function(G)
local V=G.amount or 15 
local y=G.batch_mode or false 
local j=G.submit_function or nil 
local i=G.whitelist_mutation or{}
local c=G.blacklist_mutation or{}
local J=G.variants or{}
local T=G.mut_count or 0 
local d=G.ignore_fruit_list or{}
local q=G.random or false 
local g=G.fruit_names or{}
local a=G.dont_require_ready 
local H=G.single_harvest if H==nil then
 H=true end
 
local r=false if next(g)then
 r=true end
 
local Y={}
local e=V or 15 for G,V in ipairs(E.Get_Plants_Physical_Objects())do
 if not V:IsA("Model")then
 continue end
 
task.wait()
local y=V.Name or"-"if d[y]then
 continue end
 if r then
 if not g[y]then
 continue end
 end
 
local Z={}
local j=V:FindFirstChild("Fruits")if not j then
 if not H then
 continue end
 end
 if j and#j:GetChildren()>0 then
 for G,V in ipairs(j:GetChildren())do
 table.insert(Z,V)end
 
else
 if H then
 table.insert(Z,V)end
 end
 for G,V in ipairs(Z)do
 if V==nil then
 continue end
 if not u.CheckMutationUsingLists(V,c,i)then
 continue end
 if not u.IsFruitReadyToCollect(V,a)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(V)then
 continue end
 if T>0 then
 if not u.CountMutationOnFruit(V,T)then
 continue end
 end
 if next(J)~=nil then
 
local G=u.GetFruitVariant(V)if not J[G]then
 continue end
 end
 table.insert(Y,{FruitObject=V;PlantName=y})end
 end
 table.sort(Y,
function(G,V)
local y=Z.SeedRarity[G.PlantName]or"Common"
local j=Z.SeedRarity[V.PlantName]or"Common"
local i=MJ[y]or 1 
local c=MJ[j]or 1 
return i>c end
)
local s={}for G=1,math.min(#Y,e),1 do
 table.insert(s,Y[G].FruitObject)end
 
return s end
 u.bucket_fruits={}u.ResetBucketCache=
function()u.bucket_fruits={}end
 u.CollectBucket=
function(G,y)
local j=y.amount or 15 
local i=y.batch_mode or false 
local c=y.submit_function or nil 
local J=y.whitelist_mutation or{}
local T=y.blacklist_mutation or{}
local d=y.variants or{}
local q=y.mut_count or 0 
local g=y.ignore_fruit_list or{}
local E=false 
local a=y.instant 
local H=false if a and a==true then
 H=true end
 if y.random then
 E=y.random end
 
local Y=u.bucket_fruits 
local e=j or 15 
local s=false if G then
 if next(G)~=nil then
 s=true end
 end
 
local N={}for G=1,e,1 do
 if#u.bucket_fruits<=0 then
 break end
 
local V=table.remove(u.bucket_fruits,1)if V and V.FruitObject then
 table.insert(N,V.FruitObject)end
 end
 if H then
 
local G=#N V.collectEvent:FireServer(N)
print("Instant collected ",G)
return true end
 if#N>0 then
 
local G=0 if i then
 
local y=5 for j=1,#N,y do
 
local i={}if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local J=math.min((j+y)-1,#N)if not Z.FruitCollectPause.CanCollect()then
 break end
 for G=j,J,1 do
 table.insert(i,N[G])end
 if#i>0 then
 V.collectEvent:FireServer(i)G=G+#i if c then
 c()end
 end
 
task.wait()end
 
else
 for y,j in ipairs(N)do
 if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 V.collectEvent:FireServer({j})G=G+1 
task.wait(.1)if c then
 c()end
 end
 end
 if G>0 then
 
return true end
 end
 
return false end
 u.CollectFruitByNamesSortedRarityConfig=
function(G,V)if#u.bucket_fruits>0 then
 
return u.CollectBucket(G,V)end
 if r.IsBackpackFull()then
 
return true end
 
local y=V.amount or 15 
local j=V.batch_mode or false 
local i=V.submit_function or nil 
local c=V.whitelist_mutation or{}
local J=V.blacklist_mutation or{}
local T=V.variants or{}
local d=V.mut_count or 0 
local q=V.ignore_fruit_list or{}
local g=false if V.random then
 g=V.random end
 
local a={}
local H=y or 15 
local Y=false if G then
 if next(G)~=nil then
 Y=true end
 end
 Z.EasterPlantStockpile={}
local e=0 for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 
local Z=y.Name or"-"if not g then
 if Y then
 if not G[Z]then
 continue end
 end
 end
 if q[Z]then
 continue end
 
local j={}
local i=y:FindFirstChild("Fruits")if i and#i:GetChildren()>0 then
 for G,V in ipairs(i:GetChildren())do
 table.insert(j,V)end
 
else
 table.insert(j,y)end
 for G,V in ipairs(j)do
 if V==nil then
 continue end
 if not u.IsFruitReadyToCollect(V)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(V)then
 continue end
 
local y,j,i,q=u.GetFruitMutationsVariantAndWeight(V)if d>0 then
 if not u.CountMutationOnFruit(V,d)then
 continue end
 end
 if next(T)~=nil then
 
local G=u.GetFruitVariant(V)if not T[G]then
 continue end
 end
 if not u.CheckMutationUsingLists(V,J,c)then
 continue end
 
local g=u.CountMutationOnFruitFast(V)table.insert(a,{FruitObject=V;PlantName=Z,w=j;mutcount=g})end
 end
 table.sort(a,
function(G,V)
local y=Z.SeedRarity[G.PlantName]or"Common"
local j=Z.SeedRarity[V.PlantName]or"Common"
local i=MJ[y]or 1 
local c=MJ[j]or 1 if i~=c then
 
return i>c end
 if G.mutcount~=V.mutcount then
 
return G.mutcount<V.mutcount end
 
return G.w>V.w end
)u.bucket_fruits=a if#u.bucket_fruits>0 then
 
return u.CollectBucket(G,V)end
 
return false end
 u.CollectFruitByNamesSortedRarity=
function(G,y,j,i)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local c={}
local J=y or 15 for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 
local Z=y.Name if not Z or not G[Z]then
 continue end
 
local j={}
local i=y:FindFirstChild("Fruits")if i and#i:GetChildren()>0 then
 for G,V in ipairs(i:GetChildren())do
 table.insert(j,V)end
 
else
 table.insert(j,y)end
 for G,V in ipairs(j)do
 if not u.IsFruitReadyToCollect(V)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(V)then
 continue end
 table.insert(c,{FruitObject=V,PlantName=Z})end
 end
 table.sort(c,
function(G,V)
local y=Z.SeedRarity[G.PlantName]or"Common"
local j=Z.SeedRarity[V.PlantName]or"Common"
local i=MJ[y]or 1 
local c=MJ[j]or 1 
return i>c end
)
local T={}for G=1,math.min(#c,J),1 do
 table.insert(T,c[G].FruitObject)end
 if#T>0 then
 
local G=0 if j then
 
local y=25 for j=1,#T,y do
 
local c={}if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 
local J=math.min((j+y)-1,#T)for G=j,J,1 do
 table.insert(c,T[G])end
 if#c>0 then
 V.collectEvent:FireServer(c)G=G+#c if i then
 i()end
 end
 
task.wait(.1)end
 
else
 for y,j in ipairs(T)do
 if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 V.collectEvent:FireServer({j})G=G+1 
task.wait(.1)if i then
 i()end
 end
 end
 if G>0 then
 
return true end
 end
 
return false end
 u.CollectFruitByNameAndWeight=
function(G,y,j)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local i={}
local c=y or 1 j=j or 0 for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 if y.Name~=G then
 continue end
 
local Z=y:FindFirstChild("Fruits")
local J={}if Z and#Z:GetChildren()>0 then
 J=Z:GetChildren()
else
 J={y}end
 for G,V in ipairs(J)do
 if#i>=c then
 break end
 if not u.IsFruitReadyToCollect(V)then
 continue end
 
local y,Z=u.GetFruitMutationsVariantAndWeight(V)if not y then
 continue end
 if Z>=j then
 table.insert(i,V)end
 end
 if#i>=c then
 break end
 end
 if#i>0 then
 
local G=0 for y,j in ipairs(i)do
 if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 V.collectEvent:FireServer({j})G+=1 
task.wait(.1)end
 
return true,G end
 
return false,0 end
 u.CollectFruitByNameAndMutationAndWeight=
function(G,y,j,i,c)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local J={}
local T=y or 1 i=i or{}Z.EasterPlantStockpile={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 
local Z=y.Name if not Z or Z~=G then
 continue end
 
local d={}
local q=y:FindFirstChild("Fruits")if q and#q:GetChildren()>0 then
 for G,V in ipairs(q:GetChildren())do
 table.insert(d,V)end
 
else
 table.insert(d,y)end
 for G,V in ipairs(d)do
 if#J>=T then
 break end
 if not u.IsFruitReadyToCollect(V)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(V)then
 continue end
 
local y,Z,d,q=u.GetFruitMutationsVariantAndWeight(V)if not y then
 continue end
 if not c then
 if Z<j then
 continue end
 
local G=true if next(i)~=nil then
 G=false for y,Z in pairs(i)do
 if V:GetAttribute(y)then
 G=true break end
 end
 end
 if G then
 table.insert(J,V)end
 
else
 table.insert(J,V)end
 end
 if#J>=T then
 break end
 end
 if#J>0 then
 
local G=0 for y,j in ipairs(J)do
 if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 V.collectEvent:FireServer({j})G=G+1 
task.wait(.1)end
 
return G>0 end
 
return false end
 u.CollectFruitByNames=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j={}
local i=y or 15 
local c=2 
local J=0 for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 if y.Name and not G[y.Name]then
 continue end
 
local Z={}
local T=y:FindFirstChild("Fruits")if T and#T:GetChildren()>0 then
 for G,V in ipairs(T:GetChildren())do
 table.insert(Z,V)end
 
else
 table.insert(Z,y)end
 for G,V in ipairs(Z)do
 if#j>=i then
 break end
 if not u.IsFruitReadyToCollect(V)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(V)then
 continue end
 
local y=IsPreventAscensionFruitRequirement(V)if not y then
 table.insert(j,V)
else
 J=J+1 if J>c then
 table.insert(j,V)end
 end
 end
 end
 if#j>0 then
 
local G=0 for y,j in ipairs(j)do
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({j})G=G+1 
task.wait(.1)end
 if G>0 then
 
return true end
 end
 
return false end
 u.FruitCategoryCache={}u.BuildCategoryCache=
function()u.FruitCategoryCache={}
local G=Z.PlantsCategoryData 
local V=u.avoid_category_names or{}for G,y in pairs(G)do
 if not V[G]and type(y)=="table"then
 for V,y in ipairs(y)do
 if not u.FruitCategoryCache[y]then
 u.FruitCategoryCache[y]=G end
 end
 end
 end
 end
 u.BuildCategoryCache()u.GetPlantsByCategoryName=
function(G)if not Z.PlantsCategoryData then
 
return nil end
 
local V={}
local y=Z.PlantsCategoryData[G]if y then
 for G,y in ipairs(y)do
 V[y]=true end
 
return V end
 
return nil end
 u.GetPlantsCategoryUsingFruitName=
function(G)if not Z.PlantsCategoryData then
 
return nil end
 
local V={}for V,y in pairs(Z.PlantsCategoryData)do
 if u.avoid_category_names[V]then
 continue end
 for y,Z in ipairs(y)do
 if Z==G then
 
return V end
 end
 end
 
return nil end
 u.CheckMutationWhiteBlackList=
function(G)for V,y in pairs(c.mutation_blacklist)do
 if y and G:GetAttribute(V)then
 
return false end
 end
 
local V=false for y,Z in pairs(c.mutation_whitelist)do
 if Z then
 V=true if G:GetAttribute(y)then
 
return true end
 end
 end
 if V then
 
return false end
 
return true end
 u.GetRandomFruitsIgnoreMutation=
function(G)
local V={}
local y=2 
local Z=0 
local j=
function(V)for G,y in pairs(G)do
 if V:GetAttribute(G)then
 
return true end
 end
 
return false end
 for G,i in ipairs(E.Get_Plants_Physical_Objects())do
 
local c={}
local J=i:FindFirstChild("Fruits")if J and#J:GetChildren()>0 then
 for G,V in ipairs(J:GetChildren())do
 table.insert(c,V)end
 
else
 table.insert(c,i)end
 for G,i in ipairs(c)do
 if not u.IsFruitReadyToCollect(i)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(i)then
 continue end
 if j(i)then
 continue end
 
local c=IsPreventAscensionFruitRequirement(i)if not c then
 table.insert(V,i)
else
 Z=Z+1 if Z>y then
 table.insert(V,i)end
 end
 end
 end
 
return V end
 u.GetRandomFruitsWithMutation=
function(G)
local V={}
local y=2 
local Z=0 
local j=
function(V)for G,y in pairs(G)do
 if V:GetAttribute(G)then
 
return true end
 end
 
return false end
 for G,i in ipairs(E.Get_Plants_Physical_Objects())do
 
local c={}
local J=i:FindFirstChild("Fruits")if J and#J:GetChildren()>0 then
 for G,V in ipairs(J:GetChildren())do
 table.insert(c,V)end
 
else
 table.insert(c,i)end
 for G,i in ipairs(c)do
 if not u.IsFruitReadyToCollect(i)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(i)then
 continue end
 if not j(i)then
 continue end
 
local c=IsPreventAscensionFruitRequirement(i)if not c then
 table.insert(V,i)
else
 Z=Z+1 if Z>y then
 table.insert(V,i)end
 end
 end
 end
 
return V end
 u.GetFruitsUsingNameAndMutation=
function(G,V)
local y={}
local Z=2 
local j=0 
local i=
function(G)if next(V)==nil then
 
return true end
 for V,y in pairs(V)do
 if G:GetAttribute(V)then
 
return true end
 end
 
return false end
 for V,c in ipairs(E.Get_Plants_Physical_Objects())do
 
local J={}
local T=c:FindFirstChild("Fruits")if T and#T:GetChildren()>0 then
 for G,V in ipairs(T:GetChildren())do
 table.insert(J,V)end
 
else
 table.insert(J,c)end
 for V,c in ipairs(J)do
 if not u.IsFruitReadyToCollect(c)then
 continue end
 if S.FavouriteFruit.IsFavouriteTarget(c)then
 continue end
 if G~=c.Name then
 continue end
 if not i(c)then
 continue end
 
local J=IsPreventAscensionFruitRequirement(c)if not J then
 table.insert(y,c)
else
 j=j+1 if j>Z then
 table.insert(y,c)end
 end
 end
 end
 
return y end
 u.GetAllFruitsInFarmReady=
function(G,V,y)
local Z={}
local j={}
local i=type(G)=="table"and G or{}
local c=next(i)~=nil 
local 
function J(G)if not u.IsFruitGrown(G)then
 
return end
 
local i=u.GetFruitWeight(G)if V and i<V then
 
return end
 if y and i>y then
 
return end
 if u.IsFavoriteFruitOnFarm(G)then
 table.insert(j,G)
else
 table.insert(Z,G)end
 end
 for G,V in ipairs(E.Get_Plants_Physical_Objects())do
 if c and not i[V.Name]then
 continue end
 
local y=V:FindFirstChild("Fruits")
local Z=y and y:GetChildren()or{}if#Z>0 then
 for G,V in ipairs(Z)do
 J(V)end
 
else
 J(V)end
 end
 
return Z,j end
 u.GetFruitsReadyForCollectionAny=
function()
local G={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 
local Z={}
local j=y:FindFirstChild("Fruits")if j and#j:GetChildren()>0 then
 for G,V in ipairs(j:GetChildren())do
 table.insert(Z,V)end
 
else
 table.insert(Z,y)end
 for V,y in ipairs(Z)do
 if not u.IsFruitReadyToCollect(y)then
 continue end
 table.insert(G,y)end
 end
 
return G end
 u.GetFruitSinlgeObject=
function()
local G={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 
local Z={}
local j=y:FindFirstChild("Fruits")if#G>3 then
 break end
 if j then
 for G,V in ipairs(j:GetChildren())do
 table.insert(Z,V)end
 
else
 table.insert(Z,y)end
 for V,y in ipairs(Z)do
 if not u.IsFruitGrown(y)then
 continue end
 table.insert(G,y)end
 end
 if#G>0 then
 end
 
return G end
 u.GetFruitsReadyForCollection=
function()
local G={}
local V=2 
local y=0 for Z,j in ipairs(E.Get_Plants_Physical_Objects())do
 
local i=false 
local J=u.IsAnyPlantsSelected()if J then
 i=c.collection_plants[j.Name]
else
 i=true end
 if not i then
 continue end
 
local T={}
local d=j:FindFirstChild("Fruits")if d and#d:GetChildren()>0 then
 for G,V in ipairs(d:GetChildren())do
 table.insert(T,V)end
 
else
 table.insert(T,j)end
 for Z,j in ipairs(T)do
 if not u.IsFruitReadyToCollect(j)then
 continue end
 
local i=u.CheckMutationWhiteBlackList(j)if not i then
 continue end
 
local c=IsPreventAscensionFruitRequirement(j)if not c then
 table.insert(G,j)
else
 y=y+1 if y>V then
 table.insert(G,j)end
 end
 end
 end
 
return G end
 u.CollectFruitUsingNameAndMutations=
function(G,y,j)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local i=u.GetFruitsUsingNameAndMutation(G,y)if#i==0 then
 
return 0 end
 
local c=0 for G,y in ipairs(i)do
 if c>=j then
 break end
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({y})c=c+1 
task.wait()end
 
return c end
 u.CollectFruitsRandomWithMutation=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j=u.GetRandomFruitsWithMutation(y)if#j==0 then
 
return 0 end
 
local i=0 for y,j in ipairs(j)do
 if i>=G then
 break end
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({j})i=i+1 
task.wait()end
 
return i end
 u.CollectFruitsRandomWithIgnoreMut=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j=u.GetRandomFruitsIgnoreMutation(y)if#j==0 then
 
return 0 end
 
local i=0 for y,j in ipairs(j)do
 if i>=G then
 break end
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({j})i=i+1 
task.wait()end
 
return i end
 u.CollectFruitsRandom=
function(G)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local y=u.GetFruitsReadyForCollectionAny()if#y==0 then
 
return 0 end
 
local j=0 for y,i in ipairs(y)do
 if j>=G then
 break end
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({i})j=j+1 
task.wait(.1)end
 
return j end
 u.CollectFruitForSeedingSystem=
function(G)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local y=u.GetFruitsReadyForCollection()if#y==0 then
 
return false end
 
local j=0 for y,i in ipairs(y)do
 if j>=G then
 break end
 if Z.IS_HATCHING then
 break end
 V.collectEvent:FireServer({i})j=j+1 
task.wait()end
 
return true end
 t.Hop={TriedServers={};FindBestServer=
function()
local G=2 
local y=10 
local Z=game.PlaceId 
local j=nil 
local i={}
local c={}for y=1,y,1 do
 
local J="https://games.roblox.com/v1/games/"..(Z.."/servers/Public?sortOrder=Asc&limit=100")if j then
 J=J..("&cursor="..V.HttpService:UrlEncode(j))end
 
local T,d=
pcall(
function()
return V.HttpService:JSONDecode(game:HttpGet(J))end
)if not T or not d or not d.data then
 
warn("[Hop] Failed to fetch servers")break end
 for V,y in ipairs(d.data)do
 
local Z=y.id 
local j=tonumber(y.playing)or 0 
local J=tonumber(y.maxPlayers)or 0 if Z and(Z~=game.JobId and(not t.Hop.TriedServers[Z]and(J>0 and j<J)))then
 if j<=G then
 table.insert(i,y)
else
 table.insert(c,y)end
 end
 end
 j=d.nextPageCursor if not j then
 break end
 
task.wait(.15)end
 
local J=#i>0 and i or c if#J==0 then
 
warn("[Hop] No non-full server found")
return nil end
 
local T=J[math.random(1,#J)]
print(string.format("[Hop] Selected: %s (%d/%d)",T.id,T.playing or 0,T.maxPlayers or 0))
return T.id,T end
,HopToNewServer=
function()
local G=game:GetService("Players")
local V=game:GetService("TeleportService")
local y=G.LocalPlayer for G=1,5,1 do
 
local Z,j=t.Hop.FindBestServer()if not Z or Z==""then
 
warn("[Hop] No valid JobId")
return false end
 t.Hop.TriedServers[Z]=true 
local i,c=
pcall(
function()V:TeleportToPlaceInstance(game.PlaceId,Z,y)end
)if i then
 
return true end
 
warn("[Hop] Teleport failed, trying another:",c)
task.wait(.5)end
 
warn("[Hop] All hop attempts failed")
return false end
}Z.TotalPlantsInFarm=0 E.GetAllFarmPlantsNamesAndCount=
function()if Z.IS_HATCHING then
 
return end
 
local G={}
local V=0 
local y=E.Get_Plants_Physical_Objects()for y,Z in ipairs(y)do
 
local j=Z.Name 
local i=u.FruitCategoryCache[j]or"Uncategorised"
local c=G[i]if not c then
 c={}G[i]=c end
 
local J=0 
local T=u.GetValidFruitsFromPlant(Z)if T and#T>0 then
 for G,V in ipairs(T)do
 
local y=tonumber(u.GetFruitWeight(V))or 0 if y>J then
 J=y end
 end
 end
 if c[j]then
 c[j].amount=c[j].amount+1 if J>c[j].max_weight then
 c[j].max_weight=J end
 
else
 c[j]={amount=1,name=j,max_weight=J}end
 V=V+1 end
 Z.is_garden_full_seed=(V>=800)Z.TotalPlantsInFarm=V 
local i={"<b><font color=\'#00FF00\'>Plants In Farm</font><font color=\'#FFFFFF\'> x",tostring(V),"</font></b>\n\n"}for G,V in pairs(G)do
 table.insert(i,"<b><font color=\'#00BFFF\'>")table.insert(i,G)table.insert(i,"</font></b>\n")
local y={}for G,V in pairs(V)do
 table.insert(y,V)end
 table.sort(y,
function(G,V)
return G.amount>V.amount end
)for G,V in ipairs(y)do
 
local y=string.format("%.2f",V.max_weight)table.insert(i,V.name)table.insert(i,":<font color=\'#FFA500\'>")table.insert(i,tostring(V.amount))table.insert(i,"</font> [<font color=\'#FFFF00\'>")table.insert(i,y)table.insert(i,"KG</font>]\n")end
 table.insert(i,"\n")end
 
local c=table.concat(i)if j.lbl_farm_plants_counts then
 j.lbl_farm_plants_counts:SetText(c)end
 end
 E.GetCenterPlacementPoint=
function()
local G=E.mFarm.Center_Point 
local V=10 
local y=((G.CFrame*CFrame.new(V,0,0))).Position 
return y end
 E.DeleteObject=
function(G)
pcall(
function()V.DeleteObject:FireServer(G)end
)end
 E.GetObjectsUsingName=
function(G)
local V={}for y,Z in ipairs(E.mObjects_Physical:GetChildren())do
 if not Z:IsA("Model")then
 continue end
 
local j=Z:GetAttribute("OBJECT_TYPE")if not j then
 continue end
 if Z.Name==G then
 table.insert(V,Z)continue end
 if G==j then
 table.insert(V,Z)continue end
 end
 
return V end
 E.GetAllSprinklerObjects=
function()
local G={}
local V="Sprinkler"for y,Z in ipairs(E.mObjects_Physical:GetChildren())do
 if not Z:IsA("Model")then
 continue end
 
local j=Z:GetAttribute("OBJECT_TYPE")
local i=Z:GetAttribute("OWNER")
local c=Z:GetAttribute("Lifetime")if not j or not c then
 continue end
 
local J=tonumber(c)or 0 if string.find(Z.Name,V)or string.find(j,V)then
 
local V={item=Z;time=J,name=Z.Name,type=j}table.insert(G,V)
else
 end
 end
 
return G end
 Z.GetActivePlayers=
function()
local G={}
local y=V.Players:GetPlayers()
local Z=V.LocalPlayer 
local j={}for V,y in ipairs(y)do
 if y~=Z then
 j[y.Name]=true table.insert(G,y.Name)end
 end
 
local i=T.giftpets.allow_player_targets or{}for V,y in pairs(i)do
 if j[V]then
 continue end
 table.insert(G,V)end
 
return G end
 Z.IsPlayerActiveUsingName=
function(G)if G==nil then
 
return nil end
 
local y=V.Players:FindFirstChild(G)
return y end
 Z.UpdateDropDownPlayersGiftPets=
function()
local G=Z.GetActivePlayers()
local V=true if i.dd_playertargets_giftpets then
 i.dd_playertargets_giftpets:SetValues(G,V)i.dd_playertargets_giftpets:SetValue(T.giftpets.allow_player_targets)end
 end
 Z.cooldown_pets={}V.PetCooldownsUpdated.OnClientEvent:Connect(
function(G,V)if type(G)~="string"or type(V)~="table"then
 
return end
 
local y=W.PetDataLocal[G]if not y then
 
local V=W.cache_recent_pet_data[G]if not V then
 V=WJ(G)end
 if V then
 
local G=V.PetType if G then
 y=G 
else
 
return end
 end
 end
 
local j={}for G,V in ipairs(V)do
 
local Z={Name=y;Passive=tostring(V.Passive);Time=tonumber(V.Time)or 0}table.insert(j,Z)end
 Z.cooldown_pets[G]=j end
)l.IsActive=false l.isLoaded=false l.UpdateStatus=
function(G)if j.lbl_shovel_status then
 j.lbl_shovel_status:SetText(G)end
 end
 if not _G.shovelAnimState then
 _G.shovelAnimState={frameIndex=1;colorIndex=1}end
 l.UpdateProgressInformation=
function(G)if not j.lbl_shovel_information then
 
return end
 
local V=c.shovel_keep_amount or 0 
local y={"\226\155\143\239\184\143 Shovel Time!";"\240\159\140\177 Digging Up Plants","\240\159\141\128 Plant Extermination";"\226\154\161 Auto Shovelling","\240\159\148\165 Clearing Fields","\240\159\146\168 Rapid Dig Mode";"\240\159\141\128 Green Thumb Activated","\240\159\146\165 Shovel Power!";"\240\159\140\190 Harvest Cleanup";"\240\159\155\160\239\184\143 Working Hard"}
local Z={"#ff0000";"#FFFFA2","#FFF811","#00ff00";"#FF68FF","#FFFF00";"#FFC43A"}
local i=_G.shovelAnimState.frameIndex 
local J=_G.shovelAnimState.colorIndex 
local T=string.format("<font color=\'%s\'>%s</font>\n\n",Z[J],y[i])i=i+1 if i>#y then
 i=1 end
 J=J+1 if J>#Z then
 J=1 end
 _G.shovelAnimState.frameIndex=i _G.shovelAnimState.colorIndex=J 
local d={}for G,y in pairs(G)do
 
local Z=W.StringToColor3(G)or"#ffffff"
local j if y<V then
 j="#ffff00"
elseif y==V then
 j="#00ff00"
else
 j="#ff0000"end
 table.insert(d,string.format("<font color=\'%s\'>%s:</font> <font color=\'%s\'>%d / %d</font>",Z,G,j,y,V))end
 
local u=T..table.concat(d,"\n")j.lbl_shovel_information:SetText(u)end
 S.Is_MasterBusy=
function()if Z.IsPaused()or Z.IS_HATCHING or Z.IS_GIFT or S.reclaim_running or Z.IS_HIGH_TASK then
 
return true end
 
return false end
 l.Plant={IsCanShovelPlant=
function(G)if not G then
 
return false end
 
local V=G:GetAttribute("Favorited")if V==true then
 
return false end
 
local y=G:GetAttribute("MaxAge")
local Z,j=
pcall(
function()
return tonumber(G.Weight.Value)end
)
local i=0 if Z then
 i=j 
else
 
warn("Could not get weight:",weight)
return false end
 
local J=tonumber(c.g_fruit_weight_min)
local T=tonumber(c.g_fruit_weight_max)if i>T or i<J then
 
return false end
 
return true end
,GetMultiHarvestFruits=
function(G)
local V={}
local y=G:GetChildren()
local Z=false if G and#y>0 then
 for G,y in ipairs(y)do
 if not l.Plant.IsCanShovelPlant(y)then
 
warn("Cant shovel this: "..y.Name)V={}Z=true break end
 table.insert(V,y)end
 
else
 end
 
return V,Z end
;GetPlantsToDestroyByName=
function(G)
local V={}for y,Z in ipairs(E.Get_Plants_Physical_Objects())do
 if not Z:IsA("Model")then
 continue end
 if Z.Name~=G then
 continue end
 
local j=Z:FindFirstChild("Fruits")if not j then
 continue end
 
local i,c=l.Plant.GetMultiHarvestFruits(j)if not c then
 table.insert(V,Z)continue end
 end
 
return V end
;GetPlantsToDestroy=
function()
local G={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 if y.Name and not c.shovel_plants_list[y.Name]then
 continue end
 
local Z=y:FindFirstChild("Fruits")if not Z then
 table.insert(G,y)continue end
 
local j,i=l.Plant.GetMultiHarvestFruits(Z)if not i then
 table.insert(G,y)continue end
 end
 
return G end
,DeletePlant=
function(G)
local y,Z=
pcall(
function()V.Remove_Item:FireServer(G.PrimaryPart)end
)if not y then
 
warn("Failed to remove plant:",Z)end
 
return y end
;GetAllAvailablePlants=
function()
local G={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if y:IsA("Model")then
 G[y.Name]=true end
 end
 
return G end
,PlantShovelTask=
function()if S.Is_MasterBusy()then
 
return false end
 if not l.isLoaded then
 l.UpdateCurrentPlantsInFarm()
task.wait(1)if i.ShovelDropDown then
 i.ShovelDropDown:SetText("\226\155\143\239\184\143 Plants to Shovel")end
 l.isLoaded=true end
 if not c.is_auto_shovel then
 if not l.IsActive then
 l.UpdateStatus("\240\159\148\180 Auto-Shovel Disabled")
return false 
else
 l.UpdateStatus("\240\159\159\161 Auto-Shovel Running (Manual)")end
 
else
 l.UpdateStatus("\240\159\159\162 Auto-Shovel Running (Auto)")end
 
local G=l.Plant.GetPlantsToDestroy()if#G<=0 then
 l.UpdateStatus("\240\159\148\180 Nothing to shovel")
return false end
 l.UpdateStatus("\240\159\159\162 Active and running...")
local V=E.GetPlantCountByNameArrayTable(G)
local y=tonumber(c.shovel_keep_amount)or 0 
local j=""
local J={}
local T={}for G,Z in ipairs(G)do
 if V[Z.Name]~=nil then
 if V[Z.Name]>y then
 table.insert(J,Z)
else
 T[Z.Name]=true end
 end
 end
 for G,V in pairs(T)do
 j=j..(" "..(G.." under-limit[Skipped]\n"))end
 if#J==0 then
 if not c.is_auto_shovel then
 l.UpdateStatus("\240\159\148\180 Cannot delete any plants. Stopping... "..j)l.IsActive=false Z.Notify("Shovel Stopped",1)
else
 l.UpdateStatus("\240\159\148\180 Nothing to delete. "..j)end
 
return false end
 
local d=r.GetShovel()if not d then
 
return false end
 yJ()VJ(d)
task.wait(.3)l.UpdateStatus("\240\159\159\161 Removing plants from your farm...")l.IsActive=true for G,Z in ipairs(J)do
 if not l.IsActive then
 break end
 if S.Is_MasterBusy()then
 l.UpdateStatus("\240\159\159\161 Yielding to higher priority tasks...")break end
 y=tonumber(c.shovel_keep_amount)or 0 if not zJ(d)then
 yJ()VJ(d)
task.wait(.5)end
 if V[Z.Name]~=nil then
 if V[Z.Name]<=y then
 l.UpdateProgressInformation(V)continue end
 l.Plant.DeletePlant(Z)V[Z.Name]=V[Z.Name]-1 l.UpdateProgressInformation(V)
task.wait(.7)end
 end
 l.IsActive=false yJ()l.UpdateStatus("\240\159\159\162 Shovelling Complete")
return true end
}l.Sprinklers={undertime=15,FindSprinklersAbouttoexpire=
function()
local G=E.GetAllSprinklerObjects()if#G==0 or not T.auto_remove_sprinklers then
 
return false end
 for G,V in ipairs(G)do
 
local y=V.item 
local Z=V.time 
local j=V.name 
local i=V.type if Z<l.Sprinklers.undertime then
 
return true end
 end
 
return false end
,LoopIndependent=
function()
task.spawn(
function()while true do
 
task.wait(1)if not T.auto_remove_sprinklers_nearexpire then
 continue end
 if l.Sprinklers.FindSprinklersAbouttoexpire()then
 Z.IS_HIGH_TASK=true 
task.wait(3)end
 end
 end
)end
;DeleteSprinklersAboutToExpire=
function()
local G=E.GetAllSprinklerObjects()if#G==0 or not T.auto_remove_sprinklers then
 Z.IS_HIGH_TASK=false 
return end
 
local V={}for G,y in ipairs(G)do
 
local Z=y.item 
local j=y.time 
local i=y.name 
local c=y.type if j<l.Sprinklers.undertime then
 table.insert(V,Z)end
 end
 if#V==0 then
 Z.IS_HIGH_TASK=false 
return end
 yJ()
local y=r.GetShovel()VJ(y)for G,V in ipairs(V)do
 if not fJ(y)then
 break end
 E.DeleteObject(V)S.AlreadyDeletedSprinklers[V.Name]=true 
task.wait(.8)end
 yJ()Z.IS_HIGH_TASK=false end
}l.Sprinklers.LoopIndependent()Z.SellFruitsToVendor=
function()if not Z.FruitCollectPause.CanCollect()then
 
return end
 if not E.Garden.GetIsNormalGarden()then
 
return end
 
local G=V.Character:WaitForChild("HumanoidRootPart")
local y=G.CFrame 
local j=W.Vector3ToCFrame(Z.TeleportLocations.GetLocationSellShopV3())v(j)W.SafeFruitsProccess()
task.wait(2)V.Sell_Inventory:FireServer()
task.wait(3)v(y)
task.wait(.4)end
 Z.SellFruitsToVendorWithRangeCheck=
function(G)if not Z.FruitCollectPause.CanCollect()then
 
return end
 if not E.Garden.GetIsNormalGarden()then
 
return end
 
local y=r.GetFruitCount()if y==0 then
 
return end
 
local j=V.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")if not j then
 
return end
 
local i=Z.TeleportLocations.GetLocationSellShopV3()
local c=((j.Position-i)).Magnitude 
local J=9 
local d=T.sellinventorytpback if G then
 if y>2 then
 
return end
 
task.wait(.3)r.FavAllFruitsInBackpack(false,true)end
 if c<=J then
 V.Sell_Inventory:FireServer()
else
 
local G=j.CFrame 
local y=W.Vector3ToCFrame(i)v(y)
task.wait(1)V.Sell_Inventory:FireServer()if d then
 
task.wait(1)v(G)end
 end
 end
 l.Fruit={UpdateStatusFruit=
function(G)if j.lbl_fruit_shovel_live then
 j.lbl_fruit_shovel_live:SetText(G)end
 end
,IsEnabled=
function()
return c.rmplants.fruit_remove_enabled end
,IsBusy=
function()if Z.IS_GIFT or Z.IS_HATCHING then
 
return true end
 
return false end
;DeleteFruit=
function(G)
local y,Z=
pcall(
function()V.Remove_Item:FireServer(G)end
)if not y then
 
warn("Failed to remove plant:",Z)end
 
return y end
,DoFruitsDeleteTask=
function()if S.Is_MasterBusy()then
 
return false end
 
local G,V=
pcall(
function()if not l.Fruit.IsEnabled()then
 l.Fruit.UpdateStatusFruit("\240\159\148\180 Not enabled")
return false end
 l.Fruit.UpdateStatusFruit("\240\159\159\162 Active and running.")if l.Fruit.IsBusy()then
 l.Fruit.UpdateStatusFruit("\240\159\159\161 Other tasks in progress.")
return false end
 l.Fruit.UpdateStatusFruit("\240\159\154\168 Trying to find and delete.")if next(c.rmplants.fruit_list)==nil then
 l.Fruit.UpdateStatusFruit("\226\157\140 Please select fruit types to remove.")
return false end
 
local G={amount=500;whitelist_mutation=c.rmplants.mut_whitelist;blacklist_mutation=c.rmplants.mut_blacklist,variants=c.rmplants.variants_list,fruit_names=c.rmplants.fruit_list,single_harvest=false;dont_require_ready=true}
local V=u.GetFruitObjectsSortedRarityConfig(G)if#V>0 then
 l.Fruit.UpdateStatusFruit("\240\159\148\132 Found "..(#V.." fruits to delete."))
task.wait(.3)
local G=r.GetShovel()if not zJ(G)then
 VJ(G)
task.wait(.3)end
 
local y=0 for G,V in ipairs(V)do
 if not l.Fruit.IsEnabled()then
 break end
 if S.Is_MasterBusy()then
 break end
 if y>=30 then
 break end
 
local Z=V:FindFirstChild("ProximityPrompt",true)if not Z then
 continue end
 
local j=Z.Parent if not j then
 continue end
 l.Fruit.DeleteFruit(j)y=y+1 
task.wait(.7)end
 
task.wait(.1)yJ()l.Fruit.UpdateStatusFruit("\226\156\133 Removed fruits. Looking for more.. please wait.")
return true end
 end
)
return true end
}l.UpdateCurrentPlantsInFarm=
function()if not i.ShovelDropDown then
 
return end
 
local G=l.Plant.GetAllAvailablePlants()if G then
 i.ShovelDropDown:SetValues(I(G))i.ShovelDropDown:SetValue(c.shovel_plants_list,true)end
 end
 S.AlreadyDeletedSprinklers={}S.Sprinklers={PlacedSprinklers={},DeleteSprinklers=
function()if S.Is_MasterBusy()then
 
return false end
 if not T.auto_remove_sprinklers then
 
return false end
 
local G=next(T.auto_remove_sp_list)if not G then
 
return false end
 if bJ()then
 
return false end
 
local V=false for G,y in pairs(T.auto_remove_sp_list)do
 if not T.auto_remove_sprinklers then
 
return false end
 if S.Is_MasterBusy()then
 
return false end
 
local Z=E.GetObjectsUsingName(G)if#Z>0 then
 
local y=r.GetShovel()if not y then
 continue end
 if not V then
 yJ()
task.wait(.1)if not VJ(y)then
 break end
 
task.wait(.2)V=true end
 for V,Z in pairs(Z)do
 if not T.auto_remove_sprinklers then
 break end
 if S.Is_MasterBusy()then
 break end
 if not zJ(y)then
 VJ(y)
task.wait(.2)if not zJ(y)then
 break end
 end
 E.DeleteObject(Z)
task.wait(.9)S.AlreadyDeletedSprinklers[G]=true end
 end
 end
 if V then
 yJ()end
 
return true end
,AutoPlaceSprinklersTemp=
function()if S.Is_MasterBusy()then
 
return false end
 if not c.enable_autoplacesprinklers then
 
return false end
 
local G=c.autoplacesprinklers or{}if next(G)==nil then
 
return false end
 if not E.Garden.GetIsNormalGarden()then
 
return false end
 
local V=E.GetCenterPlacementPoint()if not V then
 
return false end
 for G,y in pairs(G)do
 if not c.enable_autoplacesprinklers then
 break end
 if S.Is_MasterBusy()then
 break end
 
local Z=E.GetSprinklerOnFarm(G)if Z then
 S.Sprinklers.PlacedSprinklers[G]=true continue end
 if S.Sprinklers.PlacedSprinklers[G]then
 continue end
 
local j=r.GetSprinklerUsingName(G)if not j then
 continue end
 yJ()
task.wait(.1)VJ(j)
task.wait(.2)r.PlaceSprinkler(V)
task.wait(.7)end
 if bJ()then
 yJ()end
 
return true end
}
local AJ={}
local 
function xJ(G)
local V=string.match(G,"{(.-)}")
return"{"..(V.."}")end
 
local 
function CJ()
local G={}for V,y in pairs(AJ)do
 table.insert(G,y)end
 table.sort(G)
return G end
 W.GetSortedList=
function(G,V)
local y={table.unpack(G)}table.sort(y,
function(G,y)
local Z=V[G]
local j=V[y]if Z and not j then
 
return true 
elseif j and not Z then
 
return false end
 
return G<y end
)
return y end
 
local 
function DJ(G)
local V={}if not G then
 
return V end
 for G,y in ipairs(G)do
 
local Z=AJ[y]if Z then
 V[Z]=true end
 end
 
return V end
 
local 
function PJ()
local G=V.Players.LocalPlayer.PlayerGui.ActivePetUI.Frame.Main.Holder.Header.Title if not G then
 
return 8 end
 
local y=G.Text 
local Z=string.match(y,"/(%d+)")if Z then
 
return tonumber(Z)end
 
warn("Could not find the maximum pet count in the text: "..y)
return 8 end
 Z.CLEAN_TEXT=""S.CleanSystem={RequiresClean=
function(G)
local V=WJ(G)if not V then
 
return false end
 
local y=T.clean_pet_type or{}
local j=T.clean_mut_list or{}if next(y)==nil then
 Z.CLEAN_TEXT="\226\154\160\239\184\143 Waiting: no pet types selected."
return false end
 if next(j)==nil then
 Z.CLEAN_TEXT="\226\154\160\239\184\143 Waiting: no mutations selected."
return false end
 
local i=V.PetData if not i then
 
return false end
 
local c=V.PetType 
local J=i.MutationType 
local d=Y.AllMutationListEnum[J]if not d then
 
return false end
 if not y[c]then
 
return false end
 if j[d]then
 
return true,V,d end
 
return false end
,CleanPetUsingShard=
function(G)
local y=V.GameEvents.PetShardService_RE y:FireServer("ApplyShard",G)end
;RemoveMutationOnPet=
function()
local G=T.clean_pet_type or{}
local V=T.clean_mut_list or{}if next(G)==nil then
 Z.CLEAN_TEXT="\226\154\160\239\184\143 Waiting: no pet types selected."
return end
 if next(V)==nil then
 Z.CLEAN_TEXT="\226\154\160\239\184\143 Waiting: no mutations selected."
return end
 
local y=E.GetActivePetsParts()or{}
local j=0 
local i=0 
local c=0 Z.CLEAN_TEXT="\240\159\148\141 Scanning pets on farm..."for G,V in ipairs(y)do
 j+=1 
local y=V:GetAttribute("UUID")
local J,T,d=S.CleanSystem.RequiresClean(y)if J then
 
local G=T and T.PetType or"Unknown"Z.CLEAN_TEXT=string.format("\240\159\167\188 Cleaning %s (%s) Checked: %d | Cleaned: %d | Skipped: %d",tostring(G),tostring(d or"?"),j,i,c)
local y=r.GetCleansingPetShard()if not y then
 Z.CLEAN_TEXT=string.format("\226\157\140 No cleansing shard found. Checked: %d | Cleaned: %d | Skipped: %d",j,i,c)break end
 if not fJ(y)then
 VJ(y)
task.wait(.2)end
 
local J=false for V,y in ipairs(V:GetChildren())do
 if y:IsA("Model")then
 S.CleanSystem.CleanPetUsingShard(y)i+=1 J=true Z.CLEAN_TEXT=string.format("\226\156\133 Shard used on %s (%s) Checked: %d | Cleaned: %d | Skipped: %d",tostring(G),tostring(d or"?"),j,i,c)
task.wait(.8)end
 end
 if not J then
 Z.CLEAN_TEXT=string.format("\226\154\160\239\184\143 %s needs clean, but no pet model found. Checked: %d | Cleaned: %d | Skipped: %d",tostring(G),j,i,c)end
 
else
 c+=1 if j%5==0 then
 Z.CLEAN_TEXT=string.format("\240\159\148\141 Scanning pets... Checked: %d | Cleaned: %d | Skipped: %d",j,i,c)end
 end
 end
 Z.CLEAN_TEXT=string.format(" Checked: %d | Cleaned: %d | Skipped: %d",j,i,c)end
,CleanPetsOnFarm=
function()if not T.clean_system_enabled then
 Z.CLEAN_TEXT="\240\159\148\180 Cleanse system disabled."
return end
 S.CleanSystem.RemoveMutationOnPet()end
}Y.TEXT_STATUS=""Y.UI={GetText_LevelingTeam=
function()
local G=#c.mut_support_team 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FFD700\"><b>\226\173\144 Leveling Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
;GetText_TargetTeam=
function()
local G=#c.mut_target_pets_uuid 
local V=99 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00BFFF\"><b>\240\159\167\170 Target Pets</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
,GetText_TeamCooldown=
function()
local G=#c.mut_mutation_machineteam 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FFB700\"><b>\226\143\179 Cooldown Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
;GetText_TeamClaimPet=
function()
local G=#c.mut_claimpet_team 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#27F542\"><b>\226\156\168 Pet Claim Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
,GetText_MutationList=
function()
local G=0 for V,y in pairs(c.mut_target_mutations)do
 G=G+1 end
 
local V=I(Y.AllMutationsList)
local y=#V 
local Z=G>=y and"#FF5555"or"#00FF99"
local j=string.format("<font color=\"#FF009F\"><b>\240\159\167\172 Wanted Mutations</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",Z,G,y)
return j end
,UpdateInformation=
function() end
;UpdateStats=
function(G)if j.lbl_mutation_machine_status then
 j.lbl_mutation_machine_status:SetText(G)end
 Y.TEXT_STATUS=G end
,UpdateTeamsDropdowns=
function()if not i.dropdown_support_team or not i.dropdown_target_team or not i.dropdown_mut_cd_team or not i.dropdown_claimpet_team then
 
return false end
 
local G=CJ()i.dropdown_support_team:SetValues(G)i.dropdown_target_team:SetValues(G)i.dropdown_mut_cd_team:SetValues(G)i.dropdown_claimpet_team:SetValues(G)
local V=true i.dropdown_support_team:SetValue(DJ(c.mut_support_team),V)i.dropdown_target_team:SetValue(DJ(c.mut_target_pets_uuid),V)i.dropdown_mut_cd_team:SetValue(DJ(c.mut_mutation_machineteam),V)i.dropdown_claimpet_team:SetValue(DJ(c.mut_claimpet_team),V)end
}Y.SubmitHeldPet=
function()
local G,y=
pcall(
function()V.MutationService:FireServer("SubmitHeldPet")end
)if y then
 
warn(y)end
 
return G end
 Y.ClaimMutatedPet=
function()
local G,y=
pcall(
function()V.MutationService:FireServer("ClaimMutatedPet")end
)if y then
 
warn(y)end
 
return G end
 Y.StartMachine=
function()
local G,y=
pcall(
function()V.MutationService:FireServer("StartMachine")end
)if y then
 
warn(y)end
 
return G end
 Y.CancelMachine=
function()
local G,y=
pcall(
function()V.MutationService:FireServer("CancelMachine")end
)if y then
 
warn(y)end
 
return G end
 Y.InsertPetBackIntoTargetList=
function(G)if not G or G==""then
 
return false end
 for V,y in ipairs(c.mut_target_pets_uuid)do
 if y==G then
 
return false end
 end
 table.insert(c.mut_target_pets_uuid,G)n()
return true end
 Y.IsAllowedTargetTeamPet=
function(G)
local V={c.mut_mutation_machineteam,c.mut_support_team,c.mut_claimpet_team}for V,y in ipairs(V)do
 for V,y in ipairs(y)do
 if y==G then
 
return false end
 end
 end
 
return true end
 Y.MakeLevelingTeam=
function(G)
local V={}
local y=0 
local Z=#c.mut_support_team 
local j=G 
local i=PJ()-Z if i>0 then
 for G,Z in ipairs(c.mut_support_team)do
 table.insert(V,Z)y=y+1 end
 
local G=PJ()for Z,j in ipairs(j)do
 if y>=G then
 break end
 table.insert(V,j)y=y+1 end
 end
 
return V end
 Y.GetAvailablePetsForLeveling=
function()
local G={}for V,y in ipairs(c.mut_target_pets_uuid)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.UUID 
local i=Z.PetData 
local J=Z.PetType 
local T=Z.PetAbility 
local d=i.HatchedFrom 
local u=i.IsFavorite 
local q=i.Boosts 
local g=i.Name 
local E=i.LevelProgress 
local a=i.EggName 
local H=i.Level 
local r=i.Hunger 
local e=i.BaseWeight 
local s=i.MutationType 
local N=Y.AllMutationListEnum[s]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[N]then
 
else
 if H>=c.mut_required_level then
 
else
 table.insert(G,y)end
 end
 end
 end
 
return G end
 Y.GetHasPetsReachedMaxLevelMutationGoal=
function(G)if not G then
 
return false end
 
local V=false for G,y in ipairs(G)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.UUID 
local i=Z.PetData 
local J=Z.PetType 
local T=Z.PetAbility 
local d=i.HatchedFrom 
local u=i.IsFavorite 
local q=i.Boosts 
local g=i.Name 
local E=i.LevelProgress 
local a=i.EggName 
local H=i.Level 
local r=i.Hunger 
local e=i.BaseWeight 
local s=i.MutationType 
local N=Y.AllMutationListEnum[s]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[N]then
 if H>=100 then
 
local G={PetType=J,MutationType=s;Name=g;Level=H}table.insert(Y.MaxLevelReachedWantedPets_webhook,G)V=true end
 end
 end
 end
 
return V end
 Y.GetPetsToMaxLevelMetMutationGoal=
function()
local G={}for V,y in ipairs(c.mut_target_pets_uuid)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.PetData 
local i=j.Level 
local J=j.MutationType 
local T=Y.AllMutationListEnum[J]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[T]then
 if i<100 then
 table.insert(G,y)end
 end
 end
 end
 
return G end
 Y.GetPetsReachedMutationLevelRequirement=
function(G)
local V={}for G,y in ipairs(G)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.PetData 
local i=j.Level 
local J=j.MutationType 
local T=Y.AllMutationListEnum[J]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[T]then
 continue end
 end
 if i>=c.mut_required_level then
 table.insert(V,y)end
 end
 
return V end
 Y.GetPetsNotReadyForSubmit=
function()
local G={}
local V={}for y,Z in ipairs(c.mut_target_pets_uuid)do
 
local j=WJ(Z)if not j then
 continue end
 
local i=j.PetData 
local J=i.Level 
local T=i.MutationType or""
local d=i.Name 
local u="#E62500"if J>=c.mut_required_level then
 u="#00D61A"end
 
local q=string.format("%s Lv.(<font color=\'%s\'>%s</font>/%s)",d,u,J,c.mut_required_level)
local g=Y.AllMutationListEnum[T]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[g]then
 
else
 if J<c.mut_required_level then
 table.insert(G,Z)table.insert(V,q)end
 end
 end
 end
 
return G,V end
 Y.GetPetsReadyForSubmit=
function()
local G={}for V,y in ipairs(c.mut_target_pets_uuid)do
 
local Z=WJ(y)if not Z then
 continue end
 
local j=Z.UUID 
local i=Z.PetData 
local J=Z.PetType 
local T=Z.PetAbility 
local d=i.HatchedFrom 
local u=i.IsFavorite 
local q=i.Boosts 
local g=i.Name 
local E=i.LevelProgress 
local a=i.EggName 
local H=i.Level 
local r=i.Hunger 
local e=i.BaseWeight 
local s=i.MutationType 
local N=Y.AllMutationListEnum[s]if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[N]then
 
else
 if H>=c.mut_required_level then
 table.insert(G,y)end
 end
 end
 end
 
return G end
 Y.Status={STATE_LEVEL="STATE_LEVEL";START_MUTATION="START_MUTATION";SKIP="SKIP",CLAIM_PET="CLAIM_PET";SUBMIT_PET="SUBMIT_PET";TURN_LEVEL="levelteam";TURN_CD="cooldownteam"}Y.SetNewTurn=
function(G)c.mut_batch_process_turn=G n()end
 Y.GetCurrentTurn=
function()
local G=Y.Status.TURN_LEVEL 
local V=(c and c.mut_batch_process_turn)or G 
local y={[Y.Status.TURN_LEVEL]=true;[Y.Status.TURN_CD]=true}if not y[V]then
 V=G end
 
return V end
 Y.GetCurrentStatus=
function()
return Y.MutMachine.GetCurrentStatus()end
 z.SentWebHookMaxLevelTrack={}z.SentWebHookMutationTrack={}z.SentWebHookMutationWeightTrack={}z.State={idle="idle",mutation="mutation",baseweight="baseweight",level="level";max_level="max_level"}z.mut_ui={UpdateStats=
function(G)if j.lbl_pet_mutation_status then
 j.lbl_pet_mutation_status:SetText(G)end
 Y.TEXT_STATUS=G end
,GetText_TargetTeam=
function()
local G=#T.mut_system.targetteam 
local V=200 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00BFFF\"><b>\240\159\167\160 Target Pets</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
;GetText_MaxLevelTeam=
function()
local G=#T.mut_system.maxlevel_team 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00FF3C\"><b>\226\156\168 Max Leveling Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
;GetText_XpTeam=
function()
local G=#T.mut_system.xpteam 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FFD700\"><b>\240\159\142\150\239\184\143 XP Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
,GetText_FillerTeam=
function()
local G=#T.mut_system.filler_team 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FFD700\"><b>\240\159\148\183 Filler Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
,GetText_PetMutation=
function()
local G=#T.mut_system.mut_team 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FF00F1\"><b>\240\159\144\142 Horseman Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
;GetText_PetBaseWeightTeam=
function()
local G=#T.mut_system.baseweight_team 
local V=PJ()-1 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FAFF3D\"><b>\240\159\144\152 Elephant Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
,UpdateTeamsDropdowns=
function()if not i.dropdown_petmutation_maxlevelteam or not i.dropdown_petmut_xpteam or not i.dropdown_pettargetteam or not i.dropdown_petmutationteam or not i.dropdown_petbaseweightteam or not i.dropdown_petfiller_team then
 
return false end
 
local G=CJ()
local V=true 
local y=DJ(T.mut_system.maxlevel_team)
local Z=DJ(T.mut_system.xpteam)
local j=DJ(T.mut_system.targetteam)
local c=DJ(T.mut_system.mut_team)
local J=DJ(T.mut_system.baseweight_team)
local d=DJ(T.mut_system.filler_team)
local u=W.GetSortedList(G,y)i.dropdown_petmutation_maxlevelteam:SetValues(u)i.dropdown_petmutation_maxlevelteam:SetValue(y,V)
local q=W.GetSortedList(G,Z)i.dropdown_petmut_xpteam:SetValues(q)i.dropdown_petmut_xpteam:SetValue(Z,V)
local g=W.GetSortedList(G,j)i.dropdown_pettargetteam:SetValues(g)i.dropdown_pettargetteam:SetValue(j,V)
local E=W.GetSortedList(G,c)i.dropdown_petmutationteam:SetValues(E)i.dropdown_petmutationteam:SetValue(c,V)
local a=W.GetSortedList(G,J)i.dropdown_petbaseweightteam:SetValues(a)i.dropdown_petbaseweightteam:SetValue(J,V)
local H=W.GetSortedList(G,d)i.dropdown_petfiller_team:SetValues(H)i.dropdown_petfiller_team:SetValue(d,V)end
}z.mut={is_running=false;IsAllowedPet=
function(G)
local V={T.mut_system.xpteam,T.mut_system.mut_team,T.mut_system.maxlevel_team,T.mut_system.baseweight_team,T.mut_system.filler_team,T.agebreak.target_team,T.agebreak.dup_team}for V,y in ipairs(V)do
 for V,y in ipairs(y)do
 if y==G then
 
return false end
 end
 end
 
return true end
,IsNotInTargetTeamPet=
function(G)
local V={T.mut_system.targetteam}for V,y in ipairs(V)do
 for V,y in ipairs(y)do
 if y==G then
 
return false end
 end
 end
 
return true end
,GetPetsNotReachedWantedMut=
function(G,V)
local y={}
local Z=tonumber(T.mut_system.required_weight)or 2.1 
local j=tonumber(T.mut_system.lvl_baseweight)or 40 
local i=tonumber(T.mut_system.level)or 40 
local c=T.mut_system.is_baseweight_mode for G,c in ipairs(G)do
 
local J=WJ(c)if not J then
 continue end
 
local d=J.PetData 
local u=d.Level 
local q=d.MutationType or""
local g=d.BaseWeight 
local E=false 
local a=false 
local H=k(g,1)
local r=Y.AllMutationListEnum[q]or""if T.mut_system.wanted[r]then
 E=true end
 if H>=Z then
 a=true end
 if V=="mut"then
 if not E and u<i then
 table.insert(y,c)end
 
elseif V=="weight"then
 if not a and u<j then
 table.insert(y,c)end
 end
 end
 
return y end
;SwapPetsMutation=
function() end
,HasPetsReachedRequiredMutations_OnFarm=
function(G,V,y)
local Z={}
local j={}
local i=tonumber(T.mut_system.required_weight)or 2.1 
local c=tonumber(T.mut_system.lvl_baseweight)or 40 
local J=T.mut_system.level or 40 for G,c in ipairs(G)do
 
local J=WJ(c)if not J then
 continue end
 
local d=J.UUID 
local u=J.PetData 
local q=J.PetType 
local g=u.Name 
local E=u.LevelProgress 
local a=u.EggName 
local H=u.Level 
local r=u.Hunger 
local e=u.BaseWeight 
local s=u.MutationType or""
local N=k(e,1)
local X={PetType=q,MutationType=s;Name=g,Level=H;Weight=N,IsWeight=false}
local h=Y.AllMutationListEnum[s]or"N/A"
local l={}
local B=false if N>=i then
 B=true end
 
local L=T.mut_system.wanted for G,V in pairs(L)do
 table.insert(l,G)end
 
local m=table.concat(l,", ")
local K="#E62500"if T.mut_system.wanted[h]then
 K="#00D61A"end
 
local b=h 
local S=m 
local f=string.format("%s (%s)",W.ShortName(q),g)if y=="weight"then
 if not B then
 K="#E62500"
else
 K="#00D61A"end
 b=string.format("%.2f KG",N)S=string.format("%.2f KG",i)end
 
local t=string.format("%s Mut.(<font color=\'%s\'>%s</font>/%s)",f,K,b,S)if V[c]then
 t=string.format("<font color=\'#00C745\'>%s</font> Mut.(<font color=\'%s\'>%s</font>/%s)",f,K,b,S)end
 table.insert(j,t)if not V[c]then
 continue end
 if y=="mut"then
 if T.mut_system.wanted[h]then
 table.insert(Z,c)if not z.SentWebHookMutationWeightTrack[c]then
 table.insert(D,X)z.SentWebHookMutationWeightTrack[c]=true end
 end
 continue end
 if y=="weight"then
 if N>=i then
 X.IsWeight=true table.insert(Z,c)if not z.SentWebHookMutationTrack[c]then
 table.insert(D,X)z.SentWebHookMutationTrack[c]=true end
 end
 continue end
 end
 
return Z,j end
;HasPetReachedMaxLevel=
function(G,V,y)
local Z={}
local j={}
local i=T.mut_system.is_baseweight_mode or false 
local c=T.mut_system.turbo_xp_teams 
local J=tonumber(T.mut_system.turbo_max_level)or 25 
local d=tonumber(T.mut_system.custom_max_level)or 100 
local u=T.mut_system.only_level_mode for G,T in ipairs(G)do
 
local q=WJ(T)if not q then
 continue end
 
local g=q.UUID 
local E=q.PetData 
local a=q.PetType 
local H=q.PetAbility 
local r=E.HatchedFrom 
local e=E.IsFavorite 
local s=E.Boosts 
local N=E.Name 
local X=E.LevelProgress 
local h=E.EggName 
local l=E.Level 
local B=E.Hunger 
local L=E.BaseWeight 
local m=E.MutationType 
local K=k(L,1)
local b={PetType=a,MutationType=m,Name=N;Level=l}
local S="#E62500"if l>=d then
 S="#00D61A"end
 
local f=d 
local t=false 
local M=""if i then
 M=string.format("<font color=\'#FF00FF\'>[%.2f KG]</font>",K)end
 
local A=string.format("%s (%s)",W.ShortName(a),N)
local x=string.format("%s Lv.(<font color=\'%s\'>%s</font>/%s) %s",A,S,l,f,M)if V[T]then
 x=string.format("<font color=\'#00C745\'>%s</font> Lv.(<font color=\'%s\'>%s</font>/%s) %s",A,S,l,f,M)t=true end
 
local C={isActive=t;text=x}table.insert(j,C)if not V[T]then
 continue end
 if u then
 if l>=d then
 table.insert(Z,T)if not z.SentWebHookMaxLevelTrack[T]then
 table.insert(Y.MaxLevelReachedWantedPets_webhook,b)z.SentWebHookMaxLevelTrack[T]=true end
 end
 continue end
 
local D=Y.AllMutationListEnum[m]if c and(not y and l<d)then
 if l>=J then
 y=true table.insert(Z,T)end
 
else
 if l>=d then
 table.insert(Z,T)if not z.SentWebHookMaxLevelTrack[T]then
 table.insert(Y.MaxLevelReachedWantedPets_webhook,b)z.SentWebHookMaxLevelTrack[T]=true end
 end
 end
 end
 
local q={}for G,V in ipairs(j)do
 if V.isActive then
 table.insert(q,V.text)end
 end
 for G,V in ipairs(j)do
 if not V.isActive then
 table.insert(q,V.text)end
 end
 
return Z,q,y end
,HasPetReachedRequiredLevel=
function(G,V,y)
local Z={}
local j={}
local i=tonumber(T.mut_system.level)or 40 
local c=tonumber(T.mut_system.lvl_baseweight)or 40 
local J=T.mut_system.is_baseweight_mode 
local d=tonumber(T.mut_system.required_weight)or 2.1 
local u=T.mut_system.turbo_xp_teams 
local q=tonumber(T.mut_system.turbo_max_level)or 25 
local g=false 
local E=T.mut_system.mut_team or{}
local a=false if J and#E==0 then
 a=true end
 if T.mut_system.disable_horseman then
 a=true end
 for G,E in ipairs(G)do
 
local H=WJ(E)if not H then
 continue end
 
local r=H.UUID 
local e=H.PetData 
local s=H.PetType 
local N=H.PetAbility 
local X=e.HatchedFrom 
local h=e.IsFavorite 
local l=e.Boosts 
local B=e.Name 
local L=e.LevelProgress 
local m=e.EggName 
local K=e.Level 
local b=e.Hunger 
local S=e.BaseWeight 
local z=e.MutationType or""
local f=k(S,1)
local t=false 
local M=false 
local A=Y.AllMutationListEnum[z]or""if T.mut_system.wanted[A]then
 t=true end
 if a then
 t=true end
 if f>=d then
 M=true end
 
local x="#E62500"
local C=i if J and t then
 C=c end
 if K>=C then
 x="#00D61A"end
 
local D=""if J then
 D=string.format("<font color=\'#FF00FF\'>[%.2f KG]</font>",f)end
 
local P=string.format("%s (%s)",W.ShortName(s),B)
local O=string.format("%s Lv.(<font color=\'%s\'>%s</font>/%s) %s",P,x,K,C,D)if V[E]then
 O=string.format("<font color=\'#00C745\'>%s</font> Lv.(<font color=\'%s\'>%s</font>/%s) %s",P,x,K,C,D)end
 table.insert(j,O)if not V[E]then
 end
 if not t then
 if K>=i then
 table.insert(Z,E)continue end
 end
 if J and not M then
 if K>=c then
 table.insert(Z,E)continue end
 end
 if u then
 if not y then
 if K>=q then
 table.insert(Z,E)g=true end
 
else
 end
 end
 end
 
return Z,j,g end
;DoesPetNeedToBeCleaned=
function(G)
local V=WJ(G)if not V then
 
return true end
 
local y=V.UUID 
local Z=V.PetData 
local j=V.PetType 
local i=V.PetAbility 
local c=Z.HatchedFrom 
local J=Z.IsFavorite 
local d=Z.Boosts 
local u=Z.Name 
local q=Z.LevelProgress 
local g=Z.EggName 
local E=Z.Level 
local a=Z.Hunger 
local H=Z.BaseWeight 
local r=Z.MutationType 
local e=Y.AllMutationListEnum[r]if not e then
 
return false end
 if not T.mut_system.wanted[e]then
 
return true end
 
return false end
;ApplyPetCleaningShard=
function(G)
local y=V.GameEvents.PetShardService_RE y:FireServer("ApplyShard",G)end
,CleanPet=
function(G)
local V={}for G,y in ipairs(G)do
 V[y]=true end
 
local y=E.GetActivePetsParts()for G,y in ipairs(y)do
 
local Z=y:GetAttribute("UUID")if V[Z]then
 if z.mut.DoesPetNeedToBeCleaned(Z)then
 
local G=r.GetCleansingPetShard()if not G then
 break end
 yJ()
task.wait(.2)if VJ(G)then
 for G,V in ipairs(y:GetChildren())do
 if V:IsA("Model")then
 z.mut.ApplyPetCleaningShard(V)
task.wait(1.2)yJ()break end
 end
 end
 
else
 end
 end
 end
 end
,AddedTeamGetLevelChecks=
function(G)
local V={}
local y=T.mut_system.turbo_xp_teams 
local Z=tonumber(T.mut_system.turbo_max_level)or 25 
local j=tonumber(T.mut_system.level)
local i=tonumber(T.mut_system.lvl_baseweight)
local c=T.mut_system.is_baseweight_mode 
local J=tonumber(T.mut_system.required_weight)or 2.1 for G,j in ipairs(G)do
 
local d=WJ(j)if not d then
 continue end
 
local u=d.UUID 
local q=d.PetData 
local g=d.PetType 
local E=d.PetAbility 
local a=q.Name 
local H=q.Level 
local r=q.BaseWeight 
local e=q.MutationType 
local s=k(r,1)
local N=Y.AllMutationListEnum[e]
local W=false 
local X=false 
local h=false if T.mut_system.wanted[N]then
 W=true end
 if s>=J then
 X=true end
 if H>=i then
 h=true end
 if W and not c then
 continue end
 if W and X then
 continue end
 if c then
 if h then
 continue end
 end
 if y then
 if H<Z then
 table.insert(V,j)end
 end
 end
 
return V end
;HasPetMetLevelRequirements=
function(G) end
;FindTeamToUse=
function(G)
local V={}
local y={}
local Z={}
local j=T.mut_system.turbo_xp_teams 
local i=tonumber(T.mut_system.turbo_max_level)or 25 
local c=tonumber(T.mut_system.level)
local J=tonumber(T.mut_system.lvl_baseweight)
local d=T.mut_system.is_baseweight_mode 
local u=tonumber(T.mut_system.required_weight)or 2.1 for G,j in ipairs(G)do
 
local c=WJ(j)if not c then
 continue end
 
local J=c.PetData 
local T=c.PetType 
local d=J.Name 
local u=J.Level 
local q=J.BaseWeight 
local g=J.MutationType 
local E=k(q,1)if u<i then
 table.insert(y,j)
else
 table.insert(Z,j)end
 table.insert(V,j)end
 
return y,Z,V end
;PetPetIntoATeam=
function(G,V)
local y=PJ()-#G 
local Z=0 
local j={}
local i={}
local c=T.mut_system.single_unit_allowed 
local J=PJ()
local d=T.mut_system.filler_team or{}
local u=#d 
local q={}if y>0 then
 for G,V in ipairs(G)do
 table.insert(i,V)q[V]=true Z=Z+1 end
 
local y=0 for G,V in ipairs(V)do
 if Z>=J then
 break end
 if c then
 if y==1 then
 break end
 end
 table.insert(i,V)j[V]=true q[V]=true Z=Z+1 y=y+1 end
 end
 if#i<J and u>0 then
 for G,V in ipairs(d)do
 if q[V]then
 continue end
 if c then
 break end
 
local y=WJ(V)if not y then
 continue end
 table.insert(i,V)Z=Z+1 if Z>=J then
 break end
 end
 end
 
return i,j end
,AdvancedTeamMaker=
function(G,V)
local y=false 
local Z=false 
local j=W.CloneArray(T.mut_system.xpteam)
local i=W.CloneArray(T.mut_system.maxlevel_team)
local c=T.mut_system.turbo_xp_teams 
local J={}
local d={}if c then
 
local V,c,T=z.mut.FindTeamToUse(G)if#V>0 then
 y=true 
local G,Z=z.mut.PetPetIntoATeam(j,V)J=G d=Z 
elseif#c>0 then
 Z=true 
local G,V=z.mut.PetPetIntoATeam(i,c)J=G d=V end
 
else
 
local c,T,u=z.mut.FindTeamToUse(G)if V then
 
local G,V=z.mut.PetPetIntoATeam(i,u)J=G d=V Z=true 
else
 
local G,V=z.mut.PetPetIntoATeam(j,u)J=G d=V y=true end
 end
 
return J,d,Z end
,SmartGenTeam_MaxLevel=
function(G,V)
local y={}
local Z={}
local j=T.mut_system.turbo_xp_teams 
local i=PJ()
local c=false 
local J=false if j then
 
local V=z.mut.AddedTeamGetLevelChecks(G)
warn("Turbo mode "..#V)if#V>0 then
 
local G=0 for V,Z in ipairs(T.mut_system.xpteam)do
 table.insert(y,Z)G=G+1 end
 if G<i then
 for V,j in ipairs(V)do
 table.insert(y,j)Z[j]=true G=G+1 if G>=i then
 break end
 if T.mut_system.single_unit_allowed then
 break end
 end
 end
 
else
 
warn("Not found any pets under minimum level")J=true end
 if#y>0 then
 c=true 
return y,Z,c end
 end
 
local d={}if V then
 d=W.CloneArray(T.mut_system.maxlevel_team)if#d==0 then
 c=false d=W.CloneArray(T.mut_system.xpteam)
else
 c=true end
 
else
 d=W.CloneArray(T.mut_system.xpteam)if#d==0 then
 c=true d=W.CloneArray(T.mut_system.maxlevel_team)
else
 c=false end
 end
 if J then
 d=W.CloneArray(T.mut_system.maxlevel_team)if#d==0 then
 c=false d=W.CloneArray(T.mut_system.xpteam)
else
 c=true end
 end
 
local u=PJ()-#d 
local q=0 if u>0 then
 for G,V in ipairs(d)do
 table.insert(y,V)q=q+1 end
 
local V=0 for G,j in ipairs(G)do
 if q>=i then
 break end
 if T.mut_system.single_unit_allowed then
 if V==1 then
 break end
 end
 table.insert(y,j)Z[j]=true q=q+1 V=V+1 end
 end
 
return y,Z,c end
,GenTeam=
function(G,V)
local y={}
local Z={}
local j=0 
local i=#G 
local c=V 
local J=PJ()-i if J>0 then
 for G,V in ipairs(G)do
 table.insert(y,V)j=j+1 end
 
local V=PJ()
local i=0 for G,c in ipairs(c)do
 if j>=V then
 break end
 if T.mut_system.single_unit_allowed then
 if i==1 then
 break end
 end
 table.insert(y,c)Z[c]=true j=j+1 i=i+1 end
 end
 
return y,Z end
,GenTeamMutation=
function(G,V)
local y={}
local Z={}
local j=0 
local i=#V 
local c=G 
local J=PJ()-i if J>0 then
 for G,V in ipairs(V)do
 table.insert(y,V)j=j+1 end
 
local G=PJ()
local i=0 for V,c in ipairs(c)do
 if j>=G then
 break end
 if T.mut_system.single_unit_allowed then
 if i==1 then
 break end
 end
 table.insert(y,c)Z[c]=true j=j+1 i=i+1 end
 end
 
return y,Z end
,GetPetsNeedMutations=
function()
local G={}
local V={}
local y={}
local Z=tonumber(T.mut_system.required_weight)or 2.1 
local j=T.mut_system.is_baseweight_mode 
local i=tonumber(T.mut_system.lvl_baseweight)or 40 
local c=tonumber(T.mut_system.level)or 40 
local J=T.mut_system.wanted 
local d=T.mut_system.mut_team or{}
local u=false if j and#d==0 then
 u=true end
 if T.mut_system.disable_horseman then
 u=true end
 for G,V in ipairs(T.mut_system.targetteam)do
 
local Z=WJ(V)if not Z then
 continue end
 if u then
 continue end
 
local j=Z.UUID 
local i=Z.PetData 
local J=Z.PetType 
local d=i.Level 
local q=i.MutationType or""
local g=Y.AllMutationListEnum[q]or""if T.mut_system.wanted[g]then
 continue end
 if d<c then
 continue end
 table.insert(y,V)end
 if#y>0 then
 
return y,"mut"end
 for G,y in ipairs(T.mut_system.targetteam)do
 
local j=WJ(y)if not j then
 continue end
 
local c=j.UUID 
local J=j.PetData 
local T=j.PetType 
local d=J.Name 
local u=J.Level 
local q=J.BaseWeight 
local g=k(q,1)if g>=Z then
 continue end
 if u<i then
 continue end
 table.insert(V,y)end
 if j then
 if#V>0 then
 
return V,"weight"end
 end
 
return G,"N/A"end
;GetPetsNotReadyForMutations=
function()
local G={}
local V=tonumber(T.mut_system.required_weight)or 2.1 
local y=tonumber(T.mut_system.level)
local Z=tonumber(T.mut_system.lvl_baseweight)
local j=T.mut_system.turbo_xp_teams 
local i=tonumber(T.mut_system.turbo_max_level)or 25 
local c=T.mut_system.targetteam 
local J=T.mut_system.is_baseweight_mode 
local d=T.mut_system.mut_team 
local u=false if J and#d==0 then
 u=true end
 if T.mut_system.disable_horseman then
 u=true end
 for j,i in ipairs(c)do
 
local c=WJ(i)if not c then
 continue end
 
local d=c.UUID 
local q=c.PetData 
local g=c.PetType 
local E=c.PetAbility 
local a=q.HatchedFrom 
local H=q.IsFavorite 
local r=q.Boosts 
local e=q.Name 
local s=q.LevelProgress 
local N=q.EggName 
local W=q.Level 
local X=q.Hunger 
local h=q.BaseWeight 
local l=q.MutationType or""
local B=k(h,1)
local L=Y.AllMutationListEnum[l]or""
local m=false 
local K=false 
local b=false if T.mut_system.wanted[L]then
 m=true end
 if u then
 m=true end
 if B>=V then
 K=true end
 if m and not J then
 continue end
 if m and(K and J)then
 continue end
 if J and m then
 if B<V and W<Z then
 table.insert(G,i)continue end
 end
 if not m and W<y then
 table.insert(G,i)continue end
 end
 
return G end
,GetPetsRequireMaxLevelX=
function()
local G={}
local V=true 
local y=tonumber(T.mut_system.level)
local Z=tonumber(T.mut_system.lvl_baseweight)
local j=T.mut_system.is_baseweight_mode 
local i=tonumber(T.mut_system.required_weight)or 2.1 
local c=tonumber(T.mut_system.custom_max_level)or 100 
local J=false for y,Z in ipairs(T.mut_system.targetteam)do
 
local J=WJ(Z)if not J then
 continue end
 
local d=J.UUID 
local u=J.PetData 
local q=J.PetType 
local g=J.PetAbility 
local E=u.HatchedFrom 
local a=u.IsFavorite 
local H=u.Boosts 
local r=u.Name 
local e=u.LevelProgress 
local s=u.EggName 
local N=u.Level 
local W=u.Hunger 
local X=u.BaseWeight 
local h=u.MutationType or""
local l=k(X,1)
local B=Y.AllMutationListEnum[h]or""
local L=false 
local m=false 
local K=false if T.mut_system.wanted[B]then
 L=true end
 if l>=i then
 m=true end
 if N>=c then
 K=true end
 if K then
 continue end
 if j then
 if m and L then
 V=false continue end
 
else
 if L then
 V=false continue end
 end
 if not L then
 V=false end
 if j and not m then
 V=false end
 table.insert(G,Z)end
 if T.mut_system.max_lvl_batch then
 if not V then
 G={}
return G,J end
 end
 
return G,J end
,GetPetsRequireMaxLevel=
function()
local G={}
local V=true 
local y=tonumber(T.mut_system.level)
local Z=tonumber(T.mut_system.lvl_baseweight)
local j=T.mut_system.is_baseweight_mode 
local i=tonumber(T.mut_system.required_weight)or 2.1 
local c=tonumber(T.mut_system.custom_max_level)or 100 
local J=T.mut_system.only_level_mode 
local d=T.mut_system.mut_team 
local u=false if j and#d==0 then
 u=true end
 if T.mut_system.disable_horseman then
 u=true end
 
local q=false for y,Z in ipairs(T.mut_system.targetteam)do
 
local d=WJ(Z)if not d then
 continue end
 
local q=d.UUID 
local g=d.PetData 
local E=d.PetType 
local a=d.PetAbility 
local H=g.HatchedFrom 
local r=g.IsFavorite 
local e=g.Boosts 
local s=g.Name 
local N=g.LevelProgress 
local W=g.EggName 
local X=g.Level 
local h=g.Hunger 
local l=g.BaseWeight 
local B=g.MutationType or""
local L=k(l,1)
local m=Y.AllMutationListEnum[B]or""if X>=c then
 continue end
 if J then
 table.insert(G,Z)continue end
 
local K=T.mut_system.wanted[m]or false 
local b=L>=i 
local S=false if K then
 S=true end
 if u then
 S=true end
 if j then
 if K and b then
 S=true 
else
 S=false end
 end
 if u and j then
 if b then
 S=true end
 end
 if S then
 table.insert(G,Z)
else
 V=false end
 end
 if T.mut_system.max_lvl_batch then
 if not V then
 G={}
return G,q end
 end
 
return G,q end
}z.Turns={LEVEL="level",MUTATE="mutate"}z.UpdateTurn=
function(G)if G==z.Turns.LEVEL or G==z.Turns.MUTATE then
 T.mut_system.state=G R()end
 end
 z.GetCurrentTurn=
function()
return T.mut_system.state end
 Z.TEXT_SEED=""Z.TEXT_SEED_STATS=""Z.TEXT_SEED_INFO=""B.seedAnimState={frameIndex=1,colorIndex=1}B.IsActive=false B.Labels={updateLocation=
function(G)if Z.TEXT_SEED then
 Z.TEXT_SEED=G end
 end
,updateStats=
function(G)if Z.TEXT_SEED_STATS then
 Z.TEXT_SEED_STATS=G end
 end
,updateInformation=
function(G)if not Z.TEXT_SEED_INFO then
 
return end
 
local V=c.seed_keep_amount or 0 
local y={"\240\159\140\177 Planting Seeds","\240\159\140\191 Growing Dreams","\240\159\140\190 Sowing the Future","\240\159\140\187 Bloom Mode Active";"\240\159\141\128 Sprouting Life";"\240\159\140\184 Nature\'s Touch","\240\159\140\179 Seeding the Fields","\226\156\168 Auto-Planting","\240\159\170\180 Green Thumb Engaged";"\240\159\140\188 Growth in Progress"}
local j={"#FF4C4C";"#FFA500","#FFD700";"#32CD32";"#1E90FF","#8A2BE2","#FF69B4"}
local i=B.seedAnimState.frameIndex 
local J=B.seedAnimState.colorIndex 
local T=string.format("<font color=\'%s\'>%s</font>\n\n",j[J],y[i])i=i+1 if i>#y then
 i=1 end
 J=J+1 if J>#j then
 J=1 end
 B.seedAnimState.frameIndex=i B.seedAnimState.colorIndex=J 
local d={}for G,y in pairs(G)do
 
local Z=W.StringToColor3(G)or"#ffffff"
local j if y<V then
 j="#ff0000"
elseif y==V then
 j="#00ff00"
else
 j="#ffff00"end
 table.insert(d,string.format("<font color=\'%s\'>%s:</font> <font color=\'%s\'>%d / %d</font>",Z,G,j,y,V))end
 
local u=T..table.concat(d,"\n")Z.TEXT_SEED_INFO=u end
}B.Seeds={GetSeedsCounts=
function(G)
local V={}for G,y in pairs(G)do
 
local Z=r.GetSeedUsingName(G)if not Z then
 continue end
 
local j=r.GetSeedCountQuantity(Z)if j<=0 then
 continue end
 V[G]=j end
 if next(V)==nil then
 
return nil end
 
return V end
;GetSeedsToPlaceFiltered=
function()
local G=B.Seeds.GetSeedsCounts(c.seed_placement_list)if G==nil then
 
return nil end
 
local V 
local y,Z=
pcall(
function()
return E.GetPlantCountBySeedNamesPairs(G)end
)V=y and Z or nil if not V or next(V)==nil then
 
return nil end
 
local j=c.seed_keep_amount 
local i={}
local J={}for G,V in pairs(V)do
 if V<j then
 i[G]=j-V end
 end
 if next(i)==nil then
 
return nil end
 
return i,V end
}B.SeedLoop=
function()if S.Is_MasterBusy()then
 B.Labels.updateStats("\226\143\184\239\184\143 Paused: tasks in progress...")
return false end
 if not c.is_auto_seed then
 if not B.IsActive then
 B.Labels.updateStats("\240\159\148\180 Auto-Seed Disabled")
return false 
else
 B.Labels.updateStats("\240\159\159\161 Auto-Seed Running (Manual)")end
 
else
 B.Labels.updateStats("\240\159\159\162 Auto-Seed Running")end
 
local G,y=B.Seeds.GetSeedsToPlaceFiltered()if not G then
 if not c.is_auto_seed then
 B.Labels.updateStats("\240\159\148\180 No seeds to place...")B.IsActive=false Z.Notify("Stopping seed placement.",2)
return false end
 B.Labels.updateStats("\240\159\159\161 No seeds to place...")
return false end
 
local j=E.mFarm.Center_Point.Position 
local i=XJ(j)
local J=i[math.random(1,#i)]
local T=V.Character:WaitForChild("HumanoidRootPart")
local d=T.CFrame 
local q=c.is_seed_random 
local g=c.is_seedplace_center 
local H=c.seed_keep_amount 
local Y if not q then
 Y=W.StringToVector3(c.seed_location_vector)if not Y then
 B.Labels.updateStats("\240\159\148\180 Location is not valid, please select a new location.")
return false end
 if a.IsWithinRangeOfFarm(j,Y)then
 B.Labels.updateStats("\240\159\148\180 Current Location is not within your farm.")
return false end
 end
 
local e=a.GetCurrentCFrameFromPlayerString()
local s=a.StringToVector3(e)
local N=false if a.IsWithinRangeOfFarm(j,s)then
 v(W.Vector3ToCFrame(j))N=true end
 if Y then
 J=Y end
 B.IsActive=true B.Labels.updateStats("\240\159\140\177 Attempting to place seeds...")for G,V in pairs(G)do
 
task.wait()if not B.IsActive then
 
return false end
 if Z.is_garden_full_seed then
 B.Labels.updateStats("\226\143\184\239\184\143 Garden is full")
return false end
 
local j=r.GetSeedUsingName(G)if not j then
 continue end
 yJ()if not VJ(j)then
 continue end
 
task.wait(.1)for V=1,V,1 do
 
task.wait()if not B.IsActive then
 
return false end
 if Z.is_garden_full_seed then
 B.Labels.updateStats("\226\143\184\239\184\143 Garden is full")
return false end
 
local T=30 if S.Is_MasterBusy()then
 B.Labels.updateStats("\226\143\184\239\184\143 Paused: tasks in progress...")
return false end
 B.Labels.updateStats("\240\159\140\177 Attempting to place seeds...")if g==true then
 J=E.GetCenterPlacementPoint()
else
 if q==true then
 J=i[math.random(1,#i)]end
 end
 if not j then
 
return false end
 if not zJ(j)then
 if not j then
 
return false end
 yJ()if not VJ(j)then
 
return false end
 
task.wait(.3)end
 if y[G]~=nil then
 if y[G]>=H then
 B.Labels.updateInformation(y)break end
 end
 if y[G]~=nil then
 u.PlantSeed(J,G)y[G]=y[G]+1 end
 B.Labels.updateInformation(y)
local d=c.seed_speed_timer1 
task.wait(d)end
 end
 if N then
 v(d)end
 yJ()B.IsActive=false B.Labels.updateStats("\240\159\159\162 Seed placements complete")
return true end
 W.getColorFromName=
function(G)if type(G)~="string"or#G==0 then
 
return"#969696"end
 
local V=0 for y=1,#G,1 do
 
local Z=string.byte(G,y)if Z then
 V=((V*31+Z))%16777215 end
 end
 
local y=bit32.rshift(V,16)%256 
local Z=bit32.rshift(V,8)%256 
local j=V%256 
local i=G:lower()
local c=i:find("common")~=nil or i:find("uncommon")~=nil if c then
 
local G=math.clamp(math.floor((((y+Z)+j))/3),120,180)
return string.format("#%02X%02X%02X",G,G,G)
else
 y=math.clamp(y+60,0,255)Z=math.clamp(Z+60,0,255)j=math.clamp(j+60,0,255)
return string.format("#%02X%02X%02X",y,Z,j)end
 end
 W.UpdateDragonEggRewardsText=
function()if not j.lbl_dragon_item_collected then
 
return end
 
local G={}
local V=0 for G,y in pairs(c.bearded_dragon_egg_status or{})do
 V=V+y end
 table.insert(G,string.format("Total Collected: <b><font color=\'#EF2E92\'>%d</font></b>",V))for V,y in pairs(c.bearded_dragon_egg_status or{})do
 
local Z=W.getColorFromName(V)table.insert(G,string.format("<font color=\'%s\'>%s</font>: <b>%d</b>",Z,V,y))end
 j.lbl_dragon_item_collected:SetText(table.concat(G,"\n"))end
 W.UpdateBearGiftRewards=
function()if not j.lbl_found_merry_gifts then
 
return end
 
local G={}
local V=0 for G,y in pairs(c.bear_merrygift_status or{})do
 V=V+y end
 table.insert(G,string.format("Total Collected: <b><font color=\'#EF2E92\'>%d</font></b>",V))for V,y in pairs(c.bear_merrygift_status or{})do
 
local Z=W.getColorFromName(V)table.insert(G,string.format("<font color=\'%s\'>%s</font>: <b>%d</b>",Z,V,y))end
 j.lbl_found_merry_gifts:SetText(table.concat(G,"\n"))end
 S.MagpieSystem={UpdateUiCurrentItems=
function()if not j.lbl_magpie_item_collected then
 
return end
 
local G={}
local V=0 for G,y in pairs(c.magpie_status or{})do
 V=V+y end
 table.insert(G,string.format("Total Collected: <b><font color=\'#EF2E92\'>%d</font></b>",V))for V,y in pairs(c.magpie_status or{})do
 table.insert(G,string.format("%s: <b><font color=\'#00FF00\'>%d</font></b>",V,y))end
 j.lbl_magpie_item_collected:SetText(table.concat(G,"\n"))end
}
task.spawn(
function()while true do
 
task.wait(3)S.MagpieSystem.UpdateUiCurrentItems()
pcall(
function()W.UpdateDragonEggRewardsText()end
)
pcall(
function()W.UpdateBearGiftRewards()end
)end
 end
)a.UpdateTrowelProgress=
function(G)if j.lbl_trowel_progress then
 j.lbl_trowel_progress:SetText(G)end
 end
 a.UpdateTrowelStatus=
function(G)if j.lbl_trowel_stats then
 j.lbl_trowel_stats:SetText(G)end
 end
 a.UpdateTrowelCframe=
function(G)if j.lbl_trowel_cframe then
 j.lbl_trowel_cframe:SetText(G)end
 end
 a.Vector3ToCFrame=
function(G)if not G then
 
return nil end
 
return CFrame.new(G)end
 a.StringToVector3=
function(G)if not G then
 
return nil end
 
local V,y,Z=G:match("([^,]+),([^,]+),([^,]+)")if not V or not y or not Z then
 
return nil end
 
return Vector3.new(tonumber(V),tonumber(y),tonumber(Z))end
 a.GetCurrentCFrameFromPlayer=
function()
local G=V.Character and V.Character:FindFirstChild("HumanoidRootPart")
return G and G.CFrame or nil end
 a.GetCurrentCFrameFromPlayerString=
function()
local G=V.Character and V.Character:FindFirstChild("HumanoidRootPart")if not G then
 
return nil end
 
local y=G.Position 
return string.format("%f,%f,%f",y.X,y.Y,y.Z)end
 a.IsWithinRangeOfFarm=
function(G,V)
local y=70.8 
local Z=Vector3.new(G.X,0,G.Z)
local j=Vector3.new(V.X,0,V.Z)
local i=((G-V)).Magnitude 
return i>y end
 a.GetPlantIfPlantWithinPosition3D=
function(G,V)
local y=((G-V)).Magnitude 
return y<1 end
 a.GetPlantIfPlantWithinPositionXZ=
function(G,V)
local y=Vector3.new(G.X,0,G.Z)
local Z=Vector3.new(V.X,0,V.Z)
local j=((y-Z)).Magnitude 
return j<1.3 end
 a.GetAllPlantsOnFarmForTrowel=
function(G)
local V={}
local y=c.trowel_plants_list 
local Z=y and next(y)~=nil for j,i in ipairs(E.Get_Plants_Physical_Objects())do
 if Z and not y[i.Name]then
 continue end
 if G then
 
local V=(i:GetPivot()).Position if a.GetPlantIfPlantWithinPositionXZ(V,G)then
 continue end
 end
 V[#V+1]=i end
 
return V end
 a.FindTrowelTool=
function()for G,V in ipairs(V.Backpack:GetChildren())do
 if not V:IsA("Tool")then
 continue end
 
local y=V:GetAttribute("b")if not y then
 continue end
 if string.find(V.Name,"Trowel",1,true)then
 
return V end
 end
 for G,V in ipairs(V.Character:GetChildren())do
 if not V:IsA("Tool")then
 continue end
 
local y=V:GetAttribute("b")if not y then
 continue end
 if string.find(V.Name,"Trowel",1,true)then
 
return V end
 end
 
return nil end
 a.PickUpPlantUsingTrowel=
function(G,y)
local Z,j=
pcall(
function()V.TrowelRemote:InvokeServer("Pickup",G,y)
task.wait(.3)end
)if j then
 
warn("PickUpPlantUsingTrowel: ",j)end
 
return Z end
 a.PlacePlantUsingTrowel=
function(G,y,Z)
local j,i=
pcall(
function()V.TrowelRemote:InvokeServer("Place",G,y,a.Vector3ToCFrame(Z))
task.wait(.3)end
)if i then
 
warn("PlacePlantUsingTrowel: ",i)end
 
return j end
 a.TrowelLoop=
function()if S.Is_MasterBusy()then
 a.UpdateTrowelStatus("\240\159\165\154 Paused: tasks in progress.")
return false end
 if not a.trowel_is_running then
 a.UpdateTrowelStatus("\240\159\148\180 Not Running...")
return false end
 
local G=a.StringToVector3(c.trowel_saved_cframe)if not G then
 a.UpdateTrowelStatus("\240\159\148\180 Stopping: Location invalid...")a.trowel_is_running=false 
return false end
 
local V=a.GetAllPlantsOnFarmForTrowel(G)if not V or#V==0 then
 a.UpdateTrowelStatus("\240\159\148\180 Stopping: No plants to move...")a.trowel_is_running=false 
return false end
 
local y=a.FindTrowelTool()if not y then
 a.UpdateTrowelStatus("\240\159\148\180 Stopping: No trowel found...")a.trowel_is_running=false 
return false end
 Z.trowel_count_total_to_move=#V Z.trowel_current_moved=0 
local j=0 a.UpdateTrowelStatus("\240\159\159\162 Active and running...")a.UpdateTrowelProgress(string.format("\240\159\148\132 <font color=\'#32CD32\'>Moving </font> %d/%d",Z.trowel_current_moved,Z.trowel_count_total_to_move))yJ()
task.wait(.3)if not VJ(y)then
 
return false end
 for V,i in ipairs(V)do
 if not a.trowel_is_running then
 a.UpdateTrowelStatus("\226\157\140 Stopped by user.")break end
 if S.Is_MasterBusy()then
 a.UpdateTrowelStatus("\226\143\184\239\184\143 Paused mid-process...")break end
 if not fJ(y)then
 a.UpdateTrowelStatus("\226\157\140 Tool not held. Equipping... ")yJ()
task.wait(.3)VJ(y)j=j+1 
task.wait(1)if j>15 then
 a.UpdateTrowelStatus("\240\159\148\180 Failed to hold tool after 15 tries.")break end
 end
 
local c=a.PickUpPlantUsingTrowel(y,i)if not c then
 a.UpdateTrowelStatus("\226\157\140 Failed to pick up: "..tostring(i.Name))continue end
 
task.wait(.1)
local J=a.PlacePlantUsingTrowel(y,i,G)if not J then
 a.UpdateTrowelStatus("\226\157\140 Failed to place: "..tostring(i.Name))continue end
 Z.trowel_current_moved=Z.trowel_current_moved+1 a.UpdateTrowelStatus("\240\159\159\162 Success "..tostring(i.Name))a.UpdateTrowelProgress(string.format("\240\159\148\132 <font color=\'#32CD32\'>Moving </font> %d/%d",Z.trowel_current_moved,Z.trowel_count_total_to_move))
task.wait(.1)end
 yJ()if Z.trowel_current_moved>=Z.trowel_count_total_to_move then
 a.trowel_is_running=false a.UpdateTrowelStatus("\226\156\133 All plants moved. If nothing moved please make sure to set cframe again and inside your farm.")end
 a.UpdateTrowelProgress(string.format("\240\159\147\138 Last Moved %d/%d",Z.trowel_current_moved,Z.trowel_count_total_to_move))
return true end
 W.NotifyButton=
function()
pcall(
function()
local G=V.PlayerGui 
local y=G:WaitForChild("TopbarStandard")if not y then
 
return end
 
local Z=y:FindFirstChild("Holders")and y.Holders:FindFirstChild("Right")if not Z then
 
return end
 
local j=Z:FindFirstChild("EVENT NOTIFY")if not j then
 
return end
 j.Visible=not T.disable_event_notify_button end
)end
 
task.spawn(
function()
task.wait()W.NotifyButton()end
)W._originalTeleportSizes={}W.Event_Point=nil W.FindEventPoint=
function()if W.Event_Point then
 
return W.Event_Point end
 for G,V in ipairs(workspace:GetDescendants())do
 if V.Name=="Event_Point"then
 W.Event_Point=V 
return V end
 end
 
return nil end
 W.CreateEventTeleportButton=
function(G)
local y=V.PlayerGui:FindFirstChild("Teleport_UI")if not y then
 
return end
 
local Z=y:FindFirstChild("Frame")if not Z then
 
return end
 
local j=Z:FindFirstChild("Garden")if not j or not j:IsA("ImageButton")then
 
warn("Garden button missing")
return end
 
local i=j:Clone()i.Name="Event"
local c=i:FindFirstChildWhichIsA("TextLabel",true)if c then
 c.Text="Event"end
 i.ImageColor3=Color3.fromRGB(255,140,50)if G then
 if G.RemoveBG then
 i.Image=""i.ImageTransparency=1 end
 if G.NewImage then
 i.Image=G.NewImage i.ImageTransparency=0 end
 if G.BGTransparency then
 i.ImageTransparency=G.BGTransparency end
 end
 i.Parent=Z if G and G.OnClick then
 i.MouseButton1Click:Connect(
function()G.OnClick(i)end
)end
 
return i end
 W.ResizeTeleportButtons=
function(G)
local y=V.PlayerGui:FindFirstChild("Teleport_UI")if not y then
 
return end
 
local Z=y:FindFirstChild("Frame")if not Z then
 
return end
 
local j=.8 for V,y in ipairs(Z:GetDescendants())do
 if y:IsA("ImageButton")then
 if not W._originalTeleportSizes[y]then
 W._originalTeleportSizes[y]=y.Size end
 
local V=W._originalTeleportSizes[y]if G then
 y.Size=UDim2.new(V.X.Scale*j,V.X.Offset*j,V.Y.Scale*j,V.Y.Offset*j)
else
 y.Size=V end
 end
 end
 end
 W.CreateEventTeleportButton({OnClick=
function(G)
local V=W.FindEventPoint()if V then
 v(V.CFrame)end
 end
})W.ResizeTeleportButtons(true)N.Update_GearEventWorkbenchStatus=
function(G)if j.lbl_craftinggear_stats then
 j.lbl_craftinggear_stats:SetText(G)
else
 
warn("null label Update_GearEventWorkbenchStatus")end
 end
 N.Update_GearEventWorkbenchTimers=
function(G)if j.lbl_crafting_timeleft then
 j.lbl_crafting_timeleft:SetText(G)end
 end
 N.CraftStats={SELECT_RECIPE="SELECT_RECIPE",START_CRAFTING="START_CRAFTING";SKIP_CRAFT="SKIP_CRAFT";CLAIM_REWARDS="CLAIM_REWARDS",SUBMIT_ITEM="SUBMIT_ITEM"}N.GetProximityPromptUsingModel=
function(G)for G,V in ipairs(G:GetChildren())do
 
local y=V:FindFirstChildWhichIsA("ProximityPrompt",true)if y then
 
return y end
 end
 
return nil end
 N.GetWorkbenchStateUsingName=
function(G)
local V=N.GetWorkBenchModelUsingName(G)if not V then
 
return nil end
 
local y=N.GetProximityPromptUsingModel(V)if not y then
 
return nil end
 
local Z=N.CraftStats.SELECT_RECIPE if y and(y:IsA("ProximityPrompt")and y.ActionText)then
 
local G=y.ActionText if string.find(G,"Start Crafting",1,true)then
 Z=N.CraftStats.START_CRAFTING 
elseif string.find(G,"Select Recipe",1,true)then
 Z=N.CraftStats.SELECT_RECIPE 
elseif string.find(G,"Claim",1,true)then
 Z=N.CraftStats.CLAIM_REWARDS 
elseif string.find(G,"Submit Item",1,true)then
 Z=N.CraftStats.SUBMIT_ITEM 
elseif string.find(G,"Skip",1,true)then
 Z=N.CraftStats.SKIP_CRAFT end
 
else
 end
 
return Z end
 N.CancelWorkbenchUsingName=
function(G)
local y=N.GetWorkBenchModelUsingName(G)if not y then
 
return nil end
 V.CraftingGlobalObjectService:FireServer("Cancel",y,G,1)end
 N.ClaimWorkbenchUsingName=
function(G)
local y=N.GetWorkBenchModelUsingName(G)if not y then
 
return nil end
 V.CraftingGlobalObjectService:FireServer("Claim",y,G,1)end
 N.CreateRecipeWorkbenchUsingName=
function(G,y)
local Z=N.GetWorkBenchModelUsingName(G)if not Z then
 
return nil end
 V.CraftingGlobalObjectService:FireServer("SetRecipe",Z,G,y)end
 N.SubmitRecipeWorkbenchUsingName=
function(G,y,Z)
local j=N.GetWorkBenchModelUsingName(G)if not j then
 
return nil end
 V.CraftingGlobalObjectService:FireServer("InputItem",j,G,y,Z)end
 N.StartCraftWorkbenchUsingName=
function(G)
local y=N.GetWorkBenchModelUsingName(G)if not y then
 
return nil end
 V.CraftingGlobalObjectService:FireServer("Craft",y,G)end
 N.SetRecipeUsingName=
function(G,V)
local y=T.allcraft.receipe_data[G]if not y then
 
return false end
 for y,j in pairs(y)do
 
local i=N.AllReceipeData[G]if not i then
 continue end
 
local J=i[y].inputs 
local T={}for G,V in ipairs(J)do
 
local j=V.Name 
local i=V.Type 
local J=nil if i=="PetBoost"then
 J=r.GetPetBoostUsingName(j)
elseif i=="Pet"then
 J=r.GetPetUsingNameForCraft(j)
elseif i=="CosmeticCrate"then
 J=r.GetCosmeticCrateUsingName(j)
elseif i=="SprayBottle"then
 J=r.GetSprayBottleUsingName(j)
elseif i=="Sprinkler"then
 J=r.GetSprinklerUsingName(j)
elseif i=="Harvest Tool"then
 J=r.GetHarvestTool()
elseif i=="Recall Wrench"then
 J=r.GetRecallWrench()
elseif i=="Lightning Rod"then
 J=r.GetLightningRod()
elseif i=="PetEgg"then
 J=r.GetEggUsingName(j)
elseif i=="Holdable"then
 J=r.GetHoldableUsingName(j)
elseif i=="Seed"then
 J=r.GetSeedUsingName(j)
elseif i=="Food"then
 J=r.GetFoodUsingName(j)
elseif i=="Smith Hammer of Harvest"then
 J=r.GetSmithHammerofHarvest()
else
 J=r.GetToolUsingNameNormalised(j)end
 if not J then
 T={}N.Current_Recipe_MissingItemName=N.Current_Recipe_MissingItemName..(" "..(j..","))N.Current_Recipe_Name=N.Current_Recipe_Name..(" "..(y..","))if i=="Holdable"then
 if u.HasPlantByName(j)then
 if c.craft_autofruit_workbench then
 N.Update_GearEventWorkbenchStatus("\240\159\141\146 Trying to Collect fruits")
local G,V=
pcall(
function()
local G={}G[j]=true u.CollectFruitByNamesSortedRarity(G,3)end
)if not G then
 
warn("Failed to collect fruit: "..(j.." - "),V)end
 
task.wait(.5)end
 
else
 if c.craft_autoplant_workbench then
 if not E.Garden.GetIsNormalGarden()then
 
return false end
 N.Update_GearEventWorkbenchStatus("\240\159\141\146 Trying to plant seed ",j)
local G,V=
pcall(
function()if not Z.is_garden_full_seed then
 
task.spawn(
function()u.PlaceSeedSmart(j,2)end
)end
 end
)if not G then
 
warn("Failed to plant: "..(j.." - "),V)end
 
task.wait(.5)end
 end
 end
 break end
 
local d=J:GetAttribute("c")if i=="Pet"then
 
local G=J:GetAttribute("PET_UUID")d=G end
 
local q={ItemName=j;ItemType=i,ItemData={UUID=d}}table.insert(T,q)end
 if#T>0 then
 N.CreateRecipeWorkbenchUsingName(G,y)if not V then
 
task.wait(1.5)end
 for y,j in ipairs(T)do
 
local i=j.ItemType 
local c=j.ItemName 
local J={ItemType=j.ItemType;ItemData=j.ItemData}if i=="Pet"then
 Z.IS_CRAFTING=true if not V then
 
task.wait(1.5)end
 
local j=r.GetPetUsingNameForCraft(c)if j then
 yJ()
task.wait(.1)VJ(j)
task.wait(.5)N.SubmitRecipeWorkbenchUsingName(G,y,J)end
 Z.IS_CRAFTING=false 
else
 N.SubmitRecipeWorkbenchUsingName(G,y,J)end
 if not V then
 
task.wait(.5)end
 end
 N.Current_Recipe_Name=y 
return true end
 end
 
return false end
 S.FavouriteFruit={is_unfav_running=false;IsFavouriteTarget=
function(G)if not c.autofavfruits_enabled then
 
return false end
 if typeof(G)~="Instance"then
 
return false end
 if u.IsFavoriteFruitOnFarm(G)then
 
return false end
 
local V=type(c.autofavplantlist)=="table"and c.autofavplantlist or{}
local y=tonumber(c.autofavminweight)or 70 
local Z=tonumber(c.autofavmaxweight)or 500 
local j=next(V)~=nil 
local i=false if j then
 i=V[G.Name]==true 
else
 i=true end
 if not i then
 
return false end
 
local J=u.GetFruitWeight(G)if y and J<y then
 
return false end
 if Z and J>Z then
 
return false end
 
return true end
,FavouriteFruit=
function(G,y,Z)V.GameEvents.FavoriteToolRemote:InvokeServer(G,y,Z)end
,UnfavouriteFruits=
function()
local G=type(c.autofavplantlist)=="table"and c.autofavplantlist or{}
local V=tonumber(c.autofavminweight)or 70 
local y=tonumber(c.autofavmaxweight)or 500 
local j,i=u.GetAllFruitsInFarmReady(G,V,y)if#i>0 then
 
local G=r.GetFavouriteTool()if not G then
 Z.Notify("No fav tool ",3)
return false end
 yJ()if VJ(G)then
 
pcall(
function()for V,y in ipairs(i)do
 S.FavouriteFruit.FavouriteFruit(G,y,false)
local j=u.GetFruitWeight(y)
local i=string.format("%s %.2fKG",y.Name,j)Z.Notify("\226\157\164\239\184\143 UnFavourite Fruit "..i,3)
task.wait(.2)end
 end
)end
 
else
 Z.Notify("No fruits to unfav ",3)
return false end
 yJ()Z.Notify("Unfav completed ",3)end
,FavFruitsLoop=
function()if not c.autofavfruits_enabled then
 
return false end
 
local G=type(c.autofavplantlist)=="table"and c.autofavplantlist or{}
local V=tonumber(c.autofavminweight)or 70 
local y=tonumber(c.autofavmaxweight)or 500 
local j,i=u.GetAllFruitsInFarmReady(G,V,y)if#j>0 then
 
local G=r.GetFavouriteTool()if not G then
 
return false end
 yJ()if VJ(G)then
 
pcall(
function()for V,y in ipairs(j)do
 S.FavouriteFruit.FavouriteFruit(G,y,true)
local j=u.GetFruitWeight(y)
local i=string.format("%s %.2fKG",y.Name,j)Z.Notify("\226\157\164\239\184\143 Favourite Fruit "..i,3)
task.wait(.5)if not c.autofavfruits_enabled then
 break end
 end
 end
)yJ()end
 
else
 
return false end
 end
}N.CraftLoop=
function()if S.Is_MasterBusy()then
 
return false end
 if not T.allcraft.auto_craft_event then
 N.Update_GearEventWorkbenchStatus("\240\159\148\180 Not running")N.Update_GearEventWorkbenchTimers("\226\132\185\239\184\143 Select recipes and [Enable] to craft.")
return false end
 for G,V in pairs(N.AllReceipeData)do
 if S.Is_MasterBusy()then
 break end
 
local y=T.allcraft.receipe_data[G]if not y or next(y)==nil then
 continue end
 
local j=N.GetWorkbenchStateUsingName(G)if j==nil then
 continue end
 if j==N.CraftStats.SKIP_CRAFT then
 N.CraftTeams.PlaceTeamIdle()N.Update_GearEventWorkbenchStatus("\240\159\148\168 "..(G.." is Crafting"))continue 
elseif j==N.CraftStats.SELECT_RECIPE then
 N.Update_GearEventWorkbenchStatus("\240\159\155\160\239\184\143 "..(G.." Attempting Recipe..."))
local V,y=
pcall(
function()
return N.SetRecipeUsingName(G)end
)if V then
 if y==false then
 
local G=N.Current_Recipe_MissingItemName N.Update_GearEventWorkbenchStatus(string.format("\226\157\140 Recipes <font color=\'#F527E7\'>%s</font> missing <font color=\'#F08080\'>%s</font>",tostring(N.Current_Recipe_Name),tostring(G)))N.Current_Recipe_Name=""N.Current_Recipe_MissingItemName=""Z.IS_CRAFTING=false continue end
 
else
 N.Update_GearEventWorkbenchStatus("\226\157\140 "..(G.." Stop craft. Error occurred."))end
 
elseif j==N.CraftStats.START_CRAFTING then
 N.CraftTeams.PlaceTeamSubmitItems()N.StartCraftWorkbenchUsingName(G)N.Update_GearEventWorkbenchStatus("\226\156\133 "..(G.." Craft Started"))
elseif j==N.CraftStats.SUBMIT_ITEM then
 N.CancelWorkbenchUsingName(G)
elseif j==N.CraftStats.CLAIM_REWARDS then
 N.CraftTeams.PlaceTeamClaimItems()N.Update_GearEventWorkbenchStatus("\240\159\142\129 Claiming Rewards")N.ClaimWorkbenchUsingName(G)N.Current_Recipe_Name=""
task.wait(.2)N.Update_GearEventWorkbenchStatus("\226\156\133 Success")N.Update_GearEventWorkbenchTimers("\240\159\159\162 Waiting...")end
 end
 
return true end
 S.reclaim_running=false S.ReclaimTask=
function()S.reclaim_running=true 
local G=T.reclaim.plants 
local V=tonumber(T.reclaim.keep_amount)or 0 
local y=NJ.UpdateReclaimStatus while S.reclaim_running do
 y("\240\159\148\132 <font color=\'#00BFFF\'>Starting Reclaimer...</font>")
task.wait(1)
local j=false if next(G)==nil then
 y("\226\154\160\239\184\143 <font color=\'#FFA500\'>No plants found</font>")break end
 
local i=r.GetToolUsingName("Reclaimer")if not i then
 y("\226\154\160\239\184\143 <font color=\'#FFA500\'>No reclaimer tool found.</font>")break end
 yJ()
task.wait(.2)if not VJ(i)then
 y("\226\154\160\239\184\143 <font color=\'#FFA500\'>Failed to equip reclaimer tool.</font>")break end
 for G,c in pairs(G)do
 
local J=E.GetAllPlantsObjectUsingName(G)if#J==0 then
 continue end
 j=true 
local T=#J 
local d=math.max(0,T-V)
local u=0 if d==0 then
 y("\240\159\159\162 <font color=\'#32CD32\'>Keep amount reached for "..(G..". No reclaim needed.</font>"))
task.wait(.5)continue end
 if not zJ(i)or Z.IS_HATCHING then
 break end
 for V,j in ipairs(J)do
 if not zJ(i)or Z.IS_HATCHING then
 break end
 u=u+1 y("\240\159\140\177 <font color=\'#FFD700\'>Claiming "..(G..("</font> "..("<font color=\'#00FF00\'>["..(u..("/"..(d.."]</font>")))))))r.TryReclaim(j)if u>=d then
 y("\226\156\133 <font color=\'#32CD32\'>Finished reclaiming "..(G.."</font>"))break end
 
task.wait(.1)end
 
task.wait(.5)end
 if not j then
 y("\226\154\160\239\184\143 <font color=\'#FFA500\'>No plants to reclaim</font>")break end
 y("\226\156\133 <font color=\'#32CD32\'>Finished reclaiming all</font>")break end
 S.reclaim_running=false Z.Notify("Reclaimer completed. \240\159\140\191")end
 S.StartReclaimer=
function()if S.reclaim_running then
 Z.Notify("Reclaimer already started.")
return false end
 
task.spawn(S.ReclaimTask)Z.Notify("Reclaimer started.")
return true end
 S.StopReclaimer=
function()S.reclaim_running=false Z.Notify("Reclaimer stopped.")end
 
local OJ={}_G.EggDataStreamListener=V.DataStream.OnClientEvent:Connect(
function(G,V,y)if G~="UpdateData"or not V then
 
return end
 
local Z={}for G,V in ipairs(y)do
 
local y=V[1]
local Z=V[2]if y:match("ROOT/PetsData/PetInventory/Data/")then
 if type(Z)=="table"then
 
local G=Z.UUID 
local V=Z.PetType 
local y=nil 
local j=nil 
local i=0 if Z.PetData and type(Z.PetData)=="table"then
 y=Z.PetData.MutationType j=Z.PetData.Name i=Z.PetData.Level end
 if G and(V and(y and j))then
 if i>=tonumber(c.mut_required_level)then
 if Y.is_running then
 Y.InsertPetBackIntoTargetList(G)
task.wait(.1)end
 
else
 OJ[G]={PetType=V;MutationType=y,Name=j;Level=i}end
 end
 end
 end
 end
 end
)W.GetAllCosmeticCrateModels=
function()
local G={}
local V=E.mObjects_Physical:GetChildren()for V,y in ipairs(V)do
 if y:IsA("Model")and(y:GetAttribute("TimeToOpen")==0 and y.Name=="CosmeticCrate")then
 table.insert(G,y)end
 end
 
return G end
 
local 
function FJ()
local G={}
local V=E.mObjects_Physical:GetChildren()for V,y in ipairs(V)do
 if y:IsA("Model")and(y:GetAttribute("TimeToHatch")==0 and y.Name=="PetEgg")then
 table.insert(G,y)end
 end
 
return G end
 
local 
function vJ()
local G=FJ()if not G then
 
return nil end
 
local V={}for G,y in ipairs(G)do
 if y:IsA("Model")and(y:GetAttribute("TimeToHatch")==0 and y.Name=="PetEgg")then
 
local G=y:GetAttribute("OBJECT_UUID")table.insert(V,G)end
 end
 if#V==0 then
 
return nil end
 
return V end
 W.UpdateCrateUi=
function(G)if not G or not G:IsA("Model")then
 
return end
 
local V=G:GetAttribute("OBJECT_UUID")if not V then
 
return end
 
local y=Z.found_crate_data[V]if not y or not V then
 
return end
 
local j=120 
local i=G:FindFirstChild("CrBillboardGui")if T.is_egg_esp==false then
 if i then
 i:Destroy()i=nil 
return end
 
return end
 if not i then
 i=Instance.new("BillboardGui")i.Name="CrBillboardGui"i.Adornee=G:FindFirstChild("CosmeticCrate")or G.PrimaryPart i.Size=UDim2.new(0,150,0,50)i.StudsOffset=Vector3.new(0,2,0)i.AlwaysOnTop=true i.MaxDistance=j i.Parent=G 
local V=Instance.new("TextLabel")V.Name="EggLabel"V.Size=UDim2.new(1,0,1,0)V.BackgroundTransparency=1 V.RichText=true V.TextColor3=Color3.fromRGB(255,255,255)V.TextStrokeTransparency=0 V.Font=Enum.Font.SourceSansBold V.TextScaled=false V.TextSize=19 V.TextStrokeColor3=Color3.fromRGB(0,0,0)V.Parent=i 
else
 i.MaxDistance=j end
 
local c=i:FindFirstChild("EggLabel")if c then
 
local G=""
local V=""if y then
 G=y.name V=y.reward end
 c.RichText=true c.Text=string.format(" <font color=\'#FF6F00\'>%s</font> <font color=\'#FFFFFF\'>\226\128\162</font> <font color=\'#AAFF00\'>%s</font>",G,V)end
 end
 
local 
function kJ(G)if not G or not G:IsA("Model")then
 
return end
 
local V=G:GetAttribute("OBJECT_UUID")if not V then
 
return end
 
local y=Z.found_pet_data[V]if not y or not V then
 
return end
 
local j=120 
local i=G:FindFirstChild("EggBillboardGui")if T.is_egg_esp==false then
 if i then
 i:Destroy()i=nil 
return end
 
return end
 if not i then
 i=Instance.new("BillboardGui")i.Name="EggBillboardGui"i.Adornee=G:FindFirstChild("HitBox")or G.PrimaryPart i.Size=UDim2.new(0,150,0,50)i.StudsOffset=Vector3.new(0,2,0)i.AlwaysOnTop=true i.MaxDistance=j i.Parent=G 
local V=Instance.new("TextLabel")V.Name="EggLabel"V.Size=UDim2.new(1,0,1,0)V.BackgroundTransparency=1 V.RichText=true V.TextColor3=Color3.fromRGB(255,255,255)V.TextStrokeTransparency=0 V.Font=Enum.Font.SourceSansBold V.TextScaled=false V.TextSize=19 V.TextStrokeColor3=Color3.fromRGB(0,0,0)V.Parent=i 
else
 i.MaxDistance=j end
 
local c=i:FindFirstChild("EggLabel")if c then
 
local G=""
local V=""if y then
 G=y.petname V=y.weight end
 c.RichText=true c.Text=string.format(" <font color=\'#FFFF64\'>%s</font> <font color=\'#FF00FF\'>\226\128\162</font> <font color=\'#00FFFF\'>%.2fKG</font>",G,V)end
 end
 
local 
function pJ()while _G.EggEspUiRunning do
 
task.wait(1)
local G=FJ()for G,V in ipairs(G)do
 kJ(V)end
 
local V=W.GetAllCosmeticCrateModels()for G,V in ipairs(V)do
 W.UpdateCrateUi(V)end
 end
 end
 
local 
function UJ()
local G=vJ()if not G or#G==0 then
 
return{}end
 
local V={}for G,y in ipairs(G)do
 V[y]=true end
 
local y=getgc(true)for G=#y,math.floor(#y*.3),-1 do
 if not next(V)then
 break end
 
local j=y[G]if typeof(j)=="table"then
 for G in pairs(V)do
 for y,j in pairs(j)do
 if typeof(y)=="string"and y:find(G,1,true)then
 if typeof(j)=="table"and(j.Data and(j.Data.Type and j.Data.BaseWeight))then
 
local y=k(j.Data.BaseWeight)Z.found_pet_data[G]={petname=j.Data.Type,weight=y}V[G]=nil break end
 end
 end
 end
 end
 end
 end
 
task.spawn(pJ)
local QJ={PositionXScale=.01;PositionYScale=.19;SizeXScale=.5,SizeYScale=.17;LineSpacing=1,StrokeColor="#000000";StrokeThickness=1.3}Z.statsGui=nil Z.statsTextLabel=nil if S.uiplayerstats then
 task.cancel(S.uiplayerstats)S.uiplayerstats=nil end
 S.UpdatePlayerStatusUI=
function()
local G=c.is_playerstats_running or false if G then
 if not Z.statsGui or not Z.statsGui.Parent then
 Z.statsGui=Instance.new("ScreenGui")Z.statsGui.Name="SecretStatsGui"Z.statsGui.ResetOnSpawn=false Z.statsGui.DisplayOrder=2 Z.statsGui.IgnoreGuiInset=true 
local G=Instance.new("Frame",Z.statsGui)G.Name="MainFrame"G.AnchorPoint=Vector2.new(0,0)G.Position=UDim2.new(QJ.PositionXScale,0,QJ.PositionYScale,0)G.Size=UDim2.new(QJ.SizeXScale,0,QJ.SizeYScale,0)G.BackgroundColor3=Color3.new(.1,.1,.1)G.BackgroundTransparency=1 G.BorderSizePixel=0 G.AutomaticSize=Enum.AutomaticSize.None 
local y=Instance.new("TextLabel",G)
local 
function j(G)
local V={Enum.Font.FredokaOne;Enum.Font.GothamBold,Enum.Font.Gotham,Enum.Font.SourceSans}for V,y in ipairs(V)do
 
local Z=
pcall(
function()G.Font=y end
)if Z then
 
return end
 end
 end
 j(y)y.Name="StatsLabel"y.TextColor3=Color3.new(1,1,1)y.TextXAlignment=Enum.TextXAlignment.Left y.TextYAlignment=Enum.TextYAlignment.Top y.BackgroundTransparency=1 y.Size=UDim2.new(1,0,1,0)y.AutomaticSize=Enum.AutomaticSize.None y.TextScaled=true y.LineHeight=QJ.LineSpacing y.RichText=true Z.statsTextLabel=y Z.statsGui.Parent=V.PlayerGui end
 if Z.statsTextLabel then
 
local G={}for y,Z in pairs(Z.PlayerSecrets)do
 
local j=V.LocalPlayer:GetAttribute(y)or 0 
local i=typeof(j)=="number"and string.format("%.2f",j)or tostring(j)
local c=""if i=="0.00"then
 c=y..(": "..i)
else
 if y=="SessionTime"then
 i=tostring(W.formatDuration(j))end
 c=y..(": <b><font color=\'#39FF14\'>"..(i.."</font></b>"))end
 table.insert(G,c)end
 
local y=table.concat(G,"\n")
local j=string.format("<stroke joins=\'round\' sizing=\'fixed\' color=\'%s\' thickness=\'%d\'>%s</stroke>",QJ.StrokeColor,QJ.StrokeThickness,y)Z.statsTextLabel.Text=j end
 
else
 if Z.statsGui and Z.statsGui.Parent then
 Z.statsGui:Destroy()Z.statsGui=nil Z.statsTextLabel=nil 
print("\240\159\146\171 destroyed")end
 end
 end
 S.uiplayerstats=
task.spawn(
function()while true do
 
task.wait(.5)
local G,V=
pcall(
function()S.UpdatePlayerStatusUI()end
)if not G then
 end
 end
 end
)W.GetAllTeamsUUIDSet=
function()
local G={}
local V={T.team1,T.team2,T.team3;T.team4;T.team_enhance_targets;T.team_reduction_placefirst;T.team_reduction_placeafter,T.team_bypass_alwaysactive;T.agebreak.target_team;T.agebreak.dup_team,T.customteams_team1,T.customteams_team2,T.customteams_team3,T.customteams_team4,T.allcraft.team_claim;T.allcraft.team_idle;T.allcraft.team_submit;T.mut_system.targetteam;T.mut_system.mut_team;T.mut_system.maxlevel_team;T.mut_system.baseweight_team,T.mut_system.xpteam;T.mut_system.filler_team,T.mutation_boost_cd_team,T.mutation_boost_level_team,T.mutation_boost_team_claim}if T.giftpets.enabled_gift_pets then
 table.insert(V,S.GiftSystem.current_pet_pool or{})end
 for V,y in pairs(V)do
 if type(y)=="table"then
 for V,y in pairs(y)do
 if y then
 G[y]=true end
 end
 end
 end
 
return G end
 S.FavouritePets={FavInprocess=false;max_delay_fav=.1;GetPetsForFav=
function(G)
local V={}
local y=t.Inventory.GetPetInventory()
local j=T.petfav.min_age or 1 
local i=T.petfav.max_age or 1 
local c=T.petfav.min_weight or.8 
local J=T.petfav.max_weight or 2.86 
local d=T.petfav.allow_pet_list or{}
local u=T.petfav.allow_mutation_list or{}
local q=false 
local g=false if next(d)==nil then
 Z.Notify("No pet types selected",3)
return{}end
 if next(d)then
 q=true end
 if next(u)then
 g=true end
 for y,Z in pairs(y)do
 
local T=Z.UUID 
local E=Z.PetData 
local a=Z.PetType if q then
 if not d[a]then
 continue end
 end
 
local H=E.IsFavorite if G==H then
 continue end
 
local e=E.Name 
local s=E.Level 
local N=E.BaseWeight 
local W=E.MutationType or""
local X=Y.AllMutationListEnum[W]if g then
 if X then
 if not u[X]then
 continue end
 
else
 continue end
 end
 
local h=k(N,1)if s<j or s>i then
 continue end
 if h<c or h>J then
 continue end
 
local l=r.GetPetUsingUUID(y)if l then
 
local G={pet_uuid=y;pet_tool=l}table.insert(V,G)end
 end
 
return V end
;FavAllPets=
function()if S.FavouritePets.FavInprocess then
 Z.Notify("Already running please wait.",3)
return false end
 
local G=S.FavouritePets.GetPetsForFav(true)if G and#G<=0 then
 
return false end
 S.FavouritePets.FavInprocess=true Z.Notify("Started favorite process",3)for G,V in ipairs(G)do
 
pcall(
function()mJ(V.pet_tool)end
)
task.wait(S.FavouritePets.max_delay_fav)end
 Z.Notify("Completed favorite process",3)S.FavouritePets.FavInprocess=false end
;UnFavAllPets=
function()if S.FavouritePets.FavInprocess then
 Z.Notify("Already running please wait.",3)
return false end
 
local G=S.FavouritePets.GetPetsForFav(false)if G and#G<=0 then
 
return false end
 S.FavouritePets.FavInprocess=true Z.Notify("Started unfavorite process",3)for G,V in ipairs(G)do
 
pcall(
function()mJ(V.pet_tool)end
)
task.wait(S.FavouritePets.max_delay_fav)end
 Z.Notify("Completed unfavorite process",3)S.FavouritePets.FavInprocess=false end
}Z.TEXT_GIFT=""S.GiftSystem={current_pet_pool={};UpdateUiGiftSystem=
function(G)Z.TEXT_GIFT="[\240\159\146\157 GIFT SYSTEM] "..G end
;SendGift=
function(G)V.PetGiftingModule:GivePet(G)end
,GetAllPetsForGifting=
function()
local G={}
local V=t.Inventory.GetPetInventory()
local y=T.giftpets.min_age or 1 
local Z=T.giftpets.max_age or 1 
local j=T.giftpets.min_weight or.8 
local i=T.giftpets.max_weight or 2.86 
local c=T.giftpets.custom_pets_list or{}
local J=T.giftpets.allow_pet_list or{}
local d=T.giftpets.allow_mutation_list or{}
local u=T.giftpets.custom_mode or false 
local q=T.giftpets.allow_fav or false S.GiftSystem.current_pet_pool={}
local g=W.GetAllTeamsUUIDSet()
local E=false 
local a=false if next(J)==nil then
 
return{}end
 if next(J)then
 E=true end
 if next(d)then
 a=true end
 
local H={}for V,c in pairs(V)do
 if u then
 break end
 
local T=c.UUID 
local e=c.PetData 
local s=c.PetType if g[V]then
 continue end
 if H[V]then
 continue end
 if E then
 if not J[s]then
 continue end
 end
 
local N=e.IsFavorite if not q then
 if N then
 continue end
 end
 
local W=e.Name 
local X=e.Level 
local h=e.BaseWeight 
local l=e.MutationType or""
local B=Y.AllMutationListEnum[l]if a then
 if B then
 if not d[B]then
 continue end
 
else
 continue end
 end
 
local L=k(h,1)if X<y or X>Z then
 continue end
 if L<j or L>i then
 continue end
 
local m=r.GetPetUsingUUID(V)if m then
 
local y={pet_uuid=V,pet_tool=m}H[V]=true table.insert(G,y)table.insert(S.GiftSystem.current_pet_pool,V)end
 end
 for V,y in ipairs(c)do
 if H[y]then
 continue end
 
local Z=r.GetPetUsingUUID(y)if Z then
 
local V={pet_uuid=y,pet_tool=Z}H[y]=true table.insert(G,V)end
 end
 
return G end
}S.TradeSystem={GetValidPlayersForTrade=
function()
local G={}for V,y in pairs(T.giftpets.allow_player_targets)do
 if S.Targets_max[V]then
 continue end
 
local j=Z.IsPlayerActiveUsingName(V)if not j then
 continue end
 
local i={player=j;player_name=V}table.insert(G,i)end
 if#G<=0 then
 
return nil end
 
return G end
,SendTradeTicketToPlayer=
function(G)(game:GetService("ReplicatedStorage")).GameEvents.TradeEvents.SendRequest:FireServer(G)end
,LoopSendTicket=
function()if t.PlayerData.GetUnfairTradeWarning()then
 
local G=S.GiftSystem.UpdateUiGiftSystem G("\240\159\148\180 Please disable UnfairTradeWarning from Trade (Button) > Settings (tab) to use trading system. ")
return end
 if not T.giftpets.send_trading_ticket_auto then
 
return end
 if W.IsSellAllUnFav()and T.is_running then
 
return end
 if S.TradeSystem.IsTradeActive()then
 
return end
 
local G=S.TradeSystem.GetValidPlayersForTrade()if not G then
 
return end
 
local V=r.GetTradingTicket()if not V then
 
return end
 if not VJ(V)then
 
return end
 for G,V in ipairs(G)do
 
local y=V.player if not y then
 continue end
 if S.TradeSystem.IsTradeActive()then
 break end
 
local Z=V.player_name S.TradeSystem.SendTradeTicketToPlayer(y)
task.wait(1)end
 end
,TradeAcceptButton=
function()
local G=game:GetService("Players")
local V=G.LocalPlayer 
local y=V and V:FindFirstChild("PlayerGui")if not y then
 
return end
 
local Z=y:FindFirstChild("TradingUI")if not Z or not Z.Enabled then
 
return end
 
local j=Z:FindFirstChild("LiveTrade")
local i=j and j:FindFirstChild("Options")
local c=i and i:FindFirstChild("Accept")if c then
 
local G=false if getconnections then
 for V,y in pairs(getconnections(c.MouseButton1Click))do
 y:Fire()G=true end
 for V,y in pairs(getconnections(c.Activated))do
 y:Fire()G=true end
 end
 if G then
 
task.wait(4)end
 
else
 end
 end
;IsTradeActive=
function()
local G=V.PlayerGui:FindFirstChild("TradingUI")if G and G.Enabled==true then
 
return true end
 
return false end
;OtherPlayerReady=
function()
local G,y=
pcall(
function()
local G=V.PlayerGui:FindFirstChild("TradingUI")if G then
 
local V=G.LiveTrade.OtherPlr.Ready.BackgroundTransparency if V and V<1 then
 
return true end
 end
 
return false end
)if G then
 
return y end
 
return false end
,MyAddedItemsCount=
function()
local G,y=
pcall(
function()
local G=0 
local y=V.PlayerGui.TradingUI.LiveTrade.MyPlr.ScrollingFrame for V,y in ipairs(y:GetChildren())do
 if y:IsA("ImageButton")and y.Name=="ItemTemplate"then
 G=G+1 end
 end
 
return G end
)if G then
 
return y end
 
return 0 end
;AddPetItem=
function(G)
pcall(
function()
local y=V.ReplicatedStorage.GameEvents.TradeEvents.AddItem:FireServer("Pet",G)end
)end
}
local 
function oJ()
local G,V=t.Inventory.GetMaxEggsAndInventorySpaceCount()
return G end
 
local 
function IJ(G,V)if not G or not V then
 
print("message or keywordText are nil")
return false end
 
local y=string.lower(G)for G in string.gmatch(V,"%a+")do
 
local V=string.lower(G)if not string.find(y,V,1,true)then
 
return false end
 end
 
return true end
 
local 
function RJ()
local G,y=
pcall(
function()
return V.LocalPlayer.PlayerGui.Version_UI.Version end
)if G and y then
 
return y.Text 
else
 
warn("Could not find the server version UI element.")
return"Unknown"end
 end
 Z.GetServerVersionNumber=
function()
local G,y=
pcall(
function()
return(V.LocalPlayer.PlayerGui:WaitForChild("Version_UI",2)):WaitForChild("Version",2)end
)if G and(y and y.Text)then
 
local G=y.Text 
local V=tonumber(G:match("%d+"))if V then
 
return V end
 end
 
warn("Could not get valid server version.")
return nil end
 
local 
function nJ()if Z.is_forced_stop==true then
 
warn("Forced to stop running...")
return end
 
warn("Rejoin...")V.TeleportService:Teleport(game.PlaceId)end
 Z.HopStopUI=nil Z.HopStatusLabel=nil Z.UpdateHopStopUI=
function(G)
local V=(game:GetService("Players")).LocalPlayer 
local y=V:FindFirstChildOfClass("PlayerGui")if not y then
 
return end
 if not c.hop_enabled then
 if Z.HopStopUI then
 Z.HopStopUI:Destroy()Z.HopStopUI=nil Z.HopStatusLabel=nil end
 
return end
 if Z.HopStopUI then
 if Z.HopStatusLabel and G then
 Z.HopStatusLabel.Text=G end
 
return end
 
local j=Instance.new("ScreenGui")j.Name="AutoHop_UI"j.IgnoreGuiInset=true j.DisplayOrder=2147483647 j.ZIndexBehavior=Enum.ZIndexBehavior.Global j.ResetOnSpawn=false j.Parent=game:GetService("CoreGui")
local i=Instance.new("Frame")i.ZIndex=10 i.AnchorPoint=Vector2.new(.5,.5)i.Position=UDim2.fromScale(.5,.5)i.Size=UDim2.fromOffset(340,160)i.BackgroundColor3=Color3.fromRGB(25,25,30)i.BackgroundTransparency=.1 i.Parent=j 
local J=Instance.new("UICorner")J.CornerRadius=UDim.new(0,18)J.Parent=i 
local T=Instance.new("TextLabel")T.ZIndex=11 T.Size=UDim2.new(1,-20,0,70)T.Position=UDim2.fromOffset(10,10)T.BackgroundTransparency=1 T.Font=Enum.Font.GothamBold T.TextSize=16 T.TextWrapped=true T.TextColor3=Color3.new(1,1,1)T.Text=G or"\240\159\148\132 Auto Hop Active..."T.Parent=i 
local d=Instance.new("TextButton")d.ZIndex=11 d.Size=UDim2.new(1,-60,0,50)d.Position=UDim2.fromOffset(30,95)d.Text="\240\159\155\145 STOP AUTO HOP"d.Font=Enum.Font.GothamBold d.TextSize=18 d.BackgroundColor3=Color3.fromRGB(190,45,60)d.TextColor3=Color3.new(1,1,1)d.Parent=i 
local u=Instance.new("UICorner")u.CornerRadius=UDim.new(0,14)u.Parent=d d.MouseButton1Click:Connect(
function()c.hop_enabled=false n(true)if Z.HopStopUI then
 Z.HopStopUI:Destroy()Z.HopStopUI=nil Z.HopStatusLabel=nil end
 
warn("[AutoHop] Stopped by user.")end
)Z.HopStopUI=j Z.HopStatusLabel=T end
 Z.AutoHopServer=
function()if not c.hop_enabled then
 Z.UpdateHopStopUI()
return false end
 
local G=tonumber(c.hop_targetversion)or 0 if G<=0 then
 Z.UpdateHopStopUI("\226\157\140 No target version entered.\nStopping...")
warn("[AutoHop] No target version.")c.hop_enabled=false n(true)
return false end
 Z.UpdateHopStopUI("\240\159\148\132 Auto Hop Active...\nReading server version...")
local V=Z.GetServerVersionNumber()if not V then
 Z.UpdateHopStopUI("\226\154\160\239\184\143 Could not read server version.")
return false end
 Z.UpdateHopStopUI(string.format("\240\159\148\132 Auto Hop Active\nCurrent: v%s\nTarget: v%s",V,G))if V<=G then
 Z.UpdateHopStopUI(string.format("\226\156\133 Found server!\nVersion: v%s",V))
warn("[AutoHop] Found target version:",V)c.hop_enabled=false n(true)
return true end
 
task.wait(2)if not c.hop_enabled then
 
return false end
 t.Hop.HopToNewServer()
return true end
 
task.spawn(
function()
task.wait(1)if c.hop_enabled then
 Z.UpdateHopStopUI("\240\159\148\132 Auto Hop Active...\nResuming...")Z.AutoHopServer()end
 end
)Z.DetectTeleport=
function()
local G=game:GetService("TeleportService")
local y=false G.TeleportInitFailed:Connect(
function(G,Z,j)if G~=V.LocalPlayer then
 
return end
 if not c.hop_enabled then
 
return end
 if y then
 
return end
 y=true 
warn("[Teleport] Failed:",Z,j)
warn("[Teleport] Rejoining current server...")task.delay(3,
function()nJ()
task.wait(5)t.Hop.HopToNewServer()
task.wait(1)end
)end
)end
 Z.DetectTeleport()
local 
function wJ(G)
local V,y,Z=string.match(G,"^(.-)%s+%[(%d+%.?%d*)%s*KG%]%s+%[Age%s*(%d+)%]$")if V then
 
return V,tonumber(y),tonumber(Z)end
 V,y=string.match(G,"^(.-)%s+%[(%d+%.?%d*)%s*KG%]$")if V then
 
return V,tonumber(y),-1 end
 
return nil end
 
local 
function Gl()if not T.auto_remove_plants_folder then
 
print("\226\157\140 Plant deletion is disabled.")
return end
 
print("Searching for Plants_Physical to remove...")
local G=V.Workspace:FindFirstChild("Farm")if not G then
 
warn("Farm folder not found in workspace.")
return end
 for G,V in ipairs(G:GetChildren())do
 if V then
 
local G=V:FindFirstChild("Important")if G and G:IsA("Folder")then
 
local y=G:FindFirstChild("Plants_Physical")if y then
 
local G,Z=
pcall(
function()y:Destroy()end
)if G then
 
print("\226\156\133 Plants_Physical removed from "..V.Name)
else
 
warn("\226\157\140 Failed to destroy Plants_Physical in "..(V.Name..(": "..tostring(Z))))end
 
else
 end
 end
 end
 end
 
print("Plants_Physical cleanup complete.")end
 
local Vl={}
local 
function yl()
local G=V.Backpack:GetChildren()if G and#G>0 then
 Vl={}for G,V in ipairs(G)do
 if not V then
 continue end
 if V:IsA("Tool")and V:GetAttribute("ItemType")=="Pet"then
 
local G=V:GetAttribute("PET_UUID")if G then
 Vl[G]=true end
 end
 end
 end
 end
 r.OnAddedToolFruit=
function(G) end
 
local 
function Zl()
local 
function G(G)if G:IsA("Tool")and G:GetAttribute("ItemType")=="Pet"then
 sJ=true 
local V=G:GetAttribute("PET_UUID")
local y,j,i=wJ(G.Name)
local c=G:GetAttribute("d")if V and not Z.is_hatch_stage_koi then
 Z.seen_pets[V]=true end
 if V and not Vl[V]then
 if not c and(y and i==1)then
 Vl[V]=true if JJ(y)then
 table.insert(dJ,G.Name)table.insert(HJ,G)end
 end
 end
 end
 r.OnAddedToolFruit(G)end
 V.Backpack.ChildAdded:Connect(G)end
 Zl()W.SendLiveWebhook=
function(G,y)if not y then
 if not T.webhook_url or T.webhook_url==""then
 
warn("Webhook not configured.")
return end
 end
 
local Z=T.webhook_url if y and y~=""then
 Z=y end
 
pcall(
function()
local y=V.HttpService:JSONEncode(G)
local j=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)or(krnl and krnl.request)if j then
 j({Url=Z;Method="POST",Headers={["Content-Type"]="application/json"};Body=y})
else
 V.HttpService:PostAsync(Z,y)end
 end
)end
 W.SendLiveWebhookPublicDiscord=
function(G,y)
local Z="https://exotichub.app/5059b2085ccb"
local j={api="6ba7b812-9dad-11d1-80b4-00c04fd430c8";payload=G;cat=y}
pcall(
function()
local G=V.HttpService:JSONEncode(j)
local y=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)or(krnl and krnl.request)if y then
 y({Url=Z;Method="POST",Headers={["Content-Type"]="application/json"},Body=G})
else
 V.HttpService:PostAsync(Z,G)end
 end
)end
 W.mutationConfig={Rainbow={color=5793266,emoji="\240\159\140\136"};Dreadbound={color=9109504;emoji="\226\155\147\239\184\143"};Soulflame={color=16737792,emoji="\240\159\148\165"};Spectral={color=8900331,emoji="\240\159\145\187"};Nightmare={color=7340032,emoji="\240\159\152\136"},Ascended={color=16777215;emoji="\226\156\168"},Inverted={color=33023,emoji="\240\159\148\132"},Shiny={color=16766720,emoji="\240\159\140\159"},Radiant={color=16768350,emoji="\240\159\148\134"},IronSkin={color=8421504,emoji="\240\159\155\161\239\184\143"};Golden={color=16766720,emoji="\240\159\146\176"},Frozen={color=6736895;emoji="\240\159\167\138"};Windy={color=8355711;emoji="\240\159\140\172\239\184\143"},Tiny={color=12632256,emoji="\240\159\144\156"},Mega={color=1179647;emoji="\240\159\146\170"},Shocked={color=16776960,emoji="\226\154\161"};Default={color=8421504;emoji="\226\157\147"}}W.getWebhookMockupData=
function(G,y)
local Z=G.found_mutation 
local j=G.pet_name 
local i=G.level 
local c=G.nickname 
local J=G.wanted 
local T=G.isw 
local d=G.weight or 0 
local u=W.mutationConfig[Z]or W.mutationConfig.Default 
local q=W.GetFooterInfo(true)
local g=os.date("!%Y-%m-%dT%H:%M:%SZ")
local E=string.format("\240\159\144\137 %s (%s) [Age %s]",j,c,i)
local a=string.format("%s %s",u.emoji,Z)
local H=string.format("||%s||",V.LocalPlayer.Name)
local r=string.format("\240\159\143\139\239\184\143 %.2f KG",d)
local Y="Exotic Hub"if y then
 H=string.format("||%s||",Y)end
 
local e="\240\159\142\137 Mutation Success! \240\159\142\137"if not J then
 e="\226\154\170 Mutation Failure! \226\154\170"end
 if T then
 e="\240\159\144\152 Base Weight Success! \240\159\144\152"end
 
local s={username="Exotic Hub";embeds={{title=e;description="By user: "..H;color=u.color,fields={{name="Pet Name";value=E,inline=true},{name="Mutation";value=a,inline=true}},footer={text=q},timestamp=g}}}
local N if not T then
 N="```"..(E..("```"..("```"..(a.."```"))))
else
 N="```"..(E..("```"..("```"..(a..("```"..("```"..(r.."```")))))))end
 
local X={username="Exotic Hub";embeds={{title=e;description="By user: "..H,color=u.color,fields={{name="Stats",value=N;inline=false}},footer={text=q},timestamp=g}}}
return X end
 W.getWebhookMutMaxLevel=
function(G,y)
local Z=G.found_mutation 
local j=G.pet_name 
local i=G.level 
local c=G.nickname 
local J=W.mutationConfig[Z]or W.mutationConfig.Default 
local T=W.GetFooterInfo(true)
local d=os.date("!%Y-%m-%dT%H:%M:%SZ")
local u=string.format("%s (%s) [Mut %s]",j,c,Z)
local q=string.format("%s %s",J.emoji,i)
local g=string.format("||%s||",V.LocalPlayer.Name)
local E="Exotic Hub"if y then
 g=string.format("||%s||",E)end
 
local a="\226\173\144 Mutation [LEVEL MAX!] \226\173\144"
local H={username="Exotic Hub",embeds={{title=a,description="By user: "..g,color=J.color;fields={{name="Pet Name",value=u;inline=true},{name="Level";value=q;inline=true}},footer={text=T};timestamp=d}}}
return H end
 W.getWebhookMockupDataAgeBreak=
function(G,y)
local Z=G.pet_name 
local j=G.level 
local i=G.nickname 
local c=G.required_level 
local J=G.weight or 0 
local T=false if j>=c then
 T=true end
 
local d=W.mutationConfig.Default 
local u=W.GetFooterInfo(true)
local q=os.date("!%Y-%m-%dT%H:%M:%SZ")
local g=string.format("\240\159\144\190 %s (%s)",Z,i)
local E=string.format("||%s||",V.LocalPlayer.Name)
local a="Exotic Hub"if y then
 E=string.format("||%s||",a)end
 
local H="\226\154\170 Age Up \226\154\170"if T then
 H="\240\159\159\162 Age Break Completed! \240\159\159\162"end
 
local r=string.format("\240\159\142\175 Target Age (%s/%s)",j,c)if T then
 
local G=string.format("\226\156\133 Target Age (%s/%s)",j,c)end
 
local Y 
local e=string.format("\240\159\143\139\239\184\143 %.2f KG",J)Y="```"..(g..("```"..("```"..(r..("```"..("```"..(e.."```")))))))
local s={username="Exotic Hub";embeds={{title=H,description="By user: "..E;color=d.color;fields={{name="Stats";value=Y;inline=false}};footer={text=u},timestamp=q}}}
return s end
 W.SendWebhookSendError=
function(G)
local y=string.format("||%s||",V.LocalPlayer.Name)
local Z=string.format("```\n%s\n```",G)
local j=W.GetFooterInfo(true)
local i={username="Exotic Hub Alerter",embeds={{title="\226\157\140 Error \226\157\140",description="\226\157\140 Error",color=15548997,fields={{name="User",value=y;inline=false};{name="Error Details",value=Z,inline=false}};footer={text=j},timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")}}}W.SendLiveWebhook(i)end
 W.SendWebhookMutationMachineStop=
function(G)
local y=string.format("||%s||",V.LocalPlayer.Name)
local Z=string.format("```\n%s\n```",G)
local j=W.GetFooterInfo(true)
local i={username="Exotic Hub Alerter";embeds={{title="\226\157\140 Mutation Machine Stopped \226\157\140",description="\226\157\140 Stopped";color=15548997,fields={{name="User",value=y;inline=false},{name="Error Details",value=Z,inline=false}};footer={text=j};timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")}}}W.SendLiveWebhook(i,T.mut_webhook_url)end
 Z.SendWebhookUsingApi=
function(G,y,Z,j)if not T.webhook_url or T.webhook_url==""then
 
warn("Webhook not configured.")end
 
local i=45055 
local c=T.webhook_url 
local J=Z or{}
local d=W.GetFooterInfo(true)
local u={webhook_url=c,content="",embed={title=G,description=y,color=i,footer={text=d},timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")};db=J}
local q,g=
pcall(
function()
local G=V.HttpService:JSONEncode(u)
local y=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)or(krnl and krnl.request)
local Z if y then
 Z=y({Url=V.PROXY_URL;Method="POST";Headers={["Content-Type"]="application/json"},Body=G})
else
 Z=V.HttpService:PostAsync(V.PROXY_URL,G)end
 if j then
 W.JsonPrint(Z)end
 end
)if not q then
 
warn("Wh1 error: ",g)end
 end
 
local 
function jl(G,y,Z,j,i)if not T.webhook_url or T.webhook_url==""then
 
warn("Webhook not configured.")end
 
local c="-"if T.webhook_url then
 c=T.webhook_url end
 if i and i==1 then
 if not T.send_everyhatch_alert then
 c="-"end
 end
 
local J={}if j then
 J=j end
 
local d=W.GetFooterInfo(true)
local u={webhook_url=c,content=content or"",embed={title=G;description=y;color=Z or 45055;footer={text=d};timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")},db=J}
local q,g=
pcall(
function()
local G=V.HttpService:JSONEncode(u)
local y=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)or(krnl and krnl.request)if y then
 y({Url=V.PROXY_URL;Method="POST",Headers={["Content-Type"]="application/json"},Body=G})
else
 V.HttpService:PostAsync(V.PROXY_URL,G)end
 end
)if not q then
 
warn("Wh error: ",g)end
 end
 
local 
function il()if not j.lbl_selected_team1_count or not j.lbl_selected_team2_count or not j.lbl_selected_team3_count or not j.lbl_selected_team4_count then
 
return end
 
local G=#T.team1 
local V=#T.team2 
local y=#T.team3 
local Z=#T.team4 
local i=PJ()j.lbl_selected_team1_count:SetText("Selected: "..(G..("/"..i)))j.lbl_selected_team2_count:SetText("Selected: "..(V..("/"..i)))j.lbl_selected_team3_count:SetText("Selected: "..(y..("/"..i)))j.lbl_selected_team4_count:SetText("Selected: "..(Z..("/"..i)))end
 W.shortenMutation=
function(G)if not G or G==""then
 
return""end
 
local V=G:gsub("[%[%]]","")
local y=(V:sub(1,2)):upper()
return"["..(y.."]")end
 W.RefreshPetData=
function()
print("\240\159\148\132 Refreshing pet data...")
local G=t.Inventory.GetPetInventory()
local V={}for G,y in ipairs(E.GetActivePetsUUIDS())do
 V[y]=true end
 AJ={}
local y=T.only_show_baseweight for G,Z in pairs(G)do
 
local j=Z if j then
 
local Z=j.PetData.Level 
local i=j.PetData.BaseWeight 
local c=0 if y then
 c=k(i,1)
else
 c=k(i,Z)end
 
local J=tonumber(string.format("%.2f",c))
local T=j.PetType 
local d=j.PetData.MutationType or""
local u=j.PetData.IsFavorite 
local q=Y.AllMutationListEnum[d]
local g=""if q then
 
local G=W.shortenMutation(q)
local V=W.StringToColor3(G)g=string.format("<font color=\'%s\'>%s</font>",V,G)end
 
local E="#FFFFFF"
local a="Lv."if V[G]then
 E="#0CCF19"end
 if Z>=100 then
 E="#FFFF00"a="\226\173\144"end
 
local H=""if u then
 H="\226\157\164\239\184\143"end
 
local r=string.format("<font color=\'%s\'>%s%s%s</font>\226\128\162<font color=\'#3DD8FF\'>%skg</font> %s%s ",E,H,a,Z,J,g,T)AJ[G]=r..(" "..G)W.PetDataLocal[G]=T 
else
 AJ[G]="Active PET "..G end
 end
 if z.AgeBreakMachine.GetSubmittedPetUUID()then
 
local G=z.AgeBreakMachine.GetSubmittedPetUUID()if G then
 
local V=z.AgeBreakMachine.GetPetName()AJ[G]="<font color=\'#00FFF7\'>[AgeBreak]</font> "..(V..(" "..G))end
 end
 
local c=true 
local J=CJ()if i.dropdown_sell_inventory_pets then
 i.dropdown_sell_inventory_pets:SetValues(J)i.dropdown_sell_inventory_pets:SetValue(Z.sell_selected_pets,c)end
 if i.PetBoostSelectDropdown then
 i.PetBoostSelectDropdown:SetValues(J)i.PetBoostSelectDropdown:SetValue(DJ(T.elephant.pet_list),c)end
 if j.MultiDropdownHatchTeam and(j.MultiDropdownSellTeam and(j.MultiDropdownEggReductionTeam and j.MultiDropdownEggPetSizeTeam))then
 
local G=DJ(T.team1)
local V=DJ(T.team2)
local y=DJ(T.team3)
local Z=DJ(T.team4)
local i=W.GetSortedList(J,G)j.MultiDropdownSellTeam:SetValues(i)j.MultiDropdownSellTeam:SetValue(G,c)
local d=W.GetSortedList(J,V)j.MultiDropdownHatchTeam:SetValues(d)j.MultiDropdownHatchTeam:SetValue(V,c)
local u=W.GetSortedList(J,y)j.MultiDropdownEggReductionTeam:SetValues(u)j.MultiDropdownEggReductionTeam:SetValue(y,c)
local q=W.GetSortedList(J,Z)j.MultiDropdownEggPetSizeTeam:SetValues(q)j.MultiDropdownEggPetSizeTeam:SetValue(Z,c)end
 if i.dd_reduction_teamafter and i.dd_reduction_teamfirst then
 
local G=DJ(T.team_reduction_placefirst)
local V=DJ(T.team_reduction_placeafter)i.dd_reduction_teamafter:SetValues(J)i.dd_reduction_teamafter:SetValue(V,c)i.dd_reduction_teamfirst:SetValues(J)i.dd_reduction_teamfirst:SetValue(G,c)end
 if i.dd_enhance_targets then
 
local G=DJ(T.team_enhance_targets)
local V=W.GetSortedList(J,G)i.dd_enhance_targets:SetValues(V)i.dd_enhance_targets:SetValue(G,c)end
 if i.dd_bypass_teamsactive then
 
local G=DJ(T.team_bypass_alwaysactive)
local V=W.GetSortedList(J,G)i.dd_bypass_teamsactive:SetValues(V)i.dd_bypass_teamsactive:SetValue(G,c)end
 if i.customteams_team1 and(i.customteams_team2 and(i.customteams_team3 and i.customteams_team4))then
 
local G=DJ(T.customteams_team1)
local V=DJ(T.customteams_team2)
local y=DJ(T.customteams_team3)
local Z=DJ(T.customteams_team4)
local j=W.GetSortedList(J,G)i.customteams_team1:SetValues(j)i.customteams_team1:SetValue(G,c)
local d=W.GetSortedList(J,V)i.customteams_team2:SetValues(d)i.customteams_team2:SetValue(V,c)
local u=W.GetSortedList(J,y)i.customteams_team3:SetValues(u)i.customteams_team3:SetValue(y,c)
local q=W.GetSortedList(J,Z)i.customteams_team4:SetValues(q)i.customteams_team4:SetValue(Z,c)end
 if i.agebreaktarget_team and i.agebreakdup_team then
 
local G=DJ(T.agebreak.target_team)
local V=DJ(T.agebreak.dup_team)i.agebreaktarget_team:SetValues(J)i.agebreaktarget_team:SetValue(G,c)i.agebreakdup_team:SetValues(J)i.agebreakdup_team:SetValue(V,c)end
 if i.craftteam_claim and(i.craftteam_idle and i.craftteam_submit)then
 
local G=DJ(T.allcraft.team_submit)
local V=DJ(T.allcraft.team_claim)
local y=DJ(T.allcraft.team_idle)i.craftteam_claim:SetValues(J)i.craftteam_claim:SetValue(V,c)i.craftteam_idle:SetValues(J)i.craftteam_idle:SetValue(y,c)i.craftteam_submit:SetValues(J)i.craftteam_submit:SetValue(G,c)end
 Y.UI.UpdateTeamsDropdowns()z.mut_ui.UpdateTeamsDropdowns()s.LevelSystem.UpdateDropDown()il()end
 
local 
function cl()
task.spawn(
function()
local G,V=
pcall(
function()W.RefreshPetData()end
)if not G then
 
warn("Error: ",V)end
 end
)end
 s.LevelSystem={DetailsPastBoosts={};UpdateUiTextStats=
function(G)if j.lbl_pet_level_status then
 j.lbl_pet_level_status:SetText(G)end
 end
;UpdateUiTextInformation=
function()if not j.lbl_pet_level_info then
 
return end
 
local G={}for V,y in pairs(s.LevelSystem.DetailsPastBoosts)do
 
local Z="<font color=\'#FFD700\'>"..(V..("</font> "..("<font color=\'#00FF00\'>Lv "..(y.cur..("</font> "..("<font color=\'#FFA500\'>+"..(y.given_levels..("</font> "..("/ <font color=\'#FF69B4\'>"..(y.target.."</font>"))))))))))table.insert(G,Z)end
 
local V=table.concat(G,"\n")j.lbl_pet_level_info:SetText(V)end
,GetCurrentPetLevel=
function(G)
local V=WJ(G)if not V then
 
return 0 end
 
local y=V.UUID 
local Z=V.PetData 
local j=V.PetType 
local i=V.PetAbility 
local c=Z.HatchedFrom 
local J=Z.IsFavorite 
local T=Z.Boosts 
local d=Z.Name 
local u=Z.LevelProgress 
local q=Z.EggName 
local g=Z.Level 
local E=Z.Hunger 
local a=Z.BaseWeight 
return g end
,UpdateDropDown=
function()if i.PetLevelDropDown then
 
local G=DJ(c.pet_level_selected_pets)i.PetLevelDropDown:SetValues(CJ())i.PetLevelDropDown:SetValue(G,true)end
 end
,ReloadPetData=
function()s.LevelSystem.UpdateDropDown()end
;LevelPetsLoop=
function()if S.Is_MasterBusy()then
 
return false end
 if not c.pet_auto_level_auto then
 s.LevelSystem.UpdateUiTextStats("\240\159\148\180 Not running")
return false end
 
local G=tonumber(c.pet_auto_level_max)or 100 
local V=tonumber(c.pet_auto_level_min)or 0 if V>0 and G<=V then
 s.LevelSystem.UpdateUiTextStats("\226\157\140 Max level can\'t be less than or equal to minimum level.")
return false end
 
local y={}
local j=c.pet_level_selected_pets or{}for Z,j in ipairs(j)do
 
local i=s.LevelSystem.GetCurrentPetLevel(j)if i<G then
 if V==0 or i>=V then
 table.insert(y,j)end
 end
 end
 if#y==0 then
 s.LevelSystem.UpdateUiTextStats("\240\159\159\161 No pets found to level.")
return false end
 s.LevelSystem.UpdateUiTextStats("\240\159\159\162 Active and running")s.LevelSystem.DetailsPastBoosts={}Z.IS_LEVELUP_RUNNING=true 
local i=0 for V,y in ipairs(y)do
 i=i+1 if not c.pet_auto_level_auto or S.Is_MasterBusy()then
 break end
 if Z.IS_MUTATION_RUNNING or Z.IS_JUNGLE_RUNNING or Z.IS_HATCHING or Z.IS_COOKING or Z.IS_FEEDING or Z.IS_SEEDING or Z.IS_SHOVELING then
 s.LevelSystem.UpdateUiTextStats("\240\159\159\161 Yielding to priority tasks")break end
 G=tonumber(c.pet_auto_level_max)or 100 
local j=WJ(y)if not j or not j.PetData then
 continue end
 
local J=j.PetType 
local T=s.LevelSystem.GetCurrentPetLevel(y)if T>=G then
 continue end
 
local d=tostring(i)..("# "..J)
local u=c.pet_level_boost_list if type(u)~="string"then
 s.LevelSystem.UpdateUiTextStats("\240\159\159\161 Select a boost")break end
 
local q=string.find(u,"Syrup")~=nil 
local g=string.find(u,"Jelly")~=nil 
local a=nil if q then
 a=r.GetToolUsingName(u)
elseif g then
 
local G=BJ(u)a=r.GetToolUsingNameNormalised(G)
else
 a=r.GetPetAnyBoostUsingName(u)end
 if not a then
 s.LevelSystem.UpdateUiTextStats("\240\159\159\161 Boost not found: "..tostring(u))break end
 
local Y=E.GetActivePetsPetMoverObject(y)if not Y then
 s.LevelSystem.UpdateUiTextStats("\226\157\140 Pet not found on farm.")continue end
 if Y:IsA("Part")then
 Y=Y:FindFirstChildOfClass("Model")end
 s.LevelSystem.UpdateUiTextStats("\226\154\161 Applying boosts...")yJ()
task.wait(.1)if not VJ(a)then
 s.LevelSystem.UpdateUiTextStats("\240\159\148\180 Unable to equip tool.")break end
 
task.wait(.2)
local e=0 
local N=G-T 
local W=0 
local X=40 while N>0 do
 if S.Is_MasterBusy()then
 break end
 if not zJ(a)then
 VJ(a)
task.wait(.2)if not zJ(a)then
 break end
 end
 if W>=X then
 break end
 
local V=s.LevelSystem.GetCurrentPetLevel(y)if q then
 r.TryUseSyrup(Y)
task.wait(.3)
elseif g then
 r.TryUseGearBoost(u,Y)
task.wait(1.2)
else
 H.ApplyBoostToPet(y)end
 
task.wait(.15)
local Z=s.LevelSystem.GetCurrentPetLevel(y)
local j=Z-V if j>0 then
 e=e+j N=N-j end
 W=W+1 s.LevelSystem.DetailsPastBoosts[d]={cur=V,given_levels=e;target=G}s.LevelSystem.UpdateUiTextInformation()if Z>=G then
 break end
 end
 
task.wait(.2)yJ()end
 s.LevelSystem.UpdateUiTextStats("\226\156\133 Done applying boosts")Z.IS_LEVELUP_RUNNING=false 
return true end
}H.UsePetLead=
function(G)for G,y in ipairs(G:GetChildren())do
 if y:IsA("Model")then
 V.PetLeadService_RE:FireServer(y)end
 end
 end
 s.UsePetLeadOnTargets=
function()
local G=E.GetActivePetsParts()
local V=r.GetToolUsingName("Pet Lead")if V then
 yJ()VJ(V)end
 for G,y in ipairs(G)do
 if fJ(V)then
 H.UsePetLead(y)end
 end
 yJ()end
 
task.spawn(
function()while true do
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(12)end
 end
)
local 
function Jl()for G,V in pairs(Z.egg_counts)do
 
local y=r.GetEggCountUsingName(G)V.current_amount=y end
 end
 
local 
function Tl()for G,V in pairs(Z.egg_counts)do
 
local y=r.GetEggCountUsingName(G)V.new_amount=y end
 end
 Jl()W.NoEggsReadyToHatch=
function()for G,V in ipairs(E.mObjects_Physical:GetChildren())do
 if V.Name=="PetEgg"and V:IsA("Model")then
 
local G=V:GetAttribute("TimeToHatch")if G==0 then
 
return false end
 end
 end
 
return true end
 
local 
function dl()if not E.mObjects_Physical then
 
warn("issue finding Objects_Physical")NJ.UpdateSetLblStats("Unable to find egg folder on your farm.")
task.wait(1)
return false end
 
local G=E.mObjects_Physical:GetChildren()if#G==0 then
 
warn("No eggs found on farm")NJ.UpdateSetLblStats("\240\159\165\154 No eggs found on farm")
return true end
 if T.is_hatch_in_batch==true then
 for G,V in ipairs(G)do
 if V.Name=="PetEgg"and V:IsA("Model")then
 if V:GetAttribute("TimeToHatch")>0 then
 Z.egg_hatch_time_left=V:GetAttribute("TimeToHatch")
return false end
 end
 end
 
return true 
else
 for G,V in ipairs(G)do
 if V.Name=="PetEgg"and V:IsA("Model")then
 if V:GetAttribute("TimeToHatch")==0 then
 
return true end
 end
 end
 
return false end
 end
 W.HatchReportWebhook=
function(G)
local y=string.format("%.2f",G.koi_bonus or 0)
local j=string.format("%.2f",G.seal_bonus or 0)
local i=string.format("%.2f",G.bronto_bonus or 0)
local J=RJ()
local d=V.LocalPlayer.Name 
local u=#G.pets 
local q={}
local g={}
local E=0 
local a=0 
local H="\226\156\133"
local Y="\226\157\140"
local e={}Z.gains=0 for G,V in ipairs(G.pets)do
 
local y=V.pet_name 
local j=V.weight 
local i=string.format("[%.2f KG]",V.weight)
local c=V.level 
local J=V.egg_name 
local T=V.mut or""
local d,u=W.getEggAmounts(J)
local E=r.GetIsFavPetUsingUUID(V.uuid)
local a=Y if E then
 a=H end
 if c>1 then
 end
 
local s=""if T and T~=""then
 s="["..(T.."] ")a=a.."\240\159\167\172"end
 
local N=string.format("%sLv.%s %s%s %s",a,c,s,y,i)
local X=u-d 
local h={egg=J;start_am=d,end_am=u,gain=X;amount_placed=Z.RNG_EGG_OVERRIDE}Z.gains=X if not e[J]then
 e[J]=true table.insert(Z.hatch_history_list,h)end
 
local l=Z.GetAssetId(y,Z.ItemTypes.Pet)
local B=Z.GetAssetId(J,Z.ItemTypes.Egg)
local L={egg_name=J;petname=y,petage=c;weight=j,mut=T;old_egg_count=d,new_egg_count=u;peticonid=l;eggiconid=B}table.insert(q,L)if not g[J]then
 g[J]={start=d,finish=u;pets={}}end
 table.insert(g[J].pets,N)end
 Z.was_hatch_done=true table.insert(Z.nice_fruit_gains,Z.gains)for G,V in pairs(g)do
 E=E+((V.start-V.finish))end
 a=u-E 
local s={}table.insert(s,"**-> Session Info:**")table.insert(s,string.format("\226\148\130 \240\159\145\164 Username: ||`%s`||",d))table.insert(s,string.format("\226\148\130 \240\159\150\165\239\184\143 Server Version: `%s`",J))table.insert(s,"")table.insert(s,"**-> Stats:**")if G.bronto_bonus<=0 then
 table.insert(s,string.format("\226\148\130 \226\156\168 **Buffs** Sell: `%s%%` Hatch: `%s%%`",j,y))
else
 table.insert(s,string.format("\226\148\130 \226\156\168 **Buffs** Sell: `%s%%` Hatch: `%s%%` PetSize: `%s%%`",j,y,i))end
 table.insert(s,string.format("\226\148\130 \240\159\165\154 Eggs Used: `%d`",E or 0))table.insert(s,string.format("\226\148\130 \240\159\146\190 Eggs Saved: `%d`",a or 0))if true then
 table.insert(s,"")table.insert(s,"**-> Lucky Events! \240\159\141\128**")table.insert(s,string.format("\226\148\130 \240\159\165\154 Lucky Pet: `+%d Eggs`",G.egg_back))table.insert(s,string.format("\226\148\130 \240\159\148\132 Lucky Hatch: `+%d Eggs`",G.eggs_repaint))end
 table.insert(s,"")table.insert(s,string.format("**-> Pets Hatched (%d):**",u))for G,V in pairs(g)do
 table.insert(s,string.format("\240\159\144\163**%s (St %d, End %d)**",G,V.start,V.finish))for G,V in ipairs(V.pets)do
 table.insert(s,string.format("> `%s`",V))end
 table.insert(s,"")end
 
local N=table.concat(s,"\n")
local X={pets_hatched=q;serverversion=J,scriptversion=V.CurentV;username=d,userid=Z.player_userid;cp_api=c.web_api_key;buff_seal=j,buff_koi=y;buff_bron=G.bronto_bonus;PetPassiveBonus=G.passive_bonus;bonus_egg_back=G.egg_back;bonus_recovery=G.eggs_repaint}
local h=16766720 
local l=16753920 
local B=15105570 
local L=16766720 
local m=3066993 
local K=m 
local b="big"jl("Hatch Report",N,3447003,X,1)
local S,z={},{}for G,V in ipairs(G.pets)do
 
local y=V.pet_name 
local j=V.weight 
local i=V.level if i>1 then
 end
 if y and j then
 if Z.rare_pets[y]then
 table.insert(S,string.format("`%s` \226\128\148 `%.2f kg`",y,j))end
 if j>=tonumber(T.sell_weight)then
 if j<3 then
 b="big"K=h 
elseif j<6 then
 b="big"K=m 
elseif j<8 then
 b="huge"K=l 
elseif j<10 then
 b="titanic"K=B 
else
 b="godly"K=L end
 table.insert(z,string.format("`%s` \226\128\148 `%.2f kg`",y,j))end
 end
 end
 if#S>0 then
 
local G={"**-> Hatched By:**",string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name);"",string.format("**-> Rare Pets (%d):**",#S);table.concat(S,"\n")}jl("\240\159\142\175 Rare Pet Alert",table.concat(G,"\n"),h)end
 
local f={big="\240\159\146\170 **Big Pet Alert!**",huge="\240\159\143\139\239\184\143 **Huge Pet Alert!**",titanic="\240\159\148\165 **Titanic Pet Alert!**",godly="\226\173\144 **Godly Pet Alert!**"}
local t=f[b]if not t then
 t=f.big end
 if#z>0 then
 
local G={"**-> Hatched By:**",string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name),"",string.format("**-> Big Pets (%d):**",#z);table.concat(z,"\n")}jl(t,table.concat(G,"\n"),K)end
 
task.wait(.3)end
 
local 
function ul()
local G={"\226\157\140 **Out of Eggs!** \226\157\140","";string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name);"";"\226\157\140 **You have no eggs left.**";"";"\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"}jl("\226\157\140 No Eggs Alert",table.concat(G,"\n"),15105570)end
 
local 
function ql()
local G={"\226\157\140 **Failed to place a team!** \226\157\140","";string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name),"","\226\157\140 **Team failed to be place.**","";"\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"}jl("\226\157\140 Team Placement Alert",table.concat(G,"\n"),15105570)end
 
local 
function gl(G)G=G or"Some Error"
local y={"\226\157\140 Error \226\157\140";"";string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name),"","\226\157\140 "..G,"","\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"}jl("\226\157\140 "..G,table.concat(y,"\n"),15105570)end
 Z.SendTestMessage=
function()
local G="\226\156\133 Test webhook, it works!"
local y={"\226\156\133 Test \226\156\133";"",string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name);"","\226\156\133 "..G,"";"\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"}Z.SendWebhookUsingApi(G,table.concat(y,"\n"),{},true)end
 
local 
function El(G)G=G or"Operation completed successfully"
local y={"\226\156\133 Success \226\156\133";"",string.format("\226\148\130 Username: ||`%s`||",V.LocalPlayer.Name),"";"\226\156\133 "..G;"";"\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"}if jl then
 jl("\226\156\133 "..G,table.concat(y,"\n"),65280)
else
 
warn("\226\154\160\239\184\143 Webhook not found. Message:\n"..table.concat(y,"\n"))end
 end
 
local 
function al()
local G={"**\240\159\147\138 10-Minute Stats Update**";"";string.format("\226\148\130 \240\159\144\163 Hatched in this 10-min block: `%d`",T.eggs_hatched_in_10_min_session),string.format("\226\148\130 \240\159\149\146 Hatched in this hourly block: `%d`",T.eggs_hatched_in_hourly_session);string.format("\226\148\130 \240\159\147\136 Total Hatched (All Time): `%d`",T.pets_hatched_total);"",string.format("\226\148\130 \240\159\145\164 Username: ||`%s`||",V.LocalPlayer.Name)}jl("Timed Report (10 Min)",table.concat(G,"\n"),16776960)end
 
local 
function Hl()
local G={"**\226\143\176 Hourly Stats Summary**";"",string.format("\226\148\130 \240\159\144\163 Hatched this hour: `%d`",T.eggs_hatched_in_hourly_session);string.format("\226\148\130 \240\159\147\136 Total Hatched (All Time): `%d`",T.pets_hatched_total),"",string.format("\226\148\130 \240\159\145\164 Username: ||`%s`||",V.LocalPlayer.Name)}jl("Timed Report (Hourly)",table.concat(G,"\n"),5763719)end
 
local 
function rl()
print("\240\159\147\136 Checking if timed reports are due...")
local G=os.time()
local V=false if T.last_10min_report_time==0 then
 T.last_10min_report_time=G end
 if T.last_hourly_report_time==0 then
 T.last_hourly_report_time=G end
 if(G-T.last_10min_report_time)>=600 then
 
print("10-minute report is due. Sending...")al()T.eggs_hatched_in_10_min_session=0 T.last_10min_report_time=G V=true end
 if(G-T.last_hourly_report_time)>=3600 then
 
print("Hourly report is due. Sending...")Hl()T.eggs_hatched_in_hourly_session=0 T.last_hourly_report_time=G V=true end
 if V then
 R()end
 end
 
local 
function Yl(G)if not G then
 
return nil end
 
local y=V.Character:FindFirstChildOfClass("Humanoid")if y then
 
local y=V.Character:FindFirstChildOfClass("Tool")if y and y:GetAttribute("h")==G then
 
return y end
 end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("h")==G then
 
return y end
 end
 
return nil end
 
local 
function el()
local G=0 for V,y in pairs(Z.egg_counts)do
 
local Z=y.new_amount-y.current_amount if Z>0 then
 G=G+Z end
 end
 
return G end
 r.ValidEggOverrideCheck=
function(G,V)if not V then
 
return false end
 
local y=r.GetEggToolCount(V)if c.egg_override_enabled then
 
local V=c.egg_override[G]if V then
 
local G=tonumber(V)or 0 if y>G then
 
return true 
else
 
return false end
 
else
 end
 end
 
return true end
 r.GetEggToolForHatching=
function()
local G,V=
pcall(
function()
local G={}for V=1,Z.max_priorityx,1 do
 
local y=c["egg_priority"..V]if y and(y~="None"and not G[y])then
 G[y]=true 
local V=r.GetEggUsingNameNew(y)if V then
 if not r.ValidEggOverrideCheck(y,V)then
 continue end
 
return V 
else
 
warn(y.." egg not found.")end
 end
 end
 
return nil end
)if not G then
 
warn("[EGG Error] "..tostring(V))
return nil end
 
return V end
 
local 
function sl()for G=1,Z.max_priorityx,1 do
 
local V=c["egg_priority"..G]if V and V~="None"then
 
local G=Yl(V)if G then
 
return G 
else
 
warn(V.." not found, moving to next")end
 end
 end
 
return nil end
 
local 
function Nl()
local G,V=
pcall(
function()
local G=0 
local V=E.mObjects_Physical:GetChildren()if not V or#V==0 then
 
return 0 end
 for V,y in ipairs(V)do
 if y and(y:IsA("Model")and y.Name=="PetEgg")then
 G=G+1 end
 end
 
return G end
)
return G and V or 0 end
 W.GetTakenEggPositions=
function()
local G={}
local V,y=
pcall(
function()
local V=E.mObjects_Physical:GetChildren()if not V then
 
return end
 for V,y in ipairs(V)do
 if y and(y:IsA("Model")and y.Name=="PetEgg")then
 
local V=y:FindFirstChild("HitBox",true)if V then
 table.insert(G,V.Position)end
 end
 end
 end
)if not V then
 
warn("Error getting egg positions:",y)end
 
return G end
 e.UpdateLblStatsText=
function(G)if j.lbl_pet_system_live then
 j.lbl_pet_system_live:SetText(G)end
 end
 e.FeedFruit=
function(G)V.ActivePetService:FireServer("Feed",G)end
 e.IsPetHungry=
function(G,V)if not G then
 
return false end
 
local y=s.GetPetDataUsingName(G)if not y then
 
print("pet info not found.. "..G)
return false end
 
local Z=y.hunger if Z>0 then
 
local G=((V/Z))*100 if G<60 then
 
return true end
 
return false end
 
return V<Z end
 e.FeedPetsFood=
function(G,V)
local y=E.GetActivePetsUUIDS()if not y then
 
return end
 
local Z=true 
local j=true 
local i=0 
local c=false for y,J in ipairs(y)do
 
local T=WJ(J)if not T then
 continue end
 
task.wait()
local d=T.UUID 
local q=T.PetData 
local g=T.PetType 
local E=T.PetAbility 
local a=q.HatchedFrom 
local H=q.IsFavorite 
local r=q.Boosts 
local Y=q.Name 
local s=q.LevelProgress 
local N=q.EggName 
local W=q.Level 
local X=q.Hunger 
local h=q.BaseWeight if not Z and tonumber(W)>=100 then
 end
 if i>=V then
 break end
 if e.IsPetHungry(g,X)or j then
 
local V=u.GetFoodForFeedUsingName(G)if not V then
 break end
 if V then
 yJ()
task.wait(.3)VJ(V)
task.wait(.5)e.FeedFruit(J)
task.wait(.3)yJ()c=true i=i+1 
else
 
task.wait(.5)break end
 end
 end
 
return c end
 e.FeedHungryPets=
function(G,V)
local y=E.GetActivePetsUUIDS()if not y then
 
return end
 
local j=false 
local i=false if V and V==true then
 j=true end
 if G and G==true then
 i=true end
 e.UpdateLblStatsText("\240\159\141\142 About to feed pets. ")
local J=false for G,V in ipairs(y)do
 
local y=WJ(V)if not y then
 continue end
 
local T=y.UUID 
local d=y.PetData 
local q=y.PetType 
local g=y.PetAbility if c.feeding_list_pets[q]then
 continue end
 
local E=d.HatchedFrom 
local a=d.IsFavorite 
local H=d.Boosts 
local r=d.Name 
local Y=d.LevelProgress 
local s=d.EggName 
local N=d.Level 
local W=d.Hunger 
local X=d.BaseWeight if not j and tonumber(N)>=100 then
 end
 if Z.IsPaused()or Z.IS_GIFT or S.reclaim_running then
 
return false end
 if e.IsPetHungry(q,W)or i then
 
local G 
local y if not c.feed_food_insteadoffruits then
 G=u.GetRandomFruitForFeed()end
 if c.feed_food_insteadoffruits then
 y=u.GetRandomFoodWithExcluded()if not y then
 end
 end
 if c.feed_food_insteadoffruits==false then
 if not G then
 
local V,y=
pcall(
function()
local G={amount=1;is_batch=false,ignore_fruit_list=c.feeding_list_plants;random=true}u.CollectFruitByNamesSortedRarityConfig({},G)end
)
task.wait(.5)G=u.GetRandomFruitForFeed()
task.wait(.3)end
 end
 if G and not c.feed_food_insteadoffruits then
 yJ()VJ(G)
task.wait(.5)e.UpdateLblStatsText("\226\156\133 Fed "..q)e.FeedFruit(V)
task.wait(.3)yJ()J=true 
elseif y and c.feed_food_insteadoffruits then
 yJ()VJ(y)
task.wait(.5)e.UpdateLblStatsText("\226\156\133 Fed "..q)e.FeedFruit(V)
task.wait(.3)yJ()J=true 
else
 e.UpdateLblStatsText("\226\157\140 No fruit to feed.")
return false end
 end
 end
 if not J then
 e.UpdateLblStatsText("\226\157\140 Nothing to feed.")end
 
return true end
 e.FeedPetsLoop=
function()if Z.IsPaused()or Z.IS_GIFT or S.reclaim_running then
 
return false end
 if not c.feeding_pets_auto then
 e.UpdateLblStatsText("\240\159\148\180 Not running")
return false end
 
local G=tonumber(c.feeding_pets_timer)if not G or G<=0 then
 G=math.random(60,120)end
 if not Z.last_feed_time then
 Z.last_feed_time=0 end
 
local V=os.time()
local y=V-Z.last_feed_time if y<G then
 
local V=G-y e.UpdateLblStatsText("\240\159\159\162 Active. Feed in "..(V.."s"))
return false end
 e.UpdateLblStatsText("\240\159\159\162 Feeding pets now...")
local j,i=
pcall(
function()
return e.FeedHungryPets(c.force_feed_all_pets,true)end
)if not j then
 
warn("[PetFeeder] FeedHungryPets failed:",i)end
 Z.last_feed_time=os.time()
return true end
 d.UpdateStatsText=
function(G)if j.lbl_fallevent_stats then
 j.lbl_fallevent_stats:SetText(G)end
 end
 d.UpdateStatsRequiredText=
function(G)if j.lbl_fallevent_required_fruits then
 j.lbl_fallevent_required_fruits:SetText(G)end
 end
 d.UpdateStatsProgressText=
function(G)if j.lbl_fallevent_progress then
 j.lbl_fallevent_progress:SetText(G)end
 end
 d.UpdateStatsFallBloomText=
function(G)if j.lbl_fallevent_fall_bloom then
 j.lbl_fallevent_fall_bloom:SetText(G)end
 end
 d.UpdateRequiredFruitsInfoText=
function(G)if j.lbl_fallevent_fruit_ls then
 j.lbl_fallevent_fruit_ls:SetText(G)end
 end
 d.cache={}d.findInWorkspace=
function(G,y)
local Z=string.lower(G)for G,V in ipairs(V.Workspace:GetDescendants())do
 if string.lower(V.Name)==Z and V:IsA(y)then
 
return V end
 end
 
return nil end
 d.findInWorkspaceMulti=
function(G,y)
local Z=string.lower(G)
local j={}for G,V in ipairs(V.Workspace:GetDescendants())do
 if string.lower(V.Name)==Z and V:IsA(y)then
 table.insert(j,V)end
 end
 
return j end
 d.findInWorkspaceOrInteraction=
function(G,y)
local Z=V.Workspace:FindFirstChild(G)if Z and((not y or Z:IsA(y)))then
 
return Z end
 
local j=V.Workspace:FindFirstChild("Interaction")if j then
 for V,Z in ipairs(j:GetDescendants())do
 if Z.Name==G and((not y or Z:IsA(y)))then
 
return Z end
 end
 end
 
return nil end
 d.SubmitFruits=
function()
pcall(
function()Z.StopEnhancer(3)end
)W.SafeFruitsProccess()
task.wait(.4)
pcall(
function()
task.spawn(
function()V.GameEvents.ChristmasEvent.ChristmasTree_SubmitAll:FireServer(V.LocalPlayer)end
)end
)end
 d.ClaimRewardsTrack=
function()
pcall(
function()(game:GetService("ReplicatedStorage")).GameEvents.ChristmasEvent.ChristmasTree_ClaimRewardTrack:FireServer()end
)end
 d.ClaimRewardsOrReset=
function(G)
local y=1 
pcall(
function()
local G=V.PlayerGui:FindFirstChild("ChipmunkRewards_UI")if not G then
 
return end
 
local Z=G.Frame.Main.Holder 
local j=Z.CLAIM_BUTTON.Visible 
local i=V.Workspace.ChipmunkEvent.NutsPlatform.ChipmunkRewardSign if not i then
 
return end
 
local c=i.Root.SurfaceGui.TextLabel if not c then
 
return end
 
local J=c.Text 
local T=tonumber(string.match(J,"(%d+)"))or 0 
local d=V.ReplicatedStorage.GameEvents:FindFirstChild("ClaimChipmunkRewards")if not d then
 
return end
 
local 
function u()d:FireServer()end
 if T>=y then
 u()end
 if j then
 u()end
 end
)
pcall(
function()
local G=V.PlayerGui:FindFirstChild("ChipmunkRewards_UI")if not G then
 
return end
 
local y=G.Frame.Main.Holder.RestartFrame.Visible if y then
 
local G=V.ReplicatedStorage.GameEvents:FindFirstChild("RestartChipmunkTrack")if G then
 G:FireServer()end
 end
 end
)end
 d.GetLookingForTrait=
function()
local G,V=
pcall(
function()
local G=d.cache.SafariEvent or nil if not G then
 
return nil end
 
local V=(((G:FindFirstChild("Safari platform")):FindFirstChild("NPC")):FindFirstChild("Safari Joyce")).Head.BubblePart.SafariTraitBillboard.BG.TraitTextLabel 
local y=V.ContentText or""
local Z=y:match("looking for (.+) Plants")
return Z end
)if true then
 
return"Christmas Mutations"end
 if G and V then
 
return V 
else
 
warn("Error",V)
return nil end
 end
 d.EventFolderExists=
function()
local G,V=
pcall(
function()
local G=nil 
local V=d.findInWorkspaceMulti("LumberjackPlatformOld","Model")for G,V in ipairs(V)do
 
return V end
 
return G end
)if G then
 
return V end
 
return nil end
 d.ClaimDailyNewYears=
function()for G=1,10,1 do
 
pcall(
function()(game:GetService("ReplicatedStorage")).GameEvents.NewYearsEvent.ClaimAdventCalendarDay:FireServer(G)end
)end
 end
 
task.spawn(
function()while true do
 
task.wait(60)if not c.newyear_dailyclaim then
 continue end
 d.ClaimDailyNewYears()end
 end
)d.GetProgressPercent=
function()
local G,V=
pcall(
function()
local G=d.EventFolderExists()if not G then
 
return nil end
 
local V=G:FindFirstChild("Wonder Water",true)
local y=V:FindFirstChild("ProgressBG",true)
local Z=y.TextLabel if not Z then
 
return nil end
 
local j=((Z.ContentText or"")):match("^%s*(.-)%s*$")
local i,c=j:match("^(%d+)%s*/%s*(%d+)$")if i and c then
 
local G=string.format("%s/%s",i,c)
return G end
 
return nil end
)
return G and V or nil end
 d.GetCooldown=
function()
local G,V=
pcall(
function()
local G=d.EventFolderExists()if not G then
 
return nil end
 
local V=G:FindFirstChild("GiftTimer",true)if not V then
 
return nil end
 
local y=V.Frame.Title.Timer if not y then
 
return nil end
 
local Z=G:FindFirstChild("ProgressBar",true)
local j=Z.Frame.ProgressBG.TextLabel if not j then
 
return nil end
 
local i=(j.ContentText or"")
local c=(y.ContentText or"")if i=="Complete!"then
 
return c end
 
return nil end
)if G and V then
 
return V 
else
 
warn("Error",V)
return nil end
 end
 d.GetFallBlooms=
function()if true then
 
return nil end
 
local G,y=
pcall(
function()
local G=V.Workspace["Fall Festival"].FallPlatform.FallBloomsContributedSign.Part.SurfaceGui.Root.Quantity 
local y=G.ContentText or""
local Z=tonumber(y)if Z then
 
return Z end
 
return nil end
)if G and y then
 
return y 
else
 
return nil end
 end
 K.FeedEvent={FeedBirds=
function()
pcall(
function() end
)
local G=d.findInWorkspace("Bird_Nest","Model")if G then
 
local V=G:FindFirstChild("ForceHatchPrompt",true)if V then
 
local G=V.HoldDuration 
local y=V.MaxActivationDistance V.HoldDuration=0 V.MaxActivationDistance=10000 fireproximityprompt(V)V.HoldDuration=G V.MaxActivationDistance=y end
 end
 end
;GetEventActive=
function()
local G=d.findInWorkspace("Bird_Nest","Model")if G then
 
return true end
 
return false end
;GetAlreadyFed=
function()
local G=V.Workspace:FindFirstChild("Model")if G then
 
local V=G:FindFirstChild("Handle")if V then
 
return true end
 end
 
return false end
,FeedRandomFood=
function()
local G=r.GetFruitCount()if G==0 then
 
local G={amount=1;ignore_fruit_list=T.feedevent.feed_plant_list or{};random=true}
local V={}
local y=u.CollectFruitByNamesSortedRarityConfig(V,G)
task.wait(1)end
 
local V={ignore_plants=T.feedevent.feed_plant_list or{}}
local y=r.GetRandomFruitUsingFilters(V)if y then
 VJ(y)
task.wait(1)if fJ(y)then
 K.FeedEvent.FeedBirds()
task.wait(.1)end
 end
 end
}E.Garden={IsEasterGarden=
function()
local G=V.LocalPlayer:GetAttribute("CurrentSlot")or""if G~="Easter 2026"then
 
return false end
 
return true end
;IsHoneyBeeGarden=
function()
local G=V.LocalPlayer:GetAttribute("CurrentSlot")or""if G~="Honey"then
 
return false end
 
return true end
;GetIsNormalGarden=
function()if E.Garden.IsEasterGarden()then
 
return false end
 if E.Garden.IsHoneyBeeGarden()then
 
return false end
 
return true end
}Z.BeeEggs={}Z.BeeEggsData={}Z.LoadBeeEggRegistry=
function()
local G={["Common Bee Egg"]={Price=10,Rarity="Common";HatchTime=300};["Rare Bee Egg"]={Price=100,Rarity="Rare",HatchTime=1800},["Mythical Bee Egg"]={Price=500,Rarity="Mythical",HatchTime=3600}}
local 
function V(G)
local V={}
local y={}for G,Z in pairs(G or{})do
 if type(G)=="string"and type(Z)=="table"then
 table.insert(V,G)y[G]={Price=tonumber(Z.Price)or 0;Rarity=tostring(Z.Rarity or"Unknown");HatchTime=tonumber(Z.HatchTime)or 0,Icon=Z.Icon;StockChance=tonumber(Z.StockChance)or 0;Color=Z.Color;NameColor=Z.NameColor;BeeWeights=Z.BeeWeights or{}}end
 end
 table.sort(V,
function(G,V)
local Z=y[G]
local j=y[V]
local i=tonumber(Z and Z.Price)or 0 
local c=tonumber(j and j.Price)or 0 if i==c then
 
return tostring(G)<tostring(V)end
 
return i<c end
)Z.BeeEggs=V Z.BeeEggsData=y 
return true end
 
local y,j=
pcall(
function()
local G=game:GetService("ReplicatedStorage")
local V=G:FindFirstChild("Data")if not V then
 
return nil end
 
local y=V:FindFirstChild("BeeEvent")if not y then
 
return nil end
 
local Z=y:FindFirstChild("BeeEggRegistry")if not Z or not Z:IsA("ModuleScript")then
 
return nil end
 
local j=require(Z)if type(j)~="table"then
 
return nil end
 if type(j.Entries)~="table"then
 
return nil end
 
return j.Entries end
)if y and type(j)=="table"then
 
local G=V(j)if G then
 
return true,"Loaded from BeeEggRegistry"end
 end
 V(G)
return false,"Used fallback bee egg data"end
 
local Wl,Xl=Z.LoadBeeEggRegistry()K.BeeEggShop={MaxPerEgg={};DefaultMax=1000000,BuyDelay=.8,GetUserSelectedBeeEggs=
function()
local G={["Common Bee Egg"]=true}
return T.bee_whitelisteggs or{}end
,GetOwnedAmount=
function(G)
local V,y=r.GetBeeEggAndCountUsingName(G)
return y end
;GetCurrentHoneyCoins=
function()
return m.SpecialCurrency.GetHoneyCoins()end
,GetEggPrice=
function(G)
local V=Z.BeeEggsData and Z.BeeEggsData[G]
return tonumber(V and V.Price)or 0 end
;GetBeeStocks=
function()
local G=m.GetBigDataUsingKey("BeeEggShopStock")
local V=G and G.Stocks if not V then
 
return nil end
 
return V end
;GetSortedBuyList=
function(G)
local V=K.BeeEggShop.GetUserSelectedBeeEggs()
local y={}for G,Z in pairs(G or{})do
 if V[G]==true then
 
local V=tonumber(Z and Z.Stock)or 0 
local j=K.BeeEggShop.GetEggPrice(G)if V>0 and j>0 then
 table.insert(y,{EggName=G;Stock=V;Price=j})end
 end
 end
 table.sort(y,
function(G,V)if G.Price==V.Price then
 
return tostring(G.EggName)<tostring(V.EggName)end
 
return G.Price>V.Price end
)
return y end
;BuyBeeEgg=
function(G)
local y,Z=
pcall(
function()
return V.GameEvents.BeeColonyEggShopService.BuyBeeEggStock:InvokeServer(G)end
)if not y then
 
warn("[BeeEggShop Buy Error]:",G,Z)
return false end
 
return true end
;AutoBuyLoopTick=
function()if not T.bee_autobuyshop then
 
return end
 
local G=K.BeeEggShop.GetBeeStocks()if not G then
 
return false end
 
local V=K.BeeEggShop.GetCurrentHoneyCoins()if Z.TotalPlantsInFarm and Z.TotalPlantsInFarm<15 then
 if V<=50 then
 
return false end
 end
 if V<=5 then
 
return false end
 
local y=K.BeeEggShop.GetSortedBuyList(G)for G,y in ipairs(y)do
 
local Z=y.EggName 
local j=y.Stock 
local i=y.Price 
local c=tonumber(K.BeeEggShop.GetOwnedAmount(Z))or 0 
local J=tonumber(K.BeeEggShop.MaxPerEgg[Z])or K.BeeEggShop.DefaultMax while j>0 and(c<J and V>=i)do
 
local G=K.BeeEggShop.BuyBeeEgg(Z)if not G then
 break end
 j=j-1 c=c+1 V=V-i 
task.wait(K.BeeEggShop.BuyDelay)end
 end
 
return true end
}Z.TEXT_BEEHATCHER_STATS=""K.BeeHatchUpgrader={LastAction=0;ActionDelay=.8;KeepBeeWhitelist={["Royal Bee"]=true;["Turbo Bee"]=true,["Treasure Bee"]=true;["Princess Bee"]=true,["Illusion Bee"]=true;["Baby Bee"]=true;["Clockwork Bee"]=true,["Merchant Bee"]=true;["Jester Bee"]=true,["Panic Bee"]=true;["Rumble Bee"]=true,["Busy Bee"]=true;["Pollen Bee"]=true},EggPriorityFallback={"Mythical Bee Egg";"Rare Bee Egg","Common Bee Egg"};MinActiveBees=1;CountActiveBees=
function(G)
local V=0 if not G or type(G.BySlot)~="table"then
 
return 0 end
 for G,y in pairs(G.BySlot)do
 if y and y.State=="Active"then
 V=V+1 end
 end
 
return V end
;CanReplaceActiveBee=
function(G)
local V=K.BeeHatchUpgrader.CountActiveBees(G)
local y=tonumber(K.BeeHatchUpgrader.MinActiveBees)or 1 
return V>y,V,y end
,SetStatus=
function(G)G=tostring(G or"")Z.TEXT_BEEHATCHER_STATS=G 
return true end
,GetRemote=
function(G)
local y,Z=
pcall(
function()
local y=V and V.GameEvents or(game:GetService("ReplicatedStorage")):FindFirstChild("GameEvents")if not y then
 
return nil end
 
local Z=y:FindFirstChild("BizzyBeeEvent")if not Z then
 
return nil end
 
return Z:FindFirstChild(G)end
)if not y then
 
return nil end
 
return Z end
,IsKeepBee=
function(G)G=tostring(G or"")
return K.BeeHatchUpgrader.KeepBeeWhitelist[G]==true end
;GetEggCountBee=
function(G)
local V,y=r.GetBeeEggAndCountUsingName(G)
print("Egg Count: ",G..(" ["..tostring(y)))
return y end
,GetBestEggToUse=
function()
local G={}if type(Z.BeeEggs)=="table"and type(Z.BeeEggsData)=="table"then
 for V,y in ipairs(Z.BeeEggs)do
 
local j=Z.BeeEggsData[y]table.insert(G,{Name=y;Price=tonumber(j and j.Price)or 0})end
 
else
 for V,y in ipairs(K.BeeHatchUpgrader.EggPriorityFallback)do
 
local Z=0 if y=="Mythical Bee Egg"then
 Z=500 
elseif y=="Rare Bee Egg"then
 Z=100 
elseif y=="Common Bee Egg"then
 Z=10 end
 table.insert(G,{Name=y;Price=Z})end
 end
 table.sort(G,
function(G,V)
return((tonumber(G.Price)or 0))>((tonumber(V.Price)or 0))end
)for G,V in ipairs(G)do
 if K.BeeHatchUpgrader.GetEggCountBee(V.Name)>0 then
 
return V.Name end
 end
 
return nil end
,GetHiveModel=
function()
local G=E and E.mFarm if not G then
 
return nil end
 
local V=G:FindFirstChild("CurrentExpansion")if not V then
 
return nil end
 
local y=V:FindFirstChild("Custom")if not y then
 
return nil end
 
return y:FindFirstChild("Hive")end
,GetHiveSlots=
function()
local G=K.BeeHatchUpgrader.GetHiveModel()if not G then
 
return{}end
 
local V={}for G,y in ipairs(G:GetChildren())do
 
local Z=tonumber(y.Name)if Z then
 table.insert(V,Z)end
 end
 table.sort(V)
return V end
;GetHiveData=
function()
local G,V=
pcall(
function()
local G=m.GetBigDataUsingKey("BeeEventData")
local V=G and G.BeeInventoryData if type(V)~="table"then
 
return nil end
 
local y={BySlot={};ByUUID={},Slots=K.BeeHatchUpgrader.GetHiveSlots()}for G,V in pairs(V)do
 if type(V)=="table"and type(V.Data)=="table"then
 
local Z=tonumber(V.Data.Slot)if Z then
 
local j={UUID=tostring(G);Slot=Z,BeeName=tostring(V.BeeName or"Unknown Bee");State=tostring(V.Data.State or"Unknown"),HatchedFrom=tostring(V.Data.HatchedFrom or"Unknown Egg"),TimeUntilHatch=tonumber(V.Data.TimeUntilHatch)or 0}y.BySlot[Z]=j y.ByUUID[j.UUID]=j end
 end
 end
 
return y end
)if not G then
 
warn("[BeeHatchUpgrader GetHiveData Error]:",V)
return nil end
 
return V end
;DoHatchEgg=
function(G)G=tostring(G or"")if G==""then
 
return false end
 
local V=K.BeeHatchUpgrader.GetRemote("HatchBeeSwarmEgg")if not V then
 
return false end
 
local y,Z=
pcall(
function()V:FireServer(G)end
)if not y then
 
warn("[BeeHatchUpgrader Hatch Error]:",Z)
return false end
 
return true end
,DoPlaceEgg=
function(G,V)G=tonumber(G)if not G then
 
return false end
 
local y=K.BeeHatchUpgrader.GetRemote("PlaceBeeEggRE")if not y then
 
return false end
 
local Z,j=r.GetBeeEggAndCountUsingName(V)VJ(Z)
local i,c=
pcall(
function()y:FireServer(G)end
)if not i then
 
warn("[BeeHatchUpgrader Place Error]:",V,c)
return false end
 
return true end
,DoReplaceEgg=
function(G,V,y)G=tonumber(G)V=tostring(V or"")if not G or V==""then
 
return false end
 
local Z=K.BeeHatchUpgrader.GetRemote("ReplaceBeeRE")if not Z then
 
return false end
 
local j,i=r.GetBeeEggAndCountUsingName(y)VJ(j)
local c,J=
pcall(
function()Z:FireServer(G,V)end
)if not c then
 
warn("[BeeHatchUpgrader Replace Error]:",y,J)
return false end
 
return true end
,CanActNow=
function()
local G=os.clock()if G-K.BeeHatchUpgrader.LastAction<K.BeeHatchUpgrader.ActionDelay then
 
return false end
 K.BeeHatchUpgrader.LastAction=G 
return true end
;HatcherBeeLoop=
function()if not T.bee_hiveautohatch then
 
return end
 
local G,V=
pcall(
function()if not E.Garden.IsHoneyBeeGarden()then
 K.BeeHatchUpgrader.SetStatus("\240\159\144\157 Bee Hatcher: Waiting for Honey Bee Garden")
return false end
 if not K.BeeHatchUpgrader.CanActNow()then
 
return false end
 
local G=K.BeeHatchUpgrader.GetHiveData()if not G then
 K.BeeHatchUpgrader.SetStatus("\240\159\144\157 Bee Hatcher: Waiting for hive data")
return false end
 
local V=K.BeeHatchUpgrader.GetBestEggToUse()if not V then
 K.BeeHatchUpgrader.SetStatus("\240\159\144\157 Bee Hatcher: No Bee Eggs found in inventory")
else
 K.BeeHatchUpgrader.SetStatus("\240\159\144\157 Bee Hatcher: Best egg ready \226\128\162 "..tostring(V))end
 if V then
 for y,Z in ipairs(G.Slots)do
 if not G.BySlot[Z]then
 K.BeeHatchUpgrader.SetStatus(string.format("\240\159\165\154 Bee Hatcher: Placing %s in empty slot %s",tostring(V),tostring(Z)))
return K.BeeHatchUpgrader.DoPlaceEgg(Z,V)end
 end
 end
 if V then
 for y,Z in ipairs(G.Slots)do
 
local j=G.BySlot[Z]if j and j.State=="Hatching"then
 if not K.BeeHatchUpgrader.IsKeepBee(j.BeeName)then
 K.BeeHatchUpgrader.SetStatus(string.format("\240\159\148\129 Bee Hatcher: Replacing bad hatching bee \226\128\162 Slot %s \226\128\162 %s \226\134\146 %s",tostring(j.Slot),tostring(j.BeeName),tostring(V)))
return K.BeeHatchUpgrader.DoReplaceEgg(j.Slot,j.UUID,V)
else
 K.BeeHatchUpgrader.SetStatus(string.format("\226\143\179 Bee Hatcher: Keeping hatching bee \226\128\162 Slot %s \226\128\162 %s",tostring(j.Slot),tostring(j.BeeName)))end
 end
 end
 end
 if V then
 
local y,Z,j=K.BeeHatchUpgrader.CanReplaceActiveBee(G)if not y then
 K.BeeHatchUpgrader.SetStatus(string.format("\240\159\155\161\239\184\143 Bee Hatcher: Keeping last active bee safe \226\128\162 Active %s/%s",tostring(Z),tostring(j)))
else
 for y,j in ipairs(G.Slots)do
 
local i=G.BySlot[j]if i and i.State=="Active"then
 if not K.BeeHatchUpgrader.IsKeepBee(i.BeeName)then
 K.BeeHatchUpgrader.SetStatus(string.format("\240\159\148\129 Bee Hatcher: Replacing active bee \226\128\162 Slot %s \226\128\162 %s \226\134\146 %s \226\128\162 Active left after replace: %s",tostring(i.Slot),tostring(i.BeeName),tostring(V),tostring(Z-1)))
return K.BeeHatchUpgrader.DoReplaceEgg(i.Slot,i.UUID,V)end
 end
 end
 end
 end
 for y,Z in ipairs(G.Slots)do
 
local j=G.BySlot[Z]if j and j.State=="ReadyToHatch"then
 
local G=K.BeeHatchUpgrader.IsKeepBee(j.BeeName)if G then
 K.BeeHatchUpgrader.SetStatus(string.format("\226\156\133 Bee Hatcher: Hatching wanted bee \226\128\162 Slot %s \226\128\162 %s",tostring(j.Slot),tostring(j.BeeName)))
return K.BeeHatchUpgrader.DoHatchEgg(j.UUID)end
 if V then
 K.BeeHatchUpgrader.SetStatus(string.format("\240\159\148\129 Bee Hatcher: Replacing unwanted ready egg \226\128\162 Slot %s \226\128\162 %s \226\134\146 %s",tostring(j.Slot),tostring(j.BeeName),tostring(V)))
return K.BeeHatchUpgrader.DoReplaceEgg(j.Slot,j.UUID,V)end
 K.BeeHatchUpgrader.SetStatus(string.format("\226\154\160\239\184\143 Bee Hatcher: No eggs left, hatching anyway \226\128\162 Slot %s \226\128\162 %s",tostring(j.Slot),tostring(j.BeeName)))
return K.BeeHatchUpgrader.DoHatchEgg(j.UUID)end
 end
 K.BeeHatchUpgrader.SetStatus("\240\159\144\157 Bee Hatcher: Hive checked \226\128\162 nothing to change")
return true end
)if not G then
 K.BeeHatchUpgrader.SetStatus("\226\157\140 Bee Hatcher Error: "..tostring(V))
warn("[BeeHatchUpgrader Loop Error]:",V)
return false end
 
return true end
}Z.TEXT_HIVEUPGRDE_STATS=""K.BeeHiveUpgrateSystem={LastAction=0;ActionDelay=1.5;ReserveHoneyCoins=0,UpgradePlan={{Name="PollinationAmount";Tier=1},{Name="CompressorCapacity",Tier=1};{Name="CompressorSpeed";Tier=1};{Name="BeeCapacity",Tier=1};{Name="BeeCapacity";Tier=2};{Name="BeeCapacity";Tier=3};{Name="BeeSpeed";Tier=1},{Name="BeeSpeed",Tier=2},{Name="PollinationAmount",Tier=2};{Name="CompressorCapacity",Tier=2},{Name="CompressorSpeed";Tier=2};{Name="BeeCapacity";Tier=4},{Name="PollinationAmount",Tier=3};{Name="CompressorCapacity",Tier=3};{Name="BeeCapacity",Tier=5};{Name="BeeSpeed";Tier=3};{Name="PollinationAmount",Tier=4};{Name="BeeCapacity",Tier=6};{Name="CompressorSpeed";Tier=3},{Name="BeeCapacity",Tier=7},{Name="BeeCapacity",Tier=8},{Name="BeeSpeed";Tier=4},{Name="CompressorCapacity";Tier=4};{Name="CompressorSpeed";Tier=4}};FallbackConfig={BeeCapacity={MaxTier=8;CostPerTier={15,20;25;100;250;1000,5000;10000},LevelsPerTier={1,3;3;3,3,3,2;2}};BeeSpeed={MaxTier=4;CostPerTier={25;45,500,2000};LevelsPerTier={1;1,1;1}};CompressorCapacity={MaxTier=4;CostPerTier={10;15;150;1000;2500},LevelsPerTier={1;1;1,1}};CompressorSpeed={MaxTier=4;CostPerTier={15,75;500,5000},LevelsPerTier={1;1,1,1}};PollinationAmount={MaxTier=4,CostPerTier={10;65,250,2000};LevelsPerTier={1;1,1,1}}};SetStatus=
function(G)Z.TEXT_HIVEUPGRDE_STATS=tostring(G or"")
return true end
,CanActNow=
function()
local G=os.clock()if G-K.BeeHiveUpgrateSystem.LastAction<K.BeeHiveUpgrateSystem.ActionDelay then
 
return false end
 K.BeeHiveUpgrateSystem.LastAction=G 
return true end
;GetCurrentUpgradesData=
function()
local G,V=
pcall(
function()
local G=m.GetBigDataUsingKey("BeeEventData")
return G and G.BeeSkillTree end
)if not G or type(V)~="table"then
 
return nil end
 
return V end
,GetCHoneyCoins=
function()
local G,V=
pcall(
function()
return m.SpecialCurrency.GetHoneyCoins()end
)if not G then
 
return 0 end
 
return tonumber(V)or 0 end
,GetUpgradeConfig=
function()
local G,V=
pcall(
function()
local G=game:GetService("ReplicatedStorage")
local V=G:FindFirstChild("Modules")if not V then
 
return nil end
 
local y=V:FindFirstChild("BeeEventV2Controllers")if not y then
 
return nil end
 
local Z=y:FindFirstChild("BeeSkillTreeController")if not Z then
 
return nil end
 
local j=Z:FindFirstChild("Config")if not j or not j:IsA("ModuleScript")then
 
return nil end
 
local i=require(j)
return i and i.UPGRADE_CONFIG end
)if G and type(V)=="table"then
 
return V end
 
return K.BeeHiveUpgrateSystem.FallbackConfig end
,GetProgressKey=
function(G,V)V=tonumber(V)or 1 
return tostring(G)..("_"..tostring(V))end
,GetUpgradeCost=
function(G,V,y)
local Z=G and G[V]if type(Z)~="table"then
 
return nil end
 
local j=tonumber(Z.MaxTier)or 0 y=tonumber(y)or 0 if y<=0 or y>j then
 
return nil end
 
local i=Z.CostPerTier if type(i)~="table"then
 
return nil end
 
return tonumber(i[y])end
;GetUpgradeNeededLevels=
function(G,V,y)
local Z=G and G[V]if type(Z)~="table"then
 
return 1 end
 
local j=Z.LevelsPerTier if type(j)~="table"then
 
return 1 end
 
return tonumber(j[y])or 1 end
;GetUpgradeProgress=
function(G,V,y)
local Z=K.BeeHiveUpgrateSystem.GetUpgradeConfig()
local j=Z and Z[V]y=tonumber(y)or 1 
local i=K.BeeHiveUpgrateSystem.GetProgressKey(V,y)
local c=tonumber(G and G[i])or 0 
local J=1 if type(j)=="table"and type(j.LevelsPerTier)=="table"then
 J=tonumber(j.LevelsPerTier[y])or 1 end
 
return c,J,i end
;IsTierOwned=
function(G,V,y)if type(G)~="table"then
 
return false end
 
local Z,j=K.BeeHiveUpgrateSystem.GetUpgradeProgress(G,V,y)
return Z>=j end
,GetNextUpgradeToBuy=
function()
local G=K.BeeHiveUpgrateSystem.GetCurrentUpgradesData()if not G then
 
return nil,"No skill tree data"end
 
local V=K.BeeHiveUpgrateSystem.GetUpgradeConfig()
local y=K.BeeHiveUpgrateSystem.GetCHoneyCoins()
local Z=tonumber(K.BeeHiveUpgrateSystem.ReserveHoneyCoins)or 0 
local j=math.max(0,y-Z)
local i=nil for Z,c in ipairs(K.BeeHiveUpgrateSystem.UpgradePlan)do
 
local J=c.Name 
local T=tonumber(c.Tier)or 0 if not K.BeeHiveUpgrateSystem.IsTierOwned(G,J,T)then
 
local Z=K.BeeHiveUpgrateSystem.GetUpgradeCost(V,J,T)if Z then
 
local V,c,d=K.BeeHiveUpgrateSystem.GetUpgradeProgress(G,J,T)if j>=Z then
 
return{Name=J;Tier=T;Cost=Z;Coins=y;Spendable=j;Current=V;Needed=c,Key=d}end
 if not i then
 i={Name=J,Tier=T;Cost=Z,Coins=y;Current=V;Needed=c;Key=d}end
 end
 end
 end
 if i then
 
return nil,string.format("Need more honey coins for %s T%s \226\128\162 Progress %s/%s \226\128\162 Cost %s \226\128\162 Have %s",tostring(i.Name),tostring(i.Tier),tostring(i.Current),tostring(i.Needed),tostring(i.Cost),tostring(i.Coins))end
 
return nil,"All planned upgrades completed"end
,PurchaseUpgrade=
function(G,y)y=tonumber(y)or 1 
local Z,j,i=
pcall(
function()
local Z=V and(V.GameEvents and V.GameEvents:FindFirstChild("BeeSkillTreeService"))if not Z then
 
local G=game:GetService("ReplicatedStorage")
local V=G:FindFirstChild("GameEvents")Z=V and V:FindFirstChild("BeeSkillTreeService")end
 if not Z then
 
return false,"BeeSkillTreeService missing"end
 
local j=Z:FindFirstChild("PurchaseUpgrade")if not j then
 
return false,"PurchaseUpgrade missing"end
 
return j:InvokeServer(G,y)end
)if not Z then
 
return false,j end
 if j==false then
 
return false,i or"Server rejected upgrade"end
 
return true,j end
;HoneyUpgradeLoop=
function()if not T.bee_hiveautoupgrade then
 
return end
 
local G,V=
pcall(
function()if not K.BeeHiveUpgrateSystem.CanActNow()then
 
return false end
 
local G,V=K.BeeHiveUpgrateSystem.GetNextUpgradeToBuy()if not G then
 K.BeeHiveUpgrateSystem.SetStatus("\240\159\141\175 Hive Upgrade: "..tostring(V))
return false end
 K.BeeHiveUpgrateSystem.SetStatus(string.format("\226\172\134\239\184\143 Hive Upgrade: Buying %s T%s \226\128\162 Progress %s/%s \226\128\162 Cost %s \226\128\162 Honey %s",tostring(G.Name),tostring(G.Tier),tostring(G.Current),tostring(G.Needed),tostring(G.Cost),tostring(G.Coins)))
local y,Z=K.BeeHiveUpgrateSystem.PurchaseUpgrade(G.Name,G.Tier)if not y then
 K.BeeHiveUpgrateSystem.SetStatus(string.format("\226\157\140 Hive Upgrade: Failed %s T%s \226\128\162 Progress %s/%s \226\128\162 %s",tostring(G.Name),tostring(G.Tier),tostring(G.Current),tostring(G.Needed),tostring(Z)))
return false end
 K.BeeHiveUpgrateSystem.SetStatus(string.format("\226\156\133 Hive Upgrade: Bought %s T%s \226\128\162 Progress %s/%s \226\128\162 Cost %s",tostring(G.Name),tostring(G.Tier),tostring(G.Current),tostring(G.Needed),tostring(G.Cost)))
return true end
)if not G then
 K.BeeHiveUpgrateSystem.SetStatus("\226\157\140 Hive Upgrade Error: "..tostring(V))
warn("[BeeHiveUpgrade Error]:",V)
return false end
 
return true end
}K.Hive={GuiName="HiveSlotBillboardGui";LabelName="HiveSlotLabel",MaxDistance=100,ShowBeeNames=true;ShowEggOnly=false,GetHiveModel=
function()
local G=E and E.mFarm if not G then
 
return nil end
 
local V=G:FindFirstChild("CurrentExpansion")if not V then
 
return nil end
 
local y=V:FindFirstChild("Custom")if not y then
 
return nil end
 
return y:FindFirstChild("Hive")end
;BeeEventDataHive=
function()
local G=m.GetBigDataUsingKey("BeeEventData")
local V=G and G.BeeInventoryData if type(V)~="table"then
 
return false end
 
local y={}for G,V in pairs(V)do
 if type(V)=="table"then
 
local Z=V.Data if type(Z)=="table"then
 
local j=tonumber(Z.Slot)if j then
 y[j]={Slot=j;BeeName=V.BeeName or"Unknown Bee",HatchedFrom=Z.HatchedFrom or"Unknown Egg";State=Z.State or"Unknown";UUID=G}end
 end
 end
 end
 
return y end
,UpdateHiveEsp=
function()
local G=K.Hive.GetHiveModel()if not G then
 
return false end
 
local V=K.Hive.BeeEventDataHive()if not V then
 K.Hive.ClearAllText()
return false end
 
local y={}for G,V in pairs(V)do
 if type(V)=="table"then
 
local Z=tostring(V.HatchedFrom or"Unknown Egg")
local j=tostring(V.BeeName or"Unknown Bee")
local i=tostring(V.State or"Unknown")
local c=string.lower(i)
local J=""if K.Hive.ShowBeeNames==true then
 if c=="active"then
 J=string.format(" <font color=\'#FF6F00\'>%s</font> <font color=\'#FFFFFF\'>\226\128\162</font> [%s]",j,Z)
else
 J=string.format(" <font color=\'#FF6F00\'>%s</font>",j)end
 
elseif K.Hive.ShowEggOnly==true then
 J=string.format(" <font color=\'#FF6F00\'>%s</font>",j)
else
 
local G="#AAFF00"if c~="active"then
 G="#FFD45A"end
 J=string.format(" <font color=\'#FF6F00\'>%s</font> <font color=\'#FFFFFF\'>\226\128\162</font> <font color=\'%s\'>%s</font>",Z,G,i)end
 K.Hive.SetSlotRawText(G,J)y[tonumber(G)]=true end
 end
 for G,V in ipairs(G:GetChildren())do
 
local Z=tonumber(V.Name)if Z and not y[Z]then
 K.Hive.ClearSlotText(Z)end
 end
 
return true end
;GetSlot=
function(G)
local V=K.Hive.GetHiveModel()if not V then
 
return nil end
 
return V:FindFirstChild(tostring(G))end
,GetOccupancyPart=
function(G)
local V=K.Hive.GetSlot(G)if not V then
 
return nil end
 
local y=V:FindFirstChild("OccupancyPart")if not y or not y:IsA("BasePart")then
 
return nil end
 
return y end
,CreateOrUpdateText=
function(G,V)
local y=K.Hive.GetOccupancyPart(G)if not y then
 
return false end
 V=tostring(V or"")
local Z=y:FindFirstChild(K.Hive.GuiName)if not Z then
 Z=Instance.new("BillboardGui")Z.Name=K.Hive.GuiName Z.Adornee=y Z.Size=UDim2.new(0,150,0,50)Z.StudsOffset=Vector3.new(0,2,0)Z.AlwaysOnTop=true Z.MaxDistance=K.Hive.MaxDistance Z.Parent=y 
local G=Instance.new("TextLabel")G.Name=K.Hive.LabelName G.Size=UDim2.new(1,0,1,0)G.BackgroundTransparency=1 G.RichText=true G.TextColor3=Color3.fromRGB(255,255,255)G.TextStrokeTransparency=0 G.TextStrokeColor3=Color3.fromRGB(0,0,0)G.Font=Enum.Font.SourceSansBold G.TextScaled=false G.TextSize=14 G.TextXAlignment=Enum.TextXAlignment.Center G.TextYAlignment=Enum.TextYAlignment.Center G.Parent=Z 
else
 Z.MaxDistance=K.Hive.MaxDistance Z.Adornee=y end
 
local j=Z:FindFirstChild(K.Hive.LabelName)if not j then
 
return false end
 j.RichText=true j.Text=V 
return true end
,SetSlotText=
function(G,V,y)
local Z=string.format(" <font color=\'#FF6F00\'>%s</font> <font color=\'#FFFFFF\'>\226\128\162</font> <font color=\'#AAFF00\'>%s</font>",tostring(V or"Unknown Egg"),tostring(y or"Unknown Bee"))
return K.Hive.CreateOrUpdateText(G,Z)end
;SetSlotRawText=
function(G,V)
return K.Hive.CreateOrUpdateText(G,tostring(V or""))end
,UpdateSlotFromData=
function(G,V)if type(V)~="table"then
 
return false end
 
local y=V.eggName or V.egg or V.name or V.HatchedFrom or"Unknown Egg"
local Z=V.beeName or V.bee or V.reward or V.BeeName or"Unknown Bee"
return K.Hive.SetSlotText(G,y,Z)end
,ClearSlotText=
function(G)
local V=K.Hive.GetOccupancyPart(G)if not V then
 
return false end
 
local y=V:FindFirstChild(K.Hive.GuiName)if y then
 y:Destroy()end
 
return true end
;ClearAllText=
function()
local G=K.Hive.GetHiveModel()if not G then
 
return false end
 for G,V in ipairs(G:GetChildren())do
 if tonumber(V.Name)then
 
local G=V:FindFirstChild("OccupancyPart")if G then
 
local V=G:FindFirstChild(K.Hive.GuiName)if V then
 V:Destroy()end
 end
 end
 end
 
return true end
}
task.spawn(
function()while true do
 
task.wait(1)if not E.Garden.IsHoneyBeeGarden()then
 K.Hive.ClearAllText()
task.wait(5)continue end
 K.Hive.ShowHatchingEggs=c.hive_esp_eggs==true K.Hive.ShowBeeNames=c.hive_esp_showhatched==true if K.Hive.ShowHatchingEggs~=true and K.Hive.ShowBeeNames~=true then
 K.Hive.ClearAllText()
task.wait(4)continue end
 
local G,V=
pcall(
function()K.Hive.UpdateHiveEsp()end
)if not G then
 
warn("[Hive ESP Error]:",V)end
 end
 end
)Z.TEXT_HONEYMACHINE2026=""K.HoneyMachine2026={GetHoneyMachine2Data=
function()
local G=m.GetBigDataUsingKey("HoneyMachine2026")if not G then
 
return false end
 
return{SubmittedPlants=G.SubmittedPlants or{};HoneyStored=G.HoneyStored or 0,IsRunning=G.IsRunning;TimeLeft=G.TimeLeft or 0,PlantWeight=G.PlantWeight or 0}end
;IsRunningHoneyMachine2026=
function()
local G=K.HoneyMachine2026.GetHoneyMachine2Data()if not G then
 
return false end
 
return G.IsRunning end
;GetTotalWeightSubmitted=
function()
local G=K.HoneyMachine2026.GetHoneyMachine2Data()if not G then
 
return 0 end
 
return G.PlantWeight end
;GetStoredHoney=
function()
local G=K.HoneyMachine2026.GetHoneyMachine2Data()if not G then
 
return 0 end
 
return G.HoneyStored end
,GetTimeLeftHoneyMachine2026=
function()
local G=K.HoneyMachine2026.GetHoneyMachine2Data()if not G then
 
return false end
 
return G.TimeLeft end
,TryClaimHoney=
function()if not T.honeymachine_autoclaim then
 
return end
 
local G=K.HoneyMachine2026.IsRunningHoneyMachine2026()
local y=K.HoneyMachine2026.GetStoredHoney()if G==false and y>0 then
 Z.TEXT_HONEYMACHINE2026="<font color=\'#FFFFFF\'>\240\159\148\165 Collecting Honey</font>"V.GameEvents.HoneyMachine2026Service_RE:FireServer("CollectHoney")
task.wait(1)end
 end
;HoneyMachine2026RequiredMutations=
function()
local G={Pollinated=true;Pollinated_Fair=true,Pollinated_Godly=true;Pollinated_Good=true,Pollinated_Poor=true}
return G end
,HaveRequiredHoneyPlants=
function()
local G=r.GetFruitCountUsingMutation(K.HoneyMachine2026.HoneyMachine2026RequiredMutations())if G>0 then
 
return true end
 
return false end
,SubmitHoneyMachinePlants=
function()if not T.honeymachine_autosubmit then
 
return false end
 
local G=K.HoneyMachine2026.IsRunningHoneyMachine2026()if G==true then
 
return false end
 if K.HoneyMachine2026.HaveRequiredHoneyPlants()then
 Z.TEXT_HONEYMACHINE2026="<font color=\'#FFFFFF\'>\226\156\133 Submit Plants</font>"V.GameEvents.HoneyMachine2026Service_RE:FireServer("SubmitAll")
task.wait(1)end
 end
;GetTextHoneyMachine2026=
function()
local G=K.HoneyMachine2026.GetHoneyMachine2Data()if not G then
 Z.TEXT_HONEYMACHINE2026="<font color=\'#FFFFFF\'>Insert plants to start making honey</font>"
return Z.TEXT_HONEYMACHINE2026 end
 
local V=tonumber(G.HoneyStored)or 0 
local y=tonumber(G.TimeLeft)or 0 
local j=tonumber(G.PlantWeight)or 0 
local i=G.IsRunning==true 
local c=G.SubmittedPlants or{}
local J=0 for G,V in pairs(c)do
 J=J+1 end
 
local T=W.formatDuration(y)if i then
 Z.TEXT_HONEYMACHINE2026=string.format("<font color=\'#27F527\'>Making honey</font> <font color=\'#FFFFFF\'>with</font> <font color=\'#BD93F9\'>\240\159\140\177x%s</font> <font color=\'#FFFFFF\'>plants [%0.2f KG]</font> <font color=\'#8BE9FD\'>\226\143\179%s</font> <font color=\'#FFFFFF\'>please wait</font>",J,j,T)
return Z.TEXT_HONEYMACHINE2026 end
 if V>0 then
 Z.TEXT_HONEYMACHINE2026=string.format("<font color=\'#27F527\'>Honey is ready to collect:</font> <font color=\'#FFD166\'>%s Honey</font>",V)
return Z.TEXT_HONEYMACHINE2026 end
 Z.TEXT_HONEYMACHINE2026=string.format("<font color=\'#FFD166\'>Insert plants</font> <font color=\'#FFFFFF\'>to start making honey</font> <font color=\'#8BE9FD\'>[Plants x%s, \226\154\150%.2f KG]</font>",J,j)
return Z.TEXT_HONEYMACHINE2026 end
,HoneyLoop=
function()
task.spawn(
function()while true do
 
task.wait(1)if not T.honeymachine_enabled then
 Z.TEXT_HONEYMACHINE2026="\240\159\148\180 <font color=\'#FFFFFF\'>Not enabled.</font>"
task.wait(1)continue end
 if Z.IsPaused()then
 
task.wait(4)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(4)continue end
 K.HoneyMachine2026.GetTextHoneyMachine2026()K.HoneyMachine2026.TryClaimHoney()K.HoneyMachine2026.SubmitHoneyMachinePlants()end
 end
)end
}K.HoneyMachine2026.HoneyLoop()K.HoneyIncubator={CanCollect=
function()
local G=m.GetBigDataUsingKey("BeeEventData")
local V=G and G.HoneyIncubatorData if not V then
 
return false end
 end
}K.HoneyBee={LastAutoMiddle=0,AutoMiddleDelay=60,GetBeeEventData=
function()
local G=m.GetBigDataUsingKey("BeeEventData")
local V=G.HasPlacedFirstBeeEgg end
;AutoTeleportMiddle=
function()if not c.event_automiddle_tp then
 
return false end
 if not E.Garden.IsHoneyBeeGarden()then
 
return false end
 
local G=os.clock()if G-K.HoneyBee.LastAutoMiddle<K.HoneyBee.AutoMiddleDelay then
 
return false end
 K.HoneyBee.LastAutoMiddle=G W.TeleportToFarmMiddle(true)
return true end
;LoopSeedHoney=
function()
local G=c.is_auto_plantseedEvent 
local V=E.Garden.IsHoneyBeeGarden()if not V then
 
return false end
 
local y=30 
local j={["Honey Carrot"]=true}
local i=Z.GetPlantsUsingTrait("Honey")
local J=E.GetCenterPlacementPoint()for Z,i in pairs(i)do
 if not G then
 break end
 if not V then
 break end
 if S.Is_MasterBusy()then
 break end
 if j[Z]then
 
local G=E.GetPlantCountBySeed(Z)if G>=y then
 continue end
 end
 
local c=true u.PlaceSeedSmart(Z,9,J,c)
task.wait(.2)end
 end
,CollectHoneyFruits_Loop=
function()
local G=c.is_fall_event_running if not G then
 
return false end
 
local V=E.Garden.IsHoneyBeeGarden()if not V then
 
return false end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local y={}
local j={Pollinated=true;Pollinated_Fair=true,Pollinated_Godly=true;Pollinated_Good=true,Pollinated_Poor=true}
local i={amount=50;batch_mode=true;random=true,whitelist_mutation=j}
local J=c.is_fall_event_fastmode if J then
 while true do
 
task.wait(.5)if not G then
 break end
 if not V then
 break end
 if not J then
 break end
 if Z.IsPaused()then
 break end
 
local j=u.CollectFruitByNamesSortedRarityConfig(y,i)
task.wait(.2)if not j then
 break end
 if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 end
 
else
 while true do
 
task.wait(.5)if Z.IsPaused()then
 break end
 if not V then
 break end
 i.amount=50 i.batch_mode=false 
local y=u.CollectFruitByNamesSortedRarityConfig(collectfruits,i)if not y then
 break end
 if not G then
 break end
 if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 if J then
 break end
 end
 end
 end
;AutoSwitchGardensHoney=
function()if E.Garden.IsEasterGarden()then
(game:GetService("ReplicatedStorage")).GameEvents.EasterEvent.LoadSpecialGardenRE:FireServer("BIZZYBEE_2026")
task.wait(30)
else
(game:GetService("ReplicatedStorage")).GameEvents.EasterEvent.LoadSpecialGardenRE:FireServer("EASTER_2026")end
 end
}
task.spawn(
function()while true do
 
task.wait(3)if not c.auto_switchgarden_fast then
 continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(10)continue end
 K.HoneyBee.AutoSwitchGardensHoney()end
 end
)
task.spawn(
function()while true do
 
task.wait(.5)if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(10)continue end
 K.HoneyBee.CollectHoneyFruits_Loop()end
 end
)K.TraderEvent={cache={};cache_current_count=0,UpdateUITradeEventStatus=
function(G)if j.lbl_tradeevent_status then
 j.lbl_tradeevent_status:SetText(G)end
 end
,GetEventPlatform=
function()
local G="PortalPlatform"K.TraderEvent.cache_current_count=K.TraderEvent.cache_current_count+1 if K.TraderEvent.cache_current_count>50 then
 K.TraderEvent.cache={}end
 
local V=K.TraderEvent.cache 
local y=V[G]if y then
 
return y 
else
 V[G]=nil end
 
local Z=d.findInWorkspaceMulti(G,"Model")
local j=nil for G,V in ipairs(Z)do
 if V:FindFirstChild("Model")then
 j=V break end
 end
 if j then
 V[G]=j 
return j end
 
return nil end
;GetRequiredFruit=
function()
local G=0 
local V,y=
pcall(
function()
local V=K.TraderEvent.GetEventPlatform()
local y=V:FindFirstChild("Model")if not y then
 
return nil,G end
 
local Z=(y:FindFirstChild("2")):FindFirstChild("Frame")for V,y in ipairs(Z:GetChildren())do
 
local Z=(y:FindFirstChild("TraderEventUI")):FindFirstChild("InfoFrame")if not Z then
 continue end
 if Z.Visible==false then
 
return nil,G end
 
local j=Z.RequireFrame.ItemName.Text 
local i=Z.RequireFrame.ImageLabel.Amount.Text 
local c=(tostring(i)):gsub("%D","")or 0 G=tonumber(c)or 0 
return tostring(j),G end
 end
)if not V then
 
warn("Error:",y)
return nil,G end
 
return y,G end
;SubmitRequirements=
function()
pcall(
function()V.GameEvents.TraderEvent.Trader_SubmitFruitRE:FireServer()end
)end
}K.Furnace={cache={};UpdateUIStatus=
function(G)if j.lbl_smithman_status then
 j.lbl_smithman_status:SetText(G)end
 end
,SubmitGearHeld=
function()
pcall(
function()V.GameEvents.SmithingEvent.Smithing_SubmitGearRE:FireServer()end
)end
;SubmitEggHeld=
function()
pcall(
function()V.GameEvents.SmithingEvent.Smithing_SubmitPetRE:FireServer()end
)end
;SubmitFruitHeld=
function()
pcall(
function()V.GameEvents.SmithingEvent.Smithing_SubmitFruitRE:FireServer()end
)end
;EquipEggToSubmit=
function()
local G=T.craftevent.egg_list for G,V in pairs(G)do
 
local y=r.GetEggUsingName(G)if y then
 yJ()if not VJ(y)then
 continue end
 
task.wait(.1)
return true end
 end
 
return false end
;EquipGearToSubmit=
function()
local G=T.craftevent.gear_list for G,V in pairs(G)do
 
local y=r.GetToolUsingName(G)if y then
 yJ()if not VJ(y)then
 continue end
 
task.wait(.1)
return true end
 end
 
return false end
,EquipFruitToSubmit=
function()
local G=T.craftevent.fruit_list 
local V=false if next(G)==nil then
 V=true end
 if V then
 
local G=r.GetFruitRandom()if G then
 yJ()if not VJ(G)then
 
return false end
 
task.wait(.1)
return true 
else
 if r.IsToolHeldAny()then
 yJ()
task.wait(.1)end
 u.CollectFruitsRandom(30)
task.wait(.5)end
 
return false end
 for G,V in pairs(G)do
 
local y=r.GetFruitUsingName(G)if y then
 yJ()if not VJ(y)then
 continue end
 
task.wait(.1)
return true end
 end
 if r.IsToolHeldAny()then
 yJ()
task.wait(.1)end
 u.CollectFruitByNamesSortedRarity(G,30)
task.wait(.3)
return false end
;FindEventModel=
function()
local G="Furnace"
local V="Model"if K.Furnace.cache[G]then
 
return K.Furnace.cache[G]end
 
local y=d.findInWorkspace(G,V)if y then
 K.Furnace.cache[G]=y end
 
return y end
}K.JungleUI={UpdateStatsText=
function(G)if j.lbl_jungle_stats then
 j.lbl_jungle_stats:SetText(G)end
 end
,UpdateInformationText=
function(G)if j.lbl_jungle_information then
 j.lbl_jungle_information:SetText(G)end
 end
}K.JungleShops={BuyStage1Seeds=
function()
local G=5 
local y,Z=
pcall(
function()for y,Z in pairs(c.jungle_seed_stages1)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if y then
 
return true 
else
 
return false end
 end
,BuyStage2Seeds=
function()
local G=6 
local y={["Evo Beetroot II"]=true,["Evo Blueberry II"]=true,["Evo Pumpkin II"]=true,["Evo Mushroom II"]=true}
local Z,j=
pcall(
function()for y,Z in pairs(y)do
 if Z then
 for Z=1,10,1 do
 V.BuyEventShopStock:FireServer(y,G)end
 end
 end
 
return true end
)if Z then
 
return true 
else
 
return false end
 end
}K.JungleActions={SubmitHeld=
function()
local G,V=
pcall(
function() end
)end
;SubmitAll=
function()
local G,V=
pcall(
function() end
)end
}f.UpdateStatsText=
function(G)if j.lbl_questline_status then
 j.lbl_questline_status:SetText(G)end
 end
 f.UpdateStatsInfo=
function(G)if j.lbl_questline_info then
 j.lbl_questline_info:SetText(G)end
 end
 f.DoReroll=
function()(((((game:GetService("ReplicatedStorage")):WaitForChild("GameEvents")):WaitForChild("FallMarketEvent")):WaitForChild("Activities")):WaitForChild("RerollQuests")):FireServer()end
 f.ClaimRewards=
function()((((game:GetService("ReplicatedStorage")):WaitForChild("GameEvents")):WaitForChild("FallMarketEvent")):WaitForChild("ClaimFallEnergyRewards")):FireServer()end
 f.CanClaimRewards=
function()
local G,y=
pcall(
function()
return V.Workspace.Interaction.UpdateItems.RewardSign.RewardTimeBillboard.BillboardGui.Timer.Text=="You have rewards to claim!"end
)
return G and y or false end
 f.RerollCost=
function()
local G,y=
pcall(
function()
return V.PlayerGui.FallQuests_UI.Frame.Main.Holder.Header.RerollQuestsButton.TextLabel.Text end
)
return G and y or false end
 f.GetAvailableActivites=
function()
local G={}
local y,Z=
pcall(
function()
local y=V.LocalPlayer.PlayerGui.DeadTreeQuests_UI.Frame.Main.Holder.Content.Tasks.List if y then
 for V,y in ipairs(y:GetChildren())do
 if y and y.Name~="Segment"then
 continue end
 
local Z={}
local j=y.CHECKMARK_ICON.Visible if j then
 continue end
 
local i=y.TASK_NAME.ContentText if i=="Collect 15M Cash"then
 continue end
 
local c=y.Progress.ProgressBar.PROGRESS.ContentText 
local J,T,d=W.GetProgressLeft(c)if c=="Completed!"then
 continue end
 if i=="Use 1 Maple Leaf Charm"then
 Z.Tool={name="Maple Leaf Charm";use_current=J,use_max=T}
elseif i=="Harvest 5 Pumpkins"then
 Z.Harvest={name="Pumpkin";use_current=J,use_max=T}
elseif i=="Harvest 2 Jack O Lanterns"then
 Z.Harvest={name="Jack O Lantern",use_current=J;use_max=T}
elseif i=="Harvest 1 Banesberry"then
 Z.Harvest={name="Banesberry",use_current=J;use_max=T}
elseif i=="Harvest 10 Corn"then
 Z.Harvest={name="Corn",use_current=J;use_max=T}
elseif i=="Plant 10 Bloodred Mushroom Seeds"then
 Z.Seed={name="Bloodred Mushroom",use_current=J,use_max=T}
elseif i=="Water 30 plants"then
 Z.WATERCAN={name="Watering Can",use_current=J;use_max=T}
elseif i=="Harvest 10 Spooky mutations"then
 Z.HarvestMutation={name="Spooky";use_current=J;use_max=T}
elseif i=="Harvest 10 Vamp mutations"then
 Z.HarvestMutation={name="Vamp",use_current=J,use_max=T}
elseif i=="Harvest 5 Moonlit mutations"then
 Z.HarvestMutation={name="Moonlit",use_current=J,use_max=T}
elseif i=="Open 3 Halloween Gear Boxes"then
 Z.SeedPack={name="Halloween Gear Box";use_current=J;use_max=T}
elseif i=="Eat 3 Suspicious Soups"then
 Z.FeedFood={name="Suspicious Soup",use_current=J,use_max=T}
elseif i=="Travel 250 times on Witches\226\128\153 Broom"then
 Z.Travel={name="Witches Broom",use_current=J,use_max=T}
elseif i=="Open 1 Pumpkin Crate"then
 Z.Crate={name="Pumpkin Crate";use_current=J,use_max=T}
elseif i=="Open 1 Spooky Crate"then
 Z.Crate={name="Spooky Crate",use_current=J,use_max=T}
elseif i=="Feed any pet 15 times"then
 Z.Feed={name="FeedAnyPet";use_current=J,use_max=T}
elseif i=="Hatch 1 Spooky Egg"then
 Z.HatchEgg={name="Spooky Egg";use_current=J,use_max=T}
elseif i=="Grow Pumpkin Rat to age 7"then
 Z.GrowPetToAge={name="Pumpkin Rat",use_current=J,use_max=T}
elseif i=="Grow Bat to age 7"then
 Z.GrowPetToAge={name="Bat";use_current=J;use_max=T}
elseif i=="Sell any plant 40 times"then
 Z.SellAnyPlant={name="AnyPlant";use_current=J,use_max=T}
elseif i=="Sell 10 Pumpkins"then
 Z.SellPlant={name="Pumpkin";use_current=J,use_max=T}
elseif i=="Sell 25 Corn"then
 Z.SellPlant={name="Corn",use_current=J,use_max=T}
elseif i=="Sell 5 Bloodred Mushrooms"then
 Z.SellPlant={name="Bloodred Mushroom",use_current=J,use_max=T}
elseif i=="Sell 1 Jack O Lantern"then
 Z.SellPlant={name="Jack O Lantern";use_current=J,use_max=T}
elseif i=="Earn 500,000 Sheckles"then
 Z.EarnCurrency={name="Sheckles";use_current=J;use_max=T}
elseif i=="Spend 50 CandyCorn"then
 Z.SpendCurrency={name="CandyCorn";use_current=J;use_max=T}
elseif i=="Spend 500,000 Sheckles"then
 Z.SpendCurrency={name="Sheckles",use_current=J;use_max=T}
else
 end
 if next(Z)~=nil then
 table.insert(G,Z)end
 end
 end
 end
)if y then
 
return G 
else
 
warn("Error: ",Z)end
 
return nil end
 m.AllBigDataKeys={}m.ReloadDataService=
function()Z.BigData=V.DataService:GetData()m.AllBigDataKeys={}if#m.AllBigDataKeys==0 then
 for G,V in pairs(Z.BigData)do
 table.insert(m.AllBigDataKeys,G)end
 end
 end
 m.ReloadDataService()m.data_key={}m.HatchDataWebhook={}m.DataSaveSlots={}m.GetBigDataUsingKey=
function(G)
return Z.BigData[G]end
 Z.InventoryDataBind=m.GetBigDataUsingKey("InventoryData")m.DataSaveSlots=m.GetBigDataUsingKey("SaveSlots")m.SpecialCurrency={GardenCoins="GardenCoins";Sheckles="Sheckles";ChocCoins="ChocCoins",CandyCorn="CandyCorn";HoneyCoins="HoneyCoins",FairyPoints="FairyPoints",PassPoints="PassPoints",Honey="Honey";GetSheckles=
function()
local G=m.GetBigDataUsingKey("Sheckles")
return G or 0 end
,GetCurrency=
function(G)if G=="Sheckles"then
 
return m.SpecialCurrency.GetSheckles()end
 
local V=m.GetBigDataUsingKey("SpecialCurrency")if not V then
 
return 0 end
 
return V[G]or 0 end
,GetHoneyCoins=
function()
return m.SpecialCurrency.GetCurrency("HoneyCoins")end
;GetChocCoins=
function()
return m.SpecialCurrency.GetCurrency("ChocCoins")end
,GetGardenCoins=
function()
return m.SpecialCurrency.GetCurrency("GardenCoins")end
;GetCandyCorn=
function()
return m.SpecialCurrency.GetCurrency("CandyCorn")end
;GetFairyPoints=
function()
return m.SpecialCurrency.GetCurrency("FairyPoints")end
,GetPassPoints=
function()
return m.SpecialCurrency.GetCurrency("PassPoints")end
;GetHoney=
function()
return m.SpecialCurrency.GetCurrency("Honey")end
}t.GetTotalEggsOnFarm=
function()
local G=0 
local V=m.DataSaveSlots for V,y in pairs(V.AllSlots)do
 
local Z=y.SavedObjects for V,y in pairs(Z)do
 
local Z=y.ObjectType 
local j=y.Data if Z=="PetEgg"then
 
local V=j.Type 
local y=j.TimeToHatch 
local Z=j.CanOpen 
local i=j.CanHatch 
local c=j.BaseWeight 
local J=j.EggName G=G+1 end
 end
 end
 
return G end
 W.GetEggInformation=
function()
local G=m.GetBigDataUsingKey("SaveSlots")for G,V in pairs(G.AllSlots)do
 
local y=V.SavedObjects for G,V in pairs(y)do
 
local y=V.ObjectType 
local j=V.Data if y=="CosmeticCrate"then
 
local V=j.CanOpen if not V then
 continue end
 
local y=j.CosmeticType 
local i=j.CrateType Z.found_crate_data[G]={name=i,reward=y}continue end
 if y=="PetEgg"then
 
local V=j.Type 
local y=j.TimeToHatch 
local i=j.CanOpen 
local c=j.CanHatch 
local J=j.BaseWeight 
local T=j.EggName if y>0 then
 continue end
 if not V or not J then
 continue end
 
local d=k(J)Z.found_pet_data[G]={petname=V;weight=d}end
 end
 end
 end
 
task.spawn(
function()while true do
 
task.wait(.5)W.GetEggInformation()end
 end
)t.SetPetState=
function()
local G=E.GetActivePetsUUIDS()for G,y in ipairs(G)do
 V.ActivePetService:FireServer("SetPetState",y,"Idle")
task.wait(.1)end
 end
 W.vfx={SetVisualEffect=
function(G,V)(game:GetService("ReplicatedStorage")).GameEvents.SettingsService:FireServer(table.unpack({[1]="SetSetting";[2]=G;[3]=V}))end
}t.Inventory={GetSettings=
function()
local G=m.GetBigDataUsingKey("Settings")
return G end
,GetCurrentPetsInData=
function()
local G={}
local V=t.Inventory.GetPetInventory()for V,y in pairs(V)do
 
local Z=y.UUID if IsFavorite then
 end
 table.insert(G,V)end
 
return G end
;GetPetInventory=
function()
local G,V=
pcall(
function()
local G=m.GetBigDataUsingKey("PetsData")if not G then
 
return{}end
 
local V=G.PetInventory if not V or not V.Data then
 
return{}end
 
return V.Data end
)
return G and V or{}end
,GetEquippedPets=
function()
local G=m.GetBigDataUsingKey("PetsData")
local V=G.EquippedPets 
return V end
;GetActivePetsAsKeyVal=
function()
local G={}
local V=m.GetBigDataUsingKey("PetsData")
local y=V.EquippedPets for V,y in ipairs(y)do
 G[y]=true end
 
return G end
,GetTotalOwnedPets=
function()
local G=m.GetBigDataUsingKey("PetsData")if not G then
 
return 0 end
 
local V=G.PetInventory 
local y=0 if not V or not V.Data then
 
return 0 end
 for G,V in pairs(V.Data)do
 y=y+1 end
 
return y end
,GetMaxEggsAndInventorySpaceCount=
function()
local G=m.GetBigDataUsingKey("PetsData")if not G then
 
return 0,0 end
 
local V=G.MutableStats if not V then
 
return 0,0 end
 
local y=tonumber(V.MaxEggsInFarm)or 0 
local Z=tonumber(V.MaxPetsInInventory)or 0 
return y,Z end
,GetPetsInventoryCounts=
function()
local G,V,y=
pcall(
function()
local G=m.GetBigDataUsingKey("PetsData")
local V=G.PetInventory 
local y=G.MutableStats 
local Z=G.EquippedPets 
local j=y.MaxPetsInInventory 
local i=0 for G,V in pairs(V.Data)do
 i=i+1 end
 
return i,j end
)if G then
 
return V,y end
 
return 0,0 end
;GetPetsCount_UI_TEXT=
function()
local G,V=
pcall(
function()
local G=m.GetBigDataUsingKey("PetsData")
local V=G.PetInventory 
local y=G.MutableStats 
local Z=G.EquippedPets 
local j=y.MaxEggsInFarm 
local i=y.MaxEquippedPets 
local c=y.MaxPetsInInventory 
local J=0 
local T="#00FF2A"for G,V in pairs(V.Data)do
 J=J+1 end
 if J>=c then
 T="#FF2C00"end
 
local d={}table.insert(d,string.format("Pets In Inventory: <font color=\'%s\'>%s</font> / %s\n",T,J,c))table.insert(d,string.format("Max Eggs Allowed: %s\n",j))table.insert(d,string.format("Max Pets Equip Allowed: %s\n",i))table.insert(d,string.format("Eggs Planted: %s\n",t.GetTotalEggsOnFarm()))
return table.concat(d)end
)if G then
 
return V end
 
return""end
,GetEggsData=
function()
local G=m.GetBigDataUsingKey("SaveSlots")for G,V in pairs(G.AllSlots)do
 
warn("Key: "..G)W.JsonPrint(V)
warn("-----------------------")end
 end
}t.Hatch={GetRecommended=
function(G)
local V={}
local y=t.Inventory.GetPetInventory()for y,Z in pairs(y)do
 
local j=Z.PetType if G[j]then
 
local G=Z.PetData 
local j=G.BaseWeight 
local i=k(j,1)
local c={pet_uuid=y;pet_weight=i}table.insert(V,c)end
 end
 table.sort(V,
function(G,V)
return G.pet_weight>V.pet_weight end
)
local Z=PJ()
local j={}
local i=math.min(Z,#V)for G=1,i,1 do
 table.insert(j,V[G].pet_uuid)end
 
return j end
;GetPetsUsingNames=
function(G)
return t.Hatch.GetRecommended(G)end
;GetRecommendedKoiTeam=
function()
local G={Koi=true}
return t.Hatch.GetRecommended(G)end
,GetRecommendedSealTeam=
function()
local G={Seal=true}
return t.Hatch.GetRecommended(G)end
}m.GetPlayerPetDataSnapshot=
function()
local G,V=
pcall(
function()
local G=m.GetBigDataUsingKey("PetsData")if not G then
 
return{}end
 
local V=G.PetInventory if not V or not V.Data then
 
return{}end
 for G,V in pairs(V.Data)do
 snapshot[G]=V end
 
return snapshot end
)
return G and V or{}end
 m.GetNewUUIDs=
function(G,V)
local y={}
local Z={}for G,V in ipairs(G)do
 
local Z=type(V)=="table"and V.uuid or V if Z then
 y[Z]=true end
 end
 for G,V in ipairs(V)do
 
local j=type(V)=="table"and V.uuid or V if j and not y[j]then
 table.insert(Z,j)end
 end
 
return Z end
 m.GetHatchPetData=
function(G)
local V={}
local y={}
local j=W.GetAllTeamsUUIDSet()for G,i in ipairs(G)do
 
local c=WJ(i)if c then
 
local G=c.PetData 
local y=c.PetType 
local J=G.HatchedFrom 
local T=G.Name 
local d=G.Level 
local u=G.BaseWeight 
local q=G.MutationType or""if j[i]then
 continue end
 
local g=Y.AllMutationListEnum[q]if g then
 end
 if Z.seen_pets[i]then
 continue end
 if not JJ(y)then
 
print("Not on sell list: ",y)continue end
 
local E=k(u,1)E=tonumber(string.format("%.2f",E))table.insert(V,{uuid=i,egg_name=J,pet_name=y;nickname=T;level=d;weight=E,mut=g or""})
else
 table.insert(y,i)end
 end
 
return V,y end
 m.GetHatchPetDataxx=
function(G,V)
local y={}
local Z={}for G,V in ipairs(G)do
 Z[V]=true end
 for G,V in ipairs(V)do
 if not Z[V]then
 
local G=WJ(V)if G then
 
local Z=G.PetData 
local j=G.PetType 
local i=Z.HatchedFrom 
local c=Z.Name 
local J=Z.Level 
local T=Z.BaseWeight 
local d=Z.MutationType or""if Y.AllMutationListEnum[d]then
 continue end
 if not JJ(j)then
 continue end
 
local u=k(T,1)u=tonumber(string.format("%.2f",u))table.insert(y,{uuid=V;egg_name=i;pet_name=j;nickname=c,level=J;weight=u})
else
 
print("No data for : ",V)end
 end
 end
 
return y end
 m.GetHatchPetDatax=
function(G,V)
local y={}
local Z={}
local j={}for G,V in ipairs(G)do
 Z[V]=true end
 
local i=t.Inventory.GetPetInventory()for G,V in pairs(i)do
 if not Z[G]then
 
local Z=V.UUID 
local j=V.PetData 
local i=V.PetType 
local c=j.HatchedFrom 
local J=j.Name 
local T=j.LevelProgress 
local d=j.Level 
local u=j.Hunger 
local q=j.BaseWeight 
local g=j.MutationType or""
local E=Y.AllMutationListEnum[g]if E then
 continue end
 if not JJ(i)then
 continue end
 
local a=k(q,1)a=tonumber(string.format("%.2f",a))
local H={uuid=G;egg_name=c;pet_name=i;nickname=J,level=d;weight=a}table.insert(y,H)end
 end
 
return y end
 m.AutoSubmitHeld={SubmitHeld=
function()
local G=2000 for G=1,G,1 do
 
task.spawn(
function() end
)end
 end
}m.Visuals={RewardDropVisual=
function(G)if G.Name=="RewardDropVisual"then
 G:Destroy()end
 end
}m.FoundMarmots={}m.FoundAcorn={}m.FoundEasterEggs={}m.MerryBearGifts={}m.TeleportToTarget=
function(G)
local y,Z=
pcall(
function()
local y=(G:GetPivot()).Position 
local Z=V.Character:FindFirstChild("HumanoidRootPart")Z.CFrame=CFrame.new(y)+Vector3.new(0,5,0)end
)if not y then
 
warn("Error: ",tostring(Z))end
 end
 m.TeleportModelToSelf=
function(G)if not G or not G:IsA("Model")then
 
warn("TeleportToTarget: Invalid model")
return end
 if not G.PrimaryPart then
 
warn("TeleportToTarget: Model has no PrimaryPart")
return end
 
local y=V.Character and V.Character:FindFirstChild("HumanoidRootPart")if not y then
 
warn("TeleportToTarget: HumanoidRootPart not found")
return end
 
local Z=y.Position 
local j=Z+Vector3.new(0,5,0)
local i,c=
pcall(
function()G:SetPrimaryPartCFrame(CFrame.new(j))end
)if not i then
 
warn("TeleportToTarget error:",c)end
 end
 m.RedPanda={updateInformation=
function()if not j.lbl_redpanda_information then
 
return end
 
local G={}
local V=T.red_panda_restock_total or 0 table.insert(G,string.format("Total Restocks: <b><font color=\'#EF2E92\'>%d</font></b>",V))for V,y in pairs(T.red_panda_restock)do
 table.insert(G,string.format("%s: <b><font color=\'#00FF00\'>%d</font></b>",V,y))end
 j.lbl_redpanda_information:SetText(table.concat(G,"\n"))end
}m.EasterBunny={Teleport=
function(G)if not c.easterbunnyeggrewardcollect then
 
return end
 
local V,y=
pcall(
function()m.TeleportToTarget(G)end
)if not V then
 
warn("Error ",y)end
 end
}m.MerryBear={Teleport=
function(G)if not c.merrybear_collect then
 
return end
 
local V,y=
pcall(
function()m.TeleportToTarget(G)end
)if not V then
 
warn("Error ",y)end
 end
}m.ChubbyChipmunk={updateInformation=
function()if not j.lbl_chubby_chipmunk_information then
 
return end
 
local G=string.format("Chubby Chipmunk Event Collected: <b><font color=\'#EF2E92\'>%d</font></b>\nWatering Can: <b><font color=\'#00FF00\'>%d</font></b>\nEvent Lantern: <b><font color=\'#00FF00\'>%d</font></b>\nGodly Sprinkler: <b><font color=\'#00FF00\'>%d</font></b>\nLegendary Egg: <b><font color=\'#00FF00\'>%d</font></b>\nReclaimer: <b><font color=\'#00FF00\'>%d</font></b>\nNutty Crate: <b><font color=\'#00FF00\'>%d</font></b>\nSilver Fertilizer: <b><font color=\'#00FF00\'>%d</font></b>\nNutty Chest: <b><font color=\'#00FF00\'>%d</font></b>\nMaster Sprinkler: <b><font color=\'#00FF00\'>%d</font></b>\nMedium Treat: <b><font color=\'#00FF00\'>%d</font></b>\nMedium Toy: <b><font color=\'#00FF00\'>%d</font></b>\nMythical Egg: <b><font color=\'#00FF00\'>%d</font></b>\nGrandmaster Sprinkler: <b><font color=\'#00FF00\'>%d</font></b>\nRainbow Fertilizer: <b><font color=\'#00FF00\'>%d</font></b>\nPet Mutation Shard Nutty: <b><font color=\'#FFF01F\'>%d</font></b>",c.chubby_chipmunk_amount_collected or 0,c.chubby_chipmunk_item_watering_can or 0,c.chubby_chipmunk_item_event_lantern or 0,c.chubby_chipmunk_item_godly_sprinkler or 0,c.chubby_chipmunk_item_legendary_egg or 0,c.chubby_chipmunk_item_reclaimer or 0,c.chubby_chipmunk_item_nutty_crate or 0,c.chubby_chipmunk_item_silver_fertilizer or 0,c.chubby_chipmunk_item_nutty_chest or 0,c.chubby_chipmunk_item_master_sprinkler or 0,c.chubby_chipmunk_item_medium_treat or 0,c.chubby_chipmunk_item_medium_toy or 0,c.chubby_chipmunk_item_mythical_egg or 0,c.chubby_chipmunk_item_grandmaster_sprinkler or 0,c.chubby_chipmunk_item_rainbow_fertilizer or 0,c.chubby_chipmunk_item_petshardnutty or 0)j.lbl_chubby_chipmunk_information:SetText(G)end
,Teleport=
function(G)if not c.chubby_chipmunk_auto_collect then
 
return end
 
local V,y=
pcall(
function()m.TeleportToTarget(G)m.ChubbyChipmunk.updateInformation()n()end
)if not V then
 
warn("Error ",y)end
 end
}m.Marmot={updateInformation=
function()if not j.lbl_marmot_information then
 
return end
 
local G=string.format("Marmot Mound Collected: <b><font color=\'#EF2E92\'>%d</font></b>\nFirefly Jar: <b><font color=\'#00FF00\'>%d</font></b>\nMaple Leaf Kite: <b><font color=\'#00FF00\'>%d</font></b>\nSky Lantern: <b><font color=\'#00FF00\'>%d</font></b>\nLeaf Blower: <b><font color=\'#00FF00\'>%d</font></b>\nMaple Syrup: <b><font color=\'#00FF00\'>%d</font></b>\nMaple Sprinkler: <b><font color=\'#00FF00\'>%d</font></b>\nGolden Acorn: <b><font color=\'#FFF01F\'>%d</font></b>",c.marmot_amount_collected or 0,c.marmot_item_firefly or 0,c.marmot_item_maple_leaf_kite or 0,c.marmot_item_sky_lantern or 0,c.marmot_item_leaf_blower or 0,c.marmot_item_maple_syrup or 0,c.marmot_item_maple_sprinkler or 0,c.marmot_item_golden_acorn or 0)j.lbl_marmot_information:SetText(G)end
,Teleport=
function(G)if not c.marmot_auto_collect then
 
return end
 
local V,y=
pcall(
function()m.TeleportToTarget(G)m.Marmot.updateInformation()n()end
)if not V then
 
warn("Error ",y)end
 end
}W.FireDigEvent=
function(G,y,Z)V.DigRemote:FireServer(G,y,Z)end
 W.remain_digs=0 W.GetDigsLeft=
function()
local G="DiggingData"
local V=m.GetBigDataUsingKey(G)
local y=V.RemainingDigs if y then
 W.remain_digs=y 
return y end
 
return 0 end
 W.FindAllRewards=
function()
local G="DiggingData"
local V=m.GetBigDataUsingKey(G)
local y=V.GridData 
local Z=V.RemainingDigs if Z then
 W.remain_digs=Z end
 
local j={}for G,V in pairs(y)do
 
local y=V.IsTreasure 
local i=V.GridY 
local c=V.GridX 
local J=V.IsDug if Z and Z<=0 then
 break end
 if J then
 continue end
 if not y then
 continue end
 
local T={x=c;y=i}table.insert(j,T)end
 
return j end
 W.ResetDig=
function()
pcall(
function()
local G=V.PlayerGui.Digging_UI.DiggingCompleteFrame.Visible if G then
 
local G=V.ReplicatedStorage.GameEvents.DiggingMiniGame.RestartDiggingSheckles G:FireServer()end
 end
)end
 W.GetModelsFromGrid=
function()
local G=W.FindAllRewards()
local y={}
local Z=V.LocalPlayer.Name.."_DiggingGrid"
local j=V.Workspace:FindFirstChild(Z)if not j then
 
return y end
 for G,V in ipairs(G)do
 for G,Z in ipairs(j:GetChildren())do
 
local j=Z:FindFirstChild("DirtPart")if j then
 
local G=j:FindFirstChild("GridX")
local Z=j:FindFirstChild("GridY")if G and(Z and(G.Value==V.x and Z.Value==V.y))then
 
local G=j.CFrame 
local Z={x=V.x;y=V.y;cf=G}table.insert(y,Z)break end
 end
 end
 end
 
return y end
 W.DigUseTickets=
function()
local G="Dig Trinket"
local V=r.GetToolUsingName(G)
task.wait(.2)if V then
 yJ()if not VJ(V)then
 
return end
 
local y=0 if V:GetAttribute("e")then
 y=V:GetAttribute("e")end
 if y>0 then
 if y>=10 then
 y=10 end
 for y=1,y,1 do
 if Z.IS_HATCHING then
 break end
 if W.GetDigsLeft()>=10 then
 break end
 if not V then
 break end
 if not zJ(V)then
 break end
 r.TryUseGear(G)
task.wait(.1)end
 end
 yJ()end
 end
 if S.task_letsdig then
 task.cancel(S.task_letsdig)S.task_letsdig=nil end
 S.task_letsdig=
task.spawn(
function()while true do
 
task.wait(1)if not T.halloween.auto_dig then
 
task.wait(2)continue end
 if Z.IS_HATCHING then
 
task.wait(4)continue end
 Z.IS_DIG=true 
pcall(
function()W.DigUseTickets()end
)Z.IS_DIG=false 
local G=W.GetModelsFromGrid()if#G==0 then
 W.ResetDig()
task.wait(20)continue end
 if W.remain_digs<=0 then
 
task.wait(5)continue end
 Z.IS_DIG=true 
pcall(
function()W.DigUseTickets()end
)Z.IS_DIG=false for G,V in ipairs(G)do
 
local y=V.x 
local j=V.y 
local i=V.targetCFrame if Z.IS_HATCHING then
 break end
 if W.GetDigsLeft()<=0 then
 break end
 W.FireDigEvent(y,j,i)
task.wait(2)end
 end
 end
)W.OnSeedFoundByPets=
function(G)
local y=G:GetAttribute("OWNER")
local Z=G:GetAttribute("SEED_GIVEN")if y and Z then
 if y==V.LocalPlayer.Name then
 m.TeleportToTarget(G)end
 end
 end
 Z.IsMerryBearyGift=
function(G)
return string.match(G,"^Merry Beary Gift%s*%d*$")~=nil end
 V.Workspace.ChildAdded:Connect(
function(G)if G:IsA("Part")and G.Name=="JulyFirework"then
 G.Parent=V.ReplicatedStorage.BenchmarkTest 
return end
 
local y={"Wisp";"WindyFrostEffect";"WindBlastTemplate","SilverShockwave"}for y,Z in ipairs(y)do
 if G.Name==Z then
 G.Parent=V.ReplicatedStorage.BenchmarkTest 
return end
 end
 if G.Name=="SpiderWebFX"then
 
pcall(
function()if c.remove_visuals_weather then
 G.Parent=V.ReplicatedStorage.BenchmarkTest end
 end
)
return end
 if G:IsA("Part")and G.Name=="SpottedEffect"then
 
pcall(
function()G.Parent=V.ReplicatedStorage.BenchmarkTest end
)
return end
 if G:IsA("Sound")then
 G.Parent=V.ReplicatedStorage.BenchmarkTest 
return end
 if G:IsA("Model")then
 if G.Name=="Marmot Mound"then
 table.insert(m.FoundMarmots,G)end
 if G.Name=="EasterEggReward"then
 table.insert(m.FoundEasterEggs,G)end
 if Z.IsMerryBearyGift(G.Name)then
 
local V=G:GetAttribute("OWNER")if V and V==Z.player_userid then
 table.insert(m.MerryBearGifts,G)end
 end
 if G.Name=="Acorn"then
 
local V=G:GetAttribute("OWNER")if V and V==Z.player_userid then
 table.insert(m.FoundAcorn,G)end
 end
 end
 end
)Z.weatherv={"Visuals","Water_Effect","WeatherObjects","WeatherVisuals";"SecretObby","Rainbows","Dirt_VFX"}if c.remove_visuals_weather then
 for G,y in ipairs(Z.weatherv)do
 
local Z=V.Workspace:FindFirstChild(y)if Z and Z:IsA("Folder")then
 Z.ChildAdded:Connect(
function(G)
pcall(
function()if c.remove_visuals_weather then
 G.Parent=V.ReplicatedStorage end
 end
)end
)end
 end
 end
 W.RemovePlantsOrFruitsLoop=
function(G)if not G then
 
warn("null plant")
return end
 
local V=J.farm.delete_plants 
local y=J.farm.delete_fruits 
local j=J.farm.change_parent if j then
 
local V=Z.alt_Plants_Physical[Z.player_userid]if V then
 G.Parent=V 
return end
 end
 if V then
 for G,V in ipairs(G:GetChildren())do
 if((V:IsA("Part")or V:IsA("MeshPart")))and((V.Name~="Base"and V.Name~="PrimaryPart"))then
 V:Destroy()end
 end
 end
 if y then
 
local V=G:FindFirstChild("Fruits")if V then
 for G,V in ipairs(V:GetChildren())do
 for G,V in ipairs(V:GetChildren())do
 if((V:IsA("Part")or V:IsA("MeshPart")))and((V.Name~="Base"and V.Name~="PrimaryPart"))then
 V:Destroy()end
 end
 end
 end
 end
 end
 if S.task_plant_deleter then
 task.cancel(S.task_plant_deleter)S.task_plant_deleter=nil end
 S.task_plant_deleter=
task.spawn(
function()while true do
 
task.wait(5)if not J.farm.enable_delete_fruits then
 
task.wait(3)continue end
 if Z.IS_HATCHING then
 continue end
 if E.Plants_Physical then
 for G,V in ipairs(E.Get_Plants_Physical_Objects())do
 W.RemovePlantsOrFruitsLoop(V)end
 end
 end
 end
)if not W.task_collect_objects then
 W.task_collect_objects=
task.spawn(
function()while true do
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(2)if#m.MerryBearGifts>0 then
 
local G=table.remove(m.MerryBearGifts,1)m.MerryBear.Teleport(G)
task.wait(.1)continue end
 if#m.FoundEasterEggs>0 then
 
local G=table.remove(m.FoundEasterEggs,1)m.EasterBunny.Teleport(G)
task.wait(.1)continue end
 if#m.FoundMarmots>0 then
 
local G=table.remove(m.FoundMarmots,1)m.Marmot.Teleport(G)
task.wait(.1)continue end
 if#m.FoundAcorn>0 then
 
local G=table.remove(m.FoundAcorn,1)m.ChubbyChipmunk.Teleport(G)
task.wait(.1)continue end
 end
 end
)end
 Z.CanAscend=
function()
local G=m.GetBigDataUsingKey("RebirthData")if not G then
 
return false end
 if not V.RebirthShared then
 
return false end
 
local y=m.SpecialCurrency.GetSheckles()
local Z=G.TotalRebirths or 0 
local j=V.RebirthShared:CalculatePrice(Z,V.LocalPlayer)
return V.RebirthShared:IsRebirthAvailable(V.LocalPlayer)and y>=j end
 t.Shops={LoadDataForShops=
function() end
,RemoteBuyDailySeeds=
function(G,y)if not V.BuyDailySeedShopStock then
 
return false end
 
local j=m.SpecialCurrency.GetSheckles()if j<300 then
 
return end
 
local i,c=Z.GetDailySeedPrice(G)if i and c then
 if j<i then
 
return end
 end
 
local J=y or 1 for y=1,J,1 do
 V.BuyDailySeedShopStock:FireServer(G)end
 end
,RemoteBuySeed=
function(G,y)
local j=m.SpecialCurrency.GetSheckles()
local i,c=Z.GetSeedPrice(G)if i and c then
 if c==m.SpecialCurrency.GardenCoins then
 
local G=m.SpecialCurrency.GetGardenCoins()if G<i then
 
return end
 
else
 if j<Z.GetLowestSeedPrice()then
 
return end
 if j<i then
 
return end
 end
 end
 
local J=y or 1 for y=1,J,1 do
 
pcall(
function()V.BuySeedStock:FireServer("Shop",G)end
)end
 end
;RemoteBuyGearStock=
function(G,y)
local j=m.SpecialCurrency.GetSheckles()if j<50000 then
 
return end
 
local i,c=Z.GetGearPrice(G)if i and c then
 if j<i then
 
return end
 end
 
local J=y or 1 for y=1,J,1 do
 
pcall(
function()V.BuyGearStock:FireServer(G)end
)end
 end
;RemoteBuyEggs=
function(G,y)
local j=m.SpecialCurrency.GetSheckles()if j<Z.GetLowestEggPrice()then
 
return end
 
local i,c=Z.GetEggPrice(G)if i and c then
 if j<i then
 
return end
 end
 
local J=y or 1 for y=1,J,1 do
 
pcall(
function()V.BuyPetEgg:FireServer(G)end
)end
 end
,GetTextStockEggs=
function()
local G=m.GetBigDataUsingKey("PetEggStock")or{}
local V=""V=V.."<font color=\"#FF69B4\"><b>Pet Egg Stock</b></font>\n"if G.Stocks then
 for G,y in ipairs(G.Stocks)do
 
local Z=y.EggName or"Unknown"
local j=y.Stock or 0 
local i=j>0 and"#00FF00"or"#FF0000"V=V..string.format("<font color=\"#FFFFFF\">%s</font>: <font color=\"%s\">%d</font>\n",Z,i,j)end
 
else
 V=V.."No egg stock data found."end
 
return V end
;GetTextStockGear=
function()
local G=m.GetBigDataUsingKey("GearStock")or{}
local V=""V=V.."<font color=\"#FFA500\"><b>Gear Stock</b></font>\n"if G.Stocks then
 for G,y in pairs(G.Stocks)do
 
local Z=y.Stock or 0 
local j=y.MaxStock or 0 
local i=Z>0 and"#00FF00"or"#FF0000"V=V..string.format("<font color=\"#FFFFFF\">%s</font>: <font color=\"%s\">%d/%d</font>\n",G,i,Z,j)end
 
else
 V=V.."No gear data found."end
 
return V end
;GetTextStockSeeds=
function()
local G=m.GetBigDataUsingKey("SeedStocks")or{}
local V=""
local 
function y(y,Z,j)
local i=G[y]if i and i.Stocks then
 V=V..string.format("<font color=\"%s\"><b>%s</b></font>\n",j,Z)for G,y in pairs(i.Stocks)do
 
local Z=y.Stock or 0 
local j=y.MaxStock or 0 
local i=y.IsGoodSeed or false 
local c=i and"#D02090"or"#FFFFFF"
local J=Z>0 and"#00FF00"or"#FF0000"V=V..string.format("<font color=\"%s\">%s</font>: <font color=\"%s\">%d/%d</font>\n",c,G,J,Z,j)end
 V=V.."\n"end
 end
 y("Shop","Shop","#00BFFF")y("Daily Deals","Daily Deals","#FFD700")
return V end
;BuySeedStock=
function()if not c.shop_stocks.enabled_seedshop then
 
return false end
 
local G=m.GetBigDataUsingKey("SeedStocks")if not G then
 
return false end
 
local V=false 
local 
function y(y)
local Z=G[y]if Z and Z.Stocks then
 for G,Z in pairs(Z.Stocks)do
 
local j=Z.Stock if c.shop_stocks.seed_shop_avoid[G]then
 continue end
 if j and j>0 then
 V=true if y=="Daily Deals"then
 t.Shops.RemoteBuyDailySeeds(G,j)
else
 t.Shops.RemoteBuySeed(G,j)end
 
task.wait()end
 end
 end
 end
 y("Shop")y("Daily Deals")if V then
 end
 end
;BuyGearStock=
function()if not c.shop_stocks.enabled_gearshop then
 
return false end
 
local G=m.GetBigDataUsingKey("GearStock")or{}if G.Stocks then
 for G,V in pairs(G.Stocks)do
 
local y=V.Stock if y and y>0 then
 t.Shops.RemoteBuyGearStock(G,y)
task.wait(.1)end
 end
 
else
 end
 end
,BuyEggStock=
function()if not c.shop_stocks.enabled_eggshop then
 
return false end
 
local G=m.GetBigDataUsingKey("PetEggStock")or{}if G.Stocks then
 for G,V in ipairs(G.Stocks)do
 
local y=V.EggName 
local Z=V.Stock if Z and Z>0 then
 t.Shops.RemoteBuyEggs(y,Z)
task.wait(.1)end
 end
 end
 end
}
task.spawn(
function()while true do
 
task.wait(10)t.Shops.BuySeedStock()
task.wait(1)t.Shops.BuyGearStock()
task.wait(1)t.Shops.BuyEggStock()end
 end
)Z.WATER_TEXT=""Z.WATER_TEXT_STATS=""b.UI={UpdateProgress=
function(G)if Z.WATER_TEXT then
 Z.WATER_TEXT=G end
 end
,UpdateStatus=
function(G)if Z.WATER_TEXT_STATS then
 Z.WATER_TEXT_STATS=G end
 end
;WaterLoop=
function()if S.Is_MasterBusy()then
 b.UI.UpdateStatus("\226\132\185\239\184\143 Other tasks in progress..")
return false end
 if not c.watering_is_auto then
 b.UI.UpdateStatus("\240\159\148\180 Not Running")
return false end
 
local G=r.GetWateringCan("Watering Can")if not G then
 b.UI.UpdateStatus("\226\157\140 You do
 not have watering cans.")
return false end
 b.UI.UpdateStatus("\240\159\159\162 Active and Running")b.UI.UpdateProgress("")
local V=b.Plants.GetPlantsNotGrown()
local y=#V b.UI.UpdateStatus("\226\132\185\239\184\143 Found "..(tostring(y).." plants to water."))if y<=0 then
 b.UI.UpdateStatus("\226\157\140 No plants to water.")
return false end
 if G then
 yJ()
task.wait(.1)VJ(G)
task.wait(.1)end
 
local Z=tonumber(c.watering_amount_to_water)
local j=tonumber(c.watering_speed_time)
local i=5 
local J=0 for V,y in ipairs(V)do
 if not c.watering_is_auto then
 break end
 if S.Is_MasterBusy()then
 break end
 
local T=u.GetPlantPosition(y)if not T then
 continue end
 if not G then
 break end
 if J>=i then
 break end
 if bJ()then
 break end
 b.UI.UpdateStatus("\240\159\159\162 Watering in progress...")b.UI.UpdateProgress("\240\159\146\167 Watering "..y.Name)
local d=0 for V=1,Z,1 do
 if S.Is_MasterBusy()then
 break end
 if not G then
 break end
 if bJ()then
 break end
 if not zJ(G)then
 yJ()
return false end
 d=d+1 r.UseWateringCan(T)b.UI.UpdateProgress("\240\159\146\167 Watering "..(y.Name..(" "..(tostring(d)..("/"..Z)))))
task.wait(j)end
 
task.wait(.1)J=J+1 end
 b.UI.UpdateStatus("\240\159\159\162 Watering completed...")yJ()
return true end
}b.Plants={GetPlantsNotGrown=
function()
local G={}for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if not y:IsA("Model")then
 continue end
 if not c.watering_list_plants[y.Name]then
 continue end
 
local Z={}
local j=y:FindFirstChild("Fruits")if j and#j:GetChildren()>0 then
 for G,V in ipairs(j:GetChildren())do
 table.insert(Z,V)end
 
else
 table.insert(Z,y)end
 for V,y in ipairs(Z)do
 if not u.IsFruitGrown(y)then
 table.insert(G,y)end
 end
 end
 
return G end
}b.Sprinkler={PlaceGrandMaster=
function(G)
local V,y=
pcall(
function()
local V=r.GetSprinklerUsingName(G)if not V then
 
return end
 
local y=E.mFarm.Center_Point.Position 
local Z=XJ(y)yJ()VJ(V)
task.wait(.3)
local j=Z[math.random(1,#Z)]if zJ(V)then
 r.PlaceSprinkler(j)end
 
task.wait(.9)yJ()end
)end
}
local hl="Not enough In Pet Inventory"
local ll="max backpack space"
local Bl="loaded pets"
local Ll="max pet eggs"
local ml="from selling your pet"
local Kl="egg has been recovered"
local bl="you have reached the limit of pets"
local Sl="Your garden is full"
local zl="recently Bloomed Fall! Please wait"
local fl="You found the Marmot"
local tl="You collected an Acorn"
local Ml="Red Panda restocked"
local Al="Shiny eye"
local xl="An Acorn appeared somewhere on the map"
local Cl="Marmot burrowed away! Try to find its burrow mound"
local Dl="Your target has a max pet inventory"Z.OnMarmotOrAcornAdded=
function(G)Z.map_event_item_added=true end
 Z.ChubbyChipmunkNotifications=
function(G)
local V,y=
pcall(
function()
local V,y=G:match("Reward:%s*(%d+)x%s*(.+)")V=tonumber(V)if not V or not y then
 
return end
 
local Z={["Watering Can"]="chubby_chipmunk_item_watering_can";["Event Lantern"]="chubby_chipmunk_item_event_lantern",["Godly Sprinkler"]="chubby_chipmunk_item_godly_sprinkler",["Legendary Egg"]="chubby_chipmunk_item_legendary_egg",Reclaimer="chubby_chipmunk_item_reclaimer";["Nutty Crate"]="chubby_chipmunk_item_nutty_crate",["Silver Fertilizer"]="chubby_chipmunk_item_silver_fertilizer",["Nutty Chest"]="chubby_chipmunk_item_nutty_chest",["Master Sprinkler"]="chubby_chipmunk_item_master_sprinkler",["Medium Treat"]="chubby_chipmunk_item_medium_treat",["Medium Toy"]="chubby_chipmunk_item_medium_toy",["Mythical Egg"]="chubby_chipmunk_item_mythical_egg";["Grandmaster Sprinkler"]="chubby_chipmunk_item_grandmaster_sprinkler",["Rainbow Fertilizer"]="chubby_chipmunk_item_rainbow_fertilizer",["Pet Shard Nutty"]="chubby_chipmunk_item_petshardnutty"}
local j=Z[y]if j then
 c[j]=((c[j]or 0))+V end
 c.chubby_chipmunk_amount_collected=c.chubby_chipmunk_amount_collected+1 n()m.ChubbyChipmunk.updateInformation()end
)if not V then
 
warn("Error in ChubbyChipmunkNotifications:",y)end
 end
 Z.MarmotNotifications=
function(G)
local V,y=
pcall(
function()
local V,y=G:match("Reward:%s*(%d+)x%s*(.+)")V=tonumber(V)if not V or not y then
 
return end
 
local Z={["Firefly Jar"]="marmot_item_firefly";["Maple Leaf Kite"]="marmot_item_maple_leaf_kite",["Sky Lantern"]="marmot_item_sky_lantern";["Leaf Blower"]="marmot_item_leaf_blower",["Maple Syrup"]="marmot_item_maple_syrup",["Maple Sprinkler"]="marmot_item_maple_sprinkler",["Golden Acorn"]="marmot_item_golden_acorn"}
local j=Z[y]if j then
 c[j]=((c[j]or 0))+V end
 c.marmot_amount_collected=c.marmot_amount_collected+1 n()m.Marmot.updateInformation()end
)if not V then
 
warn("Error in MarmotNotifications:",y)end
 end
 Z.RedPandaRestock=
function(G)if not G then
 
return end
 if not T.red_panda_record_items then
 
return end
 
local V=G:match("restocked%s+(.+)%s+in%s+the%s+.+$")if V then
 T.red_panda_restock[V]=((T.red_panda_restock[V]or 0))+1 T.red_panda_restock_total=T.red_panda_restock_total+1 R()
else
 
warn("No item found in line:",G)end
 m.RedPanda.updateInformation()end
 Z.MagPieNoti=
function(G)if not c.magpie_recordstatus then
 
return end
 G=G:gsub("[^%w%s]","")G=G:gsub("%s+"," ")G=G:match("^%s*(.-)%s*$")
local V,y=string.match(G,"Shiny eye.-received x(%d+) (.+)")if V and y then
 
local G=tonumber(V)c.magpie_status[y]=((c.magpie_status[y]or 0))+G n()
else
 end
 end
 Z.BeardedDragonEggNoti=
function(G)if not c.bearded_dragon_recordstatus then
 
return end
 G=(tostring(G or"")):gsub("<.->","")if not G:find("stashed away",1,true)then
 
return end
 if not G:find("found a",1,true)and not G:find("found an",1,true)then
 
return end
 G=G:gsub("[^%w%s]","")G=G:gsub("%s+"," ")G=G:match("^%s*(.-)%s*$")
local V=G:match("found an? (.- Egg)$")if not V then
 
return end
 c.bearded_dragon_egg_status[V]=((c.bearded_dragon_egg_status[V]or 0))+1 n()end
 Z.MerryBearyGiftNoti=
function(G)if not c.merrybear_collect then
 
return end
 G=(tostring(G or"")):gsub("<.->","")if not G:find("Merry Beary gift",1,true)then
 
return end
 if not G:find("received",1,true)then
 
return end
 
local V,y=G:match("received%s+(%d+)x%s+([^!]+)")if not y then
 
return end
 V=tonumber(V)or 1 y=y:match("^%s*(.-)%s*$")c.bear_merrygift_status[y]=((c.bear_merrygift_status[y]or 0))+V n()end
 Z.Noti_Display={activeNotifications={},notificationLabel=nil,checkExpired=
function(G)
local V=time()
local y=false 
local Z={}for G,j in pairs(G.activeNotifications)do
 if V-j.expiryTime>5 then
 table.insert(Z,G)y=true end
 end
 if y then
 for V,y in ipairs(Z)do
 G.activeNotifications[y]=nil end
 G:updateDisplay()end
 end
;checkExpiredx=
function(G)
local V=time()
local y=false for Z,j in pairs(G.activeNotifications)do
 if V-j.expiryTime>5 then
 G.activeNotifications[Z]=nil y=true end
 end
 if y then
 G:updateDisplay()end
 end
,getOrCreateGui=
function(G)if G.notificationLabel and G.notificationLabel.Parent then
 
return G.notificationLabel end
 
local y=V.LocalPlayer if not y then
 
return nil end
 
local Z=V.PlayerGui if not Z then
 
return nil end
 
local j=.13 
local i=game.Workspace.CurrentCamera if not i then
 
return nil end
 
local c=i.ViewportSize.Y 
local J=math.round(c/38)J=math.clamp(J,12,18)
local T=.6 
local d=Z:FindFirstChild("x_NotificationGui")if not d then
 d=Instance.new("ScreenGui")d.Name="x_NotificationGui"d.DisplayOrder=99999 d.ZIndexBehavior=Enum.ZIndexBehavior.Sibling d.ResetOnSpawn=false d.Parent=Z end
 G.notificationLabel=d:FindFirstChild("NotificationDisplay")if not G.notificationLabel then
 G.notificationLabel=Instance.new("TextLabel")G.notificationLabel.Name="NotificationDisplay"G.notificationLabel.Size=UDim2.new(T,0,0,0)G.notificationLabel.AutomaticSize=Enum.AutomaticSize.Y G.notificationLabel.TextWrapped=true G.notificationLabel.Position=UDim2.new(.5,0,j,0)G.notificationLabel.AnchorPoint=Vector2.new(.5,0)G.notificationLabel.BackgroundTransparency=1 G.notificationLabel.LineHeight=1.2 G.notificationLabel.RichText=true G.notificationLabel.Font=Enum.Font.SourceSansBold G.notificationLabel.TextColor3=Color3.new(1,1,1)G.notificationLabel.TextSize=J G.notificationLabel.TextStrokeColor3=Color3.new(0,0,0)G.notificationLabel.TextStrokeTransparency=.3 G.notificationLabel.TextXAlignment=Enum.TextXAlignment.Center G.notificationLabel.TextYAlignment=Enum.TextYAlignment.Top G.notificationLabel.Text=""G.notificationLabel.Parent=d end
 
local u=G.notificationLabel:FindFirstChildOfClass("UIGradient")if not u then
 u=Instance.new("UIGradient")u.Color=ColorSequence.new({ColorSequenceKeypoint.new(.0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(.5,Color3.fromRGB(200,200,200))})u.Rotation=90 u.Parent=G.notificationLabel end
 
return G.notificationLabel end
;updateDisplay=
function(G)if not G.notificationLabel then
 if not G:getOrCreateGui()then
 
return end
 end
 
local V={}for G,y in pairs(G.activeNotifications)do
 if y.count>1 then
 table.insert(V,y.text..(" <font color=\'#ffff00\'>[x"..(y.count.."]</font>")))
else
 table.insert(V,y.text)end
 end
 G.notificationLabel.Text=table.concat(V,"\n")end
}W.ShowNotification=
function(G)Z.Noti_Display:getOrCreateGui()
local V=Z.Noti_Display.activeNotifications[G]
local y=time()if V then
 V.count=V.count+1 V.expiryTime=y 
else
 Z.Noti_Display.activeNotifications[G]={text=G;count=1,expiryTime=y}end
 Z.Noti_Display:updateDisplay()end
 if S.task_notification_live then
 task.cancel(S.task_notification_live)S.task_notification_live=nil end
 S.task_notification_live=
task.spawn(
function()while true do
 
task.wait(.5)
pcall(
function()Z.Noti_Display:checkExpired()end
)end
 end
)
local 
function Pl(G)if IJ(G,Dl)then
 Z.target_max_inventory=true end
 if IJ(G,hl)then
 Z.max_pet_inventory_space=true end
 if IJ(G,Ml)then
 Z.RedPandaRestock(G)end
 if IJ(G,Al)then
 Z.MagPieNoti(G)end
 Z.BeardedDragonEggNoti(G)Z.MerryBearyGiftNoti(G)if IJ(G,xl)then
 Z.OnMarmotOrAcornAdded(G)end
 if IJ(G,Cl)then
 Z.OnMarmotOrAcornAdded(G)end
 if IJ(G,tl)then
 Z.ChubbyChipmunkNotifications(G)end
 if IJ(G,fl)then
 Z.MarmotNotifications(G)end
 if IJ(G,zl)then
 Z.recent_bloom_fall_notfi=true end
 if IJ(G,Sl)then
 Z.is_garden_full_seed=true end
 if IJ(G,Ll)then
 Z.is_max_eggs_reached=true end
 if IJ(G,ml)then
 qJ=qJ+1 Z.has_seal_sold_happen=true end
 if IJ(G,Kl)then
 gJ=gJ+1 Z.has_koi_repaint=true end
 if IJ(G,Bl)then
 rJ=true end
 if IJ(G,bl)then
 YJ=true end
 end
 W.DestroyNotification=
function()
pcall(
function()
local G=(V.LocalPlayer:WaitForChild("PlayerGui")):WaitForChild("Top_Notification")G:Destroy()end
)end
 if T.use_noti then
 W.DestroyNotification()end
 
local 
function Ol()
local G=game:GetService("ReplicatedStorage")
local V=(G:WaitForChild("GameEvents")):WaitForChild("Notification")V.OnClientEvent:Connect(
function(...)for G,V in ipairs({...})do
 if type(V)=="string"then
 Pl(V)end
 if T.use_noti then
 
pcall(
function()W.ShowNotification(V)end
)end
 end
 end
)end
 Ol()z.AgeBreakMachine={cache={};PetAgeBreakMachine_Data={};STATES={EMPTY="EMPTY";SUBMITTED="SUBMITTED",RUNNING="RUNNING";READY_TO_CLAIM="READY_TO_CLAIM",BYPASS_EMPTY_READY="BYPASS_EMPTY_READY",UNKNOWN="UNKNOWN"},BuyUsingTokens=
function()
pcall(
function()V.GameEvents.TradeEvents.TradeTokens.Purchase:InvokeServer(3453278902)end
)end
;SubmitHeld=
function()
pcall(
function()V.GameEvents.PetAgeLimitBreak_SubmitHeld:FireServer()end
)end
,SubmitDups=
function(G)
pcall(
function()V.GameEvents.PetAgeLimitBreak_Submit:FireServer(G)end
)end
;ClaimPet=
function()
pcall(
function()V.GameEvents.PetAgeLimitBreak_Claim:FireServer()end
)end
,CancelPet=
function()
pcall(
function()V.GameEvents.PetAgeLimitBreak_Cancel:FireServer()end
)end
,GetTimeRemainingStatusText=
function()
local G=z.AgeBreakMachine.PetAgeBreakMachine_Data 
local V=z.AgeBreakMachine.GetState()
local y=z.AgeBreakMachine.STATES if V==y.RUNNING then
 
local V=G.TimeLeft or 0 
return W.fmt_time(V)
else
 
return"00.00"end
 end
,GetPetName=
function()
local G=z.AgeBreakMachine.PetAgeBreakMachine_Data if not G or not G.SubmittedPet or not G.SubmittedPet.PetData then
 
return nil end
 
local V=G.SubmittedPet 
local y=V.PetData 
local Z=V.PetType 
return Z end
,PetDetails=
function()
local G=tonumber(T.agebreak.max_level)or 125 
local V=z.AgeBreakMachine.PetAgeBreakMachine_Data 
local y=z.AgeBreakMachine.GetTimeRemainingStatusText()if not V or not V.SubmittedPet or not V.SubmittedPet.PetData then
 
return"<font color=\'#FF4444\'>No pet submitted.</font>"end
 
local Z=V.SubmittedPet 
local j=Z.PetData 
local i=Z.PetType 
local c=j.Name 
local J=j.BaseWeight 
local d=j.Level 
local u=k(J,d)
local q=G-d 
local g if q<=1 then
 g="#27F527"
elseif q<=5 then
 g="#F5E027"
else
 g="#F52727"end
 
local E=string.format("(<font color=\'%s\'>%s</font>/%s)",g,d,G)
local a=string.format("<font color=\'#8BE9FD\'>[AgeBreak]</font> <font color=\'#FFFFFF\'>Lv.%s</font> <font color=\'#BD93F9\'>%s</font><font color=\'#FFB86C\'>(%s)</font> <font color=\'#8BE9FD\'>[%.2f KG]</font> - <font color=\'#FF79C6\'>%s</font>",E,i,c,u,y)
return a end
,UpdateAgebreakStatus=
function(G)if j.lbl_agebreak_status then
 j.lbl_agebreak_status:SetText(G)end
 Z.TEXT_AGEBREAK=G end
;Fav=
function(G,V)if not G then
 
return false end
 
local y=G:GetAttribute("d")or false if y~=V then
 mJ(G)
task.wait(.3)
return true end
 
return false end
,GetPetToSubmit=
function()
local G=T.agebreak.target_team 
local V=nil 
local y=""
local Z=tonumber(T.agebreak.max_level)or 125 
local j=100 if#G==0 then
 
return V,y end
 
local i=nil for G,V in ipairs(G)do
 
local c=WJ(V)if not c then
 continue end
 
local J=c.PetData.Level 
local T=c.PetData.BaseWeight 
local d=k(T,J)
local u=c.PetType y=u if J<j then
 continue end
 if J>=Z then
 continue end
 i=V break end
 if i then
 V=r.GetPetUsingUUID(i)
return V,y end
 
return V,y end
,GetDupsForTarget=
function(G)
local V=nil 
local y=T.agebreak.avoid_weight_filter or false 
local Z=T.agebreak.avoid_age_filter or true if G then
 V=G 
else
 V=z.AgeBreakMachine.GetPetName()end
 
local j={}if not V then
 
return j end
 
local i=T.agebreak.dup_team if#i==0 then
 
return j end
 for G,i in ipairs(i)do
 
local c=WJ(i)if not c then
 continue end
 
local J=c.PetData.Level 
local T=c.PetData.BaseWeight 
local d=k(T,J)
local u=k(T,1)
local q=c.PetType 
local g=3.5 
local E=99 if y and u>=g then
 continue end
 if Z and J>=E then
 continue end
 if q==V then
 table.insert(j,i)
return j end
 end
 
return j end
;AssignData=
function()z.AgeBreakMachine.PetAgeBreakMachine_Data=m.GetBigDataUsingKey("PetAgeBreakMachine")end
;GetSubmittedPetUUID=
function()
local G=z.AgeBreakMachine.PetAgeBreakMachine_Data if G and(G.SubmittedPet and G.SubmittedPet.UUID)then
 
return G.SubmittedPet.UUID end
 
return nil end
,FindModel=
function()
local G="PetAgeMachine"if z.AgeBreakMachine.cache[G]then
 
return z.AgeBreakMachine.cache[G]end
 
local V=d.findInWorkspace(G,"Model")if V then
 z.AgeBreakMachine.cache[G]=V end
 
return z.AgeBreakMachine.cache[G]end
;MakeWebhookData=
function(G)
local V=WJ(G)
local y=tonumber(T.agebreak.max_level)or 125 if not V then
 
return false end
 
local Z=V.PetData.Level 
local j=V.PetData.BaseWeight 
local i=k(j,Z)
local c=V.PetType 
local J=V.PetData.Name 
local d={pet_name=c,nickname=J,level=Z,required_level=y,weight=i}table.insert(Y.AgeBreakWebHook,d)end
,GetState=
function()
local G=z.AgeBreakMachine.PetAgeBreakMachine_Data 
local V=z.AgeBreakMachine.STATES if G and(not G.SubmittedPet and(G.PetReady and not G.IsRunning))then
 
return V.BYPASS_EMPTY_READY end
 if not G or not G.SubmittedPet then
 
return V.EMPTY end
 if G.PetReady and(G.SubmittedPet and not G.IsRunning)then
 
return V.READY_TO_CLAIM end
 if G.IsRunning and G.TimeLeft>0 then
 
return V.RUNNING end
 if G.SubmittedPet and(not G.IsRunning and not G.PetReady)then
 
return V.SUBMITTED end
 
return V.UNKNOWN end
}z.AgeBreakMachine.AssignData()if S.task_agebreak_machine then
 task.cancel(S.task_agebreak_machine)S.task_agebreak_machine=nil end
 S.task_agebreak_machine=
task.spawn(
function()while true do
 
task.wait(1.5)
local G=z.AgeBreakMachine 
local V=G.GetState()
local y=G.STATES 
local j=T.agebreak.is_active_agebreak if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] Is Waiting for farm data to load.")
task.wait(5)continue end
 if not Z.GetCheckIfPro()then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] None premium user detected. Shutdown.")T.agebreak.is_active_agebreak=false R()
task.wait(10)continue end
 if not j then
 G.UpdateAgebreakStatus("\240\159\148\180 Not Enabled.")
task.wait(3)continue end
 if Z.IS_GIFT then
 
local V=G.PetDetails()G.UpdateAgebreakStatus("[\240\159\159\161 GIFT IN PROCESS] "..V)
task.wait(3)continue end
 if Z.IS_HATCHING then
 
local V=G.PetDetails()G.UpdateAgebreakStatus("[\240\159\159\161 Hatching] "..V)
task.wait(3)continue end
 if Z.IsPaused()then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] Systems are paused by user.")
task.wait(5)continue end
 if V==y.READY_TO_CLAIM then
 if Z.IS_GIFT then
 
task.wait(1)continue end
 
local V=G.GetSubmittedPetUUID()G.ClaimPet()
task.wait(5)G.MakeWebhookData(V)
task.wait(.5)
local y=r.GetPetUsingUUID(V)if y then
 
local V=true G.Fav(y,V)
task.wait(2.3)end
 yJ()cl()continue end
 if V==y.EMPTY then
 G.UpdateAgebreakStatus("\240\159\159\161 Empty machine, trying to find pet to submit.")
task.wait(.5)
local V,y=G.GetPetToSubmit()if not V then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] Unable to find any pets to submit. If the pet is active please remove it from the farm.")
task.wait(5)continue end
 
local j=G.GetDupsForTarget(y)if#j==0 then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] Current Pet has no dups assigned. Please select dupes for all pets.")
task.wait(5)continue end
 Z.IS_MUTATION_RUNNING=true 
task.wait(2.5)yJ()
task.wait(.5)if not VJ(V)then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] Failed to equip this pet, will try again.")
task.wait(5)Z.IS_MUTATION_RUNNING=false continue end
 if Z.IS_GIFT then
 
task.wait(1)continue end
 G.UpdateAgebreakStatus("\226\157\164\239\184\143 Remove fav if it is.")
local i=false G.Fav(V,i)
task.wait(.3)G.UpdateAgebreakStatus("\226\156\133 Submit pet.")G.SubmitHeld()
task.wait(3)Z.IS_MUTATION_RUNNING=false continue end
 if V==y.RUNNING then
 if T.agebreak.auto_skip_tokens then
 
task.wait(.5)G.BuyUsingTokens()
local V="\240\159\146\176 [Age Break] Skip using tokens."G.UpdateAgebreakStatus(V)
task.wait(.3)end
 
local V=G.PetDetails()G.UpdateAgebreakStatus(V)continue end
 if V==y.SUBMITTED then
 
local V=G.GetDupsForTarget()if#V==0 then
 G.UpdateAgebreakStatus("\240\159\148\180 [Age Break] No dupes found for this pet.")
task.wait(5)continue end
 G.UpdateAgebreakStatus("\226\153\187\239\184\143 Checking and finding dupes")
local y={}for V,Z in ipairs(V)do
 
local j=r.GetPetUsingUUID(Z)if j then
 
local V=false G.Fav(j,V)table.insert(y,Z)
task.wait(.2)end
 end
 
task.wait(2)G.UpdateAgebreakStatus("\226\156\133 Submit dupes and starting.")G.SubmitDups(y)
task.wait(2)continue end
 end
 end
)W.TeleportToFarmMiddle=
function(G)if G then
 
local G=E.mFarm.Center_Point.Position v(W.Vector3ToCFrame(G))
return end
 if T.char_farm_middle then
 
local G=E.mFarm.Center_Point.Position v(W.Vector3ToCFrame(G))end
 end
 
task.spawn(
function()
pcall(
function()W.TeleportToFarmMiddle()end
)end
)X.Update_AllTimers=
function()if not j.lbl_cooking_display_time then
 
return nil end
 
local G=""for V,y in pairs(X.TimeDisplayPots)do
 
local Z=W.StringToColor3(V)G=G..("<font color=\'"..(Z..("\'>"..(V..("</font> "..(y.."\n"))))))end
 j.lbl_cooking_display_time:SetText(G)end
 X.Update_AllStatus=
function(G)if j.lbl_cooking_stats then
 j.lbl_cooking_stats:SetText(G)end
 end
 X.GetAllCookingPots=
function()
local G={}for V,y in ipairs(E.Cosmetic_Physical:GetChildren())do
 
local Z=y:GetAttribute("CosmeticUUID")
local j=y:FindFirstChild("Cooking Kit")if j and Z then
 G[Z]=j end
 end
 if next(G)==nil then
 
return nil end
 
return G end
 X.GetFoodFromPot=
function(G)V.CookingPotService_RE:FireServer("GetFoodFromPot",G)
task.wait(.1+X.SpeedOffset)end
 X.GetTimeLeftUntilDone=
function(G)if not G then
 
return false end
 
local V,y=
pcall(
function()
return G.CookTimeDisplay.Face.SurfaceGui.TimeDisplayFrame.TimeLabel.Text end
)if not V then
 end
 
return V and y or false end
 X.GetIsCooking=
function(G)if not G then
 
return false end
 
local V,y=
pcall(
function()
return G.CookingPotPart.SkipCookingProxPrompt.Enabled end
)
return V and y==true end
 X.IsReadyToCollect=
function(G)if not G then
 
return false end
 
local V,y=
pcall(
function()
return G.CookingPotPart.GetFoodProxPrompt.Enabled end
)
return V and y==true end
 X.IsReadyForNewCooking=
function(G)if not G then
 
return false end
 
local V,y=
pcall(
function()
local V=G.CookingPotPart.GetFoodProxPrompt.Enabled 
local y=G.CookingPotPart.SkipCookingProxPrompt.Enabled 
return not V and not y end
)
return V and y==true end
 X.BeginCooking=
function(G)V.CookingPotService_RE:FireServer("CookBest",G)
return true end
 X.EmptyPot=
function(G)V.CookingPotService_RE:FireServer("EmptyPot",G)
return true end
 X.PutFruitIntoPot=
function(G)V.CookingPotService_RE:FireServer("SubmitHeldPlant",G)
task.wait(.01+X.SpeedOffset)end
 X.SubmitAllFruits=
function(G,V)X.EmptyPot(G)
task.wait(.3)for V,y in ipairs(V)do
 
local j=20 while Z.IS_HATCHING or Z.QUEST_TASK_RUNNING or Z.IS_SEEDING or Z.IS_SHOVELING do
 if j<=0 then
 Z.QUEST_TASK_RUNNING=false break end
 
task.wait(3)j=j-1 continue end
 yJ()
task.wait(.1+X.SpeedOffset)VJ(y)
task.wait(.2+X.SpeedOffset)X.PutFruitIntoPot(G)
task.wait(.2+X.SpeedOffset)yJ()
task.wait(.1+X.SpeedOffset)end
 
task.wait(.4+X.SpeedOffset)X.BeginCooking(G)
task.wait(.2+X.SpeedOffset)end
 X.CheckAndPlaceNewPlants=
function(G)if not G or#G==0 then
 
return false end
 if not E.Garden.GetIsNormalGarden()then
 
return false end
 
local V={}for G,y in ipairs(G)do
 if not u.HasPlantByName(y)then
 table.insert(V,y)end
 end
 if#V==0 then
 
return false end
 u.PlantsTrees(V)
task.wait(2)
return true end
 X.GatherAllRequiredIngredients=
function(G)
local y={}if c.cook_potone_item1~=nil and c.cook_potone_item1~="-"then
 table.insert(y,c.cook_potone_item1)end
 if c.cook_potone_item2~=nil and c.cook_potone_item2~="-"then
 table.insert(y,c.cook_potone_item2)end
 if c.cook_potone_item3~=nil and c.cook_potone_item3~="-"then
 table.insert(y,c.cook_potone_item3)end
 if c.cook_potone_item4~=nil and c.cook_potone_item4~="-"then
 table.insert(y,c.cook_potone_item4)end
 if c.cook_potone_item5~=nil and c.cook_potone_item5~="-"then
 table.insert(y,c.cook_potone_item5)end
 if#y==0 then
 
return false end
 
local Z={}for G,V in ipairs(y)do
 if not Z[V]then
 Z[V]=0 end
 Z[V]=Z[V]+1 end
 
local j={}
local i={}
local J={}for G,V in ipairs(V.Backpack:GetChildren())do
 if not V:IsA("Tool")then
 continue end
 if V:GetAttribute("d")then
 continue end
 if V:GetAttribute("b")~="j"then
 continue end
 
local y=V:GetAttribute("f")if not Z[y]then
 continue end
 J[y]=J[y]or 0 if J[y]>=Z[y]then
 continue end
 J[y]=J[y]+1 table.insert(i,V)end
 
local T={}for G,V in ipairs(y)do
 T[V]=T[V]or 0 
local y=J[V]or 0 
local i=Z[V]or 0 if T[V]<i-y then
 table.insert(j,V)T[V]=T[V]+1 end
 end
 if#i<#y then
 if c.cooking_autocollect_required then
 if#j>0 then
 X.Update_AllStatus("\240\159\141\146 Collect/Plant required fruits..")if c.cooking_autoplant_required then
 X.CheckAndPlaceNewPlants(j)
task.wait(1)end
 u.HarvestFruitsUsingNames(j)
task.wait(.3+X.SpeedOffset)end
 end
 
return false end
 
return i end
 X.CookLoop=
function()if S.Is_MasterBusy()then
 
return false end
 if not c.is_auto_cook then
 X.Update_AllStatus("\240\159\148\180 Not active or running")X.TimeDisplayPots={}
return false end
 X.Update_AllStatus("\240\159\159\162 Active and running")
local G=X.GetAllCookingPots()if not G then
 X.Update_AllStatus("\226\157\140 No Cooking Pots found.. Stopping..")Z.Notify("Cooking stopped - you do
 not have any Cooking Pots.",4)X.TimeDisplayPots={}X.Update_AllTimers()c.is_auto_cook=false n()if Z.UI_Buttons.ButtonAutoCook then
 Z.UI_Buttons.ButtonAutoCook:SetValue(false)end
 
return false end
 
local V=tonumber(X.SpeedOffset)or 0 for G,y in pairs(G)do
 if S.Is_MasterBusy()then
 break end
 if not c.is_auto_cook then
 break end
 if X.GetIsCooking(y)then
 
local V=X.GetTimeLeftUntilDone(y)
local Z=V and V or(G.." is cooking")X.TimeDisplayPots[G]="\240\159\141\178 Cooking Pot: "..Z X.Update_AllTimers()continue end
 if X.IsReadyToCollect(y)then
 X.Update_AllStatus("\240\159\141\148 Collecting from "..G)X.TimeDisplayPots[G]="\226\156\133 Food is Ready "X.Update_AllTimers()X.GetFoodFromPot(G)
task.wait(.1+V)X.Update_AllStatus("\226\156\133 Collected from "..G)continue end
 if X.IsReadyForNewCooking(y)then
 yJ()
task.wait(.1)X.TimeDisplayPots[G]="\226\154\170 Ready to cook "X.Update_AllTimers()
local y=X.GatherAllRequiredIngredients(G)if not y then
 X.Update_AllStatus("\226\154\161 No fruits found for "..G)continue end
 X.Update_AllStatus("\240\159\141\178 Adding fruits to "..G)
task.wait(.05+V)Z.IS_COOKING=true 
local j,i=
pcall(
function()X.SubmitAllFruits(G,y)end
)Z.IS_COOKING=false if j then
 
task.wait(.05+V)X.Update_AllStatus("\226\156\133 All fruits submitted to "..G)
else
 
warn("Failed to submit fruits to pot:",i)end
 end
 end
 Z.IS_COOKING=false 
return true end
 
local 
function Fl(G)if not j.lbl_ascenstats then
 
return end
 j.lbl_ascenstats:SetText(G)end
 
local 
function vl(G)if not j.lbl_ascen_current_requirement then
 
return end
 j.lbl_ascen_current_requirement:SetText(G)end
 
local 
function kl(G)if not j.lbl_ascen_cd then
 
return end
 j.lbl_ascen_cd:SetText(G)end
 if not _G.CoinFetchTask then
 _G.CoinFetchTask=
task.spawn(
function()while true do
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(30)
local G,V=
pcall(
function()Q()U()end
)if not G then
 
warn("\226\154\160\239\184\143 Coin fetch failed: ",V)end
 end
 end
)end
 g.MaxSprayAllAllowed=2 g.CurrentAppliedSprays=0 g.HasPlantByName=
function(G)for V,y in ipairs(E.Get_Plants_Physical_Objects())do
 if y:IsA("Model")and y.Name==G then
 
local G=y:GetAttribute("Favorited")if G then
 continue end
 
return true end
 end
 
return false end
 g.PlantSeed=
function(G,y)
local Z,j=
pcall(
function()V.PlantRemote:FireServer(G,y)end
)end
 g.FindFruitInBackpack=
function(G,y)
local 
function Z(G)for V in pairs(y)do
 if not G:GetAttribute(V)then
 
return false end
 end
 
return true end
 for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="j"then
 
local V=y:GetAttribute("f")if V==G and Z(y)then
 
return y end
 end
 end
 for V,y in ipairs(V.Character:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="j"then
 
local V=y:GetAttribute("f")if V==G and Z(y)then
 
return y end
 end
 end
 
return nil end
 g.HaveRequriementsFullFilled=
function()if not Z.AscensionFruitName then
 
return false end
 
local G=g.FindFruitInBackpack(Z.AscensionFruitName,Z.AscensionFruitMutations)if not G then
 
return false end
 
return true end
 g.AscensionFavFruitAfterHarvest=
function(G)
local V=g.FindFruitInBackpack(G,Z.AscensionFruitMutations)if V then
 mJ(V)end
 end
 g.FindFruitSeedInBackpack=
function(G)for V,y in ipairs(V.Backpack:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="n"then
 
local V=y:GetAttribute("d")
local Z=y:GetAttribute("c")
local j=y:GetAttribute("f")
local i=y:GetAttribute("Variant")
local c=y:GetAttribute("Seed")
local J=y:GetAttribute("Quantity")if j==G or c==G then
 
return y end
 end
 end
 for V,y in ipairs(V.Character:GetChildren())do
 if y:IsA("Tool")and y:GetAttribute("b")=="n"then
 
local V=y:GetAttribute("f")
local Z=y:GetAttribute("Seed")if V==G or Z==G then
 
return y end
 end
 end
 
return nil end
 g.PlantRequiredFruitsForAscension=
function(G)
local V=g.FindFruitSeedInBackpack(G)if V then
 yJ()
task.wait(.1)VJ(V)
local y=E.mFarm.Center_Point.Position 
local j=XJ(y)v(W.Vector3ToCFrame(y))
task.wait(1)for G=#j,2,-1 do
 
local V=math.random(G)j[G],j[V]=j[V],j[G]end
 
local i=tonumber(c.ascension_max_seeds)if not i then
 i=1 end
 
local J=i for V=1,J,1 do
 if Z.is_garden_full_seed then
 
task.wait(2)break end
 if#j==0 then
 break end
 
local y=table.remove(j)g.PlantSeed(y,G)
task.wait(.3)end
 yJ()
task.wait(.1)
else
 end
 end
 g.GetAscensionMutationRequirements=
function()
local G={}Z.AscensionFruitMutations={}
local y,j=
pcall(
function()
return V.PlayerGui.RebirthConfirmation.Frame.Display.RebirthDetails.RequiredItemTemplate.ItemMutations.ContentText end
)if y and(j and j~="")then
 for V in string.gmatch(j,"([^,]+)")do
 
local y=V:match("^%s*(.-)%s*$")G[y]=true Z.AscensionFruitMutations[y]=true end
 end
 
return G end
 g.GetAscensionFruitNameRequirements=
function()
local G=""Z.AscensionFruitName=""
local y,j=
pcall(
function()
return V.PlayerGui.RebirthConfirmation.Frame.Display.RebirthDetails.RequiredItemTemplate.ItemName.ContentText end
)if y and j then
 G=j Z.AscensionFruitName=j end
 
return G end
 g.GetAscensionCoolDownText=
function()
local G,y=
pcall(
function()
return V.PlayerGui.RebirthConfirmation.Frame.Frame.AscensionTimer end
)if not G or not y then
 
return"-"end
 if y.Visible then
 
return"\226\143\177\239\184\143 "..y.ContentText 
else
 
return"\240\159\159\162 Ready"end
 end
 g.GetAscensionRequireText=
function()if Z.AscensionFruitName then
 
local G=""if Z.AscensionFruitMutations and next(Z.AscensionFruitMutations)then
 
local V={}for G,y in pairs(Z.AscensionFruitMutations)do
 table.insert(V,G)end
 G=" ["..(table.concat(V,", ").."]")end
 
local V=g.HaveRequriementsFullFilled()if V then
 
return"\226\156\133 Require: "..(Z.AscensionFruitName..G)end
 
return"\226\172\134\239\184\143 Require: "..(Z.AscensionFruitName..G)
else
 
return"-"end
 end
 g.CleanImpossibleMutationsOnFruits=
function(G,V)
local y={Windstruck={"Tempestuous"};Chilled={"Frozen"},Wet={"Frozen";"Clay"}}
local Z=1 
local j=false for G,V in ipairs(G)do
 if j then
 break end
 for G,y in pairs(y)do
 if j then
 break end
 for y,i in ipairs(y)do
 if V:GetAttribute(i)then
 
local y=r.GetCleaningSpray()if not y then
 j=true break end
 if r.ApplySpray(V,y,Z)then
 
warn("Removed ",i)j=true break end
 if G=="Chilled"and g.CurrentAppliedSprays<g.MaxSprayAllAllowed then
 
local G=r.GetMutSprayChilled()if not G then
 j=true break end
 if r.ApplySpray(V,G,Z)then
 g.CurrentAppliedSprays=g.CurrentAppliedSprays+1 j=true break end
 end
 if G=="Windstruck"and g.CurrentAppliedSprays<g.MaxSprayAllAllowed then
 
local G=r.GetMutSprayWindstruck()if not G then
 j=true break end
 if r.ApplySpray(V,G,Z)then
 g.CurrentAppliedSprays=g.CurrentAppliedSprays+1 j=true break end
 end
 end
 end
 end
 end
 if g.CurrentAppliedSprays>=g.MaxSprayAllAllowed then
 
return false end
 for G,y in ipairs(G)do
 for G,V in pairs(V)do
 if y:GetAttribute(G)then
 continue end
 if G=="Windstruck"then
 
local G=r.GetMutSprayWindstruck()if not G then
 break end
 if r.ApplySpray(y,G,Z)then
 
return true 
else
 end
 end
 if G=="Chilled"then
 
local G=r.GetMutSprayChilled()if not G then
 break end
 if r.ApplySpray(y,G,Z)then
 
return true 
else
 end
 end
 end
 end
 
return false end
 g.CollectFruitUsingNameAndMut=
function(G,y)if r.IsBackpackFull()then
 
return true end
 if not Z.FruitCollectPause.CanCollect()then
 
return true end
 
local j={}
local i={}for V,Z in ipairs(E.Get_Plants_Physical_Objects())do
 if not Z:IsA("Model")then
 continue end
 if G and Z.Name~=G then
 continue end
 
local c={}
local J=Z:FindFirstChild("Fruits")if J and#J:GetChildren()>0 then
 for G,V in ipairs(J:GetChildren())do
 table.insert(c,V)end
 
else
 table.insert(c,Z)end
 for G,V in ipairs(c)do
 if not u.IsFruitReadyToCollect(V)then
 continue end
 
local Z=true for G in pairs(y)do
 if not V:GetAttribute(G)then
 Z=false break end
 end
 if Z then
 table.insert(j,V)break end
 table.insert(i,V)end
 end
 if#j>0 then
 V.collectEvent:FireServer(j)
task.wait(.3)g.GetAscensionMutationRequirements()
task.wait(.1)for G,V in ipairs(j)do
 if V.Name then
 g.AscensionFavFruitAfterHarvest(V.Name)end
 end
 Z.sleep_ascend=2 
return true 
else
 
local G=#i if G>0 then
 g.CleanImpossibleMutationsOnFruits(i,y)
task.wait(.3)Z.sleep_ascend=3 
return false end
 g.CleanImpossibleMutationsOnFruits(i,y)end
 Z.sleep_ascend=10 
return false end
 g.IsAscensionCountDownOver=
function()
local G=V.PlayerGui.RebirthConfirmation 
local y,Z=
pcall(
function()
return G.Frame.Frame.AscensionTimer.ContentText end
)if y and(Z and Z=="Next Ascension in 4:30")then
 
return true end
 if not Z then
 
return false end
 
local j=Z:gsub("%D","")
local i=tonumber(j)or 0 if i<4 then
 end
 
local c,J=
pcall(
function()
return G.Frame.Frame.AscensionTimer.Visible end
)if c and not J then
 
return true end
 
return false end
 g.AutoAscension=
function()
local G=g.FindFruitInBackpack(fruit_name,mutations_fs)if Z.CanAscend()then
 if T.fast_ascen then
 
local G=V.GameEvents:WaitForChild("BuyRebirth")for V=1,199,1 do
 
task.spawn(
function()G:FireServer()end
)end
 
else
(V.GameEvents:WaitForChild("BuyRebirth")):FireServer()end
 
task.wait(1)
else
 end
 end
 if not _G.AutoAscensionTask then
 _G.AutoAscensionTask=
task.spawn(
function()while true do
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(2)if not c.auto_ascension then
 continue end
 if Z.IS_HATCHING then
 Fl("\240\159\144\163 Paused: Eggs are hatching...")continue end
 Fl("\240\159\159\162 Auto Ascension is running ")g.GetAscensionFruitNameRequirements()g.GetAscensionMutationRequirements()
local G=g.GetAscensionRequireText()vl(G)
local V=g.GetAscensionCoolDownText()kl(V)
task.wait(Z.sleep_ascend)
local y,j=
pcall(g.AutoAscension)if not y then
 
warn("\226\154\160\239\184\143 AutoAscension failed: ",j)end
 Z.sleep_ascend=math.random(7,25)end
 end
)end
 S.Quests={QuestAutoSpin=
function()
pcall(
function() end
)end
;ClaimQuestReward=
function(G,V)
pcall(
function() end
)end
,GetQuestContainerGardenGames=
function()
local G=m.GetBigDataUsingKey("TeamEventData")if not G or not G.EasterTraining then
 
return nil end
 
local V=G.EasterTraining.QuestContainerId if not V then
 
return nil end
 
local y=m.GetBigDataUsingKey("QuestContainers")if not y then
 
return nil end
 
local Z=y[V]if Z then
 
return Z,V 
else
 
return nil end
 end
,GetQuestsTodo=
function()
local G="<font size=\"16\" color=\"#FFD700\"><b>\240\159\147\156 Current Tasks</b></font>\n"
local V,y=S.Quests.GetQuestContainerGardenGames()if not V then
 
return nil,G end
 
local Z={}for V,j in ipairs(V.Quests)do
 
local i=j.Type or"Unknown"if i=="Unknown"then
 continue end
 
local c=""
local J=nil 
local T=nil if j.Arguments and j.Arguments[1]then
 c=j.Arguments[1]end
 if j.Arguments then
 
local G=j.Arguments[1]
local V=j.Arguments[2]if tonumber(G)and V then
 J=tonumber(G)T=V end
 end
 
local d=j.Progress or 0 
local u=j.Target or 0 
local q=j.Completed 
local g=j.Claimed 
local E=j.Id or"-"
local a=u-d if not g then
 S.Quests.ClaimQuestReward(y,E)end
 
local H=""if q then
 H=string.format("\226\156\133 <font color=\"#E6E6E6\"><s><b>%s</b> %s</s></font>",i,c)
else
 H=string.format("\226\143\179 <font color=\"#00FFFF\"><b>%s</b></font> <font color=\"#FFA500\">%s</font>: <font color=\"#DDDDDD\">%s/%s</font>",i,c,d,u)end
 G=G..(H.."\n")if not q then
 
local G={action=i,target_item=c;current_amount=d;target_amount=u;needed=a,required_weight=J,required_plant=T}table.insert(Z,G)end
 end
 
return Z,G end
;ActionPlant=
function(G,V)if not E.Garden.GetIsNormalGarden()then
 
return false end
 
local y=r.GetSeedUsingName(G)if not y then
 
return false end
 if Z.is_garden_full_seed then
 f.UpdateStatsInfo("\226\154\160\239\184\143 Garden is full, unable to place a seed. Waiting...")
task.wait(2)
return false end
 
local j=u.PlaceSeedSmart(G,V)
return j end
;ActionHarvest=
function(G,V)if not u.HasPlantByName(G)then
 
local y=V if Z.IsSingleHarvest(G)then
 
local Z=E.GetPlantCountBySeed(G)
local j=V-Z y=j 
else
 y=9 end
 
return S.Quests.ActionPlant(G,y)end
 
local y={amount=V;batch_mode=false}
local j={}j[G]=true 
local i=u.CollectFruitByNamesSortedRarityConfig(j,y)
task.wait(1)
return true end
,ActionEarnSheckles=
function()
local G={amount=20,random=true}
local V={}
local y=u.CollectFruitByNamesSortedRarityConfig(V,G)
task.wait(1)Z.SellFruitsToVendorWithRangeCheck()
task.wait(1)
return true end
;HarvestTargetWithWeight=
function(G,V,y)
local Z=y or 1 u.CollectFruitByNameAndWeight(G,Z,V)end
,HarvestSingle=
function()
local G={amount=50}
local V={}V.Carrot=true V.Bamboo=true V.Mushroom=true V.Buttercup=true V.Pumpkin=true V.Daffodil=true 
local y=u.CollectFruitByNamesSortedRarityConfig(V,G)end
}V.LogService=game:GetService("LogService")Z.last_error=""Z.last_type_error={}Z.error_pet_active_count=0 Z.TARGET_ERROR_1="ActivePetsService:434"Z.TARGET_ERROR_2="attempt to index nil with \'Anchored\'"if not Z.GetCheckIfPro()then
 V.LogService.MessageOut:Connect(
function(G,V)if G then
 if string.find(G,Z.TARGET_ERROR_1)and string.find(G,Z.TARGET_ERROR_2)then
 Z.error_pet_active_count=Z.error_pet_active_count+1 if Z.error_pet_active_count>200000 then
 Z.error_pet_active_count=200000 end
 end
 end
 end
)end
 Z.GetCheckPPByPass=
function()if Z.GetCheckIfPro()then
 
return false end
 
local G=#V.Players:GetPlayers()if G>1 then
 
return false end
 if Z.error_pet_active_count>240 then
 
return true end
 
return false end
 W.SortPositionsByShape=
function(G,V,y)if y=="random"then
 for V=#G,2,-1 do
 
local y=math.random(V)G[V],G[y]=G[y],G[V]end
 
return end
 table.sort(G,
function(G,Z)
local j=G.X-V.X 
local i=G.Z-V.Z 
local c=Z.X-V.X 
local J=Z.Z-V.Z if y=="circle"then
 
local G=j^2+i^2 
local V=c^2+J^2 
return G<V 
elseif y=="square"then
 
local G=math.max(math.abs(j),math.abs(i))
local V=math.max(math.abs(c),math.abs(J))
return G<V 
elseif y=="heart"then
 
local G=.15 
local 
function V(V,y)
local Z=V*G 
local j=-((y*G))+.5 
local i=(((Z^2+j^2)-1))^3-(Z^2*(j^3))
return i end
 
local y=V(j,i)
local Z=V(c,J)
return y<Z end
 
return(j^2+i^2)<(c^2+J^2)end
)end
 W.GetTimeLeft=
function(G,V)if type(G)~="number"or type(V)~="number"then
 
return 0 end
 
local y=os.clock()-G 
local Z=V-y 
return math.max(0,Z)end
 W.GetPing=
function()
local G=V.LocalPlayer if not G or not G.Parent then
 
return 0 end
 
local y,Z=
pcall(
function()
return G:GetNetworkPing()end
)if not y then
 
return 0 end
 
return math.floor((Z*1000)+.5)end
 W.GetSafePing=
function()
local G=.0001 if not T.sync_pingmode then
 
return G end
 
local y,Z=
pcall(
function()
local y=V.LocalPlayer 
local Z=(y and y:GetNetworkPing())or 0 
return math.clamp(Z,G,7)end
)
return y and Z or G end
 W.PlaceEggsForHatching=
function()if not T.fast_egg_placement then
 end
 if not Z.GetCheckIfPro()then
 end
 Z.hatch_state=Z.HATCH_STATES.EGG_PLACE_PHASE NJ.UpdateSetLblStats("\240\159\165\154 Trying to place new eggs.")
local G="random"
local y=oJ()
local j=E.mFarm.Center_Point.Position 
local i={}if T.eggs_center_mode1 then
 i=lJ(j,W.GetTakenEggPositions())
else
 i=hJ(j)for G=#i,2,-1 do
 
local V=math.random(G)i[G],i[V]=i[V],i[G]end
 end
 
local J=os.clock()
local d=tonumber(c.max_eggs_to_place)or 0 if d==0 then
 d=y end
 if T.rng_use_system then
 if T.rng_egg_lowers_up then
 d=Z.RNG_EGG_OVERRIDE end
 end
 
local u=t.GetTotalEggsOnFarm()if d==u then
 
print("Already have enough eggs x",d)
return true end
 
local q=false if d==y then
 end
 
local g=os.clock()while true do
 
task.wait(.1)if W.IsTimeUp(g,10)then
 break end
 
local G=r.GetEggToolForHatching()if not G then
 NJ.UpdateSetLblStats("\240\159\148\180 Out of eggs.")break end
 if t.GetTotalEggsOnFarm()>=d then
 NJ.UpdateSetLblStats("\226\156\133 Farm is full 0.")break end
 
local y=VJ(G)while true do
 
task.wait(.05)if W.IsTimeUp(g,10)then
 break end
 if not G or not G.Parent then
 break end
 if t.GetTotalEggsOnFarm()>=d then
 NJ.UpdateSetLblStats("\226\156\133 Farm is full 1.")break end
 
local y=t.GetTotalEggsOnFarm()if not fJ(G)then
 yJ()
task.wait(.2)if not VJ(G)then
 break end
 end
 
local Z=table.remove(i,1)V.PetEggService:FireServer("CreateEgg",Z)
local j=os.clock()while true do
 
task.wait(.1)if W.IsTimeUp(j,3)then
 break end
 
local G=t.GetTotalEggsOnFarm()if G>y then
 if G==d then
 NJ.UpdateSetLblStats("\226\156\133 Farm is full 2.")break end
 break end
 if t.GetTotalEggsOnFarm()>=d then
 NJ.UpdateSetLblStats("\226\156\133 Farm is full 3.")break end
 end
 end
 end
 end
 
local 
function pl(G)NJ.UpdateSetLblStats("Starting to place eggs")
local y=60 
local j=oJ()math.randomseed(tick())math.random()math.random()if not E.mObjects_Physical then
 
warn("Objects_Physical not found {}")
return end
 Z.hatch_state=Z.HATCH_STATES.EGG_PLACE_PHASE 
local i=G.Center_Point.Position 
local J={}if T.eggs_center_mode1 then
 J=lJ(i,W.GetTakenEggPositions())
else
 J=hJ(i)for G=#J,2,-1 do
 
local V=math.random(G)J[G],J[V]=J[V],J[G]end
 end
 
local d=tonumber(c.max_eggs_to_place)or 0 
local u=0 
local q=sl()
local g=false if T.rng_use_system and Z.GetCheckIfPro()then
 if T.rng_egg_lowers_up then
 d=Z.RNG_EGG_OVERRIDE end
 end
 if d==0 then
 d=j end
 if d==j then
 end
 
local a=Nl()if d==a then
 
print("Already have enough eggs .",d)
return true end
 yJ()
task.wait(.5)VJ(q)
task.wait(.3)for G=1,y,1 do
 if Z.is_max_eggs_reached then
 break end
 if u>=30 then
 break end
 
local y=Nl()if T.hatch_slow_mode then
 
task.wait(.5)end
 
task.wait(.1)if d>0 and y>=d then
 NJ.UpdateSetLblStats("Max eggs placed - matching user settings.")break end
 if y>=j or Z.is_max_eggs_reached then
 Z.is_max_eggs_reached=true NJ.UpdateSetLblStats("Max eggs placed")break end
 if#J==0 then
 NJ.UpdateSetLblStats("No more spots available.")Z.is_max_eggs_reached=true break end
 
local i=table.remove(J,1)if fJ(q)then
 if T.is_test==false then
 V.PetEggService:FireServer("CreateEgg",i)if T.hatch_slow_mode then
 
task.wait(.5)end
 end
 
else
 if not VJ(q)then
 u=u+1 q=sl()
warn("Failed to equip tool egg")
task.wait(.3)continue end
 end
 if T.hatch_slow_mode then
 
task.wait(1)end
 if t.GetTotalEggsOnFarm()>=j then
 break end
 if d>0 then
 if t.GetTotalEggsOnFarm()>=d then
 break end
 end
 end
 
task.wait(.5)yJ()end
 r.GetPetsAsDataTable=
function()
local G={}for V,y in pairs(T.sell_pets)do
 for V,y in pairs(y)do
 G[V]=y end
 end
 
return G end
 
local 
function Ul(G)for V,y in pairs(T.sell_pets)do
 if y[G]~=nil then
 
return y[G]end
 end
 
return false end
 W.FavoritePetsNewFaster=
function(G)NJ.UpdateSetLblStats("\226\153\187\239\184\143 Starting Favourite Process...")
local y=r.GetPetsAsDataTable()
local Z={}
local j={}for G,V in pairs(G)do
 j[G]=true end
 
local i=W.GetAllTeamsUUIDSet()for G,V in ipairs(HJ)do
 if V:IsA("Tool")and V:GetAttribute("ItemType")=="Pet"then
 
local G=V:GetAttribute("PET_UUID")if not G then
 continue end
 j[G]=true end
 end
 
local c=t.Inventory.GetPetInventory()for G,V in pairs(c)do
 
local c=V.UUID 
local J=V.PetData 
local d=V.PetType 
local u=J.HatchedFrom 
local q=J.IsFavorite 
local g=J.Name 
local E=J.Level 
local a=J.Hunger 
local H=J.BaseWeight if q then
 continue end
 
local e=J.MutationType or""
local s=Y.AllMutationListEnum[e]
local N=false if s then
 N=true end
 if T.mutation_hatch_pet_enabled and N then
 if T.mutation_hatch_petfilter[d]then
 if T.mutation_hatch_mutlist[s]then
 table.insert(Z,tool)continue end
 end
 end
 if r.IsToolHeldAny()then
 yJ()end
 
local W=r.GetPetUsingUUID(G)if not W then
 continue end
 if T.is_sell_only_hatch_pet then
 if not j[G]then
 table.insert(Z,W)continue end
 end
 
local X=E 
local h=H 
local l=k(h,1)
local B=d 
local L=y[B]or false 
local m=false if L==false then
 m=true end
 
local K=tonumber(T.sell_weight)
local b,S,z=IsOverridePetWeight(B)if L==true and b==true then
 K=z end
 if tonumber(l)>=K then
 m=true end
 if i[G]then
 m=true end
 if m then
 table.insert(Z,W)end
 end
 if#Z==0 then
 NJ.UpdateSetLblStats("No pets needed favouriting.")
return true end
 for G,y in ipairs(Z)do
 V.FavItem:FireServer(y)end
 
return true end
 W.FavoritePetsNew=
function(G)NJ.UpdateSetLblStats("\226\153\187\239\184\143 Starting Favourite Process...")
local y=r.GetPetsAsDataTable()
local Z={}
local j={}for G,V in pairs(G)do
 j[G]=true end
 for G,V in ipairs(HJ)do
 if V:IsA("Tool")and V:GetAttribute("ItemType")=="Pet"then
 
local G=V:GetAttribute("PET_UUID")if not G then
 continue end
 j[G]=true end
 end
 
local i=t.Inventory.GetPetInventory()yJ()if T.hatch_slow_mode then
 
task.wait(1)
else
 
task.wait(.1)end
 for G,V in pairs(i)do
 
local i=V.UUID 
local c=V.PetData 
local J=V.PetType 
local d=c.HatchedFrom 
local u=c.IsFavorite 
local q=c.Name 
local g=c.Level 
local E=c.Hunger 
local a=c.BaseWeight if u then
 continue end
 if r.IsToolHeldAny()then
 yJ()
task.wait(.1)end
 
local H=r.GetPetUsingUUID(G)if not H then
 continue end
 if T.is_sell_only_hatch_pet then
 if not j[G]then
 table.insert(Z,H)continue end
 end
 
local Y=g 
local e=a 
local s=k(e,1)
local N=J 
local W=y[N]if not W then
 W=false end
 
local X=false if W==false then
 X=true end
 
local h=tonumber(T.sell_weight)
local l,B,L=IsOverridePetWeight(N)if W==true and l==true then
 h=L 
else
 end
 if tonumber(s)>=h then
 X=true end
 if X then
 table.insert(Z,H)end
 end
 if#Z==0 then
 NJ.UpdateSetLblStats("No pets needed favouriting.")
return true end
 for G,y in ipairs(Z)do
 NJ.UpdateSetLblStats("Favouriting: "..y.Name)if T.is_test==false then
 V.FavItem:FireServer(y)end
 if T.hatch_slow_mode then
 
task.wait(1)
else
 
task.wait(.1)end
 end
 if T.hatch_slow_mode then
 
task.wait(3)
else
 
task.wait(.5)end
 
local c={}
local J={}for G,V in ipairs(Z)do
 
local y=V:GetAttribute("PET_UUID")if y then
 J[y]=true end
 end
 i=t.Inventory.GetPetInventory()for G,V in pairs(i)do
 
local y=V.PetData 
local Z=V.PetType 
local j=y.IsFavorite if J[G]then
 if not j then
 table.insert(c,G)end
 end
 end
 
task.wait(.1)if#c>0 then
 
local G=true for V,y in ipairs(c)do
 
local Z=r.GetPetUsingUUID(y)if not Z then
 G=false break end
 
local j=Z:GetAttribute("d")if not j then
 G=false break end
 end
 
return G 
else
 NJ.UpdateSetLblStats("\226\156\133 All pets successfully favourited!")
return true end
 end
 Z.ban_pet_list={["Rainbow Dilophosaurus"]=true,["Ghostly Headless Horseman"]=true,["Ghostly Spider"]=true,["Rainbow Elephant"]=true}W.GetPetsToSellForHatching=
function()
local G=r.GetPetsAsDataTable()
local V={}
local y=W.GetAllTeamsUUIDSet()
local j={}for G,V in pairs(Z.hatched_pets)do
 j[G]=true end
 for G,V in ipairs(HJ)do
 if V:IsA("Tool")and V:GetAttribute("ItemType")=="Pet"then
 
local G=V:GetAttribute("PET_UUID")if not G then
 continue end
 j[G]=true end
 end
 
local i=r.GetAllPetsInInventoryNoneFav()for j,i in pairs(i)do
 
local c=i:GetAttribute("PET_UUID")if not c then
 continue end
 if y[c]then
 continue end
 
local J=WJ(c)if not J then
 continue end
 
local d=J.UUID 
local u=J.PetData 
local q=J.PetType 
local g=u.IsFavorite 
local E=u.Name 
local a=u.Level 
local H=u.Hunger 
local r=u.BaseWeight if g then
 continue end
 
local e=u.MutationType or""
local s=Y.AllMutationListEnum[e]
local N=false if s then
 N=true end
 if T.mutation_hatch_pet_enabled and N then
 if T.mutation_hatch_petfilter[q]then
 if T.mutation_hatch_mutlist[s]then
 continue end
 end
 end
 
local W=a 
local X=r 
local h=k(X,W)
local l=k(r,1)
local B=q or""if Z.ban_pet_list[B]then
 continue end
 if a>90 then
 continue end
 
local L=G[B]
local m=false if not L then
 continue end
 
local K=tonumber(T.sell_weight)
local b,S,z=IsOverridePetWeight(B)if L==true and b==true then
 K=z 
else
 end
 if l>=K then
 continue end
 table.insert(V,i)end
 
return V end
 
local 
function Ql()NJ.UpdateSetLblStats("\240\159\146\176 Sell All UnFav Process...")if T.is_test==false then
 V.SellAllPetsRemote:FireServer()end
 if T.hatch_slow_mode then
 
task.wait(3)
else
 
task.wait(1)end
 end
 W.SellSelectedPets=
function(G)
local 
function V(G)if j.lbl_sell_inventory_pets then
 j.lbl_sell_inventory_pets:SetText(G)end
 end
 V("\240\159\148\132 Preparing pets for selling...")yJ()
local y=W.GetAllTeamsUUIDSet()
local i={}for G,V in pairs(G)do
 if y[V]then
 continue end
 
local Z=r.GetPetUsingUUID(V)if Z and T.sellingpets.manual_sell_fav then
 table.insert(i,Z)end
 if Z and Z:GetAttribute("d")==false then
 table.insert(i,Z)end
 end
 
local c=#i 
local J=0 if c==0 then
 V("\226\154\160\239\184\143 No valid pets found to sell.")
return end
 V(string.format("\240\159\147\166 Pets ready for sale: %s",c))r.SellPetsUsingTools(i)Z.sell_selected_pets={}
task.wait(.5)cl()
task.wait(.2)V(string.format("\226\156\133 Selling complete! %s/%s pets sold.",J,c))end
 W.SellSelectedPetsTypes=
function()if Z.IS_HATCHING or not T.sellingpets.auto_pet_sell then
 
return false end
 if not t.IsAllowedSellPet()then
 
return false end
 
local G=T.sellingpets.auto_sell_selected if next(G)==nil then
 
return false end
 
local V=W.GetAllTeamsUUIDSet()
local y={}
local j=t.Inventory.GetPetInventory()for Z,j in pairs(j)do
 
local i=j.PetData 
local c=j.PetType 
local J=i.IsFavorite 
local d=i.Level 
local u=i.BaseWeight 
local q=k(u,d)if V[Z]then
 continue end
 if not G[c]then
 continue end
 if d>60 then
 continue end
 if q>=7 and d<2 then
 continue end
 
local g=r.GetPetUsingUUID(Z)if T.sellingpets.auto_sell_override_fav then
 table.insert(y,g)continue end
 if J then
 continue end
 table.insert(y,g)end
 
local i=#y 
local c=0 if i==0 then
 
return false end
 r.SellPetsUsingTools(y)
task.wait(1)
task.wait(.5)cl()end
 Z.WipePetsInvalidOnFarm=
function()
local G,y=
pcall(
function()if not V.petsContainer then
 
return false,0 end
 
local G=tostring(V.LocalPlayer and V.LocalPlayer.Name or"")if G==""then
 
return false,0 end
 
local y=0 
local Z=0 for V,j in ipairs(V.petsContainer:GetChildren())do
 if j and j.Name=="PetMover"then
 Z=Z+1 
local V=tostring(j:GetAttribute("OWNER")or"")if V==G then
 
local G=tostring(j:GetAttribute("UUID")or"NO_UUID")
local V,Z=
pcall(
function()j:Destroy()end
)if V then
 y=y+1 
else
 end
 end
 end
 end
 
return true,y end
)if not G then
 
return false,0 end
 
return y end
 Z.WipePetOnFarmByUUID=
function(G)
local y,Z=
pcall(
function()if not V.petsContainer then
 
return false,0 end
 G=tostring(G or"")if G==""then
 
return false,0 end
 
local y=0 
local Z=0 for V,j in ipairs(V.petsContainer:GetChildren())do
 if j and j.Name=="PetMover"then
 Z=Z+1 
local V=tostring(j:GetAttribute("UUID")or"")if V==G then
 
local G,V=
pcall(
function()j:Destroy()end
)if G then
 y=y+1 
else
 end
 end
 end
 end
 
return true,y end
)if not y then
 
return false,0 end
 
return Z end
 
local 
function ol(G)
local V=E.GetActivePetsUUIDS()
local y=t.Inventory.GetEquippedPets()
local Z=false 
local j=false for V,y in ipairs(V)do
 if y==G then
 Z=true break end
 end
 for V,y in ipairs(y)do
 if y==G then
 j=true break end
 end
 if Z and j then
 
return true end
 
return false end
 Z.CheckTeamActiveOnField=
function(G)if not G or#G==0 then
 
return false end
 for G,V in ipairs(G)do
 if not ol(V)then
 
return false end
 end
 
return true end
 W.IsByPassPetsTeamEnabled=
function()if not Z.GetCheckIfPro()then
 
return false end
 if T.team_bypass_enabled and T.is_running then
 
return true end
 
return false end
 W.UnEquipPet=
function(G)V.petsServiceRemote:FireServer("UnequipPet",G)end
 W.EquipPet=
function(G)
local y=E.mFarm.Center_Point.Position 
local Z=CFrame.new(y)V.petsServiceRemote:FireServer("EquipPet",G,Z)end
 W.FastRemoveAllPets=
function(G)
local y,j=
pcall(
function()
local y={}
local j={}
local i,c=
pcall(
function()
return t.Inventory.GetEquippedPets()end
)if i and type(c)=="table"then
 y=c 
else
 
warn("[FastRemoveAllPets] Failed to get equipped pets:",c)end
 
local J,d=
pcall(
function()
return E.GetActivePetsUUIDS()end
)if J and type(d)=="table"then
 j=d 
else
 
warn("[FastRemoveAllPets] Failed to get active pets:",d)end
 if#j==0 then
 
return true end
 
local u={}
local q={}
local g={}for G,V in ipairs(T.team_bypass_alwaysactive or{})do
 g[V]=true end
 
local a=false 
local H,r=
pcall(
function()
return W.IsByPassPetsTeamEnabled()end
)if H then
 a=r==true 
else
 
warn("[FastRemoveAllPets] Bypass check failed:",r)end
 
local 
function Y(V)
return not G and(a and g[V]==true)end
 
local 
function e(G)if G and(not q[G]and not Y(G))then
 q[G]=true table.insert(u,G)end
 end
 for G,V in ipairs(y)do
 e(V)end
 for G,V in ipairs(j)do
 e(V)end
 if#u==0 then
 
return true end
 
local 
function s(G)
local y,Z=
pcall(
function()V.petsServiceRemote:FireServer("UnequipPet",G)end
)if not y then
 
warn("[FastRemoveAllPets] Unequip remote failed:",G,Z)
return false end
 
return true end
 
local 
function N(G)for G,V in ipairs(G or{})do
 s(V)end
 end
 
local X=time()
local h=.3 
local l=15 Z.SetDisablePickPlaceFor(7)N(u)while true do
 
task.wait(h)
local G=0 
local V={}N(u)for y,Z in ipairs(u)do
 
local j,i=
pcall(
function()
return ol(Z)end
)if not j then
 
warn("[FastRemoveAllPets] Active check failed:",Z,i)i=true end
 if i then
 G=G+1 table.insert(V,Z)s(Z)
task.wait()s(Z)end
 end
 if G==0 then
 
return true end
 if time()-X>l then
 
local y,Z=
pcall(
function()
return E.GetActivePetsUUIDS()end
)if y and(type(Z)=="table"and#Z==0)then
 
warn("[FastRemoveAllPets] Timeout hit, but farm has no active pets. Returning true.")
return true end
 
warn("[FastRemoveAllPets] Timeout. Still active count:",G)for G,V in ipairs(V)do
 
warn("[FastRemoveAllPets] Still active:",V)end
 
return false end
 end
 end
)if not y then
 
warn("[FastRemoveAllPets] Hard crash:",j)
return false end
 
return j==true end
 Z.UnEquipAllPets=
function(G)Z.SetDisablePickPlaceFor(5)if W.FastRemoveAllPets(G)then
 
return true 
else
 
return false end
 end
 
local 
function Il(G)if not G or#G==0 then
 
warn("You must pass in pet names to equip")
return false end
 
local y={}for G,V in ipairs(G)do
 table.insert(y,V)end
 if Z.IS_GIFT then
 
return false end
 if Z.GetCheckPPByPass()==true then
 
return false end
 
local j=PJ()
local i=T.overridepets.selected_pets or{}
local c=T.overridepets.is_enabled or false 
local J=tonumber(T.overridepets.delay_amount)or 2.5 
local d={}
local u=E.mFarm.Center_Point.Position 
local q=CFrame.new(u)
local g={}
local a=Y.GetUUID_PetInMachine()
local H=c and next(i)~=nil Z.SetDisablePickPlaceFor(4)for G,y in ipairs(y)do
 if y==a then
 continue end
 
local Z=true if H then
 
local G=WJ(y)if G and(G.PetType and i[G.PetType])then
 table.insert(d,y)Z=false end
 end
 if Z then
 if not ol(y)then
 V.petsServiceRemote:FireServer("EquipPet",y,q)table.insert(g,y)end
 end
 end
 if H then
 if#d>0 then
 
task.wait(J)end
 end
 for G,Z in ipairs(d)do
 
task.spawn(
function()V.petsServiceRemote:FireServer("EquipPet",Z,q)end
)table.insert(g,Z)table.insert(y,Z)end
 
local 
function r(G,V,y)
local Z={}
local j={}for G,V in ipairs(G)do
 j[V]=true end
 
local i={}if V then
 for G,V in ipairs(V)do
 i[V]=true end
 end
 if y then
 for G,V in ipairs(y)do
 i[V]=true end
 end
 for G in pairs(i)do
 if not j[G]then
 table.insert(Z,G)end
 end
 
return Z end
 
local e=os.clock()
local s=10 
local N=true if W.IsByPassPetsTeamEnabled()then
 for G,V in ipairs(T.team_bypass_alwaysactive)do
 table.insert(y,V)end
 end
 while true do
 
task.wait(.2)if W.IsTimeUp(e,s)then
 N=false break end
 
local G=E.GetActivePetsUUIDS()
local i=t.Inventory.GetEquippedPets()
local c=r(y,G,i)for G,V in ipairs(c)do
 W.UnEquipPet(V)end
 for G=#g,1,-1 do
 
local y=g[G]if ol(y)then
 table.remove(g,G)
else
 if#i>=j then
 
else
 V.petsServiceRemote:FireServer("EquipPet",y,q)end
 end
 end
 if Z.IS_GIFT then
 
return false end
 if#g==0 then
 N=true break end
 end
 
return N end
 W.FastPlacePets=
function(G)
local y=E.mFarm.Center_Point.Position 
local Z=CFrame.new(y)
local 
function j()
local V=t.Inventory.GetEquippedPets()if not V then
 
return false end
 
local y={}for G,V in ipairs(V)do
 y[V]=true end
 for G,V in ipairs(G)do
 if not y[V]then
 
return false end
 end
 
return true end
 for G,y in ipairs(G)do
 
task.spawn(
function()V.petsServiceRemote:FireServer("EquipPet",y,Z)end
)end
 
local i=time()while true do
 
task.wait()if time()-i>10 then
 
warn("Timeout: Not all pets were equipped.")
return false end
 if j()then
 break end
 
task.wait(.5)end
 
return true end
 N.IsAllowToRun=
function()if T.is_running or z.mut.is_running or Y.is_running then
 
return false end
 
return true end
 N.CraftTeams={UpdateCraftTeamsStatus=
function(G)if j.lbl_craftteams_status then
 j.lbl_craftteams_status:SetText(G)end
 Z.TEXT_CRAFT_TEAMS=G end
,PlaceTeamSubmitItems=
function()if not T.allcraft.teams_enabled then
 
return end
 
local G=T.allcraft.team_submit or{}if#G==0 then
 
return end
 if not N.IsAllowToRun then
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] \226\157\140 Failed to place Submit Team, other systems are active!")
task.wait(2)
return end
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Placing Submit team.")Z.SetDisablePickPlaceFor(10)
task.wait(1)
local V=true for G,y in ipairs(G)do
 if not ol(y)then
 V=false end
 end
 if not V then
 Z.UnEquipAllPets()if not Il(G)then
 
return false end
 end
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Submit team is active.")
task.wait(2)
return true end
;PlaceTeamClaimItems=
function()if not T.allcraft.teams_enabled then
 
return end
 
local G=T.allcraft.team_claim or{}if#G==0 then
 
return end
 if not N.IsAllowToRun then
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] \226\157\140 Failed to place Claim Team, other systems are active!")
task.wait(2)
return end
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Placing Claim team.")Z.SetDisablePickPlaceFor(10)
task.wait(1)
local V=true for G,y in ipairs(G)do
 if not ol(y)then
 V=false end
 end
 if not V then
 Z.UnEquipAllPets()if not Il(G)then
 
return false end
 end
 
task.wait(2)N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Claim team is active.")
return true end
;PlaceTeamIdle=
function()if not T.allcraft.teams_enabled then
 
return end
 
local G=T.allcraft.team_idle or{}if#G==0 then
 
return end
 if not N.IsAllowToRun then
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] \226\157\140 Failed to place Idle Team, other systems are active!")
task.wait(2)
return end
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Placing Idle team or checking or already placed.")Z.SetDisablePickPlaceFor(10)
task.wait(1)
local V=true for G,y in ipairs(G)do
 if not ol(y)then
 V=false end
 end
 if not V then
 Z.UnEquipAllPets()if not Il(G)then
 
return false end
 end
 N.CraftTeams.UpdateCraftTeamsStatus("[Craft System] Idle team is active.")
task.wait(2)
return true end
}H.StartBoostingSelectedPetsElephant=
function()
local G=T.elephant.pet_list 
local V=T.elephant.boost_list 
local y=T.elephant.delay_before_unequip or.01 
local j=T.elephant.delay_before_place or.01 
local i=tonumber(T.elephant.boost_amount)or 1 H.elephant.UpdateStatus("Starting to apply...")
local c=
function(G)for V,y in pairs(Z.cooldown_pets)do
 if V~=G then
 continue end
 for G,V in ipairs(y)do
 
local y=V.Name 
local Z=V.Passive 
local j=V.Time if not j or not y or not j then
 continue end
 
local i=W.AllPetPassiveData[y]if not i then
 break end
 
local c={}for G,V in ipairs(i)do
 if W.Bad_Skills[V]then
 continue end
 c[V]=true end
 if c[Z]then
 
return true,j 
else
 end
 end
 end
 
return false,0 end
 for G,Z in ipairs(G)do
 
task.spawn(
function()for G=1,i,1 do
 
local i={}i[Z]=true W.EquipPet(Z)
task.wait(j)H.elephant.UpdateStatus("Applying boost...")H.ApplyBoostSelectedWithTargetPetsElephant(V,i)
local J,T=c(Z)while J and T>0 do
 
task.wait(.1)J,T=c(Z)H.elephant.UpdateStatus("Skill not ready, waiting...")end
 
task.wait(y)W.UnEquipPet(Z)
task.wait(.4)W.EquipPet(Z)end
 end
)
task.wait(.1)end
 H.elephant.UpdateStatus("Finished all boosts.")end
 
local 
function Rl(G)if not E.mObjects_Physical then
 
warn("issue finding Objects_Physical")NJ.UpdateSetLblStats("Issue finding eggs on farm")
return false end
 
local y=true 
local j={}
local i=E.mObjects_Physical:GetChildren()
local J=W.GetDelayKoiSell()if not G then
 y=false 
else
 y=G end
 for G,V in ipairs(i)do
 if V:IsA("Model")and(V:GetAttribute("TimeToHatch")==0 and V.Name=="PetEgg")then
 table.insert(j,V)end
 end
 
local d=#j 
print("Ready to hatch eggs:",d)
local u=r.GetPetsAsDataTable()Z.has_koi_repaint=false if d>0 then
 Z.hatch_state=Z.HATCH_STATES.EGG_HATCH_PHASE if T.fav_fruit_enhancer then
 
task.wait(.5)end
 for G,j in ipairs(j)do
 
local i=j:GetAttribute("EggName")or"Unknown Egg"
local d=j:GetAttribute("OBJECT_UUID")NJ.UpdateSetLblStats("Hatching: "..i)
local q=true 
local g=Z.found_pet_data[d]if g and y==false then
 
local G=g.weight 
local V=g.petname 
local y=u[V]or false 
local i,J,d=IsOverridePetWeight(V)
local E=tonumber(T.sell_weight)if y and(i and J)then
 
local V=tonumber(d)if G>=V then
 table.insert(Z.big_pets_hatch_models,j)continue end
 end
 if c.hatch_rare_withbigsizetm==true then
 if y==false then
 table.insert(Z.big_pets_hatch_models,j)continue end
 end
 if G>=E then
 q=false NJ.UpdateSetLblStats("Cant hatch egg, weight is high,"..V)table.insert(Z.big_pets_hatch_models,j)end
 end
 if T.is_test==false then
 if q then
 V.PetEggService:FireServer("HatchPet",j)if J>0 then
 
task.wait(J)end
 end
 end
 end
 if T.is_test==true then
 table.insert(dJ,"Test Pet [1.56 KG] [Age 1]")end
 uJ=true 
local G=time()while true do
 
task.wait(.3)if time()-G>2 then
 
warn("Timeout: Some eggs were not hatched.")break end
 if Z.has_koi_repaint then
 break end
 end
 end
 end
 
local 
function nl() end
 Z.GetAllFruitsToSell=
function()
local G={}
local y={}for V,Z in ipairs(V.Backpack:GetChildren())do
 if Z:IsA("Tool")and(Z:GetAttribute("b")=="j"and Z:GetAttribute("d")==false)then
 
local V=Z:GetAttribute("f")
local j=Z:GetAttribute("c")if next(c.sell_fruit_list)then
 if c.sell_fruit_list[V]then
 table.insert(y,Z)
else
 table.insert(G,Z)end
 
else
 table.insert(y,Z)end
 end
 end
 for V,y in ipairs(y)do
 if y:IsA("Tool")and(y:GetAttribute("b")=="j"and y:GetAttribute("d")==false)then
 
local V=y:GetAttribute("f")
local Z=y:GetAttribute("c")
local j=false for G,V in pairs(c.sell_mutation_whitelist)do
 if y:GetAttribute(G)and V then
 j=false break end
 end
 for G,V in pairs(c.sell_mutation_blacklist)do
 if y:GetAttribute(G)and V then
 j=true break end
 end
 if j then
 table.insert(G,y)end
 end
 end
 LJ(G)
task.wait(.3)Z.SellFruitsToVendorWithRangeCheck()LJ(G)end
 Z.LabelUpdateCollectFruitStats=
function(G)
local V=j.lbl_fruit_collect_live if not V then
 
return end
 
pcall(
function()V:SetText(tostring(G or""))end
)end
 
local wl=3 
local G9=0 Z.clockEmojis={"\240\159\141\142","\240\159\141\140","\240\159\141\135","\240\159\141\138","\240\159\141\137";"\240\159\141\147"}Z.clockIndex=1 if S.loopfruit_collect then
 task.cancel(S.loopfruit_collect)S.loopfruit_collect=nil end
 S.IsBusyFruitCollection=
function()if Z.IS_HATCHING then
 
return true end
 
return false end
 Z.fruit_scan_timelast=0 S.loopfruit_collect=spawn(
function()while true do
 
task.wait(1)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if tick()-((Z.fruit_scan_timelast or 0))>30 then
 u.ResetBucketCache()end
 if not c.is_collect_fruit then
 Z.LabelUpdateCollectFruitStats("\240\159\148\180 Not enabled")
task.wait(5)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 Z.LabelUpdateCollectFruitStats("\240\159\148\180 Waiting for farm data to load.")
task.wait(5)continue end
 if S.IsBusyFruitCollection()then
 Z.LabelUpdateCollectFruitStats("\240\159\159\161 Other tasks in progress.")
task.wait(3)continue end
 Z.LabelUpdateCollectFruitStats("\240\159\141\146 Trying to Collect fruits")
local G=c.fruit_collector_turbo 
local V=c.fruit_instant_collect 
local y={}if next(c.collection_plants)~=nil then
 y=c.collection_plants 
else
 for G,V in pairs(P)do
 y[G]=true end
 end
 
local j=false if G then
 
local i={amount=30;batch_mode=true,instant=V,whitelist_mutation=c.mutation_whitelist,blacklist_mutation=c.mutation_blacklist;variants=c.fruit_variants_select,mut_count=c.max_mutation_count}if V then
 i.amount=250 end
 
local J=0 while true do
 
task.wait(.5)if S.IsBusyFruitCollection()then
 break end
 if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 if not G then
 break end
 if Z.IsPaused()then
 break end
 if not c.is_collect_fruit then
 break end
 J=J+1 Z.LabelUpdateCollectFruitStats("\240\159\148\165 Turbo Mode Collecting... "..J)
local V=u.CollectFruitByNamesSortedRarityConfig(y,i)if not V then
 break end
 j=true end
 
else
 
local i={amount=20;instant=V,batch_mode=false,whitelist_mutation=c.mutation_whitelist;blacklist_mutation=c.mutation_blacklist,variants=c.fruit_variants_select;mut_count=c.max_mutation_count}if V then
 i.amount=250 end
 
local J=0 while true do
 
task.wait(.5)G=c.fruit_collector_turbo or false if S.IsBusyFruitCollection()then
 break end
 if r.IsBackpackFull()then
 break end
 if not Z.FruitCollectPause.CanCollect()then
 break end
 if G then
 break end
 if not c.is_collect_fruit then
 break end
 J=J+1 Z.LabelUpdateCollectFruitStats("\240\159\141\146 Normal mode collecting..."..J)if Z.IsPaused()then
 break end
 
local V=u.CollectFruitByNamesSortedRarityConfig(y,i)if not V then
 break end
 j=true end
 end
 if j then
 Z.LabelUpdateCollectFruitStats("\226\156\133 Collected fruits.")
else
 if r.IsBackpackFull()then
 Z.LabelUpdateCollectFruitStats("\240\159\148\180 Backpack is full, waiting....")
task.wait(3)
else
 Z.LabelUpdateCollectFruitStats("\226\154\160\239\184\143 Not found any fruits to collect.")end
 end
 end
 end
)if not Z.Backpack_autosell_timerbased then
 Z.Backpack_autosell_timerbased=
task.spawn(
function()while true do
 
task.wait(1)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not Z.FruitCollectPause.CanCollect()then
 continue end
 if c.auto_sell_backpack_time then
 
local G=c.auto_sell_backpack_every 
task.wait(G)if c.auto_sell_backpack_time then
 Z.GetAllFruitsToSell()end
 end
 end
 end
)end
 Z.backpack_full_reset=os.clock()
task.spawn(
function()while true do
 
task.wait(.5)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not c.auto_sellbackpack then
 
task.wait(math.random(5,7))continue end
 if not Z.FruitCollectPause.CanCollect()then
 
task.wait(2)continue end
 if r.IsBackpackFull()then
 Z.GetAllFruitsToSell()end
 end
 end
)W.spider_count=0 W.PetEffectsToName=
function(G)if G=="SpiderWebFX"then
 
return"Spider Webs"end
 
return G end
 W.DeleteAllWebs=
function()
local G={SpiderWebFX=true}for V,y in ipairs(V.Workspace:GetChildren())do
 if y:IsA("Folder")or y:IsA("Part")then
 if G[y.Name]then
 y:Destroy()end
 end
 end
 for V,y in ipairs(V.ReplicatedStorage.BenchmarkTest:GetChildren())do
 if y:IsA("Folder")or y:IsA("Part")then
 if G[y.Name]then
 y:Destroy()end
 end
 end
 end
 W.CountEffectsByPets=
function()
local G={"SpiderWebFX","Puddle"}
local y={}
local Z={}for G,V in ipairs(G)do
 y[V]=0 end
 for V,Z in ipairs(V.Workspace:GetChildren())do
 if Z:IsA("Folder")or Z:IsA("Part")then
 for G,V in ipairs(G)do
 if Z.Name==V then
 y[V]=y[V]+1 end
 end
 end
 end
 for V,Z in ipairs(V.ReplicatedStorage.BenchmarkTest:GetChildren())do
 if Z:IsA("Folder")or Z:IsA("Part")then
 for G,V in ipairs(G)do
 if Z.Name==V then
 y[V]=y[V]+1 end
 end
 end
 end
 for G,V in pairs(y)do
 if V>0 then
 if G=="SpiderWebFX"then
 W.spider_count=V end
 
local y=G=="SpiderWebFX"and"\240\159\149\184\239\184\143"or"\240\159\169\184"table.insert(Z,string.format("%s <stroke color=\'#FFFFFF\' thickness=\'2\'><font color=\'#000000\'>%s:</font> <font color=\'#FF2900\'>%s</font></stroke>",y,W.PetEffectsToName(G),V))end
 end
 if#Z==0 then
 
return nil end
 
return Z end
 W.RemoveDeadObjectsPetLeftOver=
function()
local G=V.LocalPlayer.Name for V,y in ipairs(V.petsContainer:GetChildren())do
 if y:GetAttribute("OWNER")==G then
 if not y:FindFirstChildWhichIsA("Model")then
 
pcall(
function()y:Destroy()end
)end
 end
 end
 end
 W.RemovePetModelFromFarm=
function(G)
local y=V.LocalPlayer.Name for V,Z in ipairs(V.petsContainer:GetChildren())do
 if Z:GetAttribute("OWNER")==y and Z:GetAttribute("UUID")==G then
 
pcall(
function()Z:Destroy()end
)break end
 end
 end
 W.UnitProcessing={}W.GetRandomisedValue=
function(G,V,y)V=V or 10 y=y or.01 
local Z=V/100 
local j=G*((1+((math.random()*((2*Z))-Z))))
return math.max(j,y)end
 W.MatchNameInTable=
function(G,V)for V,y in ipairs(V)do
 if y==G then
 
return true end
 end
 
return false end
 Z.farm_middle_pos=E.mFarm.Center_Point.Position W.PickPlaceUnit=
function(G,y)if G==nil then
 
return end
 
local j=Z.farm_middle_pos 
local i=tonumber(T.pet_pickplace_activactiondelay)or.32 
local J=tonumber(T.pet_pickplace_equipe_delay)or.11 
local d=c.petpp_overrides[y]if d and d.enabled then
 i=tonumber(d.unequip)or.7 J=tonumber(d.equip)or.12 end
 
local u=i 
local q=.03 
local g=Vector3.new(math.random()*((2*q))-q,math.random()*((2*q))-q,math.random()*((2*q))-q)
local E=CFrame.new(j+g)if T.pet_pickplace_random then
 u=W.GetRandomisedValue(i)end
 if T.pet_pickplace_random_equip then
 J=W.GetRandomisedValue(J)end
 
task.wait(u)V.petsServiceRemote:FireServer("UnequipPet",G)
task.wait(J)V.petsServiceRemote:FireServer("EquipPet",G,E)W.UnitProcessing[G]=false end
 W.Bad_Skills={["Bird of Grace"]=true;["Water Splash"]=true;["Movement Variation"]=true,["King of the Jungle"]=true,["Queen Pollinator"]=true;["Everchanting Spring"]=true}W.CanPickPlace=
function()if Z.IS_GIFT then
 
return false end
 if Z.pickplace_disable_delay>0 then
 
return false end
 
return true end
 W.PickPlacePetsFast=
function()if Z.DisablePickPlace or Z.IS_HATCHING then
 
return end
 if not W.CanPickPlace()then
 
return end
 
local G=T.pet_pickplacehatchingstage 
local V=tonumber(T.pet_pickplace_cooldownsecs)
local y=T.pet_pickplace_threading 
local j=T.mut_system.targetteam or{}
local i={}for G,V in ipairs(j)do
 i[V]=true end
 for j,c in pairs(Z.cooldown_pets)do
 if i[j]then
 continue end
 
local J=W.PetDataLocal[j]if not J then
 continue end
 if W.UnitProcessing[j]or Z.DisablePickPlace then
 continue end
 for i,c in ipairs(c)do
 if W.UnitProcessing[j]or Z.DisablePickPlace then
 break end
 
local T=W.AllPetPassiveData[J]if not T then
 break end
 
local d=c.Name 
local u=c.Passive 
local q=c.Time if not q or not d or not q then
 continue end
 if not G[d]then
 break end
 
local g={}for G,V in ipairs(T)do
 if W.Bad_Skills[V]then
 continue end
 g[V]=true end
 if g[u]then
 if q<=V then
 W.UnitProcessing[j]=true if y then
 
task.spawn(
function()W.PickPlaceUnit(j,d)end
)
else
 W.PickPlaceUnit(j,d)end
 end
 
else
 end
 end
 end
 end
 Z.is_eggs_reduction_active=false Z.dead_pet_remover_time=0 if S.unequip_task_faster then
 task.cancel(S.unequip_task_faster)S.unequip_task_faster=nil end
 if S.pickplace_rester_sys then
 task.cancel(S.pickplace_rester_sys)S.pickplace_rester_sys=nil end
 S.pickplace_rester_sys=
task.spawn(
function()while true do
 
task.wait(1)if Z.IsPaused()then
 
task.wait(.3)continue end
 if Z.pickplace_disable_delay>0 then
 Z.pickplace_disable_delay=Z.pickplace_disable_delay-1 if Z.pickplace_disable_delay<=0 then
 Z.pickplace_disable_delay=0 end
 end
 end
 end
)S.unequip_task_faster=
task.spawn(
function()while true do
 
task.wait(.2)if not Z.GetCheckIfPro()then
 break end
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not T.pet_pickplace_enabled or not Z.is_eggs_reduction_active then
 if not T.pet_pickplace_anywhere then
 
task.wait(5)continue end
 end
 if not T.is_running then
 Z.DisablePickPlace=false if not T.pet_pickplace_anywhere then
 Z.is_eggs_reduction_active=false continue end
 end
 if Z.dead_pet_remover_time>500 then
 W.RemoveDeadObjectsPetLeftOver()Z.dead_pet_remover_time=0 end
 Z.dead_pet_remover_time=Z.dead_pet_remover_time+1 if Z.IS_HATCHING then
 Z.is_eggs_reduction_active=false 
task.wait(5)continue end
 if Z.IS_PET_MUTATION_RUNNING then
 
task.wait(3)continue end
 W.PickPlacePetsFast()end
 end
)S.HatcherTeamOverrider=
function()
local G=T.team_reduction_enabled_teams or false if not G then
 
return"not_enabled"end
 if not Z.GetCheckIfPro()then
 
return"not_pro"end
 
local V=PJ()
local y=T.team3 
local j=T.team_reduction_placefirst 
local i=T.team_reduction_placeafter 
local c=tonumber(T.team_reduction_timer)or 16.5 
local J=NJ.UpdateSetLblStats J("\240\159\146\161 Trying to place custom pet.")if#y>=V then
 J("\240\159\148\180 Failed: Main egg reduction team is full, no remaining slots.")
task.wait(3)
return"team_maxed"end
 if#j==0 then
 J("\240\159\148\180 Failed: First team is empty.")
task.wait(3)
return"empty"end
 if#i==0 then
 J("\240\159\148\180 Failed: Last team is empty.")
return"empty"end
 W.spider_count=0 
local d,u=
pcall(
function()W.DeleteAllWebs()end
)if not d then
 
warn("error: ",u)end
 
local q={}
local g=V-#y J("\226\143\179 Placing phase 1 team, please wait...")
local E=0 for G,V in ipairs(j)do
 W.EquipPet(V)
task.wait(.1)W.EquipPet(V)table.insert(q,V)E=E+1 if E>=g then
 break end
 end
 
local a=0 
local H={"\240\159\149\146","\240\159\149\147","\240\159\149\148";"\240\159\149\158","\240\159\149\159";"\240\159\149\160";"\240\159\149\161"}
local r=tonumber(T.max_web_count)or 7 while true do
 Z.DisablePickPlace=false a=a+1 if W.spider_count and W.spider_count>=r then
 J("\226\153\187\239\184\143 Spider ready end
.")break end
 
local G=(((a-1))%#H)+1 
local V=H[G]
local y=string.format("%s <font color=\"#FF7B00\">Waiting to remove first team... </font> <font color=\"#A6FF8F\">%s/%s</font>",V,a,c)J(y)if a>=c then
 break end
 
task.wait(1)end
 J("\240\159\148\132 Removing phase one team. Please wait...")for G,V in ipairs(q)do
 W.UnEquipPet(V)
task.wait(.1)
local y=os.clock()
local Z=5 while true do
 
task.wait(.1)W.UnEquipPet(V)if W.IsTimeUp(y,Z)then
 break end
 if not ol(V)then
 break end
 end
 end
 J("\226\132\185\239\184\143 Removed team phase one")
task.wait(.1)J("\226\154\161Placing final phase team. please wait...")
local Y=0 for G,V in ipairs(i)do
 W.EquipPet(V)
task.wait(.2)W.EquipPet(V)Y=Y+1 if Y>=g then
 break end
 end
 J("\226\156\133 Completed. moving to hatching process..")
return"added"end
 Z.MAX_EGGS=oJ()Z.PENALTY_LOSS=30 Z.PENALTY_STAGNANT=0 Z.CRITICAL_SCORE=10 Z.UNSTABLE_SCORE=30 Z.MAX_HISTORY_LIMIT=6 Z.GOOD_SCORE=30 Z.RNG_EGG_OVERRIDE=oJ()Z.RemoveOldHatchHistory=
function()if#Z.hatch_history_list>Z.MAX_HISTORY_LIMIT then
 table.remove(Z.hatch_history_list,1)end
 end
 Z.AnalyzeRNG=
function(G)
local V=6 if#G<2 then
 
return{action="WAIT",score=100;reason="Not enough data"}end
 
local y=0 for G,V in ipairs(Z.hatch_history_list)do
 
local Z=V.gain if Z~=0 then
 y=y+Z end
 end
 if y>=7 then
 
return{action="CONTINUE",score=100,reason="Stable Profit ("..(y..")")}
elseif y>-5 then
 
return{action="LOWER_AMOUNT",score=50,reason="Small Loss / Stall ("..(y..")")}
else
 
return{action="REJOIN";score=10,reason="Bad RNG / Big Loss ("..(y..")")}end
 end
 W.findinf=
function()
local G=r.GetFruitsFromBackpackSorted()
local V=0 
local y=false Z.StopEnhancer(6)for G,Z in ipairs(G)do
 
local j=Z:GetAttribute("MaxAge")
local i=Z:GetAttribute("s")if i and(j and j==math.huge)then
 W.FavItemCustom(Z,true)V=V+1 
else
 if not r.IsFavFruit(Z)then
 W.FavItemCustom(Z,false)y=true end
 end
 end
 
local j=0 if y then
 if T.fav_fruit_enhance_sell then
 Z.StopEnhancer(7)Z.SellFruitsToVendor()end
 end
 end
 Z.nice_fruit_gains={}Z.HowMuchGain=
function()
local G=0 for V,y in ipairs(Z.nice_fruit_gains)do
 G=G+y end
 if G>=9 then
 
return true end
 
return false end
 Z.seen_fruits_enhance={}
task.spawn(
function()while true do
 
task.wait(3)
local G=NJ.UpdateEnhancerPro if not T.nice_fruit then
 G("\240\159\148\180 EnhancePro not running.")
task.wait(5)continue end
 if T.nice_fruit then
 T.nice_fruit=false R()break end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G("\240\159\159\161 Enhance Pro: Data is loading.")
task.wait(1)continue end
 G("\226\154\161 Enhance Pro is active and finding...")
local V=r.GetFruitCount()if V<=0 then
 
local G={amount=1}
local V={}
local y=E.GetAllPlantsInFarmAsKeyVal()for G,y in pairs(y)do
 if Z.seen_fruits_enhance[G]then
 continue end
 Z.seen_fruits_enhance[G]=true V[G]=true end
 if next(V)==nil then
 Z.seen_fruits_enhance={}continue end
 
local j=u.CollectFruitByNamesSortedRarityConfig(V,G)
task.wait(1)continue end
 if r.IsBackpackFull()then
 
task.wait(4)continue end
 if Z.was_hatch_done then
 Z.was_hatch_done=false if#Z.nice_fruit_gains>=5 then
 if Z.HowMuchGain()then
 T.nice_fruit=false Z.was_enhancerpro_success=true R()continue 
else
 Z.nice_fruit_gains={}Z.StopEnhancer(6)
task.wait(3)
local G=r.GetFruitRandomOrHeld()W.FavItemCustom(G,false)Z.SellFruitsToVendor()
task.wait()end
 end
 end
 end
 end
)W.GetUltraMode=
function()if Z.GetCheckIfPro()then
 
return T.hatch_ultramode end
 
return false end
 W.GetFastHatchMode=
function()if Z.GetCheckIfPro()then
 
return T.hatch_fast_mode end
 
return false end
 
local V9=0 Z.spinnerFrames={"\226\151\144","\226\151\147";"\226\151\145";"\226\151\146"}Z.spinner_frames=1 Z.rejoin_hatch_count=0 W.LockEnhance=
function(G)Z.lock_enhance=G end
 W.IsSellAllUnFav=
function()
return T.sellallunfav end
 W.AddTeamRubyWithKoi=
function()
local G={["Ruby Squid"]=true}
local V={Koi=true}
local y=t.Hatch.GetPetsUsingNames(G)
local Z=t.Hatch.GetPetsUsingNames(V)
local j=PJ()
local i={}
local c=0 for G,V in ipairs(Z)do
 table.insert(i,V)c=c+1 break end
 for G,V in ipairs(y)do
 table.insert(i,V)c=c+1 if c>=j then
 break end
 end
 
local J=Il(i)
return J end
 W.AddTeamRubyWithSeal=
function()
local G={["Ruby Squid"]=true}
local V={Seal=true}
local y=t.Hatch.GetPetsUsingNames(G)
local Z=t.Hatch.GetPetsUsingNames(V)
local j=PJ()
local i={}
local c=0 for G,V in ipairs(Z)do
 table.insert(i,V)c=c+1 break end
 for G,V in ipairs(y)do
 table.insert(i,V)c=c+1 if c>=j then
 break end
 end
 
local J=Il(i)
return J end
 Z.GetCloverBasedHatching=
function()if not Z.GetCheckIfPro()then
 
return false end
 
return T.clover_method end
 Z.PlaceEggsWhenFarmEmpty=
function()if not Z.GetCheckIfPro()then
 
return false end
 
return T.onlyplaceeggswhenempty end
 Z.WatchDogHatcher={team_uuids={},missing_since={};sample_window=10;Reset=
function(G)G.team_uuids={}G.missing_since={}end
;SetTeam=
function(G,V)G.team_uuids=V or{}G.missing_since={}end
;GetActiveSet=
function(G)
local V=E.GetActivePetsUUIDS()
local y={}for G,V in ipairs(V or{})do
 y[tostring(V)]=true end
 
return y end
;Check=
function(G)
local V=os.clock()
local y=G:GetActiveSet()for Z,j in ipairs(G.team_uuids or{})do
 j=tostring(j)if y[j]then
 G.missing_since[j]=nil 
else
 if not G.missing_since[j]then
 G.missing_since[j]=V end
 if(V-G.missing_since[j])>=G.sample_window then
 
return false,j,V-G.missing_since[j]end
 end
 end
 
return true end
}Z.was_restart_issued=false Z.restart_failed_team_placer_issue=false Z.hatch_fail_error=0 Z.SessionLoop=
function()
local G="hatchtimer"while not Z.is_forced_stop and T.is_running do
 
task.wait(.5+W.GetSafePing())dJ={}HJ={}Z.hatched_pets={}YJ=false uJ=false Z.is_max_eggs_reached=false V9=0 Z.big_pets_hatch_models={}Z.IS_HATCHING=false Z.is_eggs_reduction_active=false Z.is_hatch_stage_koi=false W.UpdatePlayerStats()if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 NJ.UpdateSetLblStats("\240\159\148\180 Waiting for farm data to load.")
task.wait(5+W.GetSafePing())continue end
 if T.rejoin_server_bugged then
 if Z.hatch_fail_error>4 then
 NJ.UpdateSetLblStats("\240\159\148\180 Server is bugged. Trying to rejoin...")nJ()
task.wait(7)continue end
 end
 Z.SetDisablePickPlaceFor(6)if Z.restart_failed_team_placer_issue then
 Z.WipePetsInvalidOnFarm()NJ.UpdateSetLblStats("\240\159\148\180 Team Placer restarted during unequip phase. Will retry.")Z.hatch_fail_error=Z.hatch_fail_error+1 Z.restart_failed_team_placer_issue=false 
task.wait(3)
else
 NJ.UpdateSetLblStats("\240\159\146\161 Checking for any eggs to hatch")end
 
task.wait(.2+W.GetSafePing())
local V=dl()
local y=Nl()if Z.PlaceEggsWhenFarmEmpty()then
 if y==0 then
 NJ.UpdateSetLblStats("\240\159\164\150 [START] No eggs on farm. Placing new eggs...")
local G,V=
pcall(
function()W.PlaceEggsForHatching()end
)if not G then
 
warn("Fail:",V)end
 
task.wait(1+W.GetSafePing())end
 end
 
local j=false W.LockEnhance(true)if Z.was_restart_issued then
 Z.SetDisablePickPlaceFor(5)Z.UnEquipAllPets()
task.wait(2)Z.UnEquipAllPets()
task.wait(2)Z.was_restart_issued=false end
 Z.IS_HATCHING=true if T.disable_team3==false then
 
local y=Z.CheckTeamActiveOnField(T.team3)if V==false then
 
local V=true NJ.UpdateSetLblStats("\240\159\148\132 Placing egg reduction team.")if y and Z.GetCloverBasedHatching()then
 NJ.UpdateSetLblStats("\226\154\160\239\184\143 Reduction team is already placed.")V=false 
task.wait(.3)end
 if V then
 
local G=Z.UnEquipAllPets()if G==false then
 NJ.UpdateSetLblStats("\226\157\140 Failed to unequip team. Restarting.")
task.wait(2+W.GetSafePing())Z.restart_failed_team_placer_issue=true Z.IS_HATCHING=false continue end
 
local V=Il(T.team3)if not V then
 NJ.UpdateSetLblStats("\226\157\140 Failed to place egg reduction team. Restarting.")
task.wait(3+W.GetSafePing())Z.IS_HATCHING=false continue end
 end
 
task.wait(.3+W.GetSafePing())W.StartTimer(G)j=true if T.hatch_boost_eggcd_enabled then
 Z.IS_HATCHING=true NJ.UpdateSetLblStats("\240\159\154\128 Applying Boosts!")H.ApplyBoostSelectedWithPetNames(T.hatch_boost_eggcd_team,T.hatch_team_boost_targets)
task.wait(.3+W.GetSafePing())Z.IS_HATCHING=false end
 Z.IS_HATCHING=false Z.is_eggs_reduction_active=true 
local i,c=
pcall(
function()Z.DisablePickPlace=false Z.SetDisablePickPlaceFor(0)
task.wait(.2+W.GetSafePing())
local G=S.HatcherTeamOverrider()end
)if not i then
 
warn("Issue with advanced team placement: ",c)end
 end
 end
 if not j then
 W.StartTimer(G)end
 if W.GetFastHatchMode()then
 
elseif T.hatch_slow_mode then
 
task.wait(9.2+W.GetSafePing())
else
 
task.wait(.5+W.GetSafePing())end
 Z.IS_HATCHING=false 
local i,J=
pcall(
function()
local G=Z.AnalyzeRNG(Z.hatch_history_list)Z.RemoveOldHatchHistory()
print(" -> Action: "..G.action)
print(" -> Score: "..(G.score.."/100"))
local V=Z.MAX_EGGS 
local y=math.floor(V/2)if G.action=="LOWER_AMOUNT"then
 Z.RNG_EGG_OVERRIDE=Z.RNG_EGG_OVERRIDE-2 if Z.RNG_EGG_OVERRIDE<y then
 Z.RNG_EGG_OVERRIDE=y end
 
print("MaxEggs: ",tostring(Z.RNG_EGG_OVERRIDE))Z.st_rng_detector_stable="afk"end
 if G.action=="CONTINUE"then
 Z.RNG_EGG_OVERRIDE=Z.RNG_EGG_OVERRIDE+3 if Z.RNG_EGG_OVERRIDE>V then
 Z.RNG_EGG_OVERRIDE=V end
 
print("MaxEggs: "..tostring(Z.RNG_EGG_OVERRIDE))Z.st_rng_detector_stable="good"end
 if G.action=="REJOIN"then
 
warn("Danger. RNG is bad")Z.RNG_EGG_OVERRIDE=Z.RNG_EGG_OVERRIDE-3 if Z.RNG_EGG_OVERRIDE<y then
 Z.RNG_EGG_OVERRIDE=y end
 Z.st_rng_detector_stable="bad"
print("MaxEggs: "..tostring(Z.RNG_EGG_OVERRIDE))if T.rng_auto_rejoin and T.rng_use_system then
 nJ()
task.wait(5+W.GetSafePing())end
 end
 end
)if not i then
 
print("Error RNG: ",J)end
 
local d=0 
local u=13 
local q=os.clock()
local g=Z.GetMinsToSecs(5)Z.was_restart_issued=false Z.hatch_state=Z.HATCH_STATES.EGG_PHASE if T.fav_fruit_enhancer then
 if T.enhancer_auto_sellfruit then
 Z.SellFruitsToVendorWithRangeCheck(true)end
 end
 
local a=os.clock()Z.WatchDogHatcher:Reset()Z.WatchDogHatcher:SetTeam(T.team3)while T.is_running do
 
task.wait(.5)if W.IsTimeUp(q,g)then
 if T.restart_hatching_system then
 NJ.UpdateSetLblStats("[Hatching Restart] \226\143\179 Timeout, restarting...")Z.was_restart_issued=true 
task.wait(3+W.GetSafePing())break end
 end
 if W.IsTimeUp(a,15)then
 a=os.clock()
local G,V,y=Z.WatchDogHatcher:Check()if not G then
 NJ.UpdateSetLblStats(string.format("\240\159\148\180 [Hatching Restart] Pet missing for %.1fs.",y))Z.was_restart_issued=true 
task.wait(2+W.GetSafePing())break end
 end
 if T.always_active_boosts and(T.hatch_boost_eggcd_enabled and(os.clock()-d>=u))then
 d=os.clock()if not H.ApplyBoostSelectedWithPetNames(T.hatch_boost_eggcd_team,T.hatch_team_boost_targets)then
 end
 
task.wait(.3+W.GetSafePing())end
 Z.is_eggs_reduction_active=true Z.DisablePickPlace=false 
local G=W.FormatTime(Z.egg_hatch_time_left)
local V=Nl()
local y=""if T.restart_hatching_system then
 
local G=W.GetTimeLeft(q,g)
local V=W.FormatTime(G)
local Z=W.GetSafePing()y=string.format("\226\153\187\239\184\143 <font color=\'#FF1797\'>Restarting in:</font> %s",V)end
 
local j="\240\159\165\154 Eggs on farm: "..V 
local i=Z.spinnerFrames[Z.spinner_frames]..(" Hatching in <font color=\'#FFFFFF\'><b>"..(tostring(G).."</b></font>"))
local c=string.format("%s\n%s\n%s",i,j,y)NJ.UpdateSetLblStats(c)V9=V9+1 Z.IS_HATCHING=false Z.spinner_frames=(Z.spinner_frames%#Z.spinnerFrames)+1 if dl()then
 break end
 if Z.is_forced_stop then
 break end
 end
 if Z.was_restart_issued then
 continue end
 Z.SetDisablePickPlaceFor(9)Jl()Z.hatch_state=Z.HATCH_STATES.NORMAL Z.is_eggs_reduction_active=false if Z.is_forced_stop or not T.is_running then
 break end
 if Nl()==0 then
 
print("No Eggs on farm detected, place and restart.")NJ.UpdateSetLblStats("\240\159\164\150 No eggs on farm. Placing new eggs...")
local G,V=
pcall(
function()W.PlaceEggsForHatching()end
)if not G then
 
warn("Fail:",V)end
 
task.wait(.1+W.GetSafePing())continue end
 Z.seen_pets={}Z.IS_HATCHING=true Z.tracked_bonus_egg_recovery=0 Z.tracked_bonus_egg_sell_refund=0 aJ=0 EJ=0 Z.pets_fav_count=0 qJ=0 gJ=0 if not Z.GetCloverBasedHatching()then
 Z.UnEquipAllPets()end
 if T.pet_pickplace_enabled then
 if W.GetFastHatchMode()then
 
elseif T.hatch_slow_mode then
 
task.wait(12+W.GetSafePing())
else
 
task.wait(1+W.GetSafePing())end
 end
 yl()
local Y=Nl()NJ.UpdateSetLblStats("\226\173\144 Eggs are ready to hatch!.")if W.GetFastHatchMode()then
 
elseif T.hatch_slow_mode then
 
task.wait(5+W.GetSafePing())
else
 
task.wait(1.5+W.GetSafePing())end
 
local e 
local s,N=
pcall(
function()
return t.Inventory.GetCurrentPetsInData()end
)if s and N then
 e=N 
else
 
warn("Failed to get pets:",N)e={}end
 
local X=r.GetAllPetsUUIDS_Backpack()for G,V in ipairs(X)do
 Z.seen_pets[V]=true end
 Z.is_hatch_stage_koi=true W.LockEnhance(false)
local h=Z.GetCloverBasedHatching()==true 
local l=t.PlayerData.GetKoiChance()
local B=false 
local L=Nl()if not((h and l>=50))then
 if T.disable_team2==false then
 if Z.UnEquipAllPets()==false then
 NJ.UpdateSetLblStats("\226\157\140 Failed to unequip team. Restarting.")Z.restart_failed_team_placer_issue=true 
task.wait(4+W.GetSafePing())Z.IS_HATCHING=false continue end
 
task.wait(.2+W.GetSafePing())NJ.UpdateSetLblStats("Placing hatching team...")if not Il(T.team2)then
 NJ.UpdateSetLblStats("\226\157\140 [KOI] Team Failed to place. Missing team or pets. Restarting.")
task.wait(5+W.GetSafePing())Z.IS_HATCHING=false continue end
 B=true end
 end
 NJ.UpdateSetLblStats("\226\143\179 Waiting for hatch buffs")if not((h and l>=50))then
 if W.GetFastHatchMode()then
 if W.GetUltraMode()then
 
task.wait(.5+W.GetSafePing())
else
 
task.wait(2.5+W.GetSafePing())end
 
elseif T.hatch_slow_mode then
 
task.wait(10+W.GetSafePing())
else
 
task.wait(4+W.GetSafePing())end
 if c.boost_auto_team_placed_koi then
 NJ.UpdateSetLblStats("\240\159\154\128 Applying Boosts!")H.ApplyBoostHeldKoi()
task.wait(.2+W.GetSafePing())end
 if c.boost_sprinkler_koi_team then
 NJ.UpdateSetLblStats("\240\159\154\128 Placeing Grandmaster Sprinkler!")
local G="Grandmaster Sprinkler"
local V=E.GetSprinklerOnFarm(G)if not V then
 b.Sprinkler.PlaceGrandMaster(G)end
 
task.wait(.2+W.GetSafePing())end
 end
 NJ.UpdateSetLblStats("\226\153\187\239\184\143 Hatching all available eggs...")W.UpdatePlayerStats()Z.tracked_bonus_egg_recovery=t.GetPlayerEggRecovery()dJ={}HJ={}Z.hatched_pets={}
local K=time()if not((h and l>=50))then
 while Z.tracked_bonus_egg_recovery<1 do
 
task.wait(.5)if time()-K>2 then
 break end
 Z.tracked_bonus_egg_recovery=t.GetPlayerEggRecovery()end
 
else
 Z.tracked_bonus_egg_recovery=t.GetPlayerEggRecovery()end
 Rl(false)W.LockEnhance(true)if T.fast_egg_placement then
 if not Z.PlaceEggsWhenFarmEmpty()then
 
task.spawn(
function()
local G,V=
pcall(
function()W.PlaceEggsForHatching()end
)if not G then
 
warn("Fail:",V)end
 end
)end
 end
 NJ.UpdateSetLblStats("\240\159\159\162 Hatching Complete.")if W.GetFastHatchMode()then
 if W.GetUltraMode()then
 
task.wait(.1+W.GetSafePing())
else
 
task.wait(2+W.GetSafePing())end
 
elseif T.hatch_slow_mode then
 
task.wait(7+W.GetSafePing())
else
 
task.wait(3.5+W.GetSafePing())end
 if B then
 Z.UnEquipAllPets()end
 if not((h and l>=50))then
 if W.GetFastHatchMode()then
 
task.wait(.5+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(5+W.GetSafePing())
else
 
task.wait(1.5+W.GetSafePing())end
 end
 
local z=Z.GetCloverBasedHatching()==true 
local f=t.PlayerData.GetBrontoChance()
local M=not((z and f>=30))
local A=false if#Z.big_pets_hatch_models>0 then
 if M then
 if T.disable_team4==false then
 Z.SetDisablePickPlaceFor(4)if Z.UnEquipAllPets(true)==false then
 Z.restart_failed_team_placer_issue=true NJ.UpdateSetLblStats("\226\157\140 Failed to unequip team. Restarting.")
task.wait(3+W.GetSafePing())Z.IS_HATCHING=false continue end
 if W.GetFastHatchMode()then
 
task.wait(3+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(5+W.GetSafePing())
else
 
task.wait(1.5+W.GetSafePing())end
 NJ.UpdateSetLblStats("Placing pet size team...")if not Il(T.team4)then
 NJ.UpdateSetLblStats("\226\157\140 Big Pet Team Failed to equip. Missing team or missing pets.")
task.wait(5+W.GetSafePing())Z.IS_HATCHING=false continue end
 A=true if T.hatch_boost_bron_enabled then
 NJ.UpdateSetLblStats("Applying Boosts!")H.ApplyBoostSelected(T.hatch_boost_bron_team)
task.wait(.3+W.GetSafePing())end
 end
 end
 if T.auto_hatch_big_pets==true then
 NJ.UpdateSetLblStats("Hatching big pets.")if M then
 
task.wait(7+W.GetSafePing())end
 W.UpdatePlayerStats()aJ=Z.PlayerSecrets.PetEggHatchSizeBonus Rl(true)if not Z.PlaceEggsWhenFarmEmpty()then
 
task.spawn(
function()
local G,V=
pcall(
function()W.PlaceEggsForHatching()end
)if not G then
 
warn("Fail:",V)end
 end
)end
 NJ.UpdateSetLblStats("Hatching Big Pets Complete.")if M then
 if W.GetFastHatchMode()then
 
task.wait(3+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(6+W.GetSafePing())
else
 
task.wait(5+W.GetSafePing())end
 end
 end
 if A then
 Z.UnEquipAllPets()
task.wait(.1+W.GetSafePing())end
 end
 
local x=Nl()if YJ then
 gl("Your Pet Inventory is getting full! Some eggs were not hatched.")end
 
local C 
local D,P=
pcall(
function()
return t.Inventory.GetCurrentPetsInData()end
)if D and P then
 C=P 
else
 
warn("Failed to get pets:",P)C={}end
 
local O=r.GetAllPetsUUIDS_Backpack()
local F=m.GetNewUUIDs(X,O)for G,V in ipairs(F)do
 Z.hatched_pets[V]=true end
 
local v=m.GetNewUUIDs(e,C)for G,V in ipairs(v)do
 Z.hatched_pets[V]=true end
 
local k=false 
local p=0 
local U=os.clock()NJ.UpdateSetLblStats("\226\153\187\239\184\143 Detecting hatched pets. please wait...")
local Q=0 
local o={}while true do
 
local G,V=m.GetHatchPetData(F)if#V==0 then
 o=G break end
 if#o>0 then
 o=G break end
 if(os.clock()-U)>40 then
 k=true break end
 Q=Q+1 NJ.UpdateSetLblStats("\240\159\148\180 Detection failed count: "..Q)
task.wait(.5+W.GetSafePing())end
 if#o==0 then
 k=true end
 for G,V in ipairs(o)do
 
local y=V.uuid if y then
 Z.hatched_pets[y]=true p=p+1 end
 end
 if k then
 
print("Failed to detect pets")end
 if Y==0 then
 k=false end
 if W.IsSellAllUnFav()then
 NJ.UpdateSetLblStats("\226\157\164\239\184\143 Favouriting Pets...")if not W.FavoritePetsNew(Z.hatched_pets)then
 NJ.UpdateSetLblStats("\226\157\140 Failed to favorite pets Lag or delayed.. Retrying cycle...")
task.wait(5+W.GetSafePing())Z.IS_HATCHING=false continue end
 if W.GetFastHatchMode()then
 if W.GetUltraMode()then
 
task.wait(2.05+W.GetSafePing())
else
 
task.wait(2.3+W.GetSafePing())end
 
elseif T.hatch_slow_mode then
 
task.wait(10+W.GetSafePing())
else
 
task.wait(2.5+W.GetSafePing())end
 end
 
local I=true if T.hatch_sell_delayed then
 I=false 
local G,V=t.Inventory.GetMaxEggsAndInventorySpaceCount()
local y=t.Inventory.GetTotalOwnedPets()if(y+G)>=V then
 I=true end
 end
 if T.is_sell_only_hatch_pet then
 I=true end
 
local R=false if I then
 if T.disable_team1==false then
 if Z.UnEquipAllPets(true)==false then
 Z.restart_failed_team_placer_issue=true NJ.UpdateSetLblStats("\226\157\140 Failed to unequip team. Restarting.")
task.wait(5+W.GetSafePing())Z.IS_HATCHING=false continue end
 W.LockEnhance(false)NJ.UpdateSetLblStats("Placing selling team...")if not Il(T.team1)then
 NJ.UpdateSetLblStats("\226\157\140 [SEAL] Team placement failed. Missing team or pets. Retrying...")
task.wait(5+W.GetSafePing())Z.IS_HATCHING=false continue end
 R=true end
 NJ.UpdateSetLblStats("\240\159\146\176 Selling pets...")if W.GetFastHatchMode()then
 if T.hatch_sell_delayed then
 
task.wait(4.2+W.GetSafePing())
else
 
task.wait(3+W.GetSafePing())end
 
elseif T.hatch_slow_mode then
 
task.wait(9+W.GetSafePing())
else
 
task.wait(3.2+W.GetSafePing())end
 if T.hatch_boost_seal_enabled then
 NJ.UpdateSetLblStats("Applying Boosts!")H.ApplyBoostSelected(T.hatch_boost_seal_team)
task.wait(.3)end
 W.UpdatePlayerStats()Z.tracked_bonus_egg_sell_refund=t.GetPlayerPetSellEggRefundChance()Z.has_seal_sold_happen=false 
local G=time()while Z.tracked_bonus_egg_sell_refund<1 do
 if time()-G>3 then
 break end
 Z.tracked_bonus_egg_sell_refund=t.GetPlayerPetSellEggRefundChance()
task.wait(.5+W.GetSafePing())end
 Z.tracked_bonus_egg_sell_refund=t.GetPlayerPetSellEggRefundChance()if W.IsSellAllUnFav()then
 if Z.tracked_bonus_egg_sell_refund<2 then
 NJ.UpdateSetLblStats("\226\157\140 Unable to sell pets. Seal boost not active")
else
 if not k then
 Ql()
else
 NJ.UpdateSetLblStats("\226\157\140 Unable to sell pets. Data issue detected. Skipping...")end
 end
 
local G=time()while true do
 
task.wait(.5+W.GetSafePing())if(time()-G)>3 then
 
print("Time out sell, unfav")break end
 if Z.has_seal_sold_happen then
 break end
 end
 
else
 if Z.tracked_bonus_egg_sell_refund<2 then
 NJ.UpdateSetLblStats("\226\157\140 Unable to sell pets. Seal boost not active")
else
 if T.auto_fav_after_hatch then
 W.FavoritePetsNewFaster(Z.hatched_pets)end
 
local G=W.GetPetsToSellForHatching()Z.hatch_state=Z.HATCH_STATES.EGG_HATCH_PHASE if T.fav_fruit_enhancer then
 
task.wait(.3)end
 r.SellPetsUsingTools(G)
task.wait(.1+W.GetSafePing())end
 end
 NJ.UpdateSetLblStats("Selling complete.")if W.GetFastHatchMode()then
 
task.wait(.5+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(8+W.GetSafePing())
else
 
task.wait(3+W.GetSafePing())end
 
else
 NJ.UpdateSetLblStats("\240\159\148\180 Unable to sell pets, not allowed, due to settings.")
print("\240\159\148\180 Unable to sell pets, not allowed, due to settings.")if W.GetFastHatchMode()then
 
task.wait()
elseif T.hatch_slow_mode then
 
task.wait(5+W.GetSafePing())
else
 
task.wait(1+W.GetSafePing())end
 end
 NJ.UpdateSetLblStats("\240\159\164\150 Placing new eggs...")if R then
 Z.UnEquipAllPets()end
 W.LockEnhance(true)if not Z.PlaceEggsWhenFarmEmpty()then
 
local G,V=
pcall(
function()W.PlaceEggsForHatching()end
)if not G then
 
warn("error eggs ",V)end
 end
 if not W.GetFastHatchMode()then
 
task.wait(.5+W.GetSafePing())
else
 
task.wait(.1+W.GetSafePing())end
 if Z.is_forced_stop then
 NJ.UpdateSetLblStats("\226\157\140 Out of eggs to place. Stopping farm.")end
 EJ=Z.PlayerSecrets.PetPassiveBonus yJ()if W.GetFastHatchMode()then
 
task.wait(.1+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(5+W.GetSafePing())
else
 
task.wait(1+W.GetSafePing())end
 Tl()Z.IS_HATCHING=false 
local n=gJ if n<=0 then
 n=x end
 
local w={pets=o;koi_bonus=Z.tracked_bonus_egg_recovery,seal_bonus=Z.tracked_bonus_egg_sell_refund,bronto_bonus=aJ;passive_bonus=EJ,egg_back=qJ,eggs_repaint=n,fav_count=Z.pets_fav_count}table.insert(m.HatchDataWebhook,w)NJ.UpdateSetLblStats("Cycle finished. Waiting for next batch.")if not W.GetFastHatchMode()then
 
task.wait(.2+W.GetSafePing())
else
 
task.wait(.1+W.GetSafePing())end
 if T.auto_restartjoin_server then
 Z.rejoin_hatch_count=Z.rejoin_hatch_count+1 if Z.rejoin_hatch_count>=T.auto_rejoin_after_hatchcount then
 Z.IS_HATCHING=true 
task.wait(6+W.GetSafePing())nJ()
task.wait(5+W.GetSafePing())
else
 
warn("Rejoin soon .. "..Z.rejoin_hatch_count)end
 end
 if W.GetFastHatchMode()then
 
task.wait(.5+W.GetSafePing())
elseif T.hatch_slow_mode then
 
task.wait(3+W.GetSafePing())
else
 
task.wait(1.5+W.GetSafePing())end
 if T.fav_fruit_enhancer then
 if T.enhancer_auto_sellfruit then
 W.LockEnhance(true)
task.spawn(
function()Z.SellFruitsToVendorWithRangeCheck(true)end
)end
 end
 Z.found_pet_data={}Z.found_crate_data={}W.StopTimer(G)end
 NJ.UpdateSetLblStats("Session-based hatching stopped.")T.is_running=false R()Z.IS_HATCHING=false end
 z.STATE={LEVEL="LEVEL",MUTATE="MUTATE"}z.XpBoostApply=
function()if T.pet_mut_xpteam_boost_enabled then
 
local G=H.ApplyBoostSelectedWithPetNames(T.pet_mut_xpteam_boosts,T.pet_mut_xpteam_petlist)if G then
 Y.UI.UpdateStats("Applying Boosts!")end
 
task.wait(.3)end
 end
 z.MutationTeamBoostApply=
function()if T.pet_mutation_team_boost_enabled then
 
local G=H.ApplyBoostSelectedWithPetNames(T.pet_mutation_boost_list,T.pet_mutation_team_list)if G then
 Y.UI.UpdateStats("Applying Boosts!")end
 
task.wait(.3)end
 end
 z.HasCheckedTeams=false z.CheckMissingTeam=
function(G)for G,V in ipairs(G)do
 
local y=WJ(V)if not y then
 
return false end
 end
 
return true end
 z.CheckTeamsForMissingPets=
function()
local G=T.mut_system.maxlevel_team 
local V=T.mut_system.xpteam 
local y=T.mut_system.mut_team 
local Z=T.mut_system.baseweight_team 
local j=T.mut_system.targetteam if not z.CheckMissingTeam(G)then
 
return false,"Max Leveling"end
 if not z.CheckMissingTeam(V)then
 
return false,"XP"end
 if not z.CheckMissingTeam(y)then
 
return false,"Mutation"end
 if not z.CheckMissingTeam(Z)then
 
return false,"Base Weight"end
 
return true,""end
 z.RestartSystemSafe=
function()if T.mut_system.timeout_system then
 
return true end
 
return false end
 z.GetTargetPetsOnField=
function()
local G=E.GetActivePetsUUIDS()
local V={}
local y=T.mut_system.targetteam or{}
local Z={}for G,V in ipairs(y)do
 Z[V]=true end
 for G,y in ipairs(G)do
 if Z[y]then
 table.insert(V,y)end
 end
 
return V end
 Z.horseman_elephant_current_time=os.clock()Z.horseman_ele_max=5 z.GetExtraPetsAdded=
function(G)if not W.IsTimeUp(Z.horseman_elephant_current_time,Z.horseman_ele_max)then
 
return end
 Z.horseman_elephant_current_time=os.clock()
local V=E.GetActivePetsUUIDS()
local y={}if G=="xp"then
 
local G=T.mut_system.maxlevel_team or{}
local Z=T.mut_system.xpteam or{}
local j=T.mut_system.targetteam or{}
local i={}for G,V in ipairs(G)do
 i[V]=true end
 for G,V in ipairs(Z)do
 i[V]=true end
 for G,V in ipairs(j)do
 i[V]=true end
 for G,V in ipairs(V)do
 if not i[V]then
 table.insert(y,V)end
 end
 end
 if G=="elephant"then
 
local G=T.mut_system.baseweight_team or{}
local Z=T.mut_system.targetteam or{}
local j={}for G,V in ipairs(G)do
 j[V]=true end
 for G,V in ipairs(Z)do
 j[V]=true end
 for G,V in ipairs(V)do
 if not j[V]then
 table.insert(y,V)end
 end
 end
 if G=="horseman"then
 
local G=T.mut_system.mut_team or{}
local Z=T.mut_system.targetteam or{}
local j={}for G,V in ipairs(G)do
 j[V]=true end
 for G,V in ipairs(Z)do
 j[V]=true end
 for G,V in ipairs(V)do
 if not j[V]then
 table.insert(y,V)end
 end
 end
 for G,V in ipairs(y)do
 W.UnEquipPet(V)
print("Extra pet was removed")end
 end
 z.IsWantedMutationsAdded=
function()if next(T.mut_system.wanted)==nil then
 
return false end
 if T.mut_system.disable_horseman then
 
return true end
 
return true end
 Z.team_placer_has_failed=false z.Loop=
function()z.is_running=true while z.is_running do
 
task.wait(.3)Z.IS_PET_MUTATION_RUNNING=false if z.IsWantedMutationsAdded()==false then
 z.mut_ui.UpdateStats("\240\159\148\180 No mutations selected.")continue end
 if not Z.GetCheckIfPro()then
 z.mut_ui.UpdateStats("\240\159\148\180 Free user detected. Please upgrade. System switched off")
task.wait(8)break end
 if Z.team_placer_has_failed then
 z.mut_ui.UpdateStats("\226\157\140 Team placer failed previously. Retrying...")Z.team_placer_has_failed=false Z.WipePetsInvalidOnFarm()
task.wait(.5)end
 
local G=T.mut_system.continue_enable 
local V=T.mut_system.turbo_xp_teams z.mut_ui.UpdateStats("\240\159\159\162 Running Pet Mutation system")if not z.HasCheckedTeams then
 
task.wait(1)z.mut_ui.UpdateStats("\240\159\154\168 Checking teams please wait.")
task.wait(1)
local G,V=z.CheckTeamsForMissingPets()if not G then
 
local G=string.format("\226\157\140 Team <font color=\'#FF0000\'>%s</font> team is missing pets, please update your team. Stopped.",V)z.mut_ui.UpdateStats(G)
task.wait(6)z.HasCheckedTeams=false break end
 z.HasCheckedTeams=true end
 
local y=os.clock()
local j=Z.GetMinsToSecs(15)if T.mut_system.max_level_enable then
 
local G,V=z.mut.GetPetsRequireMaxLevel()
local i=T.mut_system.only_level_mode 
local c="maxlevel"if#G>0 then
 Z.IS_PET_MUTATION_RUNNING=true 
local V,J,d=z.mut.AdvancedTeamMaker(G,true)if d then
 z.mut_ui.UpdateStats("\226\156\168 Placing Max Level Team")
else
 z.mut_ui.UpdateStats("\240\159\159\161 Placing XP Team")end
 if not Z.UnEquipAllPets()then
 Z.team_placer_has_failed=true z.mut_ui.UpdateStats("\226\157\140 [MAX LEVEL] Failed to unequip team, restarting.")
task.wait(3)continue end
 
task.wait(1)if not Il(V)then
 z.mut_ui.UpdateStats("\226\157\140 Failed to place team xp/level")
task.wait(1)continue end
 z.XpBoostApply()Z.IS_PET_MUTATION_RUNNING=false W.StartTimer(c)
local u=0 
local q=10 y=os.clock()
local g=0 
local E=10 while z.is_running do
 
task.wait(.5)
local V,a=z.mut.HasPetReachedMaxLevel(G,J,d)if#V>0 then
 
local y=0 for G,V in ipairs(V)do
 W.UnEquipPet(V)W.UnEquipPet(V)
task.wait()Z.WipePetOnFarmByUUID(V)J[V]=nil y=y+1 end
 
task.wait(.3)
local j,i=z.mut.GetPetsRequireMaxLevel()G=j if#j==0 then
 z.mut_ui.UpdateStats("\226\156\133 Max Level complete, restarting...")
task.wait(.3)break end
 
local c=0 for G,V in ipairs(j)do
 if c>=y then
 break end
 if J[V]then
 continue end
 W.EquipPet(V)J[V]=true c=c+1 
task.wait(.2)end
 if y>0 and c==0 then
 g=g+1 
else
 g=0 end
 if g>E then
 z.mut_ui.UpdateStats("\226\143\179 Max-level hotswap stalled, restarting...")
task.wait(.5)break end
 z.XpBoostApply()
task.wait(.2)continue end
 if W.IsTimeUp(y,j)then
 if z.RestartSystemSafe()then
 z.mut_ui.UpdateStats("\226\143\179 Timeout, restarting...")
task.wait(3)break end
 end
 if T.mut_system.realtime_monitor_system then
 z.GetExtraPetsAdded("xp")end
 if T.always_active_boosts and(os.clock()-u>=q)then
 u=os.clock()z.XpBoostApply()
task.wait(.3)end
 
local H=""
local r=6 
local Y=#a for G,V in ipairs(a)do
 if G>r then
 break end
 H=H..(V.."\n")end
 if Y>r then
 H=H..string.format("<font color=\'#FFA500\'>+%d more</font>",Y-r)end
 
local e=#a 
local s="[\240\159\148\183 XP]"if d then
 s="[\226\156\168 Max]"end
 
local N="\226\173\144 <font color=\'#00FF9D\'>Max Leveling:</font>"if i then
 N="\226\172\134\239\184\143 <font color=\'#29D1FF\'>LEVEL MODE</font> \226\172\134\239\184\143"end
 
local X=W.GetTimerFormatted(c)
local h=string.format("%s %s (%s)\n%s \n%s",s,N,e,X,H)
local l=W.GetTimeLeft(y,j)
local B=W.FormatTime(l)if T.mut_system.timeout_system then
 h=h..("\240\159\148\132 Refresh In: "..B)end
 z.mut_ui.UpdateStats(h)
task.wait(.5)end
 W.StopTimer(c)continue end
 end
 
task.wait(.3)
local i=z.mut.GetPetsNotReadyForMutations()
local c=#i 
local J=0 if#i>0 and z.GetCurrentTurn()==z.Turns.LEVEL then
 z.mut_ui.UpdateStats("\240\159\159\162 Placing xp/leveling team")
local V,c,d=z.mut.AdvancedTeamMaker(i,false)
task.wait(.5)if d then
 z.mut_ui.UpdateStats("\226\156\168 Placing Max Level Team \226\156\168")
else
 z.mut_ui.UpdateStats("\240\159\159\162 Placing XP Team \240\159\159\162")end
 Z.IS_PET_MUTATION_RUNNING=true Z.UnEquipAllPets()
task.wait(1)if not Z.UnEquipAllPets()then
 Z.team_placer_has_failed=true z.mut_ui.UpdateStats("\226\157\140 [XP STAGE] Failed to unequip team, restarting.")
task.wait(3)continue end
 if not Il(V)then
 z.mut_ui.UpdateStats("\226\157\140 Failed to place team")
task.wait(1)continue end
 z.XpBoostApply()Z.IS_PET_MUTATION_RUNNING=false 
local u="xp_team"W.StartTimer(u)
local q=false 
local g=false 
local E=0 
local a=10 y=os.clock()
local H={}
local r=false while z.is_running do
 
task.wait(.5)if next(T.mut_system.wanted)==nil then
 break end
 if T.always_active_boosts and(os.clock()-E>=a)then
 E=os.clock()z.XpBoostApply()
task.wait(.3)end
 if W.IsTimeUp(y,j)then
 if z.RestartSystemSafe()then
 z.mut_ui.UpdateStats("\226\143\179 Timeout, restarting...")q=true r=true 
task.wait(3)break end
 end
 if T.mut_system.realtime_monitor_system then
 z.GetExtraPetsAdded("xp")end
 
local V=i if T.mut_system.realtime_monitor_system then
 V=z.GetTargetPetsOnField()end
 
local H,Y,e=z.mut.HasPetReachedRequiredLevel(V,c,d)if#H>0 then
 if e then
 q=true g=true z.mut_ui.UpdateStats("\240\159\148\132 Pet reached required level.")
task.wait(.5)break end
 if G then
 
local G=0 for V,y in ipairs(H)do
 W.UnEquipPet(y)W.UnEquipPet(y)
task.wait()Z.WipePetOnFarmByUUID(y)G=G+1 c[y]=nil end
 
task.wait(.4)i=z.mut.GetPetsNotReadyForMutations()if#i==0 then
 break end
 
task.wait(.3)
local V=0 for y,Z in ipairs(i)do
 if V>=G then
 break end
 if c[Z]then
 continue end
 V=V+1 W.EquipPet(Z)c[Z]=true 
task.wait(.2)end
 W.StopTimer(u)z.XpBoostApply()W.StartTimer(u)continue 
else
 z.mut_ui.UpdateStats("\226\156\133 Success, Pet Level Reached ")i=z.mut.GetPetsNotReadyForMutations()if#i==0 then
 break end
 if#i>0 then
 q=true 
task.wait(1)break end
 end
 end
 
local s=z.mut.GetPetsNotReadyForMutations()if#s==0 then
 J=J+1 
task.wait(.3)end
 if J>10 then
 q=true 
task.wait(.5)break end
 
local N=""
local X=6 
local h=#Y for G,V in ipairs(Y)do
 if G>X then
 break end
 N=N..(V.."\n")end
 if h>X then
 N=N..string.format("<font color=\'#FFA708\'>+%d more...</font>",h-X)end
 
local l=#T.mut_system.targetteam 
local B=l-#i 
local L="[\226\173\144 XP Team]"if d then
 L="[\226\156\168 Max Level Team]"end
 
local m=W.GetTimerFormatted(u)
local K=string.format("%s Leveling: (%s/%s)\n%s \n%s",L,B,l,m,N)
local b=W.GetTimeLeft(y,j)
local S=W.FormatTime(b)if T.mut_system.timeout_system then
 K=K..("\240\159\148\132 Refresh In: "..S)end
 z.mut_ui.UpdateStats(K)
task.wait(.5)end
 if not q then
 if r==false then
 z.UpdateTurn(z.Turns.MUTATE)end
 end
 if not g then
 W.StopTimer(u)end
 
task.wait(.3)continue end
 
local d,u=z.mut.GetPetsNeedMutations()
local q=#d 
local g=false 
local a=false 
local H=0 
local r="mutationtrack"if#d>0 and z.GetCurrentTurn()==z.Turns.MUTATE then
 
local V={}
local i="\226\157\140 Failed to place mutation team"if u=="mut"then
 z.mut_ui.UpdateStats("\240\159\159\162 Placing mutation team")V=W.CloneArray(T.mut_system.mut_team)a=true 
elseif u=="weight"then
 z.mut_ui.UpdateStats("\240\159\144\152 Placing weight increase team")i="\226\157\140 Failed to place base weight team"V=W.CloneArray(T.mut_system.baseweight_team)g=true 
else
 z.mut_ui.UpdateStats("\240\159\148\180 Failed to detect mode. ")
task.wait(3)continue end
 if#V==0 then
 z.mut_ui.UpdateStats("\240\159\148\180 Missing mutation team or base weight team ")
task.wait(3)continue end
 
task.wait(.3)
local c,J=z.mut.GenTeamMutation(d,V)Z.IS_PET_MUTATION_RUNNING=true Z.UnEquipAllPets()
task.wait(2)if not Z.UnEquipAllPets()then
 Z.team_placer_has_failed=true z.mut_ui.UpdateStats("\226\157\140 [MUT STAGE] Failed to unequip team, restarting.")
task.wait(3)continue end
 if not Il(c)then
 z.mut_ui.UpdateStats(i)
task.wait(1)continue end
 z.MutationTeamBoostApply()Z.IS_PET_MUTATION_RUNNING=false 
local q=false 
local Y=0 
local e=10 
local s=0 W.StartTimer(r)y=os.clock()
local N=os.clock()while z.is_running do
 
task.wait(.2)if next(T.mut_system.wanted)==nil then
 break end
 if W.IsTimeUp(y,j)then
 if z.RestartSystemSafe()then
 z.mut_ui.UpdateStats("\226\143\179 Timeout, restarting...")q=true 
task.wait(1)break end
 end
 if T.always_active_boosts and(os.clock()-Y>=e)then
 Y=os.clock()z.MutationTeamBoostApply()
task.wait(.3)end
 if T.mut_system.gm_sprinkler and u=="weight"then
 if W.IsTimeUp(N,14)then
 N=os.clock()
local G="Grandmaster Sprinkler"
local V=E.GetSprinklerOnFarm(G)if not V then
 b.Sprinkler.PlaceGrandMaster(G)end
 
task.wait(.2+W.GetSafePing())end
 end
 
local V=d if T.mut_system.realtime_monitor_system then
 V=z.GetTargetPetsOnField()end
 
local i,c=z.mut.HasPetsReachedRequiredMutations_OnFarm(V,J,u)if#i>0 then
 W.StopTimer(r)if g then
 if not T.mut_system.elephant_hotswap then
 q=true break end
 end
 if G then
 
local G=0 for V,y in ipairs(i)do
 W.UnEquipPet(y)W.UnEquipPet(y)
task.wait()Z.WipePetOnFarmByUUID(y)G=G+1 J[y]=nil end
 
task.wait(1)d,u=z.mut.GetPetsNeedMutations()if u=="N/A"then
 break end
 if#d==0 then
 break end
 if g and u~="weight"then
 q=true break end
 
local V=0 for y,Z in ipairs(d)do
 if V>=G then
 break end
 if J[Z]then
 continue end
 W.EquipPet(Z)V=V+1 J[Z]=true end
 z.MutationTeamBoostApply()
task.wait(1)W.StartTimer(r)continue 
else
 z.mut_ui.UpdateStats("\226\156\133 Success, restarting... ")q=true 
task.wait(1)break end
 
task.wait(.3)continue end
 
local X=z.mut.GetPetsNotReachedWantedMut(d,u)if#X>0 then
 W.StopTimer(r)if g then
 if not T.mut_system.elephant_hotswap then
 q=true break end
 end
 if G then
 
local G=0 for V,y in ipairs(X)do
 W.UnEquipPet(y)W.UnEquipPet(y)
task.wait()Z.WipePetOnFarmByUUID(y)G=G+1 J[y]=nil end
 
task.wait(1)d,u=z.mut.GetPetsNeedMutations()if u=="N/A"then
 break end
 if#d==0 then
 break end
 if g and u~="weight"then
 q=true break end
 
local V=0 for y,Z in ipairs(d)do
 if V>=G then
 break end
 if J[Z]then
 continue end
 W.EquipPet(Z)V=V+1 J[Z]=true end
 z.MutationTeamBoostApply()W.StartTimer(r)
else
 z.mut_ui.UpdateStats("\240\159\148\180 Failed, restarting... ")q=true 
task.wait(1)break end
 continue end
 
local h,l=z.mut.GetPetsNeedMutations()if#h==0 then
 H=H+1 end
 if a and l~="mut"then
 z.mut_ui.UpdateStats("\240\159\148\132 Switching to weight type...")q=true 
task.wait(.5)break end
 if g and l~="weight"then
 z.mut_ui.UpdateStats("\240\159\148\132 Switching to mutation type...")q=true 
task.wait(.5)break end
 
local B=t.Inventory.GetActivePetsAsKeyVal()for G,V in pairs(J)do
 if not B[G]then
 H=H+1 end
 end
 if H>10 then
 q=true 
task.wait(.5)break end
 if T.mut_system.realtime_monitor_system then
 if u=="weight"then
 z.GetExtraPetsAdded("elephant")
else
 z.GetExtraPetsAdded("horseman")end
 end
 
local L=""
local m=6 
local K=#c for G,V in ipairs(c)do
 if G>m then
 break end
 L=L..(V.."\n")end
 if K>m then
 L=L..string.format("<font color=\'#FFA500\'>+%d more</font>",K-m)end
 
local S="\240\159\167\172 Mutating Pets"if u=="weight"and g then
 S="\240\159\144\152 Base Weight Pets"end
 
local f=W.GetTimerFormatted(r)
local M=#T.mut_system.targetteam 
local A=string.format("%s Left: (%s)\n%s\n%s",S,#d,f,L)
local x=W.GetTimeLeft(y,j)
local C=W.FormatTime(x)if T.mut_system.timeout_system then
 A=A..("\240\159\148\132 Refresh In: "..C)end
 s=s+1 z.mut_ui.UpdateStats(A)
task.wait(1)z.mut.CleanPet(d)
task.wait(2)end
 if not q then
 z.UpdateTurn(z.Turns.LEVEL)end
 
task.wait(.5)W.StopTimer(r)continue end
 if q>0 and c==0 then
 z.UpdateTurn(z.Turns.MUTATE)z.mut_ui.UpdateStats("\240\159\159\162 Found pets to process.")
else
 z.UpdateTurn(z.Turns.LEVEL)z.mut_ui.UpdateStats("\240\159\148\180 No pets found to do
 anything.")
task.wait(3)end
 
task.wait(1)continue end
 z.is_running=false x=nil T.mut_system.is_ruuning=false R()end
 z.StartThread=
function()if x then
 Z.Notify("Already running")
return end
 if M or A or C then
 Z.Notify("Unable to start, other systems are active")
return end
 if not T.mut_system.is_ruuning then
 Z.Notify("Failed to start, user stopped.")
return end
 Z.Notify("Started mutation")T.mut_system.is_ruuning=true R()x=
task.spawn(z.Loop)end
 z.StopThread=
function()if not x then
 Z.Notify("Not running...")
return end
 Z.Notify("Stopped mutation")task.cancel(x)x=nil z.is_running=false T.mut_system.is_ruuning=false R()end
 t.Teams={GetTeam1=
function()
return T.customteams_team1 end
;GetTeam2=
function()
return T.customteams_team2 end
,GetTeam3=
function()
return T.customteams_team3 end
;GetTeam4=
function()
return T.customteams_team4 end
}S.TeamsUiUpdate=
function(G)Z.TEXT_TEAM_SYSTEM=G end
 S.StartTeamsLoop=
function()
local G=S.TeamsUiUpdate 
local V="teamsystem_t1"
local y=1 
local j=nil while T.is_running_custom_teams do
 
task.wait(.1)if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G("\240\159\148\180 [Teams] Waiting for farm data to load.")
task.wait(5+W.GetSafePing())continue end
 if not Z.GetCheckIfPro()then
 G("\240\159\148\180 Teams is Premium feature. Stopped.")
task.wait(5)break end
 
local i={[1]={name="Team 1";data=t.Teams.GetTeam1();delay=T.customteams_team1_delay;enabled=true},[2]={name="Team 2";data=t.Teams.GetTeam2();delay=T.customteams_team2_delay;enabled=T.customteams_team2_enabled},[3]={name="Team 3",data=t.Teams.GetTeam3(),delay=T.customteams_team3_delay,enabled=T.customteams_team3_enabled};[4]={name="Team 4";data=t.Teams.GetTeam4(),delay=T.customteams_team4_delay;enabled=T.customteams_team4_enabled}}
local c=nil 
local J=1 for G=0,3,1 do
 
local V=((((y+G)-1))%4)+1 
local Z=i[V]if Z and(Z.enabled and(Z.data and#Z.data>0))then
 c=Z J=V y=V+1 break end
 end
 if not c then
 c=i[1]J=1 end
 if j~=J then
 Z.SetDisablePickPlaceFor(3)G(string.format("[Switching] Swapping to %s...",c.name))Z.UnEquipAllPets()
task.wait(.3)if not Il(c.data)then
 G("[Error] Failed to equip "..c.name)
task.wait(2)j=nil continue 
else
 j=J G(string.format("[Team Active] %s equipped.",c.name))
task.wait(1)end
 
else
 G(string.format("[Looping] Starting %s shift...",c.name))end
 W.StopTimer(V)W.StartTimer(V)
local d=c.delay or 30 
local u=0 
local q=os.clock()
local g=9 while u<d and T.is_running_custom_teams do
 
task.wait(1)u=u+1 if T.customteams_boosts_enabled then
 if W.IsTimeUp(q,g)then
 q=os.clock()H.ApplyBoostSelectedWithPetNames(T.customteams_boosts,T.customteams_boost_teamunits)
task.wait(.3)end
 end
 
local y=W.GetTimerFormatted(V)
local Z=d-u 
local j=string.format("[Running: %s]\nActive Time: %s\nSwitching in: %ds",c.name,y,Z)G(j)end
 end
 W.StopTimer(V)z.StopCustomTeams()G("System Stopped.")end
 z.StartCustomTeams=
function()if not Z.GetCheckIfPro()then
 Z.Notify("\240\159\148\180 Unable to start Teams is Premium feature.")
return end
 if C then
 Z.Notify("Already running")
return end
 if M or A or x then
 Z.Notify("Unable to start, other systems are active")T.is_running_custom_teams=false R()
return end
 Z.Notify("Started system")T.is_running_custom_teams=true R()C=
task.spawn(S.StartTeamsLoop)end
 z.StopCustomTeams=
function()if not C then
 Z.Notify("Not running...")
return end
 Z.Notify("Stopped system")if C then
 task.cancel(C)end
 C=nil T.is_running_custom_teams=false R()end
 Y.ForceLevelingTeam=false Y.FirstChecker=false Y.MutMachine={GetCurrentPetData=
function()
local G=m.GetBigDataUsingKey("PetMutationMachine")
local V=G.SubmittedPet if not V then
 
return nil end
 
local y=G.PetReady 
local Z=G.TimeLeft 
local j=G.IsRunning 
local i=V.PetData 
local c=V.PetType 
local J=V.UUID 
local T=i.Name 
local d=i.Level 
local u=i.BaseWeight 
local q=i.MutationType or""
local g={uuid=J,petname=c;nickname=T;baseweight=u,MutationType=q}
return g end
;GetCurrentState=
function()
local G=m.GetBigDataUsingKey("PetMutationMachine")
local V=G.PetReady 
local y=G.TimeLeft 
local Z=G.IsRunning 
local j=G.SubmittedPet if not j then
 
return end
 if Z==false and V==false then
 
return end
 
local i=j.PetData 
local c=j.PetType 
local J=j.UUID 
local T=i.Name 
local d=i.Level 
local u=i.BaseWeight end
;GetCurrentStatus_old=
function()
local G=V.Workspace.NPCS.PetMutationMachine.Model.ProxPromptPart.PetMutationMachineProximityPrompt 
local y=Y.Status.SUBMIT_PET if G and(G:IsA("ProximityPrompt")and G.ActionText)then
 
local V=G.ActionText if string.find(V,"Start Mutation",1,true)then
 y=Y.Status.START_MUTATION 
elseif string.find(V,"Claim Pet",1,true)then
 y=Y.Status.CLAIM_PET 
elseif string.find(V,"Submit Pet",1,true)then
 y=Y.Status.SUBMIT_PET 
elseif string.find(V,"Skip",1,true)then
 y=Y.Status.SKIP end
 
else
 end
 
return y end
;GetCurrentStatus=
function()
local G=m.GetBigDataUsingKey("PetMutationMachine")if not G then
 
return Y.Status.SUBMIT_PET end
 
local V=G.PetReady 
local y=G.IsRunning 
local Z=G.SubmittedPet if not Z or type(Z)~="table"or not Z.UUID then
 
return Y.Status.SUBMIT_PET end
 if V==true then
 
return Y.Status.CLAIM_PET end
 if y==true then
 
return Y.Status.SKIP end
 if y==false and V==false then
 
return Y.Status.START_MUTATION end
 
return Y.Status.SUBMIT_PET end
}Y.MachineLoop=
function()while Y.is_running do
 Z.IS_MUTATION_RUNNING=false 
task.wait(3)Z.max_pet_inventory_space=false Y.UI.UpdateStats("Running mutation system")if next(c.mut_target_mutations)==nil then
 Y.is_running=false Z.Notify("[Stopped] Please select mutations",3)break end
 
local G=Y.MutMachine.GetCurrentStatus()if c.mut_batch_process_enable and Y.GetCurrentTurn()==Y.Status.TURN_LEVEL then
 if not Y.FirstChecker then
 Y.ForceLevelingTeam=true Y.FirstChecker=true end
 end
 if Y.ForceLevelingTeam==true then
 Y.ForceLevelingTeam=false 
local V=c.mut_max_level_successfulpets 
local y=Y.GetAvailablePetsForLeveling()if#y==0 then
 if V==false then
 Y.UI.UpdateStats("Theres nothing to level, going idle for a while...")
warn("Theres nothing to level, going idle for a while...")
task.wait(5)continue end
 end
 
local j=false 
local i={}if V then
 
local G=Y.GetPetsToMaxLevelMetMutationGoal()
task.wait(.2)if#G==0 then
 
else
 y=G i=G j=true end
 end
 if#y==0 then
 Y.UI.UpdateStats("No pets to level. Retrying...")
task.wait(1)continue end
 
local J=Y.MakeLevelingTeam(y)if#J==0 then
 Y.UI.UpdateStats("Could not make a team for leveling... retrying...")
task.wait(3)continue end
 Z.UnEquipAllPets()
task.wait(2)if not Il(J)then
 
warn("Failed to place leveling support team. Will retry.")Y.UI.UpdateStats("Failed to place leveling team, retry..")
task.wait(3)continue end
 
task.wait(3)if T.mutation_boost_level_team_enabled then
 Z.IS_MUTATION_RUNNING=true 
task.wait(2)Y.UI.UpdateStats("Applying Boosts!")H.ApplyBoostSelected(T.mutation_boost_level_team)
task.wait(.3)Z.IS_MUTATION_RUNNING=false end
 
local d=Y.GetPetsReadyForSubmit()
local u=Y.Status.CLAIM_PET 
local q=Y.Status.START_MUTATION Y.UI.UpdateStats("Placed leveling team..")
local g=0 
local E=15 while true do
 
task.wait(.5)if G==u or G==q then
 if not c.mut_batch_process_enable then
 break end
 end
 if T.always_active_boosts and(os.clock()-g>=E)then
 g=os.clock()if T.mutation_boost_level_team_enabled then
 Z.IS_MUTATION_RUNNING=true 
task.wait(1)Y.UI.UpdateStats("Applying Boosts!")H.ApplyBoostSelected(T.mutation_boost_level_team)
task.wait(.3)Z.IS_MUTATION_RUNNING=false end
 end
 if V and j then
 Y.UI.UpdateStats("\226\156\168 Leveling Pets TO MAX LEVEL")
local V=Y.GetHasPetsReachedMaxLevelMutationGoal(i)if V then
 
warn("Success, one or more pet has reached max level.")break end
 G=Y.GetCurrentStatus()
else
 d=Y.GetPetsReadyForSubmit()G=Y.GetCurrentStatus()
local V=Y.GetCurrentTurn()if c.mut_batch_process_enable and V==Y.Status.TURN_LEVEL then
 
local G,V=Y.GetPetsNotReadyForSubmit()
local Z=#y-#G 
local j=""for G,V in ipairs(V)do
 j=j..(V.."\n")end
 
local i=Y.GetPetsReachedMutationLevelRequirement(y)
local c=string.format("\240\159\159\162 Batch lvl (%s/%s)\n%s",Z,#y,j)Y.UI.UpdateStats(c)if#G==0 then
 Y.UI.UpdateStats("\240\159\159\162 Leveling batch completed.. switching to mutation.")Y.SetNewTurn(Y.Status.TURN_CD)
task.wait(.5)break end
 if#i>0 then
 Y.ForceLevelingTeam=true Y.UI.UpdateStats("\226\156\133 One or more pet leveled to requirement.")
task.wait(.1)break end
 
task.wait(1)continue 
else
 d=Y.GetPetsReadyForSubmit()if#d>0 then
 break end
 end
 Y.UI.UpdateStats("\240\159\159\162 Leveling up pets")end
 
task.wait(3)end
 if Y.ForceLevelingTeam then
 continue end
 Y.UI.UpdateStats("Complete, Have a pet to submit.")
task.wait(2)end
 if G==Y.Status.CLAIM_PET then
 
local G=false Z.IS_MUTATION_RUNNING=true if#c.mut_claimpet_team>0 then
 Z.UnEquipAllPets()
task.wait(2)if not Il(c.mut_claimpet_team)then
 Y.UI.UpdateStats("Claim Pet: Team failed to place, retry..")
task.wait(3)continue end
 if T.mutation_boost_claim_enabled then
 Y.UI.UpdateStats("Applying Boosts!")H.ApplyBoostSelected(T.mutation_boost_team_claim)
task.wait(.3)end
 G=true 
else
 Y.UI.UpdateStats("Claim Pet: No team to place.")
warn("Claim Pet: No team to place.")
task.wait(2)end
 
task.wait(1)
local V=Y.MutMachine.GetCurrentPetData()if not V then
 Y.UI.UpdateStats("Pet data not found in mutation machine, retrying...")
task.wait(5)continue end
 
task.wait(.4)Y.ClaimMutatedPet()Y.UI.UpdateStats("Claiming pet.")
task.wait(4)if G then
 Z.UnEquipAllPets()end
 if Z.max_pet_inventory_space then
 Y.UI.UpdateStats("[Stop] Unable to claim pet, no space in your inventory")W.SendWebhookSendError("[Stopped] Max Pet Inventory. Unable to claim pet from your mutation machine.")Y.is_running=false Z.Notify("Stopping, unable to claim pet.")break end
 
local y=V.uuid 
local j=WJ(y)if not j then
 Y.UI.UpdateStats("[Check] Pet data not found in mutation machine, retrying...")
task.wait(5)continue end
 
local i=j.PetData 
local J=j.PetType 
local d=i.Name 
local u=i.Level 
local q=i.BaseWeight 
local g=i.MutationType or""
local E={PetType=J;MutationType=g,Name=d,Level=u}table.insert(D,E)
local a=Y.AllMutationListEnum[g]or""
local e=string.format("Claimed: %s Mut: %s ",J,a)Y.UI.UpdateStats(e)OJ={}
task.wait(1)if not Y.InsertPetBackIntoTargetList(y)then
 
local G=Y.GetUUID_PetInMachine()if G~=""then
 Y.InsertPetBackIntoTargetList(G)end
 end
 
task.wait(.2)Y.ResetPetSavedUUID()
task.wait(1)yJ()
local s=r.GetPetUsingUUID(y)if s then
 mJ(s)
task.wait(.3)end
 Z.IS_MUTATION_RUNNING=false continue end
 if G==Y.Status.SKIP then
 Y.ForceLevelingTeam=false if#c.mut_mutation_machineteam>0 then
 Z.UnEquipAllPets()
task.wait(2)if not Il(c.mut_mutation_machineteam)then
 Y.UI.UpdateStats("Failed to place cooldown team.")
task.wait(2)continue end
 
task.wait(2)if T.mutation_boost_cd_team_enabled then
 Y.UI.UpdateStats("Applying Boosts!")H.ApplyBoostSelected(T.mutation_boost_cd_team)
task.wait(.3)end
 
local V=0 
local y=15 while G==Y.Status.SKIP do
 
task.wait(3)Y.UI.UpdateStats("Cooldown Team is active")G=Y.GetCurrentStatus()if T.always_active_boosts and(os.clock()-V>=y)then
 V=os.clock()if T.mutation_boost_cd_team_enabled then
 Y.UI.UpdateStats("Applying Boosts!")H.ApplyBoostSelected(T.mutation_boost_cd_team)
task.wait(.3)end
 end
 end
 continue 
else
 if not c.mut_batch_process_enable then
 Y.ForceLevelingTeam=true Y.UI.UpdateStats("No cooldown team. Trying to level.")continue 
else
 Y.UI.UpdateStats("No cooldown team. Going idle...")
task.wait(15)continue end
 end
 end
 if G==Y.Status.SUBMIT_PET then
 Y.ForceLevelingTeam=false 
local G=Y.GetPetsReadyForSubmit()if#G==0 then
 Y.ForceLevelingTeam=true Y.UI.UpdateStats("No pets to submit, restarting checks..")Y.SetNewTurn(Y.Status.TURN_LEVEL)
task.wait(.5)continue 
else
 Y.ForceLevelingTeam=false Y.UI.UpdateStats("Submitting new pet")
local V=G[math.random(1,#G)]Z.IS_MUTATION_RUNNING=true Z.UnEquipAllPets()
task.wait(3)
local y=r.GetPetUsingUUID(V)if y then
 
local G=y:GetAttribute("d")if G then
 Y.UI.UpdateStats("Unfavorite pet...")mJ(y)
task.wait(1)end
 yJ()
task.wait(.4)VJ(y)
task.wait(1)Y.SubmitHeldPet()Y.UI.UpdateStats("Submitted pet")
task.wait(.7)Y.SavePetUUID(V)end
 
task.wait(2)cl()
task.wait(1.3)Z.IS_MUTATION_RUNNING=false end
 end
 if G==Y.Status.START_MUTATION then
 Y.ForceLevelingTeam=false Y.UI.UpdateStats("Starting mutation")
local G=Y.MutMachine.GetCurrentPetData()if G then
 Y.SavePetUUID(G.uuid)end
 Y.StartMachine()
task.wait(1)Y.UI.UpdateStats("Machine has started")cl()
task.wait(1)continue end
 end
 Y.is_running=false A=nil c.mut_was_running=false n()end
 Y.StartThread=
function()if A then
 Z.Notify("Already running..")
return end
 if M or x or C then
 Z.Notify("Unable to start, other systems are active.")
return end
 Y.is_running=true A=
task.spawn(Y.MachineLoop)c.mut_was_running=true n()Z.Notify("Mutation Machine is now running...")end
 Y.StopThread=
function()if not A then
 Z.Notify("Not running...")
return end
 Y.is_running=false task.cancel(A)A=nil Z.Notify("Mutation Machine stopped...")c.mut_was_running=false n()end
 Z.GetTextUserHubPower=
function()
local G=V.AppName 
local y=Z.is_pro if y then
 
return string.format("<font color=\'#FFE075\'>%s</font> <font color=\'#FF00C8\'>PRO</font>",G)
else
 
return string.format("%s",G)end
 end
 Z.StartHatchingSystem=
function()if M then
 Z.Notify("Already running",3)
return end
 if x or A or C then
 Z.Notify("Unable to start hatching system. Other systems are running.",3)
return end
 T.is_running=true T.is_auto_rejoin=true Z.is_forced_stop=false M=
task.spawn(Z.SessionLoop)R()end
 Z.StopHatchingSystem=
function()
pcall(
function()T.is_running=false T.is_auto_rejoin=false Z.is_forced_stop=false R()if M then
 task.cancel(M)M=nil end
 Z.Notify("Hatching stopped.",3)NJ.UpdateSetLblStats("Stopped By User")end
)end
 if S.gift_loops then
 task.cancel(S.gift_loops)S.gift_loops=nil end
 S.Targets_max={}S.gift_loops=
task.spawn(
function()while true do
 Z.IS_GIFT=false 
task.wait(2)
local G=S.GiftSystem.UpdateUiGiftSystem if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G("\226\143\179 Waiting for farm to load.")
task.wait(5)continue end
 if not T.giftpets.enabled_gift_pets then
 if T.giftpets.enabled_auto_trade then
 G("\240\159\159\162 Only Trade System is enabled.")
task.wait(2)continue end
 G("\240\159\148\180 Not Enabled")
task.wait(2)continue end
 if W.IsSellAllUnFav()and T.is_running then
 G("\240\159\159\161 Sell All Mode is active for hatching, unable to use gift feature.")
task.wait(3)continue end
 if Z.IS_HATCHING then
 G("\240\159\159\161 Hatching")
task.wait(3)continue end
 
local V=T.giftpets.allow_pet_list or{}if next(V)==nil then
 G("\240\159\148\180 No pet types selected to send. Please select a pet type.")
task.wait(5)continue end
 
local y=S.GiftSystem.GetAllPetsForGifting()if#y==0 then
 G("\226\157\140 No pets to gift.")
task.wait(5)continue end
 
local j=nil 
local i="-"for G,V in pairs(T.giftpets.allow_player_targets)do
 if S.Targets_max[G]then
 continue end
 
local y=Z.IsPlayerActiveUsingName(G)if y then
 j=y i=G break end
 end
 if not j then
 G("\240\159\148\180 No players selected or found to send to or user has max inventory.")
task.wait(5)continue end
 G("\240\159\164\150 Found pets: "..#y)
local c=3 
local J=0 for V,d in ipairs(y)do
 
task.wait()
local u=d.pet_uuid 
local q=d.pet_tool if not q then
 continue end
 
local g=Z.IsPlayerActiveUsingName(i)if not g then
 G("\226\157\140 Player not found. ")
task.wait(3)break end
 if J>=9 then
 break end
 if not zJ(q)then
 yJ()
task.wait(.3)end
 if Z.IS_HATCHING or not T.giftpets.enabled_gift_pets then
 break end
 if not j then
 break end
 Z.IS_GIFT=true if r.IsPetFav(q)then
 G("\226\157\164\239\184\143 remove fav from pet. ")if T.giftpets.allow_fav then
 mJ(q)
task.wait(1)
else
 G("\240\159\164\150 Unable to send fav pet - Setting not enabled to unfav ")
task.wait(1)continue end
 end
 
local E=VJ(q)if E==false then
 end
 
local a=q.Name or"Unknown"G("\240\159\164\150 Sending pet: "..(a..(" - Left:"..#y)))
local H,Y=
pcall(
function()S.GiftSystem.SendGift(j)
task.wait(3)if Z.target_max_inventory then
 S.Targets_max[i]=true 
print("Target max inventory ",i)Z.target_max_inventory=false J=100 end
 yJ()end
)if not H then
 
warn("gift error: ",Y)end
 G("\226\156\133 Sent gift: "..(a..(" \226\143\179 Waiting to gift next. Left:"..#y)))J=J+1 
task.wait(c)Z.IS_GIFT=false end
 
task.wait(.5)end
 end
)if S.max_inventory_reseter then
 
pcall(
function()task.cancel(S.max_inventory_reseter)end
)S.max_inventory_reseter=nil end
 S.max_inventory_reseter=
task.spawn(
function()while true do
 
task.wait(40)S.Targets_max={}
task.wait(10)end
 end
)if S.tradex_loops then
 task.cancel(S.tradex_loops)S.tradex_loops=nil end
 S.tradex_loops=
task.spawn(
function()while true do
 Z.IS_GIFT=false 
task.wait(2)
local G=S.GiftSystem.UpdateUiGiftSystem if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G("\226\143\179 Waiting for farm to load.")
task.wait(5)continue end
 if T.giftpets.auto_confirm_accept then
 if t.PlayerData.GetUnfairTradeWarning()then
 G("\240\159\148\180 Please disable UnfairTradeWarning from Trade (Button) > Settings (tab) to use trading system. ")
task.wait(3)continue end
 if S.TradeSystem.OtherPlayerReady()then
 if S.TradeSystem.IsTradeActive()then
 S.TradeSystem.TradeAcceptButton()continue end
 end
 end
 if not T.giftpets.enabled_auto_trade then
 
task.wait(2)continue end
 
local V=T.giftpets.allow_pet_list or{}if next(V)==nil then
 G("\240\159\148\180 No pet types selected to send. Please select a pet type.")
task.wait(3)continue end
 
local y=S.GiftSystem.GetAllPetsForGifting()if#y==0 then
 G("\226\157\140 No pets to trade. Make sure to remove pets from target teams or mutation teams if they are added as targets.")
task.wait(3)continue end
 if not S.TradeSystem.IsTradeActive()then
 
task.wait(2)continue end
 if S.TradeSystem.MyAddedItemsCount()>=12 then
 G("\240\159\159\161 Trade max items already added.")if T.giftpets.send_trading_ticket_auto then
 S.TradeSystem.TradeAcceptButton()end
 
task.wait(2)continue end
 G("\240\159\164\150 Found pets: "..#y)
local j=.1 
local i=0 
local c=0 for G,V in ipairs(y)do
 
task.wait()if c>=12 then
 break end
 
local y=V.pet_uuid 
local J=V.pet_tool if not J then
 continue end
 if not T.giftpets.enabled_auto_trade then
 break end
 if i>12 then
 break end
 
local d=J.Name or"Unknown"
local u,q=
pcall(
function()S.TradeSystem.AddPetItem(y)c=c+1 if Z.target_max_inventory then
 Z.target_max_inventory=false i=100 end
 end
)if not u then
 
warn("trade error: ",q)end
 i=i+1 
task.wait(j)Z.IS_GIFT=false end
 
task.wait(1)if S.TradeSystem.IsTradeActive()then
 S.TradeSystem.TradeAcceptButton()end
 end
 end
)W.ActivateFlatMode=
function()
local G=V.Workspace:FindFirstChildOfClass("Terrain")
local y=game:GetService("Lighting")
local Z=(settings()).Rendering Z.QualityLevel=1 Z.MeshPartDetailLevel=Enum.MeshPartDetailLevel.Level01 y.GlobalShadows=false y.FogEnd=9000000000.0 y.Brightness=0 y.Ambient=Color3.fromRGB(255,255,255)y.OutdoorAmbient=Color3.fromRGB(255,255,255)y.EnvironmentDiffuseScale=0 y.EnvironmentSpecularScale=0 y.ClockTime=14 for G,V in pairs(y:GetChildren())do
 if V:IsA("PostEffect")or V:IsA("Sky")or V:IsA("Atmosphere")or V:IsA("Clouds")then
 V:Destroy()end
 end
 if G then
 G.WaterWaveSize=0 G.WaterReflectance=0 G.WaterTransparency=0 G.Decoration=false G.Material=Enum.Material.SmoothPlastic end
 for G,V in pairs(V.Workspace:GetDescendants())do
 if V:IsA("Decal")or V:IsA("Texture")or V:IsA("SurfaceAppearance")then
 V:Destroy()
elseif V:IsA("MeshPart")then
 V.TextureID=""V.Material=Enum.Material.SmoothPlastic V.RenderFidelity=Enum.RenderFidelity.Performance V.Reflectance=0 V.CastShadow=false 
elseif V:IsA("SpecialMesh")then
 V.TextureId=""
elseif V:IsA("BasePart")then
 V.Material=Enum.Material.SmoothPlastic V.Reflectance=0 V.CastShadow=false 
elseif V:IsA("ParticleEmitter")or V:IsA("Trail")or V:IsA("Beam")or V:IsA("Fire")or V:IsA("Smoke")then
 V:Destroy()end
 end
 end
 
local y9=nil if y then
 y9=y:CreateWindow({Title=Z.GetTextUserHubPower(),Footer=W.GetFooterInfo(),ToggleKeybind=Enum.KeyCode.RightControl,Center=true;AutoShow=T.autoshowuisc})if y.ScreenGui.Main.Active then
 y.ScreenGui.Main.Active=true end
 end
 
function Z.HomeDashboardUi()
local G=RJ()
local V=y9:AddTab({Name="Home";Description="Game Server Version: "..G;Icon="house"})
local i=V:AddLeftGroupbox("Auto Hatch","calendar-sync",false)
local J=V:AddRightGroupbox("System","monitor-cog",false)
local d=V:AddRightGroupbox("Farm Details","tent-tree",false)
local u=V:AddRightGroupbox("Hop Server","monitor-cog",false)if u then
 u:AddLabel({Text="Hop to new server: Only works if you have Anti Spam disabled in delta. You must not be running and scripts to disable it in delta settings.",DoesWrap=true})
local 
function G()
local G=c.hop_targetversion 
local V=string.format("<b><font color=\'#7327F5\'>\240\159\148\141 Target Version </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local V V=u:AddInput("inputservertarget",{Text=G(),Default=c.hop_targetversion,Numeric=true;AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="e.g. 2767",Tooltip="Enter target version. numbers only";Callback=
function(y)
local j=jJ(y)if not j or j<=0 then
 Z.Notify("Invalid Target Version: "..y,3)V:SetValue(tostring(c.hop_targetversion))
return end
 if j>0 then
 c.hop_targetversion=j n()V:SetText(G())end
 end
})
local y=u:AddButton({Text="\240\159\159\162 Start",Func=
function()if c.hop_enabled then
 Z.Notify("Already running")
return end
 if c.hop_targetversion<=0 then
 Z.Notify("Enter a valid target server version.")
return end
 Z.Notify("\226\154\160\239\184\143 Rejoin to start. You must have anti spam disabled in delta for this to work.")c.hop_enabled=true n()
task.wait(2)nJ()
task.wait(2)t.Hop.HopToNewServer()end
})y=u:AddButton({Text="\240\159\148\180 Stop";Func=
function()Z.Notify("Stopped")c.hop_enabled=false n()end
})
local j=u:AddButton({Text="Hop Server",Func=
function()t.Hop.HopToNewServer()end
})u:AddDivider()end
 cl()if J then
 J:AddLabel({Text="<font color=\'#FFA500\'>\226\143\184\239\184\143 Pause all systems.</font>\n<font color=\'#CCCCCC\'>This does NOT pause hatching or mutation.</font>",DoesWrap=true})
local G G=J:AddToggle("pausetoggleallsystems",{Text="<font color=\'#FF5555\'>\226\143\184\239\184\143 Pause All Systems</font>",Default=T.pause_systems,Tooltip="Pause every system except hatching and mutation.";Callback=
function(V)if V==T.pause_systems then
 
return end
 if V and not T.pause_systems then
 y:Confirm({Title="Pause All Systems";Description="Everything will stop, shops, systems.";Callback=
function(V)if V then
 T.pause_systems=true R()
else
 G:SetValue(T.pause_systems)end
 end
})
return end
 T.pause_systems=V R()end
})end
 j.lbl_farm_plants_counts=d:AddLabel({Text="-",DoesWrap=true})j.lbl_stats=i:AddLabel({Text="Stopped",DoesWrap=true})i:AddDivider()j.lbl_home_info=i:AddLabel({Text="-";DoesWrap=true})i:AddLabel({Text="<font color=\'#FF3B3B\'>\226\154\160\239\184\143 [Warning] Do not trade, unfavourite or gift while the hatching system is active!</font>";DoesWrap=true})
local q q=i:AddButton({Text="\240\159\159\162 Start Auto Hatching",Func=
function()if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 Z.Notify("Wait until farm is loaded to start hatching system.",3)
return end
 y:Confirm({Title="\226\154\160\239\184\143 Start Hatching?",Description="\226\132\185\239\184\143 Please make sure all your pets are fav before starting this if you are new.",Callback=
function(G)if G then
 Z.StartHatchingSystem()
else
 end
 end
})end
})
local g=i:AddButton({Text="\240\159\148\180 Stop Farming";Func=
function()Z.StopHatchingSystem()end
})i:AddDivider()i:AddButton({Text="\240\159\164\150 Unequip Team",Func=
function()Z.UnEquipAllPets()end
})i:AddDivider()i:AddToggle("MyMiddleToggle1",{Text="\240\159\147\141 Spawn Middle";Default=T.char_farm_middle;Tooltip="Place your character in the centre of the farm when you join.",Callback=
function(G)T.char_farm_middle=G R()end
})i:AddDivider()
local a=i:AddToggle("MyToggle1",{Text="Test Mode";Default=T.is_test;Tooltip="Enable or disable testing";Callback=
function(G)T.is_test=G 
print("Toggle changed to:",G)R()end
})
local H=i:AddButton({Text="\240\159\154\168 Rejoin Server";Func=
function()nJ()end
})i:AddDivider()end
 Z.ProUi=
function()
local G=y9:AddTab({Name="Premium";Description="Premium Features";Icon="sparkles"})
local y=G:AddLeftGroupbox("\240\159\146\157 <font color=\'#FFB833\'>Gifting / Trade</font> \240\159\142\159\239\184\143","gift")
local d="\240\159\142\131 <stroke color=\'#FFD8A8\' sizing=\'fixed\' thickness=\'0.3\' transparency=\'0.3\' joins=\'round\'><b><font color=\'#FF4E1C\'>Horseman</font> & <font color=\'#FFB833\'>Elephant</font></b></stroke> \240\159\144\152"
local u=G:AddRightGroupbox(d)
local q=G:AddLeftGroupbox("\240\159\148\132 Pick Place","vault")
local g=G:AddRightGroupbox("<b><font color=\'#7CF4A8\'>\240\159\167\170 Experiments</font></b>","test-tube-diagonal")
local E=G:AddRightGroupbox("<b><font color=\'#FF0000\'>Hatching Options</font></b>","flame")
local a=G:AddLeftGroupbox("<b><font color=\'#ffffff\'>Test Options</font></b>","flame-kindling")
local e=G:AddRightGroupbox("Trade World","baggage-claim")
local s=G:AddLeftGroupbox("<b><font color=\'#FF0099\'>\240\159\148\165 Enhancer Pro</font></b>","book-search")
local N="\240\159\146\165 <stroke color=\'#000055\' thickness=\'1.5\' joins=\'round\'><b><font color=\'#00FFFF\'>PET</font> <font color=\'#FFFFFF\'>AGE</font> <font color=\'#FF00FF\'>MACHINE</font></b></stroke>"
local X=G:AddLeftGroupbox(N)
local l=G:AddRightGroupbox("<b><font color=\'#266ED9\'>Pet Data</font></b>","book-search")
local B=G:AddRightGroupbox("<b><font color=\'#266ED9\'>Egg Data</font></b>","book-search")
local L="\240\159\148\132 <stroke color=\'#000055\' thickness=\'1.5\' joins=\'round\'><b><font color=\'#FFFFFF\'>Custom</font> <font color=\'#F52727\'>Teams</font></b></stroke>"
local m=G:AddLeftGroupbox(L)if m then
 m:AddLabel({Text="\240\159\146\161 Custom teams, can be used for some setups.",DoesWrap=true})
local G=
function(G,V)
local y=#G 
local Z=PJ()
local j=y>=Z and"#FF5555"or"#00FF99"
local i="Team "..V 
local c=W.StringToColor3Light(i)
local J=string.format("<font color=\"%s\"><b>\240\159\164\150 %s</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",c,i,j,y,Z)
return J end
 i.customteams_team1=m:AddDropdown("customteams_team1",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text=G(T.customteams_team1,1);Tooltip="Select pets for this team.";Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.customteams_team1:SetValue(DJ(T.customteams_team1))Z.Notify("Team size maxed",2)
else
 T.customteams_team1=y R()i.customteams_team1:SetText(G(T.customteams_team1,2))end
 end
})
local V=m:AddInput("inputteamstimerx1",{Text="\226\143\179<font color=\'#FF9E1F\'>Switch Delay</font>",Default=T.customteams_team1_delay;Numeric=true;AllowEmpty=true;Finished=false;ClearTextOnFocus=false;Placeholder="1s",Tooltip="Delay before team is switched",Callback=
function(G)
local V=iJ(G)if not V then
 
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Enter a number above 0",3)
return end
 T.customteams_team1_delay=V R()end
})m:AddDivider()m:AddDivider()i.customteams_team2=m:AddDropdown("customteams_team2",{Values={};Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=G(T.customteams_team2,2);Tooltip="Select pets for this team.",Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.customteams_team2:SetValue(DJ(T.customteams_team2))Z.Notify("Team size maxed",2)
else
 T.customteams_team2=y R()i.customteams_team2:SetText(G(T.customteams_team2,2))end
 end
})
local y=m:AddInput("inputteamstimer1",{Text="\226\143\179<font color=\'#FF9E1F\'>Switch Delay</font>";Default=T.customteams_team2_delay;Numeric=true;AllowEmpty=true;Finished=false,ClearTextOnFocus=false,Placeholder="1s";Tooltip="Delay before team is switched";Callback=
function(G)
local V=iJ(G)if not V then
 
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Enter a number above 0",3)
return end
 T.customteams_team2_delay=V R()end
})m:AddToggle("cteam2enable",{Text="\240\159\148\183 Enable Team 2",Default=T.customteams_team2_enabled;Tooltip="Enables team 2",Callback=
function(G)T.customteams_team2_enabled=G R()end
})m:AddDivider()m:AddDivider()i.customteams_team3=m:AddDropdown("customteams_team3",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text=G(T.customteams_team3,3);Tooltip="Select pets for this team.",Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.customteams_team3:SetValue(DJ(T.customteams_team3))Z.Notify("Team size maxed",2)
else
 T.customteams_team3=y R()i.customteams_team3:SetText(G(T.customteams_team3,3))end
 end
})
local j=m:AddInput("inputteamstimer2",{Text="\226\143\179<font color=\'#FF9E1F\'>Switch Delay</font>",Default=T.customteams_team3_delay;Numeric=true,AllowEmpty=true,Finished=false,ClearTextOnFocus=false,Placeholder="1s",Tooltip="Delay before team is switched",Callback=
function(G)
local V=iJ(G)if not V then
 
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Enter a number above 0",3)
return end
 T.customteams_team3_delay=V R()end
})m:AddToggle("cteam3enable",{Text="\240\159\148\183 Enable Team 3",Default=T.customteams_team3_enabled;Tooltip="Enables team 3";Callback=
function(G)T.customteams_team3_enabled=G R()end
})m:AddDivider()m:AddDivider()i.customteams_team4=m:AddDropdown("customteams_team4",{Values={},Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=10;Text=G(T.customteams_team4,4),Tooltip="Select pets for this team.";Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.customteams_team4:SetValue(DJ(T.customteams_team4))Z.Notify("Team size maxed",2)
else
 T.customteams_team4=y R()i.customteams_team4:SetText(G(T.customteams_team4,4))end
 end
})
local c=m:AddInput("inputteamstimer4",{Text="\226\143\179<font color=\'#FF9E1F\'>Switch Delay</font>",Default=T.customteams_team4_delay,Numeric=true,AllowEmpty=true;Finished=false,ClearTextOnFocus=false;Placeholder="1s",Tooltip="Delay before team is switched",Callback=
function(G)
local V=iJ(G)if not V then
 
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Enter a number above 0",3)
return end
 T.customteams_team4_delay=V R()end
})m:AddToggle("cteam3enable",{Text="\240\159\148\183 Enable Team 4",Default=T.customteams_team3_enabled,Tooltip="Enables team 4",Callback=
function(G)T.customteams_team3_enabled=G R()end
})m:AddDivider()
local J=m:AddDropdown("_ddBoostMutpetteamwlteams",{Values={},Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\164\150 Boost Selected Pets";Tooltip="Select pets to target, if nothing is selected then
 it applies to all active pets",Callback=
function(G)if G==nil then
 
return end
 T.customteams_boost_teamunits=G R()end
})J:SetValues(Z.all_pets_names_list)J:SetValue(T.customteams_boost_teamunits)
local d=m:AddDropdown("_ddBoostlevelingcustom",{Values={};Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=6,Text="\240\159\146\138 Pet Boosts";Tooltip="Boosts are applied to all teams",Callback=
function(G)T.customteams_boosts=G R()end
})d:SetValues(F(H.boosts_list))d:SetValue(T.customteams_boosts)m:AddToggle("boostleveltargetteamcustom",{Text="\240\159\154\128 Enable Boosts";Default=T.customteams_boosts_enabled,Tooltip="If enabled boosts will be applied when team is placed and always";Callback=
function(G)T.customteams_boosts_enabled=G R()end
})m:AddButton({Text="\240\159\159\162 Start Teams";Func=
function()z.StartCustomTeams()end
})m:AddButton({Text="\240\159\148\180 Stop Teams";Func=
function()z.StopCustomTeams()end
})m:AddSpacer(100)end
 
local K=""if B then
 if Z.GetCheckIfPro()then
 B:AddLabel({Text="\240\159\146\161Shows egg details",DoesWrap=true})
local G 
local V=
function(V)
local y=Z.GetEggDetails(V)if G then
 G:SetText(y)end
 end
 
local y=B:AddDropdown("petdatadropdegg",{Values={};Default={};Multi=false;Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\165\154 Select Egg",Callback=
function(G)if G==nil then
 
return end
 V(G)K=G end
})y:SetValues(W.AllEggNamesList)y:SetValue(K)G=B:AddLabel({Text="";DoesWrap=true})B:AddButton({Text="<font color=\'#00FF04\'>Copy</font>",Func=
function()Z.CopyEggDataString(K)end
})
else
 B:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})end
 B:AddSpacer(50)end
 
local b=""if l then
 if Z.GetCheckIfPro()then
 l:AddLabel({Text="\240\159\146\161Shows pet details",DoesWrap=true})
local G 
local V=
function(V)
local y=Z.GetPetDetails(V)if G then
 G:SetText(y)end
 end
 
local y=l:AddDropdown("petdatadropd",{Values={},Default={},Multi=false,Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\164\150 Select Pet",Callback=
function(G)if G==nil then
 
return end
 V(G)b=G end
})y:SetValues(Z.all_pets_names_list)y:SetValue(b)G=l:AddLabel({Text="";DoesWrap=true})
else
 l:AddLabel({Text=Z.GetProMessage();DoesWrap=true})end
 l:AddSpacer(50)end
 if X then
 if not Z.GetCheckIfPro()then
 X:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})end
 X:AddLabel({Text="\240\159\146\161 Automatically level up pets using the Pet Age Machine.";DoesWrap=true})j.lbl_agebreak_status=X:AddLabel({Text="Waiting...",DoesWrap=true})
local G=
function()
local G=#T.agebreak.target_team 
local V=100 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00FF3C\"><b>\226\153\187\239\184\143 Target Pets</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 
local V=
function()
local G=#T.agebreak.dup_team 
local V=185 
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FF0066\"><b>\240\159\148\183 Duplicates</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 i.agebreaktarget_team=X:AddDropdown("agebreaktarget_team",{Values={},Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text=G(),Tooltip="Select pets to level",Callback=
function(V)if V==nil then
 
return end
 
local y={}
local j=true for G,V in pairs(V)do
 if V then
 
local V=xJ(G)if z.mut.IsNotInTargetTeamPet(V)then
 table.insert(y,V)
else
 j=false end
 end
 end
 if not j then
 i.agebreaktarget_team:SetValue(DJ(T.agebreak.target_team))Z.Notify("This pet is in your pet mutation (Elephant/Horseman) teams, please remove it from there.")
return end
 
local c=99 
local J=#y if J>c then
 i.agebreaktarget_team:SetValue(DJ(T.agebreak.target_team))Z.Notify("Team size maxed",2)
else
 T.agebreak.target_team=y R()i.agebreaktarget_team:SetText(G())end
 end
})i.agebreakdup_team=X:AddDropdown("agebreakdup_team",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text=V(),Tooltip="Select pets that will be used to level up your pets, these wil be consumed by the system 1 per level. You must add same type of pet. e.g. For Butterfly select butterflys";Callback=
function(G)if G==nil then
 
return end
 
local y={}
local j=true for G,V in pairs(G)do
 if V then
 
local V=xJ(G)if z.mut.IsNotInTargetTeamPet(V)then
 table.insert(y,V)
else
 j=false end
 end
 end
 if not j then
 i.agebreakdup_team:SetValue(DJ(T.agebreak.dup_team))Z.Notify("This pet is in your pet mutation (Elephant/Horseman) teams, please remove it from there.")
return end
 
local c=125 
local J=#y if J>c then
 i.agebreakdup_team:SetValue(DJ(T.agebreak.dup_team))Z.Notify("Team size maxed",2)
else
 T.agebreak.dup_team=y R()i.agebreakdup_team:SetText(V())end
 end
})X:AddLabel({Text="---------------";DoesWrap=false})X:AddToggle("baseweightlimitagebreak",{Text="\240\159\148\180BaseWeight Limit",Default=T.agebreak.avoid_weight_filter;Tooltip="If enabled, any pets with baseweight more than 3.5 KG will be ignored.",Callback=
function(G)T.agebreak.avoid_weight_filter=G R()end
})X:AddToggle("levellimitagebreak",{Text="\240\159\159\161Level Limit",Default=T.agebreak.avoid_age_filter;Tooltip="If enabled, any pet over the age of 99 will be ignored.",Callback=
function(G)T.agebreak.avoid_age_filter=G R()end
})X:AddLabel({Text="---------------",DoesWrap=false})X:AddDivider()X:AddToggle("toggleauto_skip_tokens",{Text="\240\159\146\176 Skip Token",Default=T.agebreak.auto_skip_tokens,Tooltip="If enabled, tries to skip using tokens.";Callback=
function(G)T.agebreak.auto_skip_tokens=G R()end
})X:AddDivider()
local 
function y()
local G=T.agebreak.max_level 
local V=string.format("<b><font color=\'#7327F5\'>\240\159\142\175 Target Lv.</font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local c c=X:AddInput("inputageMaxLevelCustom",{Text=y(),Default=T.agebreak.max_level,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="e.g. 101";Tooltip="Enter level, must be over 100",Callback=
function(G)
local V=jJ(G)if not V or V<=100 then
 Z.Notify("Invalid Level: "..G,3)c:SetValue(tostring(T.agebreak.max_level))
return end
 if V>125 then
 Z.Notify("Max level can\'t exceed 125: "..G,3)c:SetValue(tostring(T.agebreak.max_level))
return end
 if V>0 then
 T.agebreak.max_level=V R()c:SetText(y())end
 end
})X:AddDivider()
local J=X:AddToggle("eAgeBreak",{Text="\226\154\161 Enable Age Break";Default=T.agebreak.is_active_agebreak,Tooltip="Enables the Age Break System.",DisabledTooltip=Z.GetProMessage();Callback=
function(G)T.agebreak.is_active_agebreak=G R()end
})if not Z.GetCheckIfPro()then
 J:SetDisabled(true)end
 X:AddDivider()X:AddButton({Text="<font color=\'#00FF04\'>\226\153\187\239\184\143 Reload Teams</font>",Func=
function()cl()end
})X:AddSpacer(200)end
 if s then
 if Z.GetCheckIfPro()then
 s:AddLabel({Text="<b>\240\159\146\161 <font color=\'#8EEA8E\'>Enhancer</font></b>\n<font color=\'#FFD65A\'>Helps you recover from bad RNG.</font> ",DoesWrap=true})
local 
function G(G)
return string.format("#%02X%02X%02X",G.R*255,G.G*255,G.B*255)end
 
local V=s:AddToggle("genhancertoggle",{Text="\240\159\165\154 <font color=\'#6ECBFF\'>Enhance Egg Returns</font>",Default=T.fav_fruit_enhancer;Tooltip="May improve egg drops from hatching.";Callback=
function(G)T.fav_fruit_enhancer=G R()end
})
task.spawn(
function()while 
task.wait(.03)do
 if V then
 
local y=(tick()*.5)%1 
local Z=Color3.fromHSV(y,1,1)
local j=G(Z)
local i=string.format("\240\159\165\154 <font color=\'%s\'><b>Enhance Egg Returns</b></font>",j)if V.SetText then
 V:SetText(i)end
 
else
 break end
 end
 end
)s:AddLabel({Text="<b>\240\159\146\161 <font color=\'#8EEA8E\'>Auto Sell Fruit</font></b>\nAutomatically sells the fruit after hatching to refresh it. This will remove all fruits from your inventory. It only works if you have a maximum of two fruits in your inventory; if you have more than two, it will not sell.",DoesWrap=true})s:AddToggle("genhancertoggle",{Text="\240\159\165\154 <font color=\'#6ECBFF\'>Auto Sell Fruit</font>",Default=T.enhancer_auto_sellfruit;Tooltip="Sells fruit after hatching is complete. It will auto Unfav";Callback=
function(G)T.enhancer_auto_sellfruit=G R()end
})s:AddToggle("autofavenhancer",{Text="\226\157\164\239\184\143 <font color=\'#6ECBFF\'>Allow Auto Fav</font>",Default=T.enhancer_auto_favallow;Tooltip="fav/unfav fruits",Callback=
function(G)T.enhancer_auto_favallow=G R()end
})s:AddToggle("autofavenhancerUnequip",{Text="\240\159\141\137 <font color=\'#FFFFFF\'>Equip/Unequip Fruit</font>",Default=c.swap_enchancer,Tooltip="Will equip and unequip fruit.";Callback=
function(G)c.swap_enchancer=G n()end
})s:AddToggle("autofavenhancerUnequip",{Text="\226\157\164\239\184\143 <font color=\'#FFFFFF\'>Farm Fruit</font>",Default=c.farmfav_fruit_enhancer;Tooltip="Fav unfav farm fruit.";Callback=
function(G)c.farmfav_fruit_enhancer=G n()end
})
local 
function y()
local G=c.enhance_cooldown 
local V=string.format("<b><font color=\'#FFFFFF\'>\226\143\179 Delay </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local i i=s:AddInput("inputTimerEnhancer",{Text=y(),Default=c.enhance_cooldown;Numeric=true,AllowEmpty=true,Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 0.2",Tooltip="Delay for enhancer.";Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid number: "..G,3)i:SetValue(tostring(c.enhance_cooldown))
return end
 if V>0 then
 c.enhance_cooldown=V n()i:SetText(y())end
 end
})
local J=s:AddLabel({Text="<b>\240\159\146\161 <font color=\'#8EEA8E\'>Enhancer Pro</font></b>\n<font color=\'#FFD65A\'>Click start to start the system</font> <font color=\'#FF6B6B\'>Enhancer must be enabled for <font color=\'#FF0099\'>Enhancer Pro</font> to work</font>";DoesWrap=true})j.lbl_enhancerpro1=s:AddLabel({Text="Status: ",DoesWrap=true})j.lbl_enhancerpro1:SetVisible(false)
local d=s:AddButton({Text="\240\159\159\162 Start E-PRO";Tooltip="Starts the enhancer pro.";Func=
function()if T.nice_fruit then
 Z.Notify("\240\159\148\132 Enhancer is already running.",5)
return end
 if c.is_fall_event_running then
 Z.Notify("\226\157\140 Unable to start, Event is running. Please disable event.",5)
return end
 
local G=r.GetFruitCount()if G>0 then
 Z.Notify("\226\154\160\239\184\143 Unable to start enhancer. Please remove all fruits from your backpack! \226\154\160\239\184\143",5)
return end
 if T.rng_use_system then
 Z.Notify("\226\154\160\239\184\143 Unable to start enhancer. Please disable \240\159\155\161\239\184\143 RNG Protection \226\154\160\239\184\143",5)
return end
 if T.rng_egg_lowers_up then
 Z.Notify("\226\154\160\239\184\143 Unable to start enhancer. Please disable \226\153\187\239\184\143 Egg Adjustment \226\154\160\239\184\143",5)
return end
 if not T.is_running then
 Z.Notify("\226\154\160\239\184\143 Unable to start enhancer. Hatching system is not running. Please start the hatching system before you enable. \226\154\160\239\184\143",5)
return end
 T.nice_fruit=true R()Z.Notify("\226\156\133 Enhancer has started. ",5)end
})
local u=s:AddButton({Text="\240\159\148\180 Stop E-PRO";Tooltip="Stops the enhancer pro.",Func=
function()if not T.nice_fruit then
 Z.Notify("\226\154\160\239\184\143 Already stopped.",5)end
 T.nice_fruit=false R()Z.Notify("\226\157\140 Enhancer has stopped. ",5)end
})d:SetVisible(false)u:SetVisible(false)J:SetVisible(false)g:AddLabel({Text="-------------------------------",DoesWrap=true})g:AddLabel({Text="\226\153\187\239\184\143 If RNG is bad it will try to reconnect if you have rejoin enabled. \n Lowers egg count to place if bad rng is detect. \nWill increase as RNG improves.";DoesWrap=true})g:AddToggle("gExperimentsrngtoggle",{Text="\240\159\155\161\239\184\143 <font color=\'#6ECBFF\'>RNG Protection</font>";Default=T.rng_use_system;Tooltip="Activates the rng watcher system.",Callback=
function(G)T.rng_use_system=G R()end
})g:AddToggle("gExperimentsrngtoggleautoeead",{Text="\226\153\187\239\184\143 <font color=\'#00FFF2\'>Egg Adjustment</font>";Default=T.rng_egg_lowers_up;Tooltip="If enabled system can increase or decrease eggs.",Callback=
function(G)T.rng_egg_lowers_up=G R()end
})g:AddToggle("gExperimentsrngtoggleauto",{Text="\240\159\148\132 <font color=\'#F52765\'>RNG Auto Re-Join</font>";Default=T.rng_auto_rejoin,Tooltip="If bad rng is detected, auto rejoin will take place.",Callback=
function(G)T.rng_auto_rejoin=G R()end
})
else
 g:AddLabel({Text=Z.GetProMessage();DoesWrap=true})end
 end
 if e then
 e:AddLabel({Text="\226\154\160\239\184\143 If this mode is enabled. the system will teleport to the trading world after delay. To stop this. you must disable it here.";DoesWrap=true})if Z.GetCheckIfPro()then
 
local G=e:AddToggle("toggleTradeWorld",{Text="<b>\240\159\146\176 Trading Mode</b>";Default=J.is_trading_world_mode;Tooltip="Enables auto trading world teleport",Callback=
function(G)J.is_trading_world_mode=G h.SaveSessionSettings.SaveFile()end
})
else
 e:AddLabel({Text=Z.GetProMessage();DoesWrap=true})end
 end
 if a then
 
local G=50 
local V=
function(G)if not G then
 
return true end
 
local V={T.team1,T.team2,T.team3,T.team4}for V,y in ipairs(V)do
 if type(y)=="table"then
 for V,y in ipairs(y)do
 if y==G then
 
return false end
 end
 end
 end
 
return true end
 
local y=
function()
local V=#T.team_enhance_targets 
local y=G 
local Z=V>=y and"#FF5555"or"#00FF99"
local j=string.format("<font color=\"#00FF3C\"><b>\240\159\159\162 Targets</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",Z,V,y)
return j end
 i.dd_enhance_targets=a:AddDropdown("dd_enhance_targets",{Values={},Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10;Text=y(),Tooltip="Select targets for enhance";Callback=
function(j)if j==nil then
 
return end
 
local c={}
local J=true for G,y in pairs(j)do
 if y then
 
local y=xJ(G)if not V(y)then
 J=false end
 table.insert(c,y)end
 end
 if not J then
 Z.Notify("This pet is already in one of your teams.",2)i.dd_enhance_targets:SetValue(DJ(T.team_enhance_targets))
return end
 
local d=G 
local u=#c if u>d then
 i.dd_enhance_targets:SetValue(DJ(T.team_enhance_targets))Z.Notify("Team size maxed",2)
else
 T.team_enhance_targets=c R()i.dd_enhance_targets:SetText(y())end
 end
})
local j=a:AddToggle("toggleEnhanceEnableTargets",{Text="<b>Enable =</b>",Default=T.enhance_targets_enabled,Tooltip="Uses above selected";Callback=
function(G)T.enhance_targets_enabled=G R()end
})end
 if E then
 if not Z.GetCheckIfPro()then
 E:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})end
 E:AddLabel({Text="\226\154\160\239\184\143 Speeds up timers by over 90%. Use with caution, System stability is not guaranteed. Use at your own risk. \226\154\160\239\184\143";DoesWrap=true})
local G=E:AddToggle("toggleExtremeMode",{Text="<b><stroke color=\'#000000\' thickness=\'2\'><font color=\'#FF6A00\'>\240\159\148\165 OVERDRIVE MODE \240\159\148\165</font></stroke></b>",Default=T.hatch_fast_mode;Tooltip="Pushes the system to its limits for a <b><font color=\'#FFFF00\'>90% hatch speed boost!</font></b><br/><br/><i><font color=\'#FF0000\'><b>\226\154\160\239\184\143 WARNING:</b> System stability is not guaranteed. Use at your own risk.</font></i>",Callback=
function(G)T.hatch_fast_mode=G R()end
})E:AddDivider()
local V=E:AddToggle("toggleultradmode",{Text="<b><stroke color=\'#000000\' thickness=\'2\'><font color=\'#F527DA\'>\240\159\154\128 ULTRA MODE \240\159\154\128</font></stroke></b>",Default=T.hatch_ultramode;Tooltip="Unlocks maximum speed for hatching when eggs are ready. Only works if overdrive is active. High chance to lose eggs!";Callback=
function(G)T.hatch_ultramode=G R()end
})E:AddDivider()
local y=E:AddToggle("toggleCenterEggs",{Text="<b><stroke color=\'#000000\' thickness=\'2\'><font color=\'#DCFF00\'>\240\159\165\154 Middle Eggs </font></stroke></b>";Default=T.eggs_center_mode1,Tooltip="Tries to keep the eggs in middle of the farm.";Callback=
function(G)T.eggs_center_mode1=G R()end
})E:AddDivider()
local j=E:AddToggle("toggleclover_method",{Text="<b><stroke color=\'#003B2E\' thickness=\'2\'><font color=\'#00FFAA\'>\240\159\141\128 Clover Bonus MODE</font></stroke></b>";Default=T.clover_method,Tooltip="Removes all timers. removes unequip for teams if the clover boost provides maximum boosts.",DisabledTooltip="Pro Feature",Callback=
function(G)T.clover_method=G R()end
})E:AddDivider()
local i=E:AddToggle("toggleonlyplaceeggswhenempty",{Text="<b><stroke color=\'#2B1B00\' thickness=\'2\'><font color=\'#FFD166\'>\240\159\165\154 Place When Empty</font></stroke></b>",Default=T.onlyplaceeggswhenempty;Tooltip="Only places eggs when the farm is empty.";DisabledTooltip="Pro Feature";Callback=
function(G)T.onlyplaceeggswhenempty=G R()end
})E:AddDivider()
local 
function c()
return string.format("\240\159\146\176 Sell Delay <font color=\'#7CFC00\'>%s</font>s",T.delay_between_sell_seal)end
 
local J J=E:AddInput("input_Delaysealsell",{Text=c(),Default=T.delay_between_sell_seal,Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="1s";Tooltip="Delay between each Seal sell. Enter 0 to disable.";Callback=
function(G)
local V=iJ(G)if V and V>=3.01 then
 Z.Notify("Max allowed 3s ",3)J:SetValue(tostring(T.delay_between_hatch_koi))
return end
 if V and V>=0 then
 T.delay_between_sell_seal=V R()J:SetText(c())
else
 Z.Notify("Invalid delay: "..tostring(G),3)J:SetValue(tostring(T.delay_between_sell_seal))end
 end
})
local 
function d()
return string.format("\240\159\144\159 Hatch Delay <font color=\'#7CFC00\'>%s</font>s",T.delay_between_hatch_koi)end
 
local u u=E:AddInput("input_Delaykoihatch",{Text=d();Default=T.delay_between_hatch_koi,Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="1s",Tooltip="Delay between each Koi hatch. Enter 0 to disable.",Callback=
function(G)
local V=iJ(G)if V and V>=3.01 then
 Z.Notify("Max allowed 3s ",3)u:SetValue(tostring(T.delay_between_hatch_koi))
return end
 if V and V>=0 then
 T.delay_between_hatch_koi=V R()u:SetText(d())
else
 Z.Notify("Invalid delay: "..tostring(G),3)u:SetValue(tostring(T.delay_between_hatch_koi))end
 end
})E:AddDivider()E:AddDivider()E:AddDivider()
local q=E:AddToggle("auto_fav_after_hatch",{Text="\226\157\164\239\184\143Auto Fav Hatched";Default=T.auto_fav_after_hatch;Tooltip="If enabled the hatching system will fav the hatched pets and any protected pets.",Callback=
function(G)T.auto_fav_after_hatch=G R()end
})if not Z.GetCheckIfPro()then
 G:SetDisabled(true)V:SetDisabled(true)j:SetDisabled(true)i:SetDisabled(true)end
 E:AddDivider()end
 if g then
 if Z.GetCheckIfPro()then
 g:AddLabel({Text="<b>\240\159\146\161 <font color=\'#8EEA8E\'>Experiments</font></b>\n<font color=\'#FFD65A\'>These features are experimental.</font> <font color=\'#FF6B6B\'>They may work\226\128\166 or may not!</font>";DoesWrap=true})g:AddLabel({Text="\240\159\148\165 <font color=\'#FFD700\'>Automatically places eggs</font> as soon as they hatch. <font color=\'#A0A0A0\'>Reduces delay.</font>",DoesWrap=true})g:AddLabel({Text="--------------------------",DoesWrap=false})
else
 g:AddLabel({Text=Z.GetProMessage();DoesWrap=true})end
 end
 if q then
 if Z.GetCheckIfPro()then
 q:AddLabel({Text="\240\159\146\161 When a pet is about to cast, or has just cast, a skill \226\128\148 unequip and re-equip it. This can benefit certain pets.";DoesWrap=true})
local G=q:AddDropdown("dpPickPlaceUnits",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\164\150 Target Pets";Callback=
function(G)if G==nil then
 
return end
 T.pet_pickplacehatchingstage=G R()end
})G:SetValues(Z.all_pets_names_list)G:SetValue(T.pet_pickplacehatchingstage)
local 
function V()
local G=string.format("\226\140\155 Timer <font color=\'#7CFC00\'>%s</font>s",T.pet_pickplace_cooldownsecs)
return G end
 
local y y=q:AddInput("time_input_pickplace",{Text=V(),Default=T.pet_pickplace_cooldownsecs,Numeric=true,AllowEmpty=true,Finished=true,ClearTextOnFocus=false,Placeholder="1s",Tooltip="Picks when pet skill is under x secs";Callback=
function(G)
local j=iJ(G)if j and j>0 then
 T.pet_pickplace_cooldownsecs=j R()y:SetText(V())
else
 Z.Notify("Invalid time: "..G,3)y:SetValue(tostring(T.pet_pickplace_cooldownsecs))end
 end
})
local 
function j()
local G=string.format("\240\159\146\165 Delay B4 Unequip <b><font color=\'#FF00D7\'>%s/s</font></b>",T.pet_pickplace_activactiondelay)
return G end
 
local i i=q:AddInput("time_input_activedelay",{Text=j();Default=T.pet_pickplace_activactiondelay;Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="0.32",Tooltip="Delay before unequip is called.";Callback=
function(G)
local V=iJ(G)if V and V>0 then
 T.pet_pickplace_activactiondelay=V R()i:SetText(j())
else
 Z.Notify("Invalid time: "..G,3)i:SetValue(tostring(T.pet_pickplace_activactiondelay))end
 end
})
local 
function J()
local G=string.format("\240\159\142\175 Delay B4 Equip <b><font color=\'#FFEE00\'>%s/s</font></b>",T.pet_pickplace_equipe_delay)
return G end
 
local d d=q:AddInput("time_equipe_delaypp",{Text=J();Default=T.pet_pickplace_equipe_delay,Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="0.12";Tooltip="Delay before equip is called.",Callback=
function(G)
local V=iJ(G)if V and V>0 then
 T.pet_pickplace_equipe_delay=V R()d:SetText(J())
else
 Z.Notify("Invalid time: "..G,3)d:SetValue(tostring(T.pet_pickplace_equipe_delay))end
 end
})q:AddToggle("enableautopick",{Text="\226\154\161 Enable Pick/Place";Default=T.pet_pickplace_enabled;Tooltip="When enabled your pets will be unequipped and equipped again. if hatching system is running.",Callback=
function(G)T.pet_pickplace_enabled=G R()end
})q:AddToggle("enableautopickAnywhere",{Text="\226\154\160\239\184\143 Work Anywhere",Default=T.pet_pickplace_anywhere,Tooltip="When enabled this will apply everywhere";Callback=
function(G)T.pet_pickplace_anywhere=G R()end
})q:AddToggle("enableautopickThreading",{Text="\240\159\154\128 Enable Threading",Default=T.pet_pickplace_threading,Tooltip="When enabled pets are picked/placed simultaneously.",Callback=
function(G)T.pet_pickplace_threading=G R()end
})q:AddToggle("ranenableautopickUnequip",{Text="\226\153\187\239\184\143 Random Unequip Delay",Default=T.pet_pickplace_random,Tooltip="When enabled it will random your before unequip value. (-+ 10%)",Callback=
function(G)T.pet_pickplace_random=G R()end
})q:AddToggle("ranenableautopickxxequip",{Text="\240\159\148\132 Random Equip Delay";Default=T.pet_pickplace_random_equip,Tooltip="When enabled it will random your before equip value. (-+ 10%)",Callback=
function(G)T.pet_pickplace_random_equip=G R()end
})q:AddDivider()
local u=string.format("--<font color=\'#F50A9F\'> Advanced Overrides</font> -- ")q:AddLabel({Text="==========================";DoesWrap=false})q:AddLabel({Text=u,DoesWrap=false})q:AddLabel({Text="==========================",DoesWrap=false})q:AddDivider()
local g={enabled=false,unequip=.81;equip=.15}
local E 
local a 
local H 
local r 
local 
function Y()
local G={}for V,y in pairs(c.petpp_overrides)do
 if not y.enabled then
 continue end
 
local Z=W.StringToColor3Light(V)
local j=string.format("<font color=\'%s\'>%s</font>",Z,V)
local i=string.format("%s <font color=\"#9E9E9E\">(</font><font color=\"#FFE100\">%ss</font><font color=\"#9E9E9E\">/</font><font color=\"#81C784\">%ss</font><font color=\"#9E9E9E\">)</font>",j,y.unequip,y.equip)table.insert(G,i)end
 if r then
 r:SetText(table.concat(G,"\n"))end
 end
 
local 
function e(G)Y()if not G then
 
return end
 
local V=c.petpp_overrides[G]or g if E and(a and H)then
 if G==""or G==nil then
 E:SetVisible(false)a:SetVisible(false)H:SetVisible(false)Y()
return end
 E:SetValue(V.enabled)a:SetValue(tostring(V.unequip))H:SetValue(tostring(V.equip))E:SetVisible(true)a:SetVisible(true)H:SetVisible(true)end
 Y()end
 
local 
function s(G,V)Y()
local y=c.petpp_selected if not y then
 
return end
 if y==""then
 
return end
 if not c.petpp_overrides[y]then
 c.petpp_overrides[y]={enabled=g.enabled,unequip=g.unequip,equip=g.equip}end
 c.petpp_overrides[y][G]=V n()Y()end
 
local N N=q:AddDropdown("pickplaceoverrides",{Values={};Default={};Multi=false,Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\166\150 Override Pet";Callback=
function(G)if G==nil then
 
return end
 c.petpp_selected=G e(G)n()end
})N:SetValues(Z.all_pets_names_list)N:SetValue(c.petpp_selected)q:AddButton({Text="<font color=\'#00FF04\'>\226\157\140 Clear All Overrides</font>";Func=
function()c.petpp_overrides={}n()Y()end
})a=q:AddInput("OverrideUnequip",{Text="Unequip Delay";Default="0.81";Numeric=true,Finished=false;ClearTextOnFocus=false;Callback=
function(G)
local V=cJ(G)if V then
 s("unequip",V)end
 end
})H=q:AddInput("OverrideEquip",{Text="Equip Delay",Default="0.15";Numeric=true,Finished=false;ClearTextOnFocus=false;Callback=
function(G)
local V=cJ(G)if V then
 s("equip",V)end
 end
})E=q:AddToggle("OverrideEnabled",{Text="\240\159\146\165 Enable",Default=false;Callback=
function(G)s("enabled",G)end
})e(c.petpp_selected)q:AddDivider()q:AddDivider()
local X=string.format("= <font color=\'#84F906\'> Active Overrides</font> =")q:AddLabel({Text=X;DoesWrap=false})r=q:AddLabel({Text=" ";DoesWrap=true})Y()
else
 q:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})end
 q:AddSpacer(200)end
 if u then
 
local G=u:AddButton({Text="\240\159\159\162 Start";Func=
function()if not Z.GetCheckIfPro()then
 Z.Notify("Premium feature can\'t be run.")
else
 T.mut_system.is_ruuning=true z.StartThread()end
 end
})G:AddButton({Text="\240\159\148\180 Stop";Func=
function()z.StopThread()end
})
local V=u:AddButton({Text="<font color=\'#00FF04\'>\226\153\187\239\184\143 Reload Teams</font>";Func=
function()cl()end
})V:AddButton({Text="<font color=\'#FF0000\'>\226\157\140 UnEquip</font>",Func=
function()Z.UnEquipAllPets()end
})j.lbl_pet_mutation_status=u:AddLabel({Text="\240\159\148\180 Stopped";DoesWrap=true})if not Z.GetCheckIfPro()then
 u:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})
else
 u:AddLabel({Text="\240\159\146\165 [Headless Horseman and Elephant] Mutation System. <font color=\'#00BFFF\'><b>\226\132\185\239\184\143 Select mutations you want to apply to your pets.</b></font> Auto uses Cleansing Pet Shard if pets have a none matching mutation. (Only Target pet mutations are cleaned.) ";DoesWrap=true})end
 u:AddDivider()i.dropdown_petmutation_maxlevelteam=u:AddDropdown("dropdown_petmut_maxlevelteam",{Values={};Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text=z.mut_ui.GetText_MaxLevelTeam();Tooltip="Select max leveling team when pet has the required mutation. Will use xp team if this is empty.";Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if z.mut.IsNotInTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 if not y then
 i.dropdown_petmutation_maxlevelteam:SetValue(DJ(T.mut_system.maxlevel_team))Z.Notify("This pet is already selected in your other target team.")
return end
 
local j=PJ()-1 
local c=#V if c>j then
 i.dropdown_petmutation_maxlevelteam:SetValue(DJ(T.mut_system.maxlevel_team))Z.Notify("Team size maxed",2)
else
 T.mut_system.maxlevel_team=V R()i.dropdown_petmutation_maxlevelteam:SetText(z.mut_ui.GetText_MaxLevelTeam())end
 end
})i.dropdown_petmut_xpteam=u:AddDropdown("dropdown_petmut_xpteam",{Values={};Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10,Text=z.mut_ui.GetText_XpTeam(),Tooltip="XP Team, this team will level your pets to the set level set by you.",Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if z.mut.IsNotInTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 if not y then
 i.dropdown_petmut_xpteam:SetValue(DJ(T.mut_system.xpteam))Z.Notify("This pet is already selected in your other target team.")
return end
 
local j=PJ()-1 
local c=#V if c>j then
 i.dropdown_petmut_xpteam:SetValue(DJ(T.mut_system.xpteam))Z.Notify("Team size maxed",2)
else
 T.mut_system.xpteam=V R()i.dropdown_petmut_xpteam:SetText(z.mut_ui.GetText_XpTeam())end
 end
})
local 
function y()
local G={}
local V={["Rainbow Elephant"]=true,Elephant=true;["Headless Horseman"]=true,["Ghostly Headless Horseman"]=true,Termite=true}
local y=t.Inventory.GetPetInventory()for y,Z in pairs(y)do
 
local j=Z.PetData 
local i=Z.PetType 
local c=j.IsFavorite 
local J=j.Level 
local T=j.BaseWeight 
local d=k(T,J)if not z.mut.IsAllowedPet(y)then
 continue end
 if V[i]then
 continue end
 if J>99 then
 continue end
 table.insert(G,y)end
 
return G end
 i.dropdown_pettargetteam=u:AddDropdown("dropdown_pettargetteam",{Values={};Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Tooltip="Select pets you want to mutate!",Text=z.mut_ui.GetText_TargetTeam();Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if Z then
 if z.mut.IsAllowedPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 end
 if not y then
 i.dropdown_pettargetteam:SetValue(DJ(T.mut_system.targetteam))Z.Notify("This pet is already selected in your other mutation teams.")
return end
 
local j=200 
local c=#V if c>j then
 i.dropdown_pettargetteam:SetValue(DJ(T.mut_system.targetteam))Z.Notify("Team size maxed",2)
else
 T.mut_system.targetteam=V R()i.dropdown_pettargetteam:SetText(z.mut_ui.GetText_TargetTeam())end
 end
})
local c=u:AddButton({Text="\226\156\168 Select All",Tooltip="Selects all pets, Will not select elephants or horseman or level 99+";Func=
function()T.mut_system.targetteam={}
local G=y()T.mut_system.targetteam=G i.dropdown_pettargetteam:SetValue(DJ(T.mut_system.targetteam))R()end
})u:AddButton({Text="<font color=\'#ED2A00\'>Remove All</font>",Tooltip="Deselects all from list";Func=
function()T.mut_system.targetteam={}i.dropdown_pettargetteam:SetValue(DJ(T.mut_system.targetteam))R()end
})
local J=u:AddDropdown("ddPetMutXpTeamBoosts",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\146\138 Pet Boosts";Tooltip="Boosts will be applied when these teams are placed.",Callback=
function(G)T.pet_mut_xpteam_boosts={}for G,V in pairs(G)do
 T.pet_mut_xpteam_boosts[G]=V end
 R()end
})J:SetValues(F(H.boosts_list))J:SetValue(T.pet_mut_xpteam_boosts)
local d=u:AddDropdown("_ddBoostMutpetteamwl",{Values={},Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\164\150 Boost Selected Pets",Tooltip="Select pets to target, if nothing is selected then
 it applies to all active pets";Callback=
function(G)if G==nil then
 
return end
 T.pet_mut_xpteam_petlist=G R()end
})d:SetValues(Z.all_pets_names_list)d:SetValue(T.pet_mut_xpteam_petlist)u:AddToggle("_ddBoostMutpetxpteamtoggle",{Text="\240\159\154\128 Enable Boosts";Default=T.pet_mut_xpteam_boost_enabled;Tooltip="If enabled boosts will be applied when teams are placed.",Callback=
function(G)T.pet_mut_xpteam_boost_enabled=G R()end
})
local q=u:AddButton({Text="<font color=\'#00FF04\'>\226\153\187\239\184\143 Reload Teams</font>",Func=
function()cl()
task.wait(.3)end
})q:AddButton({Text="<font color=\'#FF0000\'>UnEquip</font>",Func=
function()Z.UnEquipAllPets()end
})u:AddLabel({Text="<font color=\'#ffff11\'>------------------------------</font>";DoesWrap=false})i.dropdown_petmutationteam=u:AddDropdown("dropdown_petmutationteam",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text=z.mut_ui.GetText_PetMutation(),Tooltip="Select team that will apply mutation to your pets. Select headless horseman here. ",Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if z.mut.IsNotInTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 if not y then
 i.dropdown_petmutationteam:SetValue(DJ(T.mut_system.mut_team))Z.Notify("This pet is already selected in your target team.")
return end
 
local j=PJ()-1 
local c=#V if c>j then
 i.dropdown_petmutationteam:SetValue(DJ(T.mut_system.mut_team))Z.Notify("Team size maxed",2)
else
 T.mut_system.mut_team=V R()i.dropdown_petmutationteam:SetText(z.mut_ui.GetText_PetMutation())end
 end
})i.dropdown_petbaseweightteam=u:AddDropdown("dropdown_petbaseweightteam",{Values={};Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text=z.mut_ui.GetText_PetBaseWeightTeam();Tooltip="Select team that will increase base weight for your pets. Select elephants here. ";Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if z.mut.IsNotInTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 if not y then
 i.dropdown_petbaseweightteam:SetValue(DJ(T.mut_system.baseweight_team))Z.Notify("This pet is already selected in your target team.")
return end
 
local j=PJ()-1 
local c=#V if c>j then
 i.dropdown_petbaseweightteam:SetValue(DJ(T.mut_system.baseweight_team))Z.Notify("Team size maxed",2)
else
 T.mut_system.baseweight_team=V R()i.dropdown_petbaseweightteam:SetText(z.mut_ui.GetText_PetBaseWeightTeam())end
 end
})
local g=u:AddDropdown("_ddBoostMutpetteam",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\146\138 Pet Boosts",Tooltip="Boosts will be applied when this team is placed.",Callback=
function(G)T.pet_mutation_boost_list={}for G,V in pairs(G)do
 T.pet_mutation_boost_list[G]=V end
 R()end
})g:SetValues(F(H.boosts_list))g:SetValue(T.pet_mutation_boost_list)
local E=u:AddDropdown("_ddBoostMutpetteamwl",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\164\150 Select Pets",Tooltip="Select pets to target, if nothing is selected then
 it applies to all active pets";Callback=
function(G)if G==nil then
 
return end
 T.pet_mutation_team_list=G R()end
})E:SetValues(Z.all_pets_names_list)E:SetValue(T.pet_mutation_team_list)u:AddToggle("_ddBoostMutpetteamtoggle",{Text="\240\159\154\128 Enable Boosts",Default=T.pet_mutation_team_boost_enabled,Tooltip="If enabled boosts will be applied when team is placed.";Callback=
function(G)T.pet_mutation_team_boost_enabled=G R()end
})
local 
function a()
local G=W.CountTable(T.mut_system.wanted)
local V=string.format("<font color=\'#F7C400\'><b>\240\159\167\170 Wanted Mutations</b></font>(%s)",G)
return V end
 u:AddDivider()
local r r=u:AddDropdown("dd_required_mut",{Values={};Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=a(),Callback=
function(G)if G==nil then
 
return end
 T.mut_system.wanted=G r:SetText(a())R()end
})r:SetValues(I(Y.GetAllMutationAsKeyPair()))r:SetValue(T.mut_system.wanted)u:AddDivider()
local 
function e()
local G=string.format("<font color=\'#FF00A6\'>\240\159\144\142Horseman LVL</font> <b>%s</b>",T.mut_system.level)
return G end
 
local 
function s()
local G=T.mut_system.lvl_baseweight 
local V=string.format("<b><font color=\'#FFD700\'>\240\159\144\152Elephant LVL </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local 
function N()
local G=T.mut_system.required_weight 
local V=string.format("<b><font color=\'#FF00A6\'>\240\159\144\152Elephant Weight </font></b><font color=\'#00FFFF\'>%s KG</font>",G)
return V end
 
local 
function X()
local G=T.mut_system.custom_max_level 
local V=string.format("<b><font color=\'#7327F5\'>\226\173\144MAX Lv.</font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local h h=u:AddInput("inputMaxLevelCustom",{Text=X(),Default=T.mut_system.custom_max_level;Numeric=true,AllowEmpty=true,Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 100";Tooltip="Max level override for max leveling team. Only override if needed.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Level: "..G,3)h:SetValue(tostring(T.mut_system.custom_max_level))
return end
 if V>0 then
 T.mut_system.custom_max_level=V R()h:SetText(X())end
 end
})
local l l=u:AddInput("ssinputMaxLevel",{Text=e();Default=T.mut_system.level;Numeric=true;AllowEmpty=true,Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 40",Tooltip="Enter a level you want your pets before mutation.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Level: "..G,3)l:SetValue(tostring(T.mut_system.level))
return end
 if V>0 then
 T.mut_system.level=V R()l:SetText(e())end
 end
})
local B B=u:AddInput("inputMaxLevelBaseWeight",{Text=s(),Default=T.mut_system.lvl_baseweight,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 40",Tooltip="Enter a level you want your pets before base weight team is added.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Level: "..G,3)B:SetValue(tostring(T.mut_system.lvl_baseweight))
return end
 if V>0 then
 T.mut_system.lvl_baseweight=V R()B:SetText(s())end
 end
})
local L L=u:AddInput("inputMaxBaseWeight",{Text=N();Default=T.mut_system.required_weight,Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="e.g. 6.049 KG";Tooltip="BaseWeight, if you have elephant with 5.5 base weight on its skill then
 enter 6.049 (You have to add 10% to get real weight 5.5 + 10% = 6.05 , takeaway small amount or your elephant will get stuck sometimes.)",Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid Weight: "..G,3)L:SetValue(tostring(T.mut_system.required_weight))
return end
 if V>0 then
 T.mut_system.required_weight=V R()L:SetText(N())end
 end
})u:AddDivider()u:AddToggle("togglelevelonlymode",{Text="<b><stroke color=\'#008F27\' thickness=\'1\'>\226\172\134\239\184\143 <font color=\'#00FF3C\'>Level Only Mode</font></stroke></b>",Default=T.mut_system.only_level_mode,Tooltip="Ignores all the requirements and puts system into leveling mode for any targets selected.";Callback=
function(G)T.mut_system.only_level_mode=G R()end
})u:AddDivider()u:AddToggle("lvlmaxmutatedpetsss",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\226\156\168 <font color=\'#00FFFF\'>Max Level</font> <font color=\'#FF69B4\'>Mutated</font></stroke></b>",Default=T.mut_system.max_level_enable;Tooltip="Levels up any pet \226\156\168 that gets the mutations you wanted, <b>automatically</b>!",Callback=
function(G)T.mut_system.max_level_enable=G R()end
})u:AddToggle("lvlmaxmutatedpetsssbatch",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\226\154\160\239\184\143 <font color=\'#00FFFF\'>Max Level</font> <font color=\'#17FFD1\'>Batch</font></stroke></b>",Default=T.mut_system.max_lvl_batch,Tooltip="If max leveling is enabled then
 it uses batch mode to level. If all the pets have reached required mutations and are not max leveled.",Callback=
function(G)T.mut_system.max_lvl_batch=G R()end
})u:AddToggle("enable_continuous_mutation",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\226\153\187\239\184\143 <font color=\'#00FFFF\'>Continuous</font> <font color=\'#17FFD1\'>Mutation</font></stroke></b>";Default=T.mut_system.continue_enable,Tooltip="If enabled then
 the loop will not restart instead pick and place new pets right away.";Callback=
function(G)T.mut_system.continue_enable=G R()end
})u:AddToggle("singleunitmutation",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\167\172 <font color=\'#00FFFF\'>Single Pet</font> <font color=\'#17FFD1\'>Limit</font></stroke></b>",Default=T.mut_system.single_unit_allowed,Tooltip="Limits mutations to just one pet at a time, regardless of available farm slots.",Callback=
function(G)T.mut_system.single_unit_allowed=G R()end
})u:AddToggle("baseweight_mode",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\144\152 <font color=\'#00FFFF\'>Elephant</font> <font color=\'#17FFD1\'>Mode</font></stroke></b>";Default=T.mut_system.is_baseweight_mode,Tooltip="If enabled the system will also increase the base weight if mutation is successful.",Callback=
function(G)T.mut_system.is_baseweight_mode=G R()end
})u:AddToggle("elephant_hot_swap",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\226\153\187\239\184\143 <font color=\'#00FFFF\'>Elephant</font> <font color=\'#17FFD1\'>Hot Swap</font></stroke></b>";Default=T.mut_system.elephant_hotswap,Tooltip="If enabled pets are hot swapped right away while base weight mutation is active";Callback=
function(G)T.mut_system.elephant_hotswap=G R()end
})u:AddToggle("elephantgm",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\154\128 <font color=\'#00FFFF\'>Elephant</font> <font color=\'#FFBB00\'>Grandmaster</font></stroke></b>";Default=T.mut_system.gm_sprinkler,Tooltip="If enabled places a grand master sprinkler",Callback=
function(G)T.mut_system.gm_sprinkler=G R()end
})u:AddButton({Text="\240\159\159\162 Start Pet Mutation",Func=
function()if not Z.GetCheckIfPro()then
 Z.Notify("Premium feature can\'t be run.")
else
 T.mut_system.is_ruuning=true z.StartThread()end
 end
})u:AddButton({Text="\240\159\148\180 Stop Pet Mutation",Func=
function()z.StopThread()end
})u:AddDivider()u:AddButton({Text="\226\157\140 Clear All Team Selections",Func=
function()z.StopThread()T.mut_system.mut_team={}T.mut_system.targetteam={}T.mut_system.xpteam={}T.mut_system.baseweight_team={}T.mut_system.maxlevel_team={}R()z.mut_ui.UpdateTeamsDropdowns()end
})u:AddDivider()u:AddDivider()if not Z.GetCheckIfPro()then
 i.dropdown_petmutation_maxlevelteam:SetVisible(false)i.dropdown_petmut_xpteam:SetVisible(false)i.dropdown_petmutationteam:SetVisible(false)i.dropdown_petbaseweightteam:SetVisible(false)end
 
local 
function m()
local G=T.mut_system.turbo_max_level 
local V=string.format("<b><font color=\'#00D7FF\'>Minimum Level: </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 u:AddLabel({Text="--- <b><font color=\'#FF00A6\'>\240\159\167\170 Experiments</font> <font color=\'#17FFD1\'>Lab \240\159\167\172</font></b> ---";DoesWrap=false})u:AddLabel({Text="\240\159\146\161 Intelligent team switching:\n\226\154\161 XP team below minimum level, max-level team above.\n\240\159\154\128 Speeds up leveling efficiently.\n\240\159\148\185 Works with Horseman & Elephant requirements.",DoesWrap=true})
local K K=u:AddInput("inputMinimumTurboLevel",{Text=m();Default=T.mut_system.turbo_max_level;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="e.g. 40",Tooltip="Set the level at which the system switches from XP team to max-level team.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Level: "..G,3)K:SetValue(tostring(T.mut_system.turbo_max_level))
return end
 if V>0 then
 T.mut_system.turbo_max_level=V R()K:SetText(m())end
 end
})u:AddToggle("intelligentteams",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\167\170 <font color=\'#00FFFF\'>Enable</font> <font color=\'#17FFD1\'>Intelligent Teams</font></stroke></b>";Default=T.mut_system.turbo_xp_teams,Tooltip="Enable to let the system intelligently boost leveling and increase base weight when mutations succeed.",Callback=
function(G)T.mut_system.turbo_xp_teams=G R()end
})u:AddDivider()u:AddDivider()u:AddLabel({Text="------",DoesWrap=false})u:AddToggle("disablehorsemanteam",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\148\180 <font color=\'#ED2200\'>Disable</font> <font color=\'#B900FF\'>Horseman</font></stroke></b>";Default=T.mut_system.disable_horseman,Tooltip="If set horseman will not be used.";Callback=
function(G)T.mut_system.disable_horseman=G R()end
})u:AddDivider()u:AddLabel({Text="\240\159\149\181\239\184\143 Monitoring:\n\240\159\148\141 Actively watches your active pets. If any unapproved or extra pet is detected, it will be removed automatically.",DoesWrap=true})u:AddToggle("disablehorsemanteamActively",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\148\141<font color=\'#4A9AFF\'>Realtime</font> <font color=\'#FF5757\'>Monitoring</font></stroke></b>",Default=T.mut_system.realtime_monitor_system;Tooltip="When enabled it will remove pets that are not part of the module system.";Callback=
function(G)T.mut_system.realtime_monitor_system=G R()end
})u:AddDivider()u:AddDivider()u:AddLabel({Text="\240\159\154\168 Restart System:\n\240\159\148\132 Refresh every 15 minutes to prevent freezes and automatically recover from unexpected issues.",DoesWrap=true})u:AddToggle("disablehorsemanteamRestart",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\148\141<font color=\'#00FFB3\'>Refresh</font> <font color=\'#E5FF00\'>System</font></stroke></b>",Default=T.mut_system.timeout_system;Tooltip="If enabled it will Refresh the system every set time.",Callback=
function(G)T.mut_system.timeout_system=G R()end
})u:AddDivider()u:AddLabel({Text="------";DoesWrap=false})i.dropdown_petfiller_team=u:AddDropdown("dropdown_petfiller_team",{Values={},Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text=z.mut_ui.GetText_FillerTeam();Tooltip="Filler Team, Any pets selected here will be used to fill in any missing slots in your teams.Won\'t work with Continuous Mode, Won\'t work if single mode active, won\'t work on mutation stages. Only works for XP and Max leveling.",Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if z.mut.IsNotInTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 if not y then
 i.dropdown_petfiller_team:SetValue(DJ(T.mut_system.filler_team))Z.Notify("This pet is already selected in your other target team.")
return end
 
local j=PJ()-1 
local c=#V if c>j then
 i.dropdown_petfiller_team:SetValue(DJ(T.mut_system.filler_team))Z.Notify("Team size maxed",2)
else
 T.mut_system.filler_team=V R()i.dropdown_petfiller_team:SetText(z.mut_ui.GetText_FillerTeam())end
 end
})u:AddDivider()u:AddSpacer(300)end
 
task.spawn(
function()
local y=G.TabLabel if y then
 while true do
 
local G=(tick()%5)/5 
local Z=Color3.fromHSV(G,1,1)y.TextColor3=Z V.RunService.Heartbeat:Wait()end
 
else
 
warn("Could not find TabLabel! Did you add \'TabLabel = TabLabel\' to the library?")end
 end
)if y then
 y:AddToggle("autogift",{Text="Auto Accept Gift",Default=T.is_auto_accept_gift;Tooltip="Auto accepts gifts.",Callback=
function(G)T.is_auto_accept_gift=G R()end
})y:AddDivider()y:AddToggle("autogift",{Text="Auto Accept <font color=\'#F50072\'>Trade</font>";Default=T.giftpets.trade_auto_accept;Tooltip="Auto accepts trade ticket requests.",Callback=
function(G)T.giftpets.trade_auto_accept=G R()end
})y:AddDivider()
local G=y:AddDropdown("dd_giftpets_allowlist",{Values={};Default={};Multi=true,Text="\240\159\166\150 Pets",Searchable=true,MaxVisibleDropdownItems=10,Changed=
function(G)if not G then
 
return end
 T.giftpets.allow_pet_list=G R()end
})G:SetValues(Z.all_pets_names_list)G:SetValue(T.giftpets.allow_pet_list)
local V=y:AddButton({Text="Select All";Func=
function()T.giftpets.allow_pet_list={}for G,V in ipairs(Z.all_pets_names_list)do
 T.giftpets.allow_pet_list[V]=true end
 G:SetValue(T.giftpets.allow_pet_list)R()end
})V:AddButton({Text="<font color=\'#FF3D17\'>Remove All</font>",Func=
function()T.giftpets.allow_pet_list={}G:SetValue(T.giftpets.allow_pet_list)R()end
})
local j=y:AddDropdown("dd_giftpet_mut",{Values={};Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\167\172 Mutations";Callback=
function(G)if G==nil then
 
return end
 T.giftpets.allow_mutation_list=G R()end
})j:SetValues(I(Y.AllMutationsList))j:SetValue(T.giftpets.allow_mutation_list)
local c=
function()
local G=string.format("Min Level <font color=\'#47FF40\'>%s</font>",T.giftpets.min_age)
return G end
 
local J=
function()
local G=string.format("Max Level <font color=\'#FF4065\'>%s</font>",T.giftpets.max_age)
return G end
 
local d d=y:AddInput("input_min_age",{Text=c();Default=T.giftpets.min_age,Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false;Placeholder="e.g 1";Tooltip="Specify minimum Pet Age";Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)d:SetValue(tostring(T.giftpets.min_age))
return end
 if V>T.giftpets.max_age then
 Z.Notify("Can\'t be more than max age ",3)d:SetValue(tostring(T.giftpets.min_age))
return end
 T.giftpets.min_age=V R()d:SetText(c())end
})
local u u=y:AddInput("input_max_age",{Text=J(),Default=T.giftpets.max_age;Numeric=true,AllowEmpty=true,Finished=true;ClearTextOnFocus=false,Placeholder="e.g 1";Tooltip="Specify maximum Pet Age",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)u:SetValue(tostring(T.giftpets.max_age))
return end
 if V<T.giftpets.min_age then
 Z.Notify("Can\'t be lower than min age ",3)u:SetValue(tostring(T.giftpets.max_age))
return end
 T.giftpets.max_age=V R()u:SetText(J())end
})
local q=
function()
local G=string.format("Min BaseWeight <font color=\'#47FF40\'>%s</font>",T.giftpets.min_weight)
return G end
 
local g=
function()
local G=string.format("Max BaseWeight <font color=\'#FF4065\'>%s</font>",T.giftpets.max_weight)
return G end
 
local E E=y:AddInput("input_min_weight",{Text=q();Default=T.giftpets.min_weight;Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g 1",Tooltip="Specify minimum Pet BaseWeight";Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)E:SetValue(tostring(T.giftpets.min_weight))
return end
 if V>T.giftpets.max_weight then
 Z.Notify("Can\'t be more than max weight",3)E:SetValue(tostring(T.giftpets.min_weight))
return end
 T.giftpets.min_weight=V R()E:SetText(q())end
})
local a a=y:AddInput("input_max_weight",{Text=g();Default=T.giftpets.max_weight;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="e.g 1";Tooltip="Specify maximum BaseWeight",Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)a:SetValue(tostring(T.giftpets.max_weight))
return end
 if V<T.giftpets.min_weight then
 Z.Notify("Can\'t be lower than min weight ",3)a:SetValue(tostring(T.giftpets.max_weight))
return end
 T.giftpets.max_weight=V R()a:SetText(g())end
})i.dd_playertargets_giftpets=y:AddDropdown("dd_playertargets_giftpets",{Values={},Default={},Multi=true,Text="\226\154\148\239\184\143Target Players",Searchable=true;MaxVisibleDropdownItems=10,Changed=
function(G)if not G then
 
return end
 T.giftpets.allow_player_targets=G R()end
})y:AddButton({Text="\240\159\148\132Reload Players",Func=
function()Z.UpdateDropDownPlayersGiftPets()Z.Notify("Players reloaded")end
})
local H=y:AddToggle("toggleAllowFav",{Text="\226\157\164\239\184\143 Auto Unfav",Default=T.giftpets.allow_fav,Tooltip="Auto Unfav pets before sending them.";Callback=
function(G)T.giftpets.allow_fav=G R()end
})y:AddDivider()
local r=y:AddToggle("toggleautotradeaccpet",{Text="\240\159\142\159\239\184\143Auto Confirm/Accept";Default=T.giftpets.auto_confirm_accept;Tooltip="When enabled it auto accepts and confirms when target accepts";Callback=
function(G)T.giftpets.auto_confirm_accept=G R()end
})y:AddDivider()
local e=y:AddToggle("toggleEnableGiftting",{Text="\226\154\161Enable GiftSystem",Default=T.giftpets.enabled_gift_pets;Tooltip="When enabled it finds and keeps sending to selected targets",Callback=
function(G)T.giftpets.enabled_gift_pets=G R()end
})y:AddDivider()
local s=y:AddToggle("toggleEnableGiftting",{Text="\240\159\142\159\239\184\143Enable TradeTicket",Default=T.giftpets.enabled_auto_trade,Tooltip="When enabled it finds and adds pets following gift settings";Callback=
function(G)T.giftpets.enabled_auto_trade=G R()end
})y:AddDivider()
local N=y:AddToggle("xsend_trading_ticket_auto",{Text="\240\159\142\159\239\184\143 Auto Send Ticket \240\159\167\172";Default=T.giftpets.send_trading_ticket_auto,Tooltip="When enabled it will send trade tickets to the target users and also auto accept after adding the pets.",Callback=
function(G)T.giftpets.send_trading_ticket_auto=G R()end
})y:AddDivider()y:AddDivider()y:AddDivider()end
 end
 Z.PetTeamsUi=
function()
local G=y9:AddTab({Name="<font color=\'#FF3F00\'>Hatching</font> Teams";Description="<font color=\'#FFFFCC\'>Manage teams used for hatching pets efficiently.</font>",Icon="cat"})
local V=G:AddLeftGroupbox("Egg Reduction [<font color=\'#00CED1\'>Peacock</font>]","timer-reset")
local y=G:AddRightGroupbox("Hatch Egg [<font color=\'#FF4500\'>Koi</font>]","egg")
local J=G:AddRightGroupbox("Sell Egg [<font color=\'#1E90FF\'>Seal</font>]","badge-dollar-sign")
local d=G:AddLeftGroupbox("Pet Size [<font color=\'#32CD32\'>Bronto</font>]","turtle")
local u=G:AddLeftGroupbox("Options","circle-ellipsis")
local q=G:AddRightGroupbox("Auto Rejoin","list-restart")
local g=G:AddRightGroupbox("Pet Overrides","atom")
local a=G:AddLeftGroupbox("\240\159\148\139 <font color=\'#59FF00\'>Sticky Pets</font>","redo-2")
local r=G:AddLeftGroupbox("\240\159\167\172 Pet <font color=\'#FF0084\'>Mutations</font>","boxes")
local e=G:AddRightGroupbox("<font color=\'#59FF00\'>Egg</font> Overrides","egg")if e then
 e:AddLabel({Text="\226\154\160\239\184\143 Override eggs, Once eggs fall below set amount it will auto stop hatching that egg and move to next egg in the list.";DoesWrap=true})
local G=""
local V=0 
local y y=e:AddDropdown("dd_egglimiter",{Values={};Default={},Multi=false,Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\165\154 Eggs",Callback=
function(V)if V==nil then
 G=""
return end
 G=V end
})y:SetValues(W.AllEggNamesList)
local 
function j()
return string.format("\240\159\148\180 <font color=\'#FFFFFF\'><b>Limit Amount</b></font><stroke color=\'#6B5E0A\' th=\'2\' tr=\'0.5\' joins=\'round\' sizing=\'fixed\'></stroke>")end
 
local i=500 V=i 
local J J=e:AddInput("input_egglimitamount",{Text=j(),Default=i,Numeric=true,AllowEmpty=true,Finished=false,ClearTextOnFocus=false,Placeholder="e.g. 1",Tooltip="Enter value to limit eggs",Callback=
function(G)
local y=jJ(G)if y and y>0 then
 V=y J:SetText(j())
else
 Z.Notify("Invalid "..G,3)J:SetValue(i)V=i end
 end
})
local 
function T()if not G then
 Z.Notify("Select a egg ")
return end
 if G==""then
 Z.Notify("Select a egg ")
return end
 if V<=0 then
 Z.Notify("Enter valid amount")
return end
 c.egg_override[G]=V n()end
 
local 
function d()c.egg_override[G]=nil n()end
 
local u=e:AddButton({Text="\226\156\133 Add";Func=
function()T()end
})u=e:AddButton({Text="\226\157\140 Remove",Func=
function()d()end
})e:AddToggle("toggleEnabledEggLimiter",{Text="\226\154\161 Enable",Default=c.egg_override_enabled,Tooltip="When enabled, when eggs lower than set amount they will be skipped.",Callback=
function(G)c.egg_override_enabled=G n()end
})e:AddDivider()e:AddLabel({Text="--- ACTIVE OVERRIDES --- ";DoesWrap=false})
local q q=e:AddLabel({Text="-",DoesWrap=true})
local 
function g()
local G={}for V,y in pairs(c.egg_override)do
 
local Z=W.StringToColor3Light(V)
local j=string.format("<font color=\'%s\'>%s</font>",Z,V)
local i=string.format("%s <font color=\"#9E9E9E\">(</font><font color=\"#FFE100\">%s</font><font color=\"#9E9E9E\">)</font>",j,y)table.insert(G,i)end
 if q then
 q:SetText(table.concat(G,"\n"))end
 end
 
task.spawn(
function()while true do
 
task.wait(.5)g()end
 end
)e:AddSpacer(200)end
 if r then
 r:AddLabel({Text="\226\154\160\239\184\143 Select mutations to keep on pets that are hatched.";DoesWrap=true})
local G=r:AddDropdown("dpMutationPetFilter",{Values={};Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10;Text="\240\159\166\150 Pet Type",Callback=
function(G)if G==nil then
 
return end
 T.mutation_hatch_petfilter=G R()end
})G:SetValues(Z.all_pets_names_list)G:SetValue(T.mutation_hatch_petfilter)r:AddDivider()r:AddLabel({Text="<font color=\'#00BFFF\'><b>\226\132\185\239\184\143 Select mutations you want to keep.</b></font>";DoesWrap=true})
local V V=r:AddDropdown("dropdown_mutations_listx",{Values={};Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\167\172 Mutations",Callback=
function(G)if G==nil then
 
return end
 T.mutation_hatch_mutlist=G R()end
})V:SetValues(I(Y.AllMutationsList))V:SetValue(T.mutation_hatch_mutlist)r:AddDivider()r:AddToggle("togglepetdelay",{Text="\240\159\164\150 Enable Mutation";Default=T.mutation_hatch_pet_enabled;Tooltip="When enabled, Selected pets will not be sold if they have the mutation on them.";Callback=
function(G)T.mutation_hatch_pet_enabled=G R()end
})r:AddSpacer(200)end
 if a then
 a:AddLabel({Text="\226\154\160\239\184\143 Pets selected here will be ignored by the unequip system. This only applies during hatching.";DoesWrap=true})
local G=4 
local V=PJ()
local y=
function()
local V=#T.team_bypass_alwaysactive 
local y=G 
local Z=V>=y and"#FF5555"or"#00FF99"
local j=string.format("<font color=\"#00FF3C\"><b>Sticky Pets</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",Z,V,y)
return j end
 i.dd_bypass_teamsactive=a:AddDropdown("dd_bypass_teamsactive",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text=y(),Tooltip="Select for active team";Callback=
function(V)if V==nil then
 
return end
 
local j={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(j,V)end
 end
 
local c=G 
local J=#j if J>c then
 i.dd_bypass_teamsactive:SetValue(DJ(T.team_bypass_alwaysactive))Z.Notify("Team size maxed",2)
else
 T.team_bypass_alwaysactive=j R()i.dd_bypass_teamsactive:SetText(y())end
 end
})
local j j=a:AddToggle("togglegStickyPets",{Text="Enable Sticky Pets";Default=T.team_bypass_enabled,Tooltip="When enabled pets selected here are ignored by unequip system.";DisabledTooltip="Premium feature!";Callback=
function(G)if G then
 if#W.GetKoiTeam()>=V then
 Z.Notify("\226\157\140 Koi team has no room! Please amount (selected in your sticky pets, if you selected 2, remove 2) pets from your Koi team!",5)j:SetValue(false)
return end
 end
 T.team_bypass_enabled=G R()end
})if not Z.GetCheckIfPro()then
 j:SetDisabled(true)end
 end
 if g then
 g:AddLabel({Text="\226\154\160\239\184\143 Override pets, anything set here is applied everywhere teams are placed. Selected pets will be placed after a delay when team placement is called. Usedful for pets: [Ruby Squid]",DoesWrap=true})
local G=g:AddDropdown("dpPetOverrideDelay",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\147\161 Delay Pets",Callback=
function(G)if G==nil then
 
return end
 T.overridepets.selected_pets=G R()end
})G:SetValues(Z.all_pets_names_list)G:SetValue(T.overridepets.selected_pets)
local 
function V()
local G=tonumber(T.overridepets.delay_amount)or 2.5 
return string.format("\226\143\176 <font color=\'#FFFFFF\'><b>Current Delay</b></font><stroke color=\'#6B5E0A\' th=\'2\' tr=\'0.5\' joins=\'round\' sizing=\'fixed\'><font color=\'#E7E734\'><b> %s</b></font>s</stroke>",G)end
 
local y y=g:AddInput("input_overridepets_delay_am",{Text=V(),Default=T.overridepets.delay_amount,Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g. 0.5",Tooltip="Input delay for these pets. Press Enter to see";Callback=
function(G)
local j=iJ(G)if j and j>0 then
 T.overridepets.delay_amount=j R()y:SetText(V())
else
 Z.Notify("Invalid "..G,3)y:SetValue(tostring(T.overridepets.delay_amount))end
 end
})g:AddToggle("togglepetdelay",{Text="\240\159\164\150 Enable Pet Delay",Default=T.overridepets.is_enabled,Tooltip="When enabled, Selected pets will be placed with a delay.",Callback=
function(G)T.overridepets.is_enabled=G R()end
})g:AddSpacer(200)end
 q:AddLabel({Text="\226\154\160\239\184\143 Auto rejoin after set options.";DoesWrap=true})
local 
function s()
local G=tonumber(T.auto_rejoin_after_hatchcount)
return string.format("\226\156\168 <font color=\'#FFFFFF\'><b>Rejoin Hatch Count</b></font><stroke color=\'#6B5E0A\' th=\'2\' tr=\'0.5\' joins=\'round\' sizing=\'fixed\'><font color=\'#E7E734\'><b> %s</b></font></stroke>",G)end
 
local N N=q:AddInput("input_hatchcount",{Text=s(),Default=T.auto_rejoin_after_hatchcount,Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false,Placeholder="e.g. 4";Tooltip="Enter when the system should rejoin server. When hatch count meets this requirement the game will try to rejoin.";Callback=
function(G)
local V=jJ(G)if V and V>=1 then
 T.auto_rejoin_after_hatchcount=V R()N:SetText(s())
else
 N:SetValue(tostring(T.auto_rejoin_after_hatchcount))end
 end
})q:AddToggle("toggleAutoREjoin",{Text="\240\159\148\132 Enable Auto Rejoin",Default=T.auto_restartjoin_server;Tooltip="When enabled, it will rejoin following the settings set.",Callback=
function(G)if G then
 Z.rejoin_hatch_count=0 end
 T.auto_restartjoin_server=G R()end
})u:AddToggle("hatchrejoinbugged",{Text="<b><stroke color=\'#000000\' thickness=\'2\'><font color=\'#FFFFFF\'>\240\159\148\132 Rejoin when server is bugged.</font></stroke></b>",Default=T.rejoin_server_bugged,Tooltip="Slow mode for hatching.",Callback=
function(G)T.rejoin_server_bugged=G R()end
})u:AddToggle("toggleslowMode",{Text="<b><stroke color=\'#000000\' thickness=\'2\'><font color=\'#F40FFF\'>\226\134\148\239\184\143 SLOW MODE</font></stroke></b>";Default=T.hatch_slow_mode,Tooltip="Slow mode for hatching.";Callback=
function(G)T.hatch_slow_mode=G R()end
})u:AddDivider()
local X=u:AddToggle("togglesellmaxinv",{Text="\240\159\154\168 Max Inventory Sell";Default=T.hatch_sell_delayed;Tooltip="Only sells if you are going to exceed inventory limit for next hatch. Has no effect if [Only Sell Hatched Pets \240\159\155\161\239\184\143] is enabled.";Callback=
function(G)T.hatch_sell_delayed=G R()end
})u:AddDivider()u:AddToggle("gExperimenteggstoggle",{Text="\226\156\168 <font color=\'#6ECBFF\'>Fast Egg Placement</font>";Default=T.fast_egg_placement;Tooltip="<font color=\'#DADADA\'>When enabled, missing eggs are placed <font color=\'#7CFF6E\'>immediately</font> after hatching.</font>",Callback=
function(G)T.fast_egg_placement=G R()end
})u:AddDivider()
local h=u:AddToggle("toverridebackpack",{Text="Only Sell Hatched Pets \240\159\155\161\239\184\143",Default=T.is_sell_only_hatch_pet,Tooltip="Enable this to only sell hatched pets; all other backpack pets will be auto-favourited.",Callback=
function(G)T.is_sell_only_hatch_pet=G R()end
})u:AddDivider()
local l=u:AddToggle("tooglegm",{Text="\240\159\154\191 Grandmaster Sprinkler",Default=c.is_auto_place_sprinkler_hatch;Tooltip="Global: Auto places Grandmaster Sprinkler if you don\'t have one on the farm.",Callback=
function(G)c.is_auto_place_sprinkler_hatch=G n()end
})u:AddDivider()
local B=u:AddToggle("toggleBatchHatch",{Text="Batch Hatching";Default=T.is_hatch_in_batch;Tooltip="Hatch all the eggs together when they are ready.";Callback=
function(G)T.is_hatch_in_batch=G R()Z.Notify("Updated",3)end
})u:AddDivider()
local L=u:AddToggle("toggleEggView",{Text="Egg Esp",Default=T.is_egg_esp;Tooltip="Show/Hide Egg Info";Callback=
function(G)T.is_egg_esp=G R()Z.Notify("Updated",3)end
})u:AddDivider()u:AddToggle("toggleAlwaysActive",{Text="\240\159\154\128 Always Active Boosts",Default=T.always_active_boosts;Tooltip="If enabled, hatching and mutation try to apply boosts every 10s",Callback=
function(G)T.always_active_boosts=G R()end
})u:AddDivider()u:AddToggle("toggleRestartHatching",{Text="\240\159\148\132 Restart Hatching",Default=T.restart_hatching_system;Tooltip="If enabled, Hatching system will restart every 5mins",Callback=
function(G)T.restart_hatching_system=G R()end
})u:AddDivider()u:AddToggle("togglesyncpingmode",{Text="\240\159\147\161 Sync Ping";Default=T.sync_pingmode;Tooltip="If enabled, Hatching will add extra time based on the ping rate.",Callback=
function(G)T.sync_pingmode=G R()end
})u:AddDivider()u:AddToggle("togglemodeautosell",{Text="\240\159\146\176<b>Sell All Mode</b>",Default=T.sellallunfav,Tooltip="If enabled, Hatching will use sell all.",Callback=
function(G)T.sellallunfav=G R()end
})u:AddDivider()
local m=u:AddButton({Text="\226\153\187\239\184\143 Reload Pet Team";Func=
function()cl()Z.Notify("Reloaded Pets",1)end
})V:AddLabel({Text="\226\173\144 Speeds up egg timer. Pets: <font color=\'#FFD700\'>Mimics</font>, <font color=\'#00CED1\'>Peacock</font>, <font color=\'#A52A2A\'>Bald Eagles</font>";DoesWrap=true})J:AddLabel({Text="\226\173\144 Placed before selling. Pets: <font color=\'#1E90FF\'>Seal</font> max 50%";DoesWrap=true})y:AddLabel({Text="\226\173\144 Placed before hatching eggs. Pets: <font color=\'#FF4500\'>Koi</font> max 50%",DoesWrap=true})d:AddLabel({Text="\226\173\144 For bigger pet hatch. Pets: <font color=\'#32CD32\'>Brontosaurus</font> max 30%";DoesWrap=true})j.lbl_selected_team1_count=J:AddLabel("-")j.lbl_selected_team2_count=y:AddLabel("-")j.lbl_selected_team3_count=V:AddLabel("-")j.lbl_selected_team4_count=d:AddLabel("-")il()j.MultiDropdownSellTeam=J:AddDropdown("dropdownSellTeam",{Values=CJ();Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\146\176 Sell Team",Callback=
function(G)
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=#V if y>PJ()then
 Z.Notify("Team size maxed",2)
else
 T.team1=V R()il()Z.Notify("Sell Team Updated",2)end
 end
})
local K=J:AddButton({Text="\226\156\168 Auto Select";Tooltip="Auto selects best pets for this team!";Func=
function()
local G=t.Hatch.GetRecommendedSealTeam()if#G==0 then
 Z.Notify("\226\157\140 No pets found.",3)
else
 
local V={}for G,y in ipairs(G)do
 table.insert(V,y)end
 T.team1=V 
local y=DJ(T.team1)j.MultiDropdownSellTeam:SetValue(y,true)R()il()Z.Notify("\226\156\133 Seal team updated!",3)end
 end
})J:AddDivider()
local b=J:AddButton({Text="Equip",Func=
function()if#T.team1==0 then
 Z.Notify("Team is empty",2)
else
 Il(T.team1)end
 end
})b:AddButton({Text="<font color=\'#FF0000\'>UnEquip</font>";Func=
function()Z.UnEquipAllPets()end
})b:AddButton({Text="<font color=\'#00FF04\'>Reload</font>";Func=
function()cl()
task.wait(.3)end
})
local S=J:AddDropdown("_ddBoostTeam1",{Values={};Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=6;Text="\240\159\146\138 Pet Boosts",Tooltip="Boosts are applied when team is placed by the system.";Callback=
function(G)T.hatch_boost_seal_team={}for G,V in pairs(G)do
 T.hatch_boost_seal_team[G]=V end
 R()end
})S:SetValues(F(H.boosts_list))S:SetValue(T.hatch_boost_seal_team)J:AddToggle("enable_ddBoostTeam1",{Text="\240\159\154\128 Enable Boosts",Default=T.hatch_boost_seal_enabled;Tooltip="If enabled boosts will be applied when team is placed.",Callback=
function(G)T.hatch_boost_seal_enabled=G R()end
})J:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})
local z=J:AddToggle("ToggleTeam1Disable",{Text="\226\155\148 Don\'t use";Default=T.disable_team1,Tooltip="If enabled, this team will <font color=\'#FF00FF\'>NOT</font> be used.",Callback=
function(G)if G then
 T.disable_team1=G R()Z.Notify("Team Disabled",2)
else
 T.disable_team1=G R()Z.Notify("Team Enabled",2)end
 end
})J:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})J:AddSpacer(30)j.MultiDropdownHatchTeam=y:AddDropdown("dropdownHatchTeam",{Values=CJ(),Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\144\163 Hatch Team";Callback=
function(G)
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=#V if y>PJ()then
 Z.Notify("Team size maxed",2)
else
 T.team2=V R()il()Z.Notify("Hatch Team Updated",2)end
 end
})
local f=y:AddButton({Text="\226\156\168 Auto Select";Tooltip="Auto selects best pets for this team!";Func=
function()
local G=t.Hatch.GetRecommendedKoiTeam()if#G==0 then
 Z.Notify("\226\157\140 No pets found.",3)
else
 
local V={}for G,y in ipairs(G)do
 table.insert(V,y)end
 T.team2=V 
local y=DJ(T.team2)j.MultiDropdownHatchTeam:SetValue(y,true)R()il()Z.Notify("\226\156\133 Koi team updated!",3)end
 end
})y:AddDivider()
local M=y:AddButton({Text="Equip";Func=
function()if#T.team2==0 then
 Z.Notify("Team is empty",2)
else
 Il(T.team2)end
 end
})M:AddButton({Text="<font color=\'#FF0000\'>UnEquip</font>";Func=
function()Z.UnEquipAllPets()end
})M:AddButton({Text="<font color=\'#00FF04\'>Reload</font>";Func=
function()cl()
task.wait(.3)end
})y:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})
local A=y:AddToggle("ToggleTeam2Disable",{Text="\226\155\148 Don\'t use",Default=T.disable_team2;Tooltip="If enabled, this team will <font color=\'#FF00FF\'>NOT</font> be used.";Callback=
function(G)if G then
 T.disable_team2=G R()Z.Notify("Team Disabled",2)
else
 T.disable_team2=G R()Z.Notify("Team Enabled",2)end
 end
})y:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>";DoesWrap=false})
local x=y:AddDropdown("dropdownHatchTeamBoosts",{Values={};Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=6;Text="\240\159\146\138 Pet Boosts",Tooltip="Boosts are applied when team is placed by the auto hatching system.";Callback=
function(G)c.boost_koi_team_list={}for G,V in pairs(G)do
 c.boost_koi_team_list[G]=V end
 n()end
})x:SetValues(F(H.boosts_list))x:SetValue(c.boost_koi_team_list)y:AddDivider()y:AddButton({Text="\226\154\161 Apply Now [Active Pets]",Func=
function()
local G=E:GetActivePetsUUIDS()if G then
 H.ApplyBoostHeldKoi()end
 end
})y:AddToggle("ToggleTeam2Boost",{Text="\226\153\187\239\184\143 Auto Boost [Placed]";Default=c.boost_auto_team_placed_koi,Tooltip="Applies boosts when this team is placed by the hatching system.";Callback=
function(G)c.boost_auto_team_placed_koi=G n()end
})y:AddToggle("ToggleTeam2BoostGrandmaster",{Text="\240\159\148\171 Grandmaster Sprinkler [Place]",Default=c.boost_sprinkler_koi_team;Tooltip="If enabled then
 it places a Grandmaster Sprinkler if farm has none.",Callback=
function(G)c.boost_sprinkler_koi_team=G n()end
})y:AddSpacer(30)j.MultiDropdownEggReductionTeam=V:AddDropdown("dropdownEggReductionTeam",{Values=CJ();Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\144\163\226\143\179 Egg Reduction Team";Callback=
function(G)
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=#V if y>PJ()then
 Z.Notify("Team size maxed",2)
else
 T.team3=V R()il()Z.Notify("Egg Reduction Team Updated",2)end
 end
})V:AddDivider()
local C=V:AddButton({Text="Equip";Func=
function()if#T.team3==0 then
 Z.Notify("Team is empty",2)
else
 Il(T.team3)end
 end
})C:AddButton({Text="<font color=\'#FF0000\'>UnEquip</font>",Func=
function()Z.UnEquipAllPets()end
})C:AddButton({Text="<font color=\'#00FF04\'>Reload</font>";Func=
function()cl()
task.wait(.3)end
})
local D=V:AddDropdown("_ddBoostTeam3",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=6;Text="\240\159\146\138 Pet Boosts";Tooltip="Boosts are applied when team is placed by the system.";Callback=
function(G)T.hatch_boost_eggcd_team={}for G,V in pairs(G)do
 T.hatch_boost_eggcd_team[G]=V end
 R()end
})D:SetValues(F(H.boosts_list))D:SetValue(T.hatch_boost_eggcd_team)
local P=V:AddDropdown("hatchteamTargetBoost",{Values={};Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\164\150 Boost Selected Pets",Tooltip="Select pets to target, if nothing is selected then
 it applies to all active pets";Callback=
function(G)if G==nil then
 
return end
 T.hatch_team_boost_targets=G R()end
})P:SetValues(Z.all_pets_names_list)P:SetValue(T.hatch_team_boost_targets)V:AddToggle("enable_ddBoostTeam3",{Text="\240\159\154\128 Enable Boosts";Default=T.hatch_boost_eggcd_enabled,Tooltip="If enabled boosts will be applied when team is placed.";Callback=
function(G)T.hatch_boost_eggcd_enabled=G R()end
})V:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})
local O=V:AddToggle("ToggleTeam3Disable",{Text="\226\155\148 Don\'t use";Default=T.disable_team3,Tooltip="If enabled, this team will <font color=\'#FF00FF\'>NOT</font> be used.",Callback=
function(G)if G then
 T.disable_team3=G R()Z.Notify("Team Disabled",2)
else
 T.disable_team3=G R()Z.Notify("Team Enabled",2)end
 end
})V:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})
local v=Z.GetCheckIfPro()V:AddLabel({Text="<font color=\'#ffd700\'><b>\226\148\129 PREMIUM OPTIONS \226\148\129</b></font>",DoesWrap=true})if not v then
 
local G=Z.GetProMessage()V:AddLabel({Text=G;DoesWrap=true})end
 if v then
 V:AddLabel({Text="<font color=\'#ffcc00\'>\226\154\160\239\184\143 How it works</font>\n<font color=\'#ffffff\'>\226\128\162 Pick pets for your main team and keep empty slots for the extra teams.\n\226\128\162 Feature will not run if your main team is full or extra teams are empty.\n\226\128\162 When enabled, hatching can use multiple teams.\n\226\128\162 Extra teams fill missing pets; the first team is swapped out after a short delay.\n\n<font color=\'#a0ffb0\'>Best combo:</font> Mimics + Spider for webs \226\134\146 auto-switch to Bald Eagle for faster hatching.</font>",DoesWrap=true})
local G=
function()
local G=#T.team_reduction_placefirst 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FF00B7\"><b>\240\159\164\150 Place First</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 
local y=
function()
local G=#T.team_reduction_placeafter 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00FF3C\"><b>\240\159\159\162 Place After</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 i.dd_reduction_teamfirst=V:AddDropdown("dd_reduction_teamfirst",{Values={};Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=G();Tooltip="Select pets to place along side main team.",Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.dd_reduction_teamfirst:SetValue(DJ(T.team_reduction_placefirst))Z.Notify("Team size maxed",2)
else
 T.team_reduction_placefirst=y R()i.dd_reduction_teamfirst:SetText(G())end
 end
})i.dd_reduction_teamafter=V:AddDropdown("dd_reduction_teamafter",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text=y();Tooltip="Select pets to be placed after.";Callback=
function(G)if G==nil then
 
return end
 
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)table.insert(V,y)end
 end
 
local j=PJ()
local c=#V if c>j then
 i.dd_reduction_teamafter:SetValue(DJ(T.team_reduction_placeafter))Z.Notify("Team size maxed",2)
else
 T.team_reduction_placeafter=V R()i.dd_reduction_teamafter:SetText(y())end
 end
})V:AddDivider()
local 
function j()
local G=T.team_reduction_timer or 16.5 
local V=string.format("<b><font color=\'#7327F5\'>\226\143\179 Timer</font></b><font color=\'#00FFFF\'>%s</font>/s",G)
return V end
 
local c c=V:AddInput("input_timerdelay_phases",{Text=j(),Default=T.team_reduction_timer,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 16";Tooltip="Enter delay, must be more than 0";Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid Timer: "..G,3)c:SetValue(tostring(T.team_reduction_timer))
return end
 if V>0 then
 T.team_reduction_timer=V R()c:SetText(j())end
 end
})V:AddDivider()
local 
function J()
local G=T.max_web_count or 7 
local V=string.format("<b><font color=\'#00D67D\'>\226\154\160\239\184\143 Max Webs</font></b><font color=\'#00FF9B\'> x%s</font>",G)
return V end
 
local d d=V:AddInput("inputmaxwebs",{Text=J();Default=T.max_web_count;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 7",Tooltip="Enter max webs before the team switches.";Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)d:SetValue(tostring(T.max_web_count))
return end
 if V>0 then
 T.max_web_count=V R()d:SetText(J())end
 end
})V:AddDivider()V:AddToggle("hatchingreductionteamsg",{Text="\226\153\187\239\184\143 Enable Teams",Default=T.team_reduction_enabled_teams;Tooltip="When enabled, this will work with main egg reduction team to place pets.";Callback=
function(G)T.team_reduction_enabled_teams=G R()end
})end
 V:AddSpacer(100)j.MultiDropdownEggPetSizeTeam=d:AddDropdown("dropdownSellTeam",{Values=CJ(),Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\144\178 PetSize Team Selection";Callback=
function(G)
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=#V if y>PJ()then
 Z.Notify("Team size maxed",2)
else
 T.team4=V R()il()Z.Notify("PetSize Team Updated",2)end
 end
})d:AddDivider()
local k=d:AddButton({Text="Equip",Func=
function()if#T.team4==0 then
 Z.Notify("Team is empty",2)
else
 Il(T.team4)end
 end
})k:AddButton({Text="<font color=\'#FF0000\'>UnEquip</font>",Func=
function()Z.UnEquipAllPets()end
})k:AddButton({Text="<font color=\'#00FF04\'>Reload</font>";Func=
function()cl()
task.wait(.3)end
})
local p=d:AddDropdown("_ddBoostTeam4",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=6;Text="\240\159\146\138 Pet Boosts";Tooltip="Boosts are applied when team is placed by the system.",Callback=
function(G)T.hatch_boost_bron_team={}for G,V in pairs(G)do
 T.hatch_boost_bron_team[G]=V end
 R()end
})p:SetValues(F(H.boosts_list))p:SetValue(T.hatch_boost_bron_team)d:AddToggle("enable_ddBoostTeam4",{Text="\240\159\154\128 Enable Boosts";Default=T.hatch_boost_bron_enabled;Tooltip="If enabled boosts will be applied when team is placed.",Callback=
function(G)T.hatch_boost_bron_enabled=G R()end
})d:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})
local U=d:AddToggle("ToggleTeam4Disable",{Text="\226\155\148 Don\'t use";Default=T.disable_team4,Tooltip="If enabled, this team will <font color=\'#FF00FF\'>NOT</font> be used.";Callback=
function(G)T.disable_team4=G if G then
 R()Z.Notify("Team Disabled",2)
else
 R()Z.Notify("Team Enabled",2)end
 end
})d:AddLabel({Text="<font color=\'#FF0000\'>------------------------------</font>",DoesWrap=false})d:AddToggle("ToggleTeam4Prevent",{Text="\226\154\160\239\184\143 Allow Big Pet Hatch?";Default=T.auto_hatch_big_pets;Tooltip="Disable to keep big pets in the egg and never hatch them. Can be used for manual hatching.",Callback=
function(G)T.auto_hatch_big_pets=G if G then
 R()Z.Notify("Auto Hatch Big Pet Enabled",2)
else
 R()Z.Notify("Auto Hatch Big Pet Disabled",2)end
 end
})d:AddToggle("ToggleTeam4RareHatch",{Text="\240\159\146\142 Hatch Rare/Excluded Sell List";Default=c.hatch_rare_withbigsizetm;Tooltip="Enable this to hatch pets that are rare and not included in your sell list.";Callback=
function(G)c.hatch_rare_withbigsizetm=G if G then
 Z.Notify("Enabled",2)
else
 Z.Notify("Disabled",2)end
 n()end
})d:AddSpacer(30)end
 Z.MEggUi=
function()
local G=100 
local V=y9:AddTab({Name="Eggs Priority",Description="Manage Egg hatching priority",Icon="egg"})
local y=V:AddLeftGroupbox("Egg Priority","list-ordered",false)
local j=V:AddRightGroupbox("Egg Options","egg")
local i=V:AddRightGroupbox("Egg Actions","egg")if y then
 
local G={}if T.eggs_to_place_array then
 
local G={}for V,y in pairs(T.eggs_to_place_array)do
 if y.enabled then
 table.insert(G,{name=V,order=tonumber(y.order)or 0})end
 end
 if#G>0 then
 table.sort(G,
function(G,V)
return G.order>V.order end
)for V=1,Z.max_priorityx,1 do
 
local y=G[V]c["egg_priority"..V]=y and y.name or"None"end
 end
 T.eggs_to_place_array=nil R()n()
print("Migration Egg P Completed.")end
 for V,y in pairs(Z.egg_custom_place_array)do
 table.insert(G,V)end
 table.sort(G)table.insert(G,1,"None")
local V={}for Z=1,Z.max_priorityx,1 do
 
local j="egg_priority"..Z 
local i="egg"..(Z.."p")
local J=y:AddDropdown(i,{Values={},Default={};Multi=false;Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\165\154 #"..(Z.." Priority"),Callback=
function(G)if G==nil then
 
return end
 c[j]=G n()end
})J:SetValues(G)J:SetValue(c[j])V[Z]=J end
 end
 if i then
 i:AddButton({Text="Hatch All";Tooltip="Hatches all eggs on the farm, if they are ready",Func=
function()Rl(false)end
})end
 j:AddLabel({Text="\226\132\185\239\184\143 Max eggs to place, Put 0 to disable. Press Enter to save",DoesWrap=true})
local 
function J()
local G=tonumber(c.max_eggs_to_place)or 0 
local V="x"..G if G==0 then
 V="MAX!"end
 
return string.format("<font color=\'#F5F5F5\'><b>\226\156\168 Max Eggs</b></font> <stroke color=\'#000000\' thickness=\'1.5\' transparency=\'0.65\'><font color=\'#FFD85A\'><b>%s</b></font></stroke>",V)end
 
local d d=j:AddInput("input_egg_limit",{Text=J();Default=c.max_eggs_to_place,Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g. 4";Tooltip="Enter 0 to turn this off.",Callback=
function(G)
local V=jJ(G)if V and V>=0 then
 c.max_eggs_to_place=V n()d:SetText(J())
else
 d:SetValue(tostring(c.max_eggs_to_place))end
 end
})end
 
function Z.PetSellSettingsUi()
local G=y9:AddTab({Name="Pet Sell Settings";Description="Configure pet selling";Icon="coins"})
local V=G:AddLeftGroupbox("Pet Sell List","gavel")
local y=G:AddRightGroupbox("Pet Sell Weight","weight")if y then
 y:AddLabel({Text="<font color=\'#FFD700\'><b>\226\154\150\239\184\143 Global Default Pet Weight</b></font>\n Any pet with a weight greater than this will be marked as <font color=\'#00FF7F\'><b>Big </b></font> and automatically set as a <font color=\'#1E90FF\'><b>Favourite \226\173\144</b></font>.\n\240\159\147\166 This rule applies to all pets in your backpack that are not already favourited.\n\226\156\168 Make sure to <font color=\'#FF69B4\'><b>favourite your pets</b></font> before starting the <font color=\'#FFA500\'><b>Hatching System</b></font>.\n <font color=\'#FF4500\'><b>\226\154\160\239\184\143 If you override any pet\226\128\153s weight, this rule will be ignored.</b></font>",DoesWrap=true})y:AddDivider()
local G="\226\154\150\239\184\143 <font color=\'#00B200\'>Keep</font> Pets Above Weight [KG]"
local V V=y:AddInput("sellpetaboveweight",{Text=G;Default=T.sell_weight,Numeric=true;AllowEmpty=true,Finished=true;ClearTextOnFocus=false;Tooltip="Pets with size bigger or equal to this weight are considered big, huge etc",Placeholder="Global default weight",Callback=
function(y)
local j=iJ(y)if not j then
 Z.Notify("Invalid number : "..y,3)V:SetValue(tostring(T.sell_weight))
return end
 if j<=0 then
 Z.Notify("Enter value more than 0",3)V:SetValue(tostring(T.sell_weight))
return end
 T.sell_weight=j R()V:SetText("\226\156\133 <font color=\'#00FF00\'>Pets Weight Updated</font>")
task.wait(1.5)V:SetText(G)end
})end
 if V then
 V:AddLabel({Text="\240\159\148\128 <font color=\'#00FF7F\'><b>Toggle ON</b></font> to <font color=\'#FF4500\'><b>auto-sell</b></font> a pet.\n\240\159\148\149 <font color=\'#1E90FF\'><b>Toggle OFF</b></font> to keep it.";DoesWrap=true})V:AddDivider()
local G={}for V,y in pairs(T.sell_pets)do
 table.insert(G,V)end
 
local y={}
local 
function j()for G,V in ipairs(y)do
 if V and V.Holder then
 V.Holder:Destroy()end
 end
 table.clear(y)end
 
local 
function i(G)if G then
 table.insert(y,G)end
 
return G end
 
local 
function J(G)j()if not G or not T.sell_pets[G]then
 
return end
 
local y=T.sell_pets[G]i(V:AddLabel({Text="<font color=\'#00B200\'>\227\128\144\226\157\150 \240\159\165\154 <b>"..(G.."</b> \226\157\150\227\128\145</font>");DoesWrap=false}))
local J={}for G,V in pairs(y)do
 table.insert(J,G)end
 table.sort(J)for j,J in ipairs(J)do
 
local d=i(V:AddToggle(J,{Text=J,Default=y[J];Callback=
function(V)T.sell_pets[G][J]=V R()Z.Notify("Updated "..J,3)end
}))
local u=false 
local q=T.sell_weight 
local g=false if not c.pet_override_weight[J]then
 c.pet_override_weight[J]={override=u;weight=q;is_big=g}end
 
local E=c.pet_override_weight[J]if not E.is_big then
 E.is_big=g end
 
local a=i(V:AddDependencyBox())a:SetupDependencies({{d;true}})
local H=i(a:AddCheckbox(J.."_override",{Text=" \226\154\150\239\184\143 Override Weight ",Default=E.override,Tooltip="Override global default weight for "..J;Callback=
function(G)E.override=G n()end
}))
local r=i(V:AddDependencyBox())r:SetupDependencies({{d,true},{H;true}})
local Y=i(r:AddInput(J.."_weight_input",{Text=" \226\148\148 Keep Weight <font color=\'#FF00FF\'>Above</font> [KG]",Default=tostring(E.weight),Placeholder="e.g., 1.25",Finished=true;Numeric=false;ClearTextOnFocus=false,AllowEmpty=true,Tooltip=J.." will not be sold if over this weight! Max 2.20 KG";Callback=
function(G)
local V=iJ(G)
local y=false if V then
 
local G=20 if V>G then
 V=G y=true end
 end
 if V and V>0 then
 if E.weight==V and y==false then
 
return end
 E.weight=V n()Z.Notify(J..(" Weight Override "..(V.." KG")),2)if weightInput then
 weightInput:SetValue(tostring(E.weight))end
 
else
 Z.Notify("Invalid weight for "..J,3)if weightInput then
 weightInput:SetValue(tostring(E.weight))end
 end
 end
}))i(r:AddCheckbox(J.."_bigoverride",{Text="\240\159\146\170 Mark Big Pet ";Default=E.is_big,Tooltip="When enabled, "..(J.." will hatch with the Big Pets team. If big pets team is set."),Callback=
function(G)E.is_big=G n()end
}))i(V:AddLabel({Text="<font size=\'9\' color=\'#cccccc\'>---------------------</font>",DoesWrap=false}))end
 end
 
local d=V:AddDropdown("SelectedEggConfig",{Values=G;Default=1,Multi=false,Searchable=true;MaxVisibleDropdownItems=10,Text="Select Egg",Callback=
function(G)J(G)end
})if G[1]then
 J(G[1])end
 end
 end
 
function Z.M_UI_PLANTS()
local G=y9:AddTab({Name="<font color=\'#7CFC00\'>Plants</font> & <font color=\'#C700FF\'>Packs</font>",Description="<font color=\'#ADFF2F\'>\240\159\140\191 Automate planting, harvesting, and more with ease.</font>";Icon="leaf"})
local V=G:AddLeftGroupbox("<font color=\"#32CD32\">\240\159\140\177 Seed Placement</font>","leaf")
local y=G:AddLeftGroupbox("<font color=\"#1E90FF\">\240\159\155\160\239\184\143 Trowel Plants</font>","pickaxe")
local d=G:AddRightGroupbox("\240\159\140\191 <font color=\'#3CB371\'>Water Plants</font>")
local u=G:AddRightGroupbox("<font color=\"#DC143C\">\240\159\155\145 Shovel Plants \226\154\160\239\184\143</font>","skull")
local q=G:AddLeftGroupbox("Auto Sprinklers","milk")
local g=G:AddRightGroupbox("Packs & Chests","package-open")
local H=G:AddLeftGroupbox("Reclaimer","shredder")
local Y=G:AddRightGroupbox("Performance","chart-no-axes-column")
local e=G:AddLeftGroupbox("Favourite Inventory","heart")
local s=G:AddRightGroupbox("\240\159\141\137 Shovel Fruits","chart-no-axes-column")
local N=G:AddRightGroupbox("\226\157\164\239\184\143 Favourite Fruit [Farm]","chart-no-axes-column")
local W=G:AddLeftGroupbox("\240\159\140\187 Fruit ESP","chart-no-axes-column")if N then
 N:AddLabel({Text="This will favourite fruits in your garden based on set filters.";DoesWrap=true})
local G=
function()
local G=string.format("Min Weight <font color=\'#47FF40\'>%s</font>",c.autofavminweight)
return G end
 
local V=
function()
local G=string.format("Max Weight <font color=\'#FF4065\'>%s</font>",c.autofavmaxweight)
return G end
 
local y y=N:AddInput("input_min_weightfav",{Text=G(),Default=c.autofavminweight,Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="e.g 1";Tooltip="Specify minimum Weight";Callback=
function(V)
local j=iJ(V)if not j or j<=0 then
 Z.Notify("Invalid: "..V,3)y:SetValue(tostring(c.autofavminweight))
return end
 if j>c.autofavmaxweight then
 Z.Notify("Can\'t be more than max weight",3)y:SetValue(tostring(c.autofavminweight))
return end
 c.autofavminweight=j n()y:SetText(G())end
})
local j j=N:AddInput("input_max_weightfav",{Text=V(),Default=c.autofavmaxweight;Numeric=true,AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g 1",Tooltip="Specify maximum Weight";Callback=
function(G)
local y=iJ(G)if not y or y<=0 then
 Z.Notify("Invalid: "..G,3)j:SetValue(tostring(c.autofavmaxweight))
return end
 if y<c.autofavminweight then
 Z.Notify("Can\'t be lower than min weight ",3)j:SetValue(tostring(c.autofavmaxweight))
return end
 c.autofavmaxweight=y n()j:SetText(V())end
})
local i=N:AddDropdown("dd_plantsfavfilter",{Values={};Default={},Multi=true;Text="\240\159\140\180 Plants [Empty = all]";Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 c.autofavplantlist=G n()end
})i:SetValues(F(P))i:SetValue(c.autofavplantlist)N:AddToggle("enablefavfruits",{Text="\226\157\164\239\184\143 Enable Fav",Default=c.autofavfruits_enabled;Tooltip="When enabled it will auto fav fruits matching the filters set",Callback=
function(G)c.autofavfruits_enabled=G n()end
})N:AddDivider()N:AddDivider()N:AddLabel({Text="\226\154\160\239\184\143Unfav uses same filters set above to unfav fruits.",DoesWrap=true})N:AddButton({Text="\226\154\161 Unfav Farm fruits",Func=
function()if c.autofavfruits_enabled then
 Z.Notify("Please disable favourite system above to run unfav.",2)
return end
 if S.FavouriteFruit.is_unfav_running then
 Z.Notify("Already running unfav",2)
return end
 Z.Notify("Unfav requested. Please wait.",2)S.FavouriteFruit.is_unfav_running=true end
})end
 if W then
 W:AddLabel({Text="Select fruits to show esp.";DoesWrap=true})
local G=W:AddDropdown("dd_espflist",{Values={};Default={};Multi=true,Text="\240\159\140\180 Plants";Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 J.fruitesp.plants_list=G h.SaveSessionSettings.SaveFile()end
})G:SetValues(F(P))G:SetValue(J.fruitesp.plants_list)W:AddToggle("enablefruitesp",{Text="\226\154\161 Enable ESP";Default=J.fruitesp.enable_esp,Tooltip="Shows fruit esp and makes them smaller. Restart if you disable to restore.",Callback=
function(G)J.fruitesp.enable_esp=G h.SaveSessionSettings.SaveFile()end
})end
 if s then
 j.lbl_fruit_shovel_live=s:AddLabel({Text="\240\159\148\180 Not running",DoesWrap=true})s:AddLabel({Text="\226\132\185\239\184\143 Weight filters are used from Fruit collection settings (Min, Max), change it there.",DoesWrap=true})s:AddDivider()
local G=s:AddDropdown("dd_fruitlist",{Values={},Default={},Multi=true,Text="\240\159\141\137 Fruit Types";Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 c.rmplants.fruit_list=G n()end
})G:SetValues(F(P))G:SetValue(c.rmplants.fruit_list)s:AddDivider()
local V=s:AddDropdown("_shovelwhitelistfruits",{Values={},Default={},Multi=true;Text="\226\156\133 Whitelist Mutations";Tooltip="Fruits matching the selected mutations are deleted, otherwise all fruits are deleted.",Searchable=true;MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 c.rmplants.mut_whitelist=G n()end
})V:SetValues(F(o))V:SetValue(c.rmplants.mut_whitelist)
local y=s:AddDropdown("shovel_blacklis",{Values={};Default={};Text="\226\157\140 Blacklist Mutations",Multi=true;Searchable=true,Tooltip="Fruits carrying selected mutations will not be deleted.";MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 c.rmplants.mut_blacklist=G n()end
})y:SetValues(F(o))y:SetValue(c.rmplants.mut_blacklist)
local i=s:AddDropdown("_Variantfruit",{Values={};Default={};Text="\226\156\168 <color=\'#FF00CF\'>Variant</font>",Multi=true;Searchable=true;Tooltip="Delete any selected Variants (Gold, Rainbow etc). if nothing is selected then
 this is skipped.";MaxVisibleDropdownItems=10,Changed=
function(G)c.rmplants.variants_list=G n()end
})i:SetValues(F(Z.All_Variants))i:SetValue(c.rmplants.variants_list)
task.spawn(
function()while 
task.wait()do
 if not i then
 break end
 
local G=(tick()%5)/5 
local V=Color3.fromHSV(G,1,1)
local y=V:ToHex()i:SetText("\226\156\168 <font color=\'#"..(y.."\'>Variant</font>"))end
 end
)s:AddDivider()
local 
function J()
local G=string.format("\226\156\168 Mutation Count <font color=\'#7CFC00\'>%s</font>",c.rmplants.max_mut_count)
return G end
 
local T T=s:AddInput("max_mutation_count",{Text=J(),Default=c.rmplants.max_mut_count;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="12";Tooltip="Enter amount of mutations should fruit have to be deleted. ";Callback=
function(G)
local V=jJ(G)if not V then
 Z.Notify("Invalid number : "..G,3)T:SetValue(c.rmplants.max_mut_count)
return end
 if V<0 then
 Z.Notify("Enter value 0 or more",3)T:SetValue(c.rmplants.max_mut_count)
return end
 c.rmplants.max_mut_count=V n()T:SetText(J())end
})s:AddDivider()s:AddToggle("shovel_fruits_toggle",{Text="\226\154\161 Enable Shovel",Default=c.rmplants.fruit_remove_enabled,Tooltip="Automatically deletes fruits when available.";Callback=
function(G)c.rmplants.fruit_remove_enabled=G n()Z.Notify(status,2)end
})s:AddSpacer(100)end
 if e then
 e:AddLabel({Text="\240\159\146\161 Favourite or UnFavourite fruits.";DoesWrap=true})e:AddButton({Text="<font color=\'#00FF00\'>Favourite All</font>";Tooltip="\226\157\164\239\184\143 Favourite all fruits in backpack",Func=
function()r.FavAllFruitsInBackpack(true,true)Z.Notify("Success Favourite",2)end
})e:AddButton({Text="<font color=\'#ED2A00\'>UnFavourite All</font>";Tooltip="\226\157\140 UnFavourite all fruits in backpack";Func=
function()r.FavAllFruitsInBackpack(false,true)Z.Notify("Success UnFavourite All",2)end
})e:AddDivider()end
 if Y then
 Y:AddLabel({Text="\240\159\146\161Deletes fruits and plants. May increase performance. Disable and rejoin to restore back to normal.",DoesWrap=true})Y:AddToggle("toogledeleteplants",{Text="\240\159\140\177 Delete Plants",Default=J.farm.delete_plants;Tooltip="Delete plants textures.",Callback=
function(G)J.farm.delete_plants=G h.SaveSessionSettings.SaveFile()end
})Y:AddToggle("toogledeletefruits",{Text="\240\159\140\184 Delete Fruits",Default=J.farm.delete_fruits;Tooltip="Delete fruit textures.";Callback=
function(G)J.farm.delete_fruits=G h.SaveSessionSettings.SaveFile()end
})Y:AddDivider()Y:AddLabel({Text="\240\159\146\161Reload game after changing this setting.";DoesWrap=true})Y:AddToggle("toogledeletOutside",{Text="\240\159\148\132 Parent Outside",Default=J.farm.change_parent,Tooltip="Parents to it outside of the farm. Some features may stop working.",Callback=
function(G)J.farm.change_parent=G h.SaveSessionSettings.SaveFile()end
})Y:AddDivider()Y:AddToggle("toggle_enable_delete_fruits",{Text="\226\154\161 Enable Task";Default=J.farm.enable_delete_fruits;Tooltip="When enabled it will slowly keep deleting your fruits and plants.",Callback=
function(G)J.farm.enable_delete_fruits=G h.SaveSessionSettings.SaveFile()end
})Y:AddDivider()Y:AddDivider()Y:AddToggle("toggleRemoveFarms",{Text="\240\159\148\170 Remove Other Farms";Default=T.remove_farms;Tooltip="Removes other farms. disable and rejoin to get them back.";Callback=
function(G)T.remove_farms=G R()Z.DeleteOtherFarms()end
})end
 if H then
 j.lbl_reclaimer_stats=H:AddLabel({Text="\240\159\146\161 Not Running";DoesWrap=true})
local G=H:AddDropdown("ddreclaimer",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\140\187 Plants",Tooltip="Select plants.. Converts plants into seeds",Changed=
function(G)if not G then
 
return end
 T.reclaim.plants=G R()end
})G:SetValues(I(P))G:SetValue(T.reclaim.plants)
local V=H:AddButton({Text="Select All",Tooltip="Selects all plants on the list.";Func=
function()
local V=I(P)if#V>0 then
 T.reclaim.plants={}end
 for G,V in ipairs(V)do
 T.reclaim.plants[V]=true end
 G:SetValue(T.reclaim.plants,true)R()end
})V:AddButton({Text="<font color=\'#ED2A00\'>DeSelect All</font>";Tooltip="Deselects all the plants on the list";Func=
function()T.reclaim.plants={}G:SetValue(T.reclaim.plants,true)R()end
})
local 
function y()
local G=T.reclaim.keep_amount 
local V=string.format("\226\154\160\239\184\143 Keep Amount<font color=\'#3CB371\'>(%s)</font>",G)
return V end
 
local i i=H:AddInput("input_reclaim_limitx",{Text=y(),Default=T.reclaim.keep_amount,Numeric=true;AllowEmpty=true,Finished=true;ClearTextOnFocus=false;Placeholder="e.g. 3",Tooltip="How many to keep?",Callback=
function(G)
local V=jJ(G)if V and V>=0 then
 T.reclaim.keep_amount=V i:SetText(y())R()
else
 Z.Notify("Invalid "..G,3)i:SetValue(tostring(T.reclaim.keep_amount))end
 end
})H:AddDivider()H:AddButton({Text="<font color=\'#00FF7F\'>\240\159\159\162 Start Reclaimer</font>";Tooltip="Starts to claim plants",Func=
function()S.StartReclaimer()end
})H:AddButton({Text="<font color=\'#FF2424\'>\240\159\148\180 Stop Reclaimer</font>";Tooltip="Stops the reclaimer.",Func=
function()S.StopReclaimer()end
})H:AddDivider()H:AddSpacer(200)end
 do
 g:AddLabel({Text="\240\159\146\161 Select packs to open";DoesWrap=true})
local G=g:AddDropdown("ddseedpacksselect",{Values={},Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\167\176 Select Packs";Tooltip="Select packs to open",Changed=
function(G)if not G then
 
return end
 T.seedpack.selected_packs={}for G,V in pairs(G)do
 T.seedpack.selected_packs[G]=V end
 R()end
})G:SetValues(Z.all_seed_pack_names)G:SetValue(T.seedpack.selected_packs)g:AddToggle("togglepacksopen",{Text="\226\154\161 Enablle OpenPacks";Default=T.seedpack.is_active,Tooltip="Automatically opens any selected packs.";Callback=
function(G)T.seedpack.is_active=G R()end
})g:AddSpacer(200)end
 do
 q:AddLabel({Text="\240\159\146\161 <font color=\'#FFD700\'>Automatically removes</font> any <font color=\'#00BFFF\'>selected sprinklers</font> that have been placed. It <font color=\'#FF4500\'>wont delete</font> while you are <font color=\'#ADFF2F\'>holding a sprinkler manually</font> \226\128\148 it will <font color=\'#00FF7F\'>resume</font> once unequipped. <font color=\'#FFA500\'>Pauses</font> whenever other <font color=\'#FF69B4\'>tasks or events</font> are running.",DoesWrap=true})
local G=q:AddDropdown("dp_placedsprinklers",{Values={};Default={};Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\159\162 Place Sprinklers",Tooltip="Select sprinklers to place. only 1 sprinkler will be placed of each selected type",Changed=
function(G)if not G then
 
return end
 c.autoplacesprinklers={}for G,V in pairs(G)do
 c.autoplacesprinklers[G]=V end
 n()end
})G:SetValues(r.Gear.GetAllSprinklers())G:SetValue(c.autoplacesprinklers)
local V=q:AddDropdown("dropdowndeleteSprinklers",{Values={};Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text="\226\157\140 Delete Sprinklers";Tooltip="Select sprinklers to delete when they are placed.",Changed=
function(G)if not G then
 
return end
 T.auto_remove_sp_list={}for G,V in pairs(G)do
 T.auto_remove_sp_list[G]=V end
 R()end
})V:SetValues(r.Gear.GetAllSprinklers())V:SetValue(T.auto_remove_sp_list)q:AddToggle("toggledeleteSprinklers",{Text="\226\154\161 Enable Auto Delete",Default=T.auto_remove_sprinklers;Tooltip="Automatically deletes placed sprinklers",Callback=
function(G)T.auto_remove_sprinklers=G R()end
})q:AddToggle("toggledeleteSprinklersExpire",{Text="\240\159\148\180 Del-Near-Expire";Default=T.auto_remove_sprinklers_nearexpire;Tooltip="Deletes when sprinklers are about to expire.";Callback=
function(G)T.auto_remove_sprinklers_nearexpire=G R()end
})q:AddDivider()q:AddLabel({Text="\240\159\146\161 Places one sprinkler of each type per session, use it with auto delete to keep it unlimited effect for current session. Places in the center right side of the farm.",DoesWrap=true})q:AddToggle("placesprinkersauto",{Text="\240\159\147\140 Enable Auto Place",Default=c.enable_autoplacesprinklers;Tooltip="Automatically places sprinklers";Callback=
function(G)c.enable_autoplacesprinklers=G n()end
})end
 do
 d:AddLabel({Text="\240\159\146\167 Waters plants, Pauses automatically if any other task are in progress. Skips fully grown plants.",DoesWrap=true})j.lbl_watering_stats=d:AddLabel({Text="-";DoesWrap=true})j.lbl_watering_information=d:AddLabel({Text="";DoesWrap=true})d:AddDivider()
local G=d:AddDropdown("waterplantslist",{Values={},Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\146\167 Plants To Water",Tooltip="Choose one or multiple plants that should be automatically watered.",Changed=
function(G)c.watering_list_plants={}for G,V in pairs(G)do
 c.watering_list_plants[G]=V end
 n()end
})G:SetValues(I(P))G:SetValue(c.watering_list_plants)d:AddDivider()
local V 
local y="\240\159\146\167 Watering Can Per <font color=\'#3CB371\'>Plant</font>"V=d:AddInput("inputwateringcanspercycle",{Text=y,Default=c.watering_amount_to_water;Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g. 3",Tooltip="Set how many watering cans are used for each plant.";Callback=
function(G)
local j=jJ(G)if j and j>0 then
 c.watering_amount_to_water=j n()V:SetText("\226\156\133 <font color=\'#00FF00\'>Updated</font>")
task.wait(1)V:SetText(y)
else
 Z.Notify("Invalid "..G,3)V:SetValue(tostring(c.watering_amount_to_water))end
 end
})
local i 
local J="\226\154\161 Watering <font color=\'#3CB371\'>Speed</font>"i=d:AddInput("inputwateringcanspercyclexx",{Text=J,Default=c.watering_speed_time,Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="Seconds (e.g. 2.5)",Tooltip="Adjust the time interval (in seconds) between each watering action.",Callback=
function(G)
local V=iJ(G)if V and V>0 then
 c.watering_speed_time=V n()i:SetText("\226\156\133 <font color=\'#00FF00\'>Updated</font>")
task.wait(1)i:SetText(J)
else
 Z.Notify("Invalid "..G,3)i:SetValue(tostring(c.watering_speed_time))end
 end
})d:AddDivider()d:AddToggle("toogleEnableWatering",{Text="\226\154\161Water Plants",Default=c.watering_is_auto;Tooltip="Automatically waters plants that are not grown.",Callback=
function(G)c.watering_is_auto=G n()if G then
 Z.Notify("\226\156\133 Enabled",1)
else
 Z.Notify("\226\143\184\239\184\143 Disabled",1)end
 end
})d:AddSpacer(20)end
 do
 y:AddLabel({Text="\240\159\147\141 Select plants to trowel (move) \n\240\159\159\162 Set your position if you change farm locations \n\240\159\155\160\239\184\143 Changing tools will stop the process\n\240\159\165\154 Pauses automatically if hatching is in progress",DoesWrap=true})j.lbl_trowel_stats=y:AddLabel({Text="-",DoesWrap=true})y:AddDivider()
local G G=y:AddDropdown("trowelPlantsListDropdown",{Values={},Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text="\226\155\143\239\184\143 Select Plants To Trowel",Tooltip="Select plants to move to a new position. If you don\'t select any then
 all plants will be moved.",Changed=
function(G)c.trowel_plants_list={}for G,V in pairs(G)do
 c.trowel_plants_list[G]=V end
 n()end
})G:SetValues(I(P))G:SetValue(c.trowel_plants_list)
local V=y:AddButton({Text="Select All";Tooltip="Selects all plants on the list.",Func=
function()
local V=I(P)if#V>0 then
 c.trowel_plants_list={}end
 for G,V in ipairs(V)do
 c.trowel_plants_list[V]=true end
 G:SetValue(c.trowel_plants_list,true)n()end
})V:AddButton({Text="<font color=\'#ED2A00\'>DeSelect All</font>";Tooltip="Deselects all the plants on the list";Func=
function()c.trowel_plants_list={}G:SetValue(c.trowel_plants_list,true)n()end
})y:AddDivider()j.lbl_trowel_cframe=y:AddLabel({Text="-",DoesWrap=true})j.lbl_trowel_progress=y:AddLabel({Text="";DoesWrap=true})y:AddDivider()a.UpdateTrowelCframe("\240\159\147\141Current Position: "..tostring(c.trowel_saved_cframe))
local i=y:AddButton({Text="\240\159\151\186\239\184\143 Copy Player Position";Tooltip="Please stand where you want to move the Plants.",Func=
function()
local G=a.GetCurrentCFrameFromPlayerString()if not G then
 Z.Notify("Failed to save",3)
return end
 
local V=a.StringToVector3(G)
local y=E.mFarm.Center_Point.Position if a.IsWithinRangeOfFarm(y,V)then
 Z.Notify("Failed, Please be inside your farm.",3)
return end
 c.trowel_saved_cframe=G a.UpdateTrowelCframe("\240\159\147\141New Position: "..c.trowel_saved_cframe)Z.Notify("Position saved",3)n()end
})
local J=y:AddButton({Text="\226\150\182\239\184\143 Start Trowel",Func=
function()if a.trowel_is_running then
 
return end
 a.trowel_is_running=true Z.Notify("Trowel started",3)end
})
local T=J:AddButton({Text="\240\159\148\180 Stop Trowel";Func=
function()if not a.trowel_is_running then
 
return end
 a.trowel_is_running=false Z.Notify("Trowel stopped",3)end
})y:AddSpacer(20)end
 do
 u:AddLabel({Text="\240\159\170\147 Auto-shovel system: select plants to remove <font color=\'#e81416\'>(will be destroyed)</font>";DoesWrap=true})u:AddDivider()j.lbl_shovel_status=u:AddLabel({Text="-";DoesWrap=true})u:AddDivider()j.lbl_shovel_information=u:AddLabel({Text="";DoesWrap=true})u:AddDivider()i.ShovelDropDown=u:AddDropdown("dropdownShovel",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text="\226\154\160\239\184\143 Loading please wait...";Tooltip="Choose the plants you want to shovel";Changed=
function(G)if type(G)~="table"then
 
warn("Invalid dropdown selection:",G)
return end
 c.shovel_plants_list={}for G,V in pairs(G)do
 c.shovel_plants_list[G]=V end
 n()end
})u:AddButton({Text="\226\153\187\239\184\143 Reload Plants",Func=
function()if not E.IsDataFullyLoaded or not E.IsFarmFullyLoaded()then
 Z.Notify("Farm is still loading...")
return end
 l.UpdateCurrentPlantsInFarm()Z.Notify("Reloaded")end
})u:AddDivider()
local G 
local V="\240\159\140\177 Max <font color=\'#F54927\'>Plants</font> to keep"G=u:AddInput("shovel_seedcount",{Text=V;Default=c.shovel_keep_amount,Numeric=true;AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="Enter number of plants to keep",Tooltip="Specify how many plants to keep when shovelling. Enter 0 to remove all. Each type of plant will follow this limit.";Callback=
function(y)
local j=jJ(y)if not j or j<0 then
 Z.Notify("Invalid Seed Count: "..y,3)G:SetValue(tostring(c.shovel_keep_amount))
return end
 if j>=0 then
 c.shovel_keep_amount=j n()G:SetText("\226\156\133 <font color=\'#00FF00\'>Plant Count Updated</font>")
task.wait(1)G:SetText(V)end
 end
})u:AddButton({Text="\226\150\182\239\184\143 Start Shovel";Func=
function()if l.IsActive then
 Z.Notify("Already running",3)
return end
 l.IsActive=true Z.Notify("Shovel started",3)n()end
})u:AddButton({Text="\240\159\148\180 Stop Shovel";Func=
function()if not l.IsActive then
 Z.Notify("Already stopped",3)
return end
 l.IsActive=false Z.Notify("Shovel stopped",3)n()end
})u:AddDivider()u:AddLabel({Text="\226\153\187\239\184\143 Auto-Shovel: Continuously removes plants that exceed your set limit. \240\159\140\177 Please select which plants to filter.";DoesWrap=true})u:AddToggle("toggleshovelalwayson",{Text="\226\154\161 Always On",Default=c.is_auto_shovel,Tooltip="Automatically removes any plants that go beyond your set maximum.",Callback=
function(G)c.is_auto_shovel=G n()if G then
 Z.Notify("\226\156\133 Auto-Shovel Enabled",1)
else
 Z.Notify("\226\143\184\239\184\143 Auto-Shovel Disabled",1)end
 end
})u:AddSpacer(20)end
 do
 V:AddLabel({Text="\240\159\140\177 Seed Placement System: select seeds to plant <font color=\'#32CD32\'>(will be automatically placed)</font>";DoesWrap=true})V:AddDivider()j.lbl_seed_status=V:AddLabel({Text="-",DoesWrap=true})V:AddDivider()j.lbl_seed_information=V:AddLabel({Text="";DoesWrap=true})V:AddDivider()
local G G=V:AddDropdown("dropdownSave",{Values={},Default={};Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\140\190 Seeds to Plant";Tooltip="Choose which seeds you want to plant automatically",Changed=
function(G)if type(G)~="table"then
 
warn("Invalid dropdown selection:",G)
return end
 c.seed_placement_list={}for G,V in pairs(G)do
 c.seed_placement_list[G]=V end
 n()end
})G:SetValues(I(P))G:SetValue(c.seed_placement_list)
local y=V:AddButton({Text="Select All",Tooltip="Selects all seeds on the list.",Func=
function()
local V=I(P)if#V>0 then
 c.seed_placement_list={}end
 for G,V in ipairs(V)do
 c.seed_placement_list[V]=true end
 G:SetValue(c.seed_placement_list,true)n()end
})y:AddButton({Text="<font color=\'#ED2A00\'>DeSelect All</font>";Tooltip="Deselects all the seeds on the list",Func=
function()c.seed_placement_list={}G:SetValue(c.seed_placement_list,true)n()end
})V:AddDivider()
local i 
local J="\240\159\140\177 Max <font color=\'#32CD32\'>Seeds</font> to keep"i=V:AddInput("seed_keepcount",{Text=J,Default=c.seed_keep_amount;Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false,Placeholder="Enter maximum seeds per type";Tooltip="Specify how many seeds can be planted per type at once.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Seed Count: "..G,3)i:SetValue(tostring(c.seed_keep_amount))
return end
 c.seed_keep_amount=V n()i:SetText("\226\156\133 <font color=\'#00FF00\'>Seed Count Updated</font>")
task.wait(1)i:SetText(J)end
})V:AddDivider()
local T="\226\154\161 <font color=\'#FF9E1F\'>Seed Placement Speed</font>"
local d d=V:AddInput("inputspeedtimer",{Text=T;Default=c.seed_speed_timer1;Numeric=true;AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="Enter placement speed (lower = faster)",Tooltip="Set how fast seeds are automatically placed. Smaller numbers mean faster placement.",Callback=
function(G)
local V=iJ(G)if not V then
 Z.Notify("\226\157\140 Invalid number: "..tostring(G),3)d:SetValue(tostring(c.seed_speed_timer1))
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Please enter a number greater than 0",3)d:SetValue(tostring(c.seed_speed_timer1))
return end
 c.seed_speed_timer1=V n()d:SetText("\226\156\133 <font color=\'#00FF00\'>Placement Speed Updated</font>")
task.wait(1.5)d:SetText(T)end
})j.lbl_seed_location=V:AddLabel({Text="-";DoesWrap=true})V:AddDivider()B.Labels.updateLocation("\240\159\147\141Current Position: "..tostring(c.seed_location_vector))
local u=V:AddButton({Text="\240\159\151\186\239\184\143 Copy Player Position";Tooltip="Please stand where you want to plant the Seeds.";Func=
function()
local G=a.GetCurrentCFrameFromPlayerString()if not G then
 Z.Notify("Failed to save",3)
return end
 
local V=a.StringToVector3(G)
local y=E.mFarm.Center_Point.Position if a.IsWithinRangeOfFarm(y,V)then
 Z.Notify("Failed, Please be inside your farm.",3)
return end
 c.seed_location_vector=G B.Labels.updateLocation("\240\159\147\141New Position: "..c.seed_location_vector)Z.Notify("Position saved",3)n()end
})V:AddToggle("toggleRandomPos",{Text="\240\159\142\178 Random Placement";Default=c.is_seed_random,Tooltip="Automatically plants seeds at random positions.",Callback=
function(G)c.is_seed_random=G n()if G then
 Z.Notify("\226\156\133 Random Placement Enabled",1)
else
 Z.Notify("\226\143\184\239\184\143 Random Placement Disabled",1)end
 end
})V:AddToggle("togglecenterePos",{Text="\240\159\147\140 Center Place",Default=c.is_seedplace_center,Tooltip="Automatically plants seeds at center right. Overrides random placement.";Callback=
function(G)c.is_seedplace_center=G n()if G then
 Z.Notify("\226\156\133 center Placement Enabled",1)
else
 Z.Notify("\226\143\184\239\184\143 center Placement Disabled",1)end
 end
})V:AddButton({Text="\226\150\182\239\184\143 Start Placement";Func=
function()if B.IsActive then
 Z.Notify("Already running",3)
return end
 B.IsActive=true Z.Notify("Seed placement started",3)n()end
})V:AddButton({Text="\240\159\148\180 Stop Placement";Func=
function()if not B.IsActive then
 Z.Notify("Already stopped",3)
return end
 B.IsActive=false Z.Notify("Seed placement stopped",3)n()end
})V:AddDivider()V:AddLabel({Text="\226\153\187\239\184\143 Auto-Placement: Continuously plants seeds according to your selected types.";DoesWrap=true})V:AddToggle("toggleseedalwayson",{Text="\226\154\161 Always On";Default=c.is_auto_seed;Tooltip="Automatically plants seeds continuously according to your limits.",Callback=
function(G)c.is_auto_seed=G n()if G then
 Z.Notify("\226\156\133 Auto-Placement Enabled",1)
else
 Z.Notify("\226\143\184\239\184\143 Auto-Placement Disabled",1)end
 end
})V:AddSpacer(20)end
 end
 
function Z.MEventsUi()
local G=y9:AddTab({Name="<b><stroke color=\'#000000\' thickness=\'1.5\'><font color=\'#FF6347\'>Event</font> <font color=\'#FFFFFF\'>&</font> <font color=\'#00FFFF\'>Mutation</font></stroke></b>";Description="Manage game events and pet mutations.",Icon="calendar-heart"})
local y="HoneyBee Event \240\159\148\165"
local J=G:AddLeftGroupbox("\240\159\164\150 Gardens","tasks")
local d=G:AddLeftGroupbox("\240\159\141\175 Honey Machine 2026","tasks")
local u=G:AddLeftGroupbox("Bee Hive & Shop","coins")
local g=G:AddLeftGroupbox(y,"snowflake")
local E=G:AddLeftGroupbox("\240\159\141\130 <font color=\'#FFD700\'>Quests</font> \240\159\140\189","tasks")
local a=G:AddRightGroupbox("AutoAscension","calendar-sync")
local e=G:AddRightGroupbox("Pet Mutation Machine","blocks")
local s=G:AddRightGroupbox("<uc>Event Category</uc>","sun-moon")
local N=G:AddRightGroupbox("<uc>Data</uc>","blocks")
local X=G:AddLeftGroupbox("[\226\155\143] Dig Event","shovel")
local h=G:AddLeftGroupbox("Cleanse Pets","spray-can")if u then
 u:AddLabel({Text="\226\132\185\239\184\143 Select which Bee Eggs should be bought automatically from the Honey Bee Egg Shop.";DoesWrap=true})
local G=
function()
local G=0 for V,y in pairs(T.bee_whitelisteggs or{})do
 if y==true then
 G=G+1 end
 end
 
local V=Z.BeeEggs or{}
local y=#V 
local j=G<=0 and"#FF5555"or"#00FF99"
return string.format("<font color=\"#FFD45A\"><b>\240\159\165\154 Bee Eggs</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",j,G,y)end
 
local V V=u:AddDropdown("dd_honey_bee_eggs_autobuy",{Values={};Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=G(),Callback=
function(y)if y==nil then
 
return end
 T.bee_whitelisteggs={}for G,V in pairs(y)do
 if V==true then
 T.bee_whitelisteggs[G]=true end
 end
 V:SetText(G())R()end
})V:SetValues(Z.BeeEggs or{})V:SetValue(T.bee_whitelisteggs or{})u:AddToggle("toggle_honey_bee_auto_buy_eggs",{Text="\240\159\155\146 <font color=\'#FFFFFF\'>Auto Buy Selected Bee Eggs</font>",Default=T.bee_autobuyshop;Tooltip="Automatically buys only the Bee Eggs selected above. The most expensive selected egg is bought first when stock and Honey Coins are available.",Callback=
function(G)T.bee_autobuyshop=G R()end
})u:AddToggle("toggle_honey_bee_auto_hatch_upgrade",{Text="\240\159\144\157 <font color=\'#FFFFFF\'>Auto Hatch & Upgrade Hive Bees</font>";Default=T.bee_hiveautohatch;Tooltip="Automatically manages your Bee Hive. It fills empty slots, hatches wanted bees, and replaces unwanted bees using your best available Bee Eggs. Keeps at least one active bee safe so your garden can still pollinate.";Callback=
function(G)T.bee_hiveautohatch=G R()end
})u:AddToggle("toggle_honey_bee_auto_skill_tree",{Text="\226\172\134\239\184\143 <font color=\'#FFFFFF\'>Auto Upgrade Bee Hive Skill Tree</font>",Default=T.bee_hiveautoupgrade,Tooltip="Automatically spends Honey Coins on useful hive upgrades. It follows a smart upgrade path focused on earning more Honey Coins faster, then
 expanding bee capacity and speed.",Callback=
function(G)T.bee_hiveautoupgrade=G R()end
})end
 if d then
 d:AddLabel({Text="\226\132\185\239\184\143 Automatically submits plants, starts the machine, and claims honey when ready. Enable the honey machine to use below options.",DoesWrap=true})d:AddToggle("togglegHoneyMachine2026SubmitAuto",{Text="\240\159\140\177 Auto Submit Plants",Default=T.honeymachine_autosubmit;Callback=
function(G)T.honeymachine_autosubmit=G R()end
})d:AddToggle("togglegHoneyMachine2026claim",{Text="\240\159\141\175 Auto Claim Honey",Default=T.honeymachine_autoclaim,Callback=
function(G)T.honeymachine_autoclaim=G R()end
})d:AddDivider()d:AddToggle("togglegHoneyMachine2026enablesystem",{Text="\240\159\141\175 Enable Honey Machine",Default=T.honeymachine_enabled;Callback=
function(G)T.honeymachine_enabled=G R()end
})end
 if h then
 h:AddLabel({Text="\226\132\185\239\184\143 Cleanse pets on the farm using the filters below. You must select Pet Type and Mutations you want to remove! Does nothing if Pet Type or Mutation selection is empty.";DoesWrap=true})
local G=h:AddDropdown("cleanpets_dd",{Values={},Default={};Multi=true;Text="\240\159\166\156 Pet Type",Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 T.clean_pet_type=G R()end
})G:SetValues(Z.all_pets_names_list,true)G:SetValue(T.clean_pet_type)h:AddDivider()h:AddLabel({Text="<font color=\'#00BFFF\'><b>\226\132\185\239\184\143 Select mutations to remove from your pets.</b></font>";DoesWrap=true})
local V=
function()
local G=0 for V,y in pairs(T.clean_mut_list)do
 G=G+1 end
 
local V=I(Y.AllMutationsList)
local y=#V 
local Z=G>=y and"#FF5555"or"#00FF99"
local j=string.format("<font color=\"#FF009F\"><b>\240\159\148\180 Remove Mutations</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",Z,G,y)
return j end
 
local y y=h:AddDropdown("ddremovecleanmut",{Values={},Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=V(),Callback=
function(G)if G==nil then
 
return end
 T.clean_mut_list={}for G,V in pairs(G)do
 T.clean_mut_list[G]=true end
 y:SetText(V())R()end
})y:SetValues(I(Y.AllMutationsList))y:SetValue(T.clean_mut_list)h:AddDivider()h:AddToggle("clean_system_enabled",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\226\154\161 <font color=\'#00FFFF\'>Enable</font> <font color=\'#FF69B4\'>Cleanse</font></stroke></b>",Default=T.clean_system_enabled,Tooltip="If enabled it will clean mutations on the pets with selected filters";Callback=
function(G)T.clean_system_enabled=G R()end
})h:AddSpacer(300)end
 if J then
 J:AddLabel({Text="\240\159\146\161 Quickly switch between easter and honry bee garden. if farm is loaded. Resets the bee timers. ";DoesWrap=true})J:AddButton({Text="Load Easter Garden";Func=
function()(game:GetService("ReplicatedStorage")).GameEvents.EasterEvent.LoadSpecialGardenRE:FireServer("EASTER_2026")end
})J:AddButton({Text="Load HoneyBee Garden",Func=
function()(game:GetService("ReplicatedStorage")).GameEvents.EasterEvent.LoadSpecialGardenRE:FireServer("BIZZYBEE_2026")end
})J:AddToggle("autowitchgardenfast",{Text="Auto Switch Gardens",Default=c.auto_switchgarden_fast;Tooltip="Every 30s will switch between each garden",Callback=
function(G)c.auto_switchgarden_fast=G n()end
})end
 if gTradeEvent then
 gTradeEvent:AddLabel({Text="\240\159\146\161 Automatically submits to trade event.";DoesWrap=true})j.lbl_tradeevent_status=gTradeEvent:AddLabel({Text="Status: ",DoesWrap=true})gTradeEvent:AddDivider()gTradeEvent:AddToggle("gTradeEventbtncraftautofruitsx",{Text="\240\159\141\146 Auto-Collect Fruits",Default=T.tradeevent.fruit_collect,Tooltip="Automatically collects required fruits for crafting.";Callback=
function(G)T.tradeevent.fruit_collect=G R()
local V=G and"\240\159\141\146 Auto-Collect Enabled"or"\240\159\141\146 Auto-Collect Disabled"Z.Notify(V,2)end
})gTradeEvent:AddDivider()gTradeEvent:AddToggle("gTradeEventtogglesdjksdjksdx",{Text="\240\159\140\177 Auto-Place Plants",Default=T.tradeevent.seed_place,Tooltip="Automatically plants seeds when if no plants found.";Callback=
function(G)T.tradeevent.seed_place=G R()
local V=G and"\240\159\140\177 Auto-Plant Enabled"or"\240\159\140\177 Auto-Plant Disabled"Z.Notify(V,2)end
})gTradeEvent:AddToggle("toggleenabletradeevent",{Text="\226\154\161 Enable Trade Event";Default=T.tradeevent.enable_trade_event,Tooltip="Automatically submits requirements to trade event.";Callback=
function(G)T.tradeevent.enable_trade_event=G R()end
})end
 if gSmithMan then
 gSmithMan:AddLabel({Text="\240\159\146\161 Automatically submits items to the Smith Man. Auto collects fruits if none found.";DoesWrap=true})j.lbl_smithman_status=gSmithMan:AddLabel({Text="Status: ";DoesWrap=true})
local G=gSmithMan:AddDropdown("dd_egglistsmithman",{Values={};Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10,Text="Select <font color=\'#32CD32\'>Eggs</font>";Tooltip="Select eggs to submit.";Changed=
function(G)if G==nil then
 
return end
 T.craftevent.egg_list=G R()end
})G:SetValues(W.AllEggNamesList)G:SetValue(T.craftevent.egg_list)
local V=gSmithMan:AddDropdown("gearlist_event_smith",{Values={};Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text="Select <font color=\'#32CD32\'>Gear</font>";Tooltip="Select gears to submit.",Changed=
function(G)if G==nil then
 
return end
 T.craftevent.gear_list=G R()end
})
local y=r.Gear.GetAllGearData()V:SetValues(y)V:SetValue(T.craftevent.gear_list)
local Z=gSmithMan:AddDropdown("fruitlist_event_smith",{Values={};Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10,Text="Select <font color=\'#32CD32\'>Fruits</font>";Tooltip="Select fruits to submit. If nothing is selected then
 random fruit will be submitted.";Changed=
function(G)if G==nil then
 
return end
 T.craftevent.fruit_list=G R()end
})Z:SetValues(F(P))Z:SetValue(T.craftevent.fruit_list)gSmithMan:AddToggle("autosmithman",{Text="\226\154\161 Enable Smith Man",Default=T.craftevent.smith_auto;Tooltip="Automatically submits items to smith man",Callback=
function(G)T.craftevent.smith_auto=G R()end
})end
 if X then
 X:AddLabel({Text="[\226\155\143] Digging Event \226\128\148 when enabled, it will automatically dig and automatically use your <font color=\'#FFD93B\'>Dig Trinkets</font> if available.",DoesWrap=true})X:AddDivider()X:AddToggle("autoDig",{Text="\240\159\170\163 Enable Auto Dig";Default=T.halloween.auto_dig,Tooltip="Automatically digs whenever you have available digs.",Callback=
function(G)T.halloween.auto_dig=G R()end
})X:AddDivider()end
 if s then
 
local 
function G()
local G=Z.GetEfficientEventFruits()
local V=Z.GetSeedsToPlaceBalanced(G)Z.event_seeding_list=V 
local y="<b><font color=\'#FFD700\'>Recommended Seeds</font></b>\n\n"for G,V in pairs(V)do
 y=y..string.format("<b><font color=\'#00FF00\'>%s</font></b>: %d\n",G,V.placeamount)end
 
local j=string.format("%s \n %s",Z.BuildEventSeedText(G),y)
return j end
 
local V=s:AddLabel({Text="Click reload button to get recommended seeds for placement.";DoesWrap=true})s:AddButton({Text="Reload Seed Data";Func=
function()Z.Notify("Reload",3)V:SetText(G())end
})s:AddButton({Text="<font color=\'#F6FF00\'>Place These Seeds</font>";Func=
function()if Z.event_seeding_active then
 Z.Notify("Already running",3)
return end
 Z.Notify("Started",3)Z.event_seeding_active=true end
})s:AddButton({Text="<font color=\'#FF0F0F\'>Stop seed placement</font>";Func=
function()if not Z.event_seeding_active then
 Z.Notify("Not running",3)
return end
 Z.Notify("Stopped",3)Z.event_seeding_active=false end
})end
 
local l=nil 
local B=""
local L=N:AddDropdown("ddDatalistsds",{Values={};Default={};Multi=false,Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\148\146 Select Key",Tooltip="Reads data based on key",Callback=
function(G)if G==nil then
 
return end
 B=G 
local y=m.GetBigDataUsingKey(G)
local Z=V.HttpService:JSONEncode(y)if l then
 l:SetText(Z)end
 end
})N:AddButton({Text="Copy";Func=
function()if B==""or B==nil then
 
return end
 
local G=m.GetBigDataUsingKey(B)
local y=V.HttpService:JSONEncode(G)W.CopyToClipBoard(y)end
})l=N:AddLabel({Text="--",DoesWrap=true})L:SetValues(m.AllBigDataKeys)if eventJungle then
 
local G="Seed Stages Event"j.lbl_jungle_stats=eventJungle:AddLabel({Text="\226\143\179 Waiting for stats...",DoesWrap=true})eventJungle:AddDivider()j.lbl_jungle_information=eventJungle:AddLabel({Text="-",DoesWrap=true})eventJungle:AddLabel({Text="\226\132\185\239\184\143 "..(G.." <font color=\'#FFD700\'>Skips Ascension-required items. Pausing as a other events occur. </font>");DoesWrap=true})eventJungle:AddDivider()eventJungle:AddToggle("seedstagesevent",{Text="\226\154\161 "..G;Default=c.is_auto_jungle,Tooltip="Auto submits and collects fruits.",Callback=
function(V)c.is_auto_jungle=V n()Z.Notify(G..(" "..((V and"Enabled"or"Disabled"))),2)end
})
local V=eventJungle:AddDropdown("auto_submitplants",{Values={},Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="Seed Stages <font color=\'#32CD32\'>Seeds</font>";Tooltip="Select plants to submit or collect.",Changed=
function(G)c.jungle_auto_plants_list={}for G,V in pairs(G)do
 c.jungle_auto_plants_list[G]=V end
 n()end
})
local y=F(P)
local i={}for G,V in ipairs(y)do
 if string.find(V,"Evo",1,true)then
 table.insert(i,V)end
 end
 V:SetValues(i)V:SetValue(c.jungle_auto_plants_list)eventJungle:AddDivider()eventJungle:AddLabel({Text="\240\159\155\146 <b>Shops</b>",DoesWrap=true})
local J=eventJungle:AddDropdown("jungle_seed_shop",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="Seed <font color=\'#32CD32\'>Stages</font>";Tooltip="Select Items to buy";Changed=
function(G)c.jungle_seed_stages1={}for G,V in pairs(G)do
 c.jungle_seed_stages1[G]=V end
 n()end
})J:SetValues(F(Z.JungleSeedStage1))J:SetValue(c.jungle_seed_stages1)eventJungle:AddDivider()eventJungle:AddDivider()eventJungle:AddDivider()eventJungle:AddDivider()eventJungle:AddDivider()eventJungle:AddDivider()end
 do
 j.lbl_mutation_machine_status=e:AddLabel({Text="\240\159\148\180 Stopped";DoesWrap=true})e:AddDivider()e:AddLabel({Text="<font color=\'#ffff11\'>------------------------------</font>";DoesWrap=false})i.dropdown_support_team=e:AddDropdown("mut_support_team",{Values={},Default={};Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text=Y.UI.GetText_LevelingTeam(),Callback=
function(G)if G==nil then
 
return end
 
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=PJ()-1 
local j=#V if j>y then
 i.dropdown_support_team:SetValue(DJ(c.mut_support_team))Z.Notify("Team size maxed",2)
else
 c.mut_support_team=V n()i.dropdown_support_team:SetText(Y.UI.GetText_LevelingTeam())end
 end
})i.dropdown_target_team=e:AddDropdown("dropdown_target_team",{Values={},Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=Y.UI.GetText_TargetTeam(),Callback=
function(G)if G==nil then
 
return end
 
local V={}
local y=true for G,Z in pairs(G)do
 if Z then
 
local Z=xJ(G)if Z then
 if Y.IsAllowedTargetTeamPet(Z)then
 table.insert(V,Z)
else
 y=false end
 end
 end
 end
 if not y then
 i.dropdown_target_team:SetValue(DJ(c.mut_target_pets_uuid))Z.Notify("This pet is already selected in your other mutation teams.")
return end
 
local j=99 
local J=#V if J>j then
 i.dropdown_target_team:SetValue(DJ(c.mut_target_pets_uuid))Z.Notify("Team size maxed",2)
else
 c.mut_target_pets_uuid=V n()i.dropdown_target_team:SetText(Y.UI.GetText_TargetTeam())end
 end
})
local G=e:AddDropdown("_ddBoostleveling",{Values={},Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=6,Text="\240\159\146\138 Pet Boosts";Tooltip="Boosts are applied to both teams (Leveling, Target) when teams is placed by the system.",Callback=
function(G)T.mutation_boost_level_team={}for G,V in pairs(G)do
 T.mutation_boost_level_team[G]=V end
 R()end
})G:SetValues(F(H.boosts_list))G:SetValue(T.mutation_boost_level_team)e:AddToggle("boostleveltargetteammut",{Text="\240\159\154\128 Enable Boosts";Default=T.mutation_boost_level_team_enabled,Tooltip="If enabled boosts will be applied when team is placed.",Callback=
function(G)T.mutation_boost_level_team_enabled=G R()end
})e:AddLabel({Text="<font color=\'#ffff11\'>------------------------------</font>",DoesWrap=false})e:AddDivider()e:AddLabel({Text="<font color=\"#FFFFFF\"><b>\226\132\185\239\184\143 Cooldown Team:</b></font> <font color=\"#DDDDDD\">This team will be placed when the machine is running to reduce its cooldown timer. [Ignored if empty]</font>",DoesWrap=true})i.dropdown_mut_cd_team=e:AddDropdown("dropdown_mut_cd_team",{Values={};Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10;Text=Y.UI.GetText_TeamCooldown();Callback=
function(G)if G==nil then
 
return end
 
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=PJ()
local j=#V if j>y then
 i.dropdown_mut_cd_team:SetValue(DJ(c.mut_mutation_machineteam))Z.Notify("Team size maxed",2)
else
 c.mut_mutation_machineteam=V n()i.dropdown_mut_cd_team:SetText(Y.UI.GetText_TeamCooldown())end
 end
})
local V=e:AddDropdown("_ddBoostMachineCd",{Values={},Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=6;Text="\240\159\146\138 Pet Boosts",Tooltip="Boosts are applied when teams is placed by the system.";Callback=
function(G)T.mutation_boost_cd_team={}for G,V in pairs(G)do
 T.mutation_boost_cd_team[G]=V end
 R()end
})V:SetValues(F(H.boosts_list))V:SetValue(T.mutation_boost_cd_team)e:AddToggle("boostteamtteammutcd",{Text="\240\159\154\128 Enable Boosts";Default=T.mutation_boost_cd_team_enabled,Tooltip="If enabled boosts will be applied when team is placed.",Callback=
function(G)T.mutation_boost_cd_team_enabled=G R()end
})e:AddLabel({Text="<font color=\'#ffff11\'>------------------------------</font>",DoesWrap=false})e:AddLabel({Text="<font color=\"#FFFFFF\"><b>\226\132\185\239\184\143 Pre-Claim Team:</b></font> <font color=\"#DDDDDD\">This team will be placed just before the system claims the pet. [Ignored if empty]</font>",DoesWrap=true})i.dropdown_claimpet_team=e:AddDropdown("dropdown_claimpet_team",{Values={},Default={},Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text=Y.UI.GetText_TeamClaimPet();Callback=
function(G)
warn("Updated called dropdown_claimpet_team")if G==nil then
 
return end
 
local V={}for G,y in pairs(G)do
 if y then
 
local y=xJ(G)if y then
 table.insert(V,y)end
 end
 end
 
local y=PJ()
local j=#V if j>y then
 i.dropdown_claimpet_team:SetValue(DJ(c.mut_claimpet_team))Z.Notify("Team size maxed",2)
else
 c.mut_claimpet_team=V n()i.dropdown_claimpet_team:SetText(Y.UI.GetText_TeamClaimPet())end
 end
})
local y=e:AddDropdown("_ddClaimBoost",{Values={},Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=6,Text="\240\159\146\138 Pet Boosts",Tooltip="Boosts are applied when team is placed by the system.";Callback=
function(G)T.mutation_boost_team_claim={}for G,V in pairs(G)do
 T.mutation_boost_team_claim[G]=V end
 R()end
})y:SetValues(F(H.boosts_list))y:SetValue(T.mutation_boost_team_claim)e:AddToggle("boostclaimteammut",{Text="\240\159\154\128 Enable Boosts";Default=T.mutation_boost_claim_enabled;Tooltip="If enabled boosts will be applied when team is placed.",Callback=
function(G)T.mutation_boost_claim_enabled=G R()end
})e:AddLabel({Text="<font color=\'#ffff11\'>------------------------------</font>",DoesWrap=false})e:AddDivider()Y.UI.UpdateTeamsDropdowns()e:AddDivider()e:AddLabel({Text="<font color=\'#00BFFF\'><b>\226\132\185\239\184\143 Select mutations you want to apply to your pets.</b></font>",DoesWrap=true})
local J J=e:AddDropdown("dropdown_target_mutations_list",{Values={},Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text=Y.UI.GetText_MutationList();Callback=
function(G)if G==nil then
 
return end
 c.mut_target_mutations={}for G,V in pairs(G)do
 c.mut_target_mutations[G]=true end
 J:SetText(Y.UI.GetText_MutationList())n()end
})J:SetValues(I(Y.AllMutationsList))J:SetValue(c.mut_target_mutations)e:AddDivider()e:AddToggle("leveltomaxmutation",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\140\136 <font color=\'#00FFFF\'>Max Level</font> <font color=\'#FF69B4\'>Mutated</font></stroke></b>",Default=c.mut_max_level_successfulpets;Tooltip="Levels up any pet \226\156\168 that gets the mutations you wanted, <b>automatically</b>!",Callback=
function(G)c.mut_max_level_successfulpets=G n()end
})e:AddToggle("batch_leveling_mode",{Text="<b><stroke color=\'#000000\' thickness=\'1\'>\240\159\148\132 <font color=\'#87CEEB\'>Batch</font> <font color=\'#90EE90\'>Leveling</font></stroke></b>";Default=c.mut_batch_process_enable;Tooltip="When enabled, levels a full team of pets. The process will restart to pick a new pet each time one reaches the required level.";Callback=
function(G)c.mut_batch_process_enable=G n()end
})e:AddButton({Text="\240\159\159\162 Start Mutation System",Func=
function()Y.StartThread()end
})e:AddButton({Text="\240\159\148\180 Stop Mutation System",Func=
function()Y.StopThread()end
})e:AddDivider()e:AddDivider()e:AddDivider()e:AddDivider()
local d=e:AddButton({Text="Submit Held Pet";Func=
function()Y.SubmitHeldPet()end
})
local u=e:AddButton({Text="Claim Mutated Pet",Func=
function()Y.ClaimMutatedPet()end
})
local q=e:AddButton({Text="Start Machine";Func=
function()Y.StartMachine()end
})e:AddSpacer(30)end
 
local K=false if g then
 
local G="Honey Bee"j.lbl_fallevent_stats=g:AddLabel({Text="\226\143\179 Waiting to start with delay.",DoesWrap=true})g:AddDivider()j.lbl_fallevent_progress=g:AddLabel({Text="-";DoesWrap=true})j.lbl_fallevent_required_fruits=g:AddLabel({Text="-";DoesWrap=true})j.lbl_fallevent_fall_bloom=g:AddLabel({Text="-";DoesWrap=true})j.lbl_fallevent_progress:SetVisible(false)j.lbl_fallevent_required_fruits:SetVisible(false)j.lbl_fallevent_fall_bloom:SetVisible(false)g:AddLabel({Text="\226\132\185\239\184\143 "..(G.." <font color=\'#FFD700\'> auto harvest, auto plant, auto submit and more!</font>");DoesWrap=true})g:AddDivider()g:AddToggle("autoplantseedsevent",{Text="\240\159\141\128 <font color=\'#00DB73\'>Auto Plant Seeds</font>",Default=c.is_auto_plantseedEvent;Tooltip="If enabled auto plants honey seeds. Will only work if you have honey garden active",Callback=
function(G)c.is_auto_plantseedEvent=G n()end
})g:AddToggle("autoplantseedsevent",{Text="\240\159\147\141 <font color=\'#91E326\'>Teleport to middle</font>";Default=c.event_automiddle_tp;Tooltip="Tp to middle of the farm every 1 min",Callback=
function(G)c.event_automiddle_tp=G n()end
})g:AddToggle("toggle_hive_esp_eggs",{Text="\240\159\165\154 <font color=\'#FFFFFF\'>Show Hatching Egg Names [Hive ESP]</font>";Default=c.hive_esp_eggs;Tooltip="Shows the egg name above hive slots while the egg is still hatching.",Callback=
function(G)c.hive_esp_eggs=G n()end
})g:AddToggle("toggle_hive_esp_showhatched",{Text="\240\159\144\157 <font color=\'#FFFFFF\'>Show Hatched Bee Names [Hive ESP]</font>",Default=c.hive_esp_showhatched;Tooltip="Shows the bee name above hive slots once the egg has hatched and the bee is active.",Callback=
function(G)c.hive_esp_showhatched=G n()end
})g:AddToggle("fastcollect",{Text="\226\156\168 <font color=\'#E60086\'>Fast Collect</font>";Default=c.is_fall_event_fastmode;Tooltip="If enabled Collects fruits really fast.";Callback=
function(G)c.is_fall_event_fastmode=G n()end
})g:AddDivider()g:AddToggle("tEventFall",{Text="\226\154\161 "..(G.." Auto Collects Fruits"),Default=c.is_fall_event_running,Tooltip="Enable or Disable event - if enabled it will collect fruits.",Callback=
function(V)c.is_fall_event_running=V n()Z.Notify(G..(" "..((V and"Enabled"or"Disabled"))),2)end
})g:AddDivider()
local V=q.HalloweenShopData g:AddLabel({Text="\240\159\155\146 "..(G.." <b>Shops</b>"),DoesWrap=true})
local y={}for G in pairs(V)do
 table.insert(y,G)end
 table.sort(y)for G,y in ipairs(y)do
 
local Z=V[y]
local j=W.StringToColor3(y)
local i=g:AddDropdown(y.."shoppinh",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text=string.format("<stroke color=\'#cccccc\' thickness=\'1\' transparency=\'0.5\'><font color=\'%s\'>%s</font></stroke>",j,y);Tooltip="Select Items to buy";Changed=
function(G)if G==nil then
 
return end
 T.halloween.shops[y]=G R()end
})i:SetValues(Z)i:SetValue(T.halloween.shops[y]or{})end
 if K then
 g:AddLabel({Text="\240\159\155\146 <b>Shops</b>",DoesWrap=true})
local G=g:AddDropdown("xfall_pet_shop",{Values={},Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text="Fall Festival <font color=\'#FF69B4\'>Pets</font>";Tooltip="Select Items to buy",Changed=
function(G)c.fall_pets_shop={}for G,V in pairs(G)do
 c.fall_pets_shop[G]=V end
 n()end
})
local V=g:AddDropdown("xfall_seed_shop",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=5;Text="Fall Festival <font color=\'#32CD32\'>Seeds</font>",Tooltip="Select Items to buy";Changed=
function(G)c.fall_seeds_shop={}for G,V in pairs(G)do
 c.fall_seeds_shop[G]=V end
 n()end
})
local y=g:AddDropdown("xfall_gear_shop",{Values={};Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=6;Text="Fall Festival <font color=\'#FFA500\'>Gears</font>";Tooltip="Select Items to buy",Changed=
function(G)c.fall_gear_shop={}for G,V in pairs(G)do
 c.fall_gear_shop[G]=V end
 n()end
})
local j=g:AddDropdown("xfall_cosmetic_shop",{Values={},Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=5,Text="Fall Festival <font color=\'#8A2BE2\'>Cosmetics</font>",Tooltip="Select Items to buy";Changed=
function(G)c.fall_cosmetic_shop={}for G,V in pairs(G)do
 c.fall_cosmetic_shop[G]=V end
 n()end
})G:SetValues(F(Z.FallEvent_Pet_Shop_ItemList))V:SetValues(F(Z.FallEvent_Seeds_Shop_ItemList))j:SetValues(F(Z.FallEvent_Cosmetic_Shop_ItemList))y:SetValues(F(Z.FallEvent_Gear_Shop_ItemList))G:SetValue(c.fall_pets_shop)V:SetValue(c.fall_seeds_shop)j:SetValue(c.fall_cosmetic_shop)y:SetValue(c.fall_gear_shop)end
 j.lbl_fallevent_fruit_ls=g:AddLabel({Text="",DoesWrap=true})g:AddSpacer(120)end
 if E then
 j.lbl_questline_status=E:AddLabel({Text="Not running",DoesWrap=true})E:AddDivider()j.lbl_questline_info=E:AddLabel({Text="-";DoesWrap=true})E:AddDivider()E:AddLabel({Text="\226\132\185\239\184\143 Automatically performs quests.",DoesWrap=true})E:AddDivider()
local G="Auto Spin"E:AddToggle("enableautospintoggle",{Text="\226\153\187\239\184\143 "..G;Default=c.is_fall_questline_spin;Tooltip="Auto Spin";Callback=
function(V)c.is_fall_questline_spin=V n()Z.Notify(G..(" "..((V and"Enabled"or"Disabled"))),2)end
})E:AddDivider()
local V="Enable Quests"E:AddToggle("enablequestlinetogglex",{Text="\226\154\161 "..V;Default=c.is_fall_questline_auto;Tooltip="Enable or disable quests",Callback=
function(G)c.is_fall_questline_auto=G n()Z.Notify(V..(" "..((G and"Enabled"or"Disabled"))),2)end
})E:AddSpacer(50)end
 j.lbl_ascenstats=a:AddLabel({Text="Current status";DoesWrap=true})a:AddDivider()a:AddLabel({Text="\226\154\160\239\184\143 Auto Ascension: Plants, collects fruits, and claims Ascension for you.\nPauses if hatching is in progress.\nAutomatically removes <font color=\'#4da6ff\'>[Frozen,Tempestuous]</font>, then
 applies <font color=\'#3399cc\'>[Windstruck]</font> or <font color=\'#66ccff\'>[Chilled]</font> after removing <font color=\'#4da6ff\'>[Frozen]</font>.";DoesWrap=true})j.lbl_ascen_current_requirement=a:AddLabel({Text="",DoesWrap=true})j.lbl_ascen_cd=a:AddLabel({Text="";DoesWrap=true})if c.auto_ascension then
 Fl("\240\159\159\162 Ascension is active")
else
 Fl("\226\157\140 Ascension not active")end
 a:AddDivider()
local b 
local S="\240\159\140\177 Max <font color=\'#7CFC00\'>Seeds</font> to place"b=a:AddInput("asen_seedcount",{Text=S,Default=c.ascension_max_seeds;Numeric=true;AllowEmpty=true,Finished=true;ClearTextOnFocus=false;Placeholder="Enter seed count here";Tooltip="Places seeds when you are missing plant.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Seed Count: "..G,3)b:SetValue(tostring(c.ascension_max_seeds))
return end
 if V>0 then
 c.ascension_max_seeds=V n()b:SetText("\226\156\133 <font color=\'#00FF00\'>Seeds Count Updated</font>")
task.wait(1)b:SetText(S)end
 end
})a:AddDivider()a:AddToggle("fastascens",{Text="\240\159\148\180 Spam Ascension";Default=T.fast_ascen,Tooltip="If enabled. Spams claim button when its ready";Callback=
function(G)T.fast_ascen=G R()end
})a:AddDivider()a:AddToggle("toogleAutoA",{Text="\226\154\161 Auto Ascension",Default=c.auto_ascension;Tooltip="Enable or Disable Ascension",Callback=
function(G)c.auto_ascension=G n()Z.Notify("Auto Ascension "..((G and"Enabled"or"Disabled")),1)end
})a:AddDivider()end
 
function Z.UiPetsSideTab()
local G=y9:AddTab({Name="<font color=\'#FFD700\'>Pet Manager</font>";Description="<font color=\'#00FFFF\'>Feed, grow, and manage your pets with ease.</font>";Icon="rabbit"})
local y=G:AddLeftGroupbox("Pet Feeding System","hand-platter")
local J=G:AddRightGroupbox("<font color=\'#FFD700\'>Pet </font><font color=\'#00FFFF\'>Level-Up</font>","bone")
local d=G:AddLeftGroupbox("Pet Marmot","circle-arrow-out-up-right")
local u=G:AddRightGroupbox("Chubby Chipmunk","nut")
local q=G:AddLeftGroupbox("Red Panda","panda")
local g=G:AddLeftGroupbox("Favorite Pets","panda")
local E=G:AddLeftGroupbox("Easter Bunny","bone")
local a=G:AddLeftGroupbox("Santa Bear","bone")
local e="\240\159\142\129 <stroke color=\'#000055\' thickness=\'1.5\' joins=\'round\'><b><font color=\'#FFFFFF\'>Magpie</font> <font color=\'#F52727\'>Rewards</font></b></stroke>"
local N=G:AddRightGroupbox(e)
local W=G:AddRightGroupbox("Bearded Dragon")if W then
 W:AddToggle("trackwardsEggsdragon",{Text="\240\159\165\154 Track Eggs";Default=c.bearded_dragon_recordstatus;Tooltip="If enabled will count and track eggs from shop";Callback=
function(G)c.bearded_dragon_recordstatus=G n()end
})W:AddDivider()W:AddDivider()j.lbl_dragon_item_collected=W:AddLabel({Text="",DoesWrap=true})W:AddDivider()end
 if N then
 N:AddToggle("trackwardspie",{Text="\240\159\148\141 Track Rewards";Default=c.magpie_recordstatus;Tooltip="If enabled will count and track rewards";Callback=
function(G)c.magpie_recordstatus=G n()end
})N:AddDivider()N:AddDivider()j.lbl_magpie_item_collected=N:AddLabel({Text="",DoesWrap=true})N:AddDivider()end
 if g then
 
local G=g:AddDropdown("dd_giftpets_allowlistpetfav",{Values={};Default={};Multi=true;Text="\240\159\166\150 Pets",Searchable=true;MaxVisibleDropdownItems=10,Changed=
function(G)if not G then
 
return end
 T.petfav.allow_pet_list=G R()end
})G:SetValues(Z.all_pets_names_list)G:SetValue(T.petfav.allow_pet_list)
local V=g:AddButton({Text="Select All";Func=
function()T.petfav.allow_pet_list={}for G,V in ipairs(Z.all_pets_names_list)do
 T.petfav.allow_pet_list[V]=true end
 G:SetValue(T.petfav.allow_pet_list)R()end
})V:AddButton({Text="<font color=\'#FF3D17\'>Remove All</font>",Func=
function()T.petfav.allow_pet_list={}G:SetValue(T.petfav.allow_pet_list)R()end
})
local y=g:AddDropdown("dd_giftpet_mutpetfav",{Values={};Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\167\172 Mutations",Callback=
function(G)if G==nil then
 
return end
 T.petfav.allow_mutation_list=G R()end
})y:SetValues(I(Y.AllMutationsList))y:SetValue(T.petfav.allow_mutation_list)
local j=
function()
local G=string.format("Min Level <font color=\'#47FF40\'>%s</font>",T.petfav.min_age)
return G end
 
local i=
function()
local G=string.format("Max Level <font color=\'#FF4065\'>%s</font>",T.petfav.max_age)
return G end
 
local c c=g:AddInput("input_min_agepetfav",{Text=j();Default=T.petfav.min_age,Numeric=true,AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g 1",Tooltip="Specify minimum Pet Age";Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)c:SetValue(tostring(T.petfav.min_age))
return end
 if V>T.petfav.max_age then
 Z.Notify("Can\'t be more than max age ",3)c:SetValue(tostring(T.petfav.min_age))
return end
 T.petfav.min_age=V R()c:SetText(j())end
})
local J J=g:AddInput("input_max_agepetfav",{Text=i();Default=T.petfav.max_age,Numeric=true,AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="e.g 1",Tooltip="Specify maximum Pet Age",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)J:SetValue(tostring(T.petfav.max_age))
return end
 if V<T.petfav.min_age then
 Z.Notify("Can\'t be lower than min age ",3)J:SetValue(tostring(T.petfav.max_age))
return end
 T.petfav.max_age=V R()J:SetText(i())end
})
local d=
function()
local G=string.format("Min BaseWeight <font color=\'#47FF40\'>%s</font>",T.petfav.min_weight)
return G end
 
local u=
function()
local G=string.format("Max BaseWeight <font color=\'#FF4065\'>%s</font>",T.petfav.max_weight)
return G end
 
local q q=g:AddInput("input_min_weightpetfav",{Text=d();Default=T.petfav.min_weight;Numeric=true;AllowEmpty=true,Finished=true;ClearTextOnFocus=false;Placeholder="e.g 1";Tooltip="Specify minimum Pet BaseWeight";Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)q:SetValue(tostring(T.petfav.min_weight))
return end
 if V>T.petfav.max_weight then
 Z.Notify("Can\'t be more than max weight",3)q:SetValue(tostring(T.petfav.min_weight))
return end
 T.petfav.min_weight=V R()q:SetText(d())end
})
local E E=g:AddInput("input_max_weightpetfav",{Text=u();Default=T.petfav.max_weight,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g 1",Tooltip="Specify maximum BaseWeight",Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid: "..G,3)E:SetValue(tostring(T.petfav.max_weight))
return end
 if V<T.petfav.min_weight then
 Z.Notify("Can\'t be lower than min weight ",3)E:SetValue(tostring(T.petfav.max_weight))
return end
 T.petfav.max_weight=V R()E:SetText(u())end
})g:AddButton({Text="\226\157\164\239\184\143 Fav Pets";Func=
function()S.FavouritePets.FavAllPets()end
})g:AddButton({Text="\226\157\140 Unfav Pets",Func=
function()S.FavouritePets.UnFavAllPets()end
})g:AddDivider()g:AddDivider()g:AddDivider()end
 
local X=nil 
local h={BlazeTopUpPet1=true,BlazeTopUpPet2=true,HexaFlame99=true,DobroeUtroOleg=true,topguy713=true,tinybloxi33=true,rizzyt9=true,["0SuperAlpha0"]=true,blazetopup=true}if h[V.LocalPlayer.Name]or Z.GetCheckIfPro()then
 X=G:AddRightGroupbox("<font color=\'#FF0062\'>Elephant </font><font color=\'#00FFFF\'>Boost</font>","sunrise")end
 if X then
 X:AddDivider()j.lbl_elephant_booster_status=X:AddLabel({Text="\226\154\170 Status";DoesWrap=true})X:AddLabel({Text="\240\159\166\163 <b><font color=\'#FFD700\'>Apply Boost \226\128\148 Step by Step</font></b>:\n1. Place the target unit (<font color=\'#00FFFF\'>Age 50</font> \226\128\148 or <font color=\'#FF69B4\'>Age 40</font> for <font color=\'#FFA500\'>Premium Elephants</font>).\n2. Place up to <font color=\'#00FF00\'>7 elephants</font> and pick them in Select Pets list! .\n3. Select the <b><font color=\'#00FFFF\'>Chew</font></b> boost.\n4. Set the amount to <b><font color=\'#FF4500\'>2</font></b> (tested to work).\n5. Press the <b><font color=\'#00FF00\'>Apply</font></b> button to activate.\n\n\226\154\160\239\184\143 <font color=\'#FF5555\'><b>Disable pick+place, Events and hatching</b></font> for best results!";DoesWrap=true})
local G=X:AddDropdown("petBoostActiveselectpets",{Values={},Default={};Multi=true;Text="\226\154\161 Choose Boost",Searchable=true;Tooltip="Select a pet boost to use.",MaxVisibleDropdownItems=10;Changed=
function(G)if not G then
 
return end
 T.elephant.boost_list=G R()end
})
local V=r.Gear.GetGearBoosts()G:SetValues(V)G:SetValue(T.elephant.boost_list)i.PetBoostSelectDropdown=X:AddDropdown("PetBoostSelectDropdown",{Values={},Default={},Multi=true,Text="\240\159\166\156 Select Pets",Searchable=true;MaxVisibleDropdownItems=10,Changed=
function(G)if G==nil then
 
return end
 T.elephant.pet_list={}for G,V in pairs(G)do
 
local y=xJ(G)if y then
 table.insert(T.elephant.pet_list,y)end
 end
 R()end
})X:AddDivider()X:AddButton("Reload Teams",
function()cl()end
)X:AddDivider()
local 
function y()
local G=T.elephant.delay_before_unequip 
local V=string.format("<b><font color=\'#FFD700\'>B4 UnEquip </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local 
function c()
local G=T.elephant.delay_before_place 
local V=string.format("<b><font color=\'#FFD700\'>B4 Equip </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local 
function J()
local G=T.elephant.boost_amount 
local V=string.format("<b><font color=\'#FFAB00\'>Amount Per Pet </font></b><font color=\'#00FFFF\'>%s</font>",G)
return V end
 
local d d=X:AddInput("inputbefore_pick_boost",{Text=y();Default=T.elephant.delay_before_unequip,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="e.g. 0.1";Tooltip="Delay before pet is unequipped";Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid Number: "..G,3)d:SetValue(tostring(T.elephant.delay_before_unequip))
return end
 if V>0 then
 T.elephant.delay_before_unequip=V R()d:SetText(y())end
 end
})
local u u=X:AddInput("inputbefore_place_boost",{Text=c(),Default=T.elephant.delay_before_place;Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false;Placeholder="e.g. 0.1",Tooltip="Delay before pet is equipped",Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid Number: "..G,3)u:SetValue(tostring(T.elephant.delay_before_place))
return end
 if V>0 then
 T.elephant.delay_before_place=V R()u:SetText(c())end
 end
})
local q q=X:AddInput("inputbefore_place_boostamount",{Text=J(),Default=T.elephant.boost_amount,Numeric=true,AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="e.g. 0.1",Tooltip="Boosts per pet. if you enter 3 it will apply x3 to same pet.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Number: "..G,3)q:SetValue(tostring(T.elephant.boost_amount))
return end
 if V>0 then
 T.elephant.boost_amount=V R()q:SetText(J())end
 end
})X:AddDivider()X:AddButton("Start Applying",
function()H.StartBoostingSelectedPetsElephant()end
)end
 j.lbl_redpanda_information=q:AddLabel({Text=(("Total Restocks: <b><font color=\'#EF2E92\'>%d</font></b>")):format(T.red_panda_restock_total),DoesWrap=true})m.RedPanda.updateInformation()q:AddDivider()q:AddToggle("toggleRedpandarestock",{Text="\226\154\161 Auto Record",Default=T.red_panda_record_items;Tooltip="Automatically records any restocks from Red Panda";Callback=
function(G)T.red_panda_record_items=G R()end
})q:AddDivider()E:AddLabel({Text="When enabled it will collect easter eggs when you have easter bunny pet in your farm.";DoesWrap=true})E:AddDivider()E:AddToggle("toggleeasterbunny",{Text="\226\154\161 Auto EasterBunny Reward",Default=c.easterbunnyeggrewardcollect,Tooltip="Automatically collects easter eggs",Callback=
function(G)c.easterbunnyeggrewardcollect=G n()end
})E:AddDivider()if a then
 a:AddLabel({Text="When enabled it will collect gifts dropped by the bear.",DoesWrap=true})a:AddDivider()j.lbl_found_merry_gifts=a:AddLabel({Text="",DoesWrap=true})a:AddDivider()a:AddToggle("toggleesantaBear",{Text="\226\154\161 Auto Gifts";Default=c.merrybear_collect;Tooltip="Automatically collects gifts";Callback=
function(G)c.merrybear_collect=G n()end
})a:AddDivider()end
 j.lbl_chubby_chipmunk_information=u:AddLabel({Text=(("Acorn Collected: <b><font color=\'#00FF00\'>%d</font></b>")):format(c.chubby_chipmunk_amount_collected),DoesWrap=true})m.ChubbyChipmunk.updateInformation()u:AddDivider()u:AddToggle("toggleAcornCollect",{Text="\226\154\161 Auto Acorn",Default=c.chubby_chipmunk_auto_collect;Tooltip="Automatically collect Acorn",Callback=
function(G)c.chubby_chipmunk_auto_collect=G n()
local V=G and" Started "or" Stopped"Z.Notify(V,2)end
})u:AddDivider()j.lbl_marmot_information=d:AddLabel({Text=(("Marmot Mound Collected: <b><font color=\'#00FF00\'>%d</font></b>")):format(c.marmot_amount_collected),DoesWrap=true})m.Marmot.updateInformation()d:AddDivider()d:AddToggle("toggleMarmotCollect",{Text="\226\154\161 Auto Marmot Mound";Default=c.marmot_auto_collect,Tooltip="Automatically collect Marmot Mound";Callback=
function(G)c.marmot_auto_collect=G n()
local V=G and" Started "or" Stopped"Z.Notify(V,2)end
})d:AddDivider()J:AddDivider()j.lbl_pet_level_status=J:AddLabel({Text="\240\159\148\180 Not running";DoesWrap=true})j.lbl_pet_level_info=J:AddLabel({Text="-",DoesWrap=true})
local l=J:AddDropdown("petleveldropdown",{Values={};Default={};Multi=false,Text="\226\154\161 Choose Boost",Searchable=true,Tooltip="Select a pet boost to use. Only one can be active at a time.";MaxVisibleDropdownItems=10,Changed=
function(G)if not G then
 
return end
 c.pet_level_boost_list=G n()end
})
local B=r.Gear.GetAllGearItems()table.insert(B,1,"\226\128\148")l:SetValues(B)l:SetValue(c.pet_level_boost_list)i.PetLevelDropDown=J:AddDropdown("dropdownlevelpetslist",{Values={};Default={},Multi=true,Text="\240\159\166\156 Select Pets To Level",Searchable=true;MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 c.pet_level_selected_pets={}for G,V in pairs(G)do
 if V then
 
local V=xJ(G)if V then
 table.insert(c.pet_level_selected_pets,V)end
 end
 end
 n()end
})s.LevelSystem.UpdateDropDown()J:AddDivider()J:AddButton("Reload Teams",
function()cl()Z.Notify("Loading...",2)end
)J:AddDivider()
local L 
local K="\226\140\155 <font color=\'#7CFC00\'>Max</font> Level"L=J:AddInput("inputMaxLevel",{Text=K;Default=c.pet_auto_level_max;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false,Placeholder="Max Level";Tooltip="Enter max age to reach.",Callback=
function(G)
local V=jJ(G)if not V or V<=0 then
 Z.Notify("Invalid Level: "..G,3)L:SetValue(tostring(c.pet_auto_level_max))
return end
 if V>0 then
 c.pet_auto_level_max=V n()L:SetText("\226\156\133 <font color=\'#00FF00\'>Max Level Updated</font>")
task.wait(1)L:SetText(K)end
 end
})
local b 
local z="\226\140\155 <font color=\'#FF4E29\'>Min</font> Level"b=J:AddInput("inputMinLevel",{Text=z,Default=c.pet_auto_level_min,Numeric=true,AllowEmpty=true,Finished=true,ClearTextOnFocus=false;Placeholder="Min Level";Tooltip="Enter min age (0 to disable), pets will start leveling if they are over minimum age",Callback=
function(G)
local V=jJ(G)if not V or V<0 then
 Z.Notify("Invalid Level: "..G,3)b:SetValue(tostring(c.pet_auto_level_min))
return end
 if V>=0 then
 c.pet_auto_level_min=V n()b:SetText("\226\156\133 <font color=\'#00FF00\'>Min Level Updated</font>")
task.wait(1)b:SetText(z)end
 end
})J:AddDivider()J:AddToggle("toogleAutoLevel",{Text="\226\154\161 Auto Level Pets";Default=c.pet_auto_level_auto,Tooltip="Automatically level pets";Callback=
function(G)c.pet_auto_level_auto=G n()
local V=G and" Started "or" Stopped"Z.Notify(V,2)end
})y:AddDivider()j.lbl_pet_system_live=y:AddLabel({Text="\240\159\148\180 Not running",DoesWrap=true})y:AddDivider()
local f=y:AddDropdown("exclude_pet_list",{Values={},Default={};Multi=true;Text="\240\159\166\156 Exclude Pets",Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)c.feeding_list_pets={}for G,V in pairs(G)do
 c.feeding_list_pets[G]=V end
 n()end
})f:SetValues(Z.all_pets_names_list)f:SetValue(c.feeding_list_pets)y:AddDivider()
local t=y:AddDropdown("exlcudeplants",{Values={};Default={},Multi=true,Text="\240\159\140\177 Exclude Plants",Searchable=true;MaxVisibleDropdownItems=10,Changed=
function(G)c.feeding_list_plants={}for G,V in pairs(G)do
 c.feeding_list_plants[G]=V end
 n()end
})t:SetValues(F(P))t:SetValue(c.feeding_list_plants)y:AddLabel({Text="\226\154\160\239\184\143 Feeds all active <font color=\'#FFFACD\'>pets</font> with hunger under <font color=\'#FF4C4C\'>60%</font>. Ignores <font color=\'#FFA07A\'>excluded</font> list pets. Paused if hatching is in progress.";DoesWrap=true})
local M 
local A="\226\140\155 <font color=\'#7CFC00\'>Time</font> in Seconds"M=y:AddInput("feedingtimeinput",{Text=A;Default=c.feeding_pets_timer,Numeric=true;AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="Enter time here";Tooltip="Feeds every seconds set.",Callback=
function(G)
local V=iJ(G)if not V or V<=0 then
 Z.Notify("Invalid time: "..G,3)M:SetValue(tostring(c.feeding_pets_timer))
return end
 if V>0 then
 c.feeding_pets_timer=V n()M:SetText("\226\156\133 <font color=\'#00FF00\'>Time Updated</font>")
task.wait(1)M:SetText(A)end
 end
})y:AddDivider()y:AddToggle("autofeddingsystemenable",{Text="\226\154\161 Auto Feed Pet",Default=c.feeding_pets_auto;Tooltip="Automatically feeds and collects fruits when required [if enabled].",Callback=
function(G)c.feeding_pets_auto=G n()
local V=G and" Started "or" Stopped"Z.Notify(V,2)end
})y:AddDivider()y:AddLabel({Text="\226\154\160\239\184\143 If you run out of <font color=\'#FFD700\'>fruits</font>, the system can automatically collect the <font color=\'#FFA500\'>required fruits</font>. Follows the <font color=\'#1E90FF\'>Fruit Collection</font> settings. Ignores fruits required for <font color=\'#00FF00\'>ascension</font>.";DoesWrap=true})
local x=y:AddDropdown("exclude_food_list",{Values={};Default={},Multi=true;Text="\240\159\141\149 Exclude Foods",Searchable=true,Tooltip="Will not feed these foods.",MaxVisibleDropdownItems=10,Changed=
function(G)c.feeding_exlude_food_list={}for G,V in pairs(G)do
 c.feeding_exlude_food_list[G]=V end
 n()end
})
local C=r.GetFoodCategoryNames()x:SetValues(C)x:SetValue(c.feeding_exlude_food_list)y:AddToggle("autofeedsys_enfood",{Text="\240\159\141\149 Feed Food",Default=c.feed_food_insteadoffruits,Tooltip="If enabled, it will feed food instead of fruits.";Callback=
function(G)c.feed_food_insteadoffruits=G n()
local V=G and"Enabled"or"Disabled"Z.Notify(V,2)end
})y:AddToggle("autofeedsys_en",{Text="\240\159\141\142 Auto Fruit Collection";Default=c.feeding_auto_collectfruits,Tooltip="Automatically collects fruits when none are available for feeding.",Callback=
function(G)c.feeding_auto_collectfruits=G n()
local V=G and"Enabled"or"Disabled"Z.Notify(V,2)end
})y:AddToggle("force_feedallpets",{Text="\240\159\154\168 Force Feed All Pets",Default=c.force_feed_all_pets;Tooltip="\226\154\161 Feed all pets immediately, even if they are full or at max level",Callback=
function(G)c.force_feed_all_pets=G n()
local V=G and"\226\156\133 Enabled"or"\226\157\140 Disabled"Z.Notify("\240\159\154\168 Force Feed All Pets: "..V,2)end
})y:AddSpacer(50)end
 
function Z.UiCraftsideTab()
local G=y9:AddTab({Name="\240\159\148\165 <font color=\'#F5272A\'>Craft</font> and \240\159\145\168\226\128\141\240\159\141\179 <font color=\'#00FF00\'>Cook</font>";Description="Automatically craft items and manage your workbench";Icon="hammer"})
local V=G:AddRightGroupbox("\240\159\145\168\226\128\141\240\159\141\179 <font color=\'#00FF00\'>Cooking Pots</font>","chef-hat")
local y=G:AddLeftGroupbox("\240\159\148\165 <font color=\'#00FF00\'>Work Bench(s)</font> \240\159\148\165","theater")
local J=G:AddLeftGroupbox("\226\154\148\239\184\143 <font color=\'#A3FFFA\'>Craft Teams</font>","brick-wall-fire")if J then
 J:AddLabel({Text="\226\132\185\239\184\143 Craft Teams - These teams handle your items before submission and before claiming. \240\159\148\180 They will not operate while hatching or mutation systems are active. <font color=\"#FF0F53\">Leave a team empty</font> if you do
 NOT wish to use it.";DoesWrap=true})j.lbl_craftteams_status=J:AddLabel({Text="Waiting...";DoesWrap=true})
local G=
function()
local G=#T.allcraft.team_claim 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#00FF3C\"><b>\240\159\142\129 Claim Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 
local V=
function()
local G=#T.allcraft.team_submit 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FF0066\"><b>\240\159\142\128 Submit Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 
local y=
function()
local G=#T.allcraft.team_idle 
local V=PJ()
local y=G>=V and"#FF5555"or"#00FF99"
local Z=string.format("<font color=\"#FFAA0F\"><b>\226\143\179 Idle Team</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",y,G,V)
return Z end
 i.craftteam_claim=J:AddDropdown("craftteam_claimx",{Values={};Default={},Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text=G();Tooltip="Select pets that will be placed before you claim items.";Callback=
function(V)if V==nil then
 
return end
 
local y={}for G,V in pairs(V)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local j=PJ()
local c=#y if c>j then
 i.craftteam_claim:SetValue(DJ(T.allcraft.team_claim))Z.Notify("Team size maxed",2)
else
 T.allcraft.team_claim=y R()i.craftteam_claim:SetText(G())end
 end
})i.craftteam_submit=J:AddDropdown("craftteam_submitx",{Values={},Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text=V(),Tooltip="This team will be placed when you are about to submit items.";Callback=
function(G)if G==nil then
 
return end
 
local y={}
local j=true for G,V in pairs(G)do
 if V then
 
local V=xJ(G)table.insert(y,V)end
 end
 
local c=PJ()
local J=#y if J>c then
 i.craftteam_submit:SetValue(DJ(T.allcraft.team_submit))Z.Notify("Team size maxed",2)
else
 T.allcraft.team_submit=y R()i.craftteam_submit:SetText(V())end
 end
})i.craftteam_idle=J:AddDropdown("craftteam_idlex",{Values={},Default={};Multi=true;Searchable=true,MaxVisibleDropdownItems=10;Text=y();Tooltip="This team will be used when crafts are not ready.";Callback=
function(G)if G==nil then
 
return end
 
local V={}
local j=true for G,y in pairs(G)do
 if y then
 
local y=xJ(G)table.insert(V,y)end
 end
 
local c=PJ()
local J=#V if J>c then
 i.craftteam_idle:SetValue(DJ(T.allcraft.team_idle))Z.Notify("Team size maxed",2)
else
 T.allcraft.team_idle=V R()i.craftteam_idle:SetText(y())end
 end
})J:AddLabel({Text="\226\154\160\239\184\143 When enabled, these teams will operate with the crafting system. Will not work if hatching or mutations are running.",DoesWrap=true})J:AddToggle("togglecraftTeamsGroups",{Text="\226\154\161 Craft Teams";Default=T.allcraft.teams_enabled,Tooltip="If enabled, These teams will be used by the crafting system";Callback=
function(G)T.allcraft.teams_enabled=G R()end
})J:AddSpacer(200)end
 
local d=
function(G,V)
local Z=y:AddDropdown("craft"..G,{Values={};Default={};Multi=true;Text="\240\159\155\160\239\184\143 "..G,Tooltip="Choose which items will be automatically crafted.";Searchable=true,MaxVisibleDropdownItems=10,Changed=
function(V)if V==nil then
 
return end
 T.allcraft.receipe_data[G]=V R()end
})Z:SetValues(F(V))Z:SetValue(T.allcraft.receipe_data[G])end
 if y then
 y:AddDivider()j.lbl_craftinggear_stats=y:AddLabel({Text="\240\159\148\180 Not running";DoesWrap=true})j.lbl_crafting_timeleft=y:AddLabel({Text="-",DoesWrap=true})y:AddDivider()y:AddLabel({Text="\226\154\160\239\184\143 Auto-Craft your items automatically. Crafting will be <font color=\"#FF0000\">paused</font> if <font color=\"#FFA500\">hatching is in progress</font>. Items will be crafted only if you have the <font color=\"#00FF00\">required resources</font>, otherwise they will be <font color=\"#FF0000\">skipped</font>.";DoesWrap=true})y:AddDivider()for G,V in pairs(N.AllReceipeData)do
 
local y=N.GetWorkBenchModelUsingName(G)if not y then
 continue end
 d(G,V)end
 y:AddDivider()y:AddToggle("autofeddingsystemenablex",{Text="\226\154\161 Auto-Craft",Default=T.allcraft.auto_craft_event,Tooltip="Automatically craft items when resources are available.",Callback=
function(G)T.allcraft.auto_craft_event=G R()
local V=G and"Auto-Craft Started"or"Auto-Craft Stopped"Z.Notify(V,2)end
})y:AddDivider()y:AddToggle("btncraftautofruitsx",{Text="\240\159\141\146 Auto-Collect Fruits",Default=c.craft_autofruit_workbench,Tooltip="Automatically collects required fruits for crafting.";Callback=
function(G)c.craft_autofruit_workbench=G n()
local V=G and"\240\159\141\146 Auto-Collect Enabled"or"\240\159\141\146 Auto-Collect Disabled"Z.Notify(V,2)end
})y:AddDivider()y:AddToggle("togglesdjksdjksdx",{Text="\240\159\140\177 Auto-Place Plants",Default=c.craft_autoplant_workbench;Tooltip="Automatically plants seeds when if no plants found.",Callback=
function(G)c.craft_autoplant_workbench=G n()
local V=G and"\240\159\140\177 Auto-Plant Enabled"or"\240\159\140\177 Auto-Plant Disabled"Z.Notify(V,2)end
})y:AddSpacer(200)end
 V:AddDivider()j.lbl_cooking_stats=V:AddLabel({Text="\240\159\148\180 Not running";DoesWrap=true})V:AddDivider()j.lbl_cooking_display_time=V:AddLabel({Text="-";DoesWrap=true})V:AddDivider()
local u=V:AddDropdown("cook1Dropdown1",{Values={};Default={},Multi=false;Text="\240\159\140\191 Ingredient 1",Tooltip="Select your first ingredient.";Searchable=true;MaxVisibleDropdownItems=7;Changed=
function(G)if G~=nil then
 c.cook_potone_item1=G 
else
 c.cook_potone_item1="-"end
 n()end
})
local q=F(P)table.insert(q,1,"-")u:SetValues(q)u:SetValue(c.cook_potone_item1)
local g=V:AddDropdown("cook2Dropdown",{Values={};Default={},Multi=false;Text="\240\159\165\149 Ingredient 2";Tooltip="Select your second ingredient.";Searchable=true;MaxVisibleDropdownItems=7;Changed=
function(G)if G~=nil then
 c.cook_potone_item2=G 
else
 c.cook_potone_item2="-"end
 n()end
})
local E=F(P)table.insert(E,1,"-")g:SetValues(E)g:SetValue(c.cook_potone_item2)
local a=V:AddDropdown("cook3Dropdown",{Values={};Default={};Multi=false;Text="\240\159\141\132 Ingredient 3",Tooltip="Select your third ingredient.",Searchable=true;MaxVisibleDropdownItems=7,Changed=
function(G)if G~=nil then
 c.cook_potone_item3=G 
else
 c.cook_potone_item3="-"end
 n()end
})
local H=F(P)table.insert(H,1,"-")a:SetValues(H)a:SetValue(c.cook_potone_item3)
local r=V:AddDropdown("cook4Dropdown",{Values={},Default={};Multi=false;Text="\240\159\141\133 Ingredient 4",Tooltip="Select your fourth ingredient.";Searchable=true;MaxVisibleDropdownItems=7;Changed=
function(G)if G~=nil then
 c.cook_potone_item4=G 
else
 c.cook_potone_item4="-"end
 n()end
})
local Y=F(P)table.insert(Y,1,"-")r:SetValues(Y)r:SetValue(c.cook_potone_item4)
local e=V:AddDropdown("cook5Dropdown",{Values={};Default={};Multi=false;Text="\240\159\141\177 Ingredient 5",Tooltip="Select your final ingredient.";Searchable=true,MaxVisibleDropdownItems=7;Changed=
function(G)if G~=nil then
 c.cook_potone_item5=G 
else
 c.cook_potone_item5="-"end
 n()end
})
local s=F(P)table.insert(s,1,"-")e:SetValues(s)e:SetValue(c.cook_potone_item5)V:AddDivider()V:AddLabel({Text="\226\154\160\239\184\143 Auto-Cooks foods for you, will cook on all available <font color=\"#FF0000\">Cooking Pots</font> ,<font color=\"#FFD700\">Skips Ascension-required items</font>. Pauses if <font color=\"#FFA500\">hatching is in progress</font>.";DoesWrap=true})V:AddDivider()Z.UI_Buttons.ButtonAutoCook=V:AddToggle("autocookstart",{Text="\240\159\165\163 Auto-Cook",Default=c.is_auto_cook,Tooltip="Automatically cooks ingredients when ready \240\159\141\179";Callback=
function(G)c.is_auto_cook=G n()
local V=G and"Auto-Cooking Started"or"Auto-Cooking Stopped"Z.Notify(V,2)end
})V:AddLabel({Text="\226\152\162\239\184\143 <font color=\"#FF4500\">Stop cooking before changing recipes - may cook the wrong dish</font>",DoesWrap=true})V:AddToggle("autocook_autoharvest",{Text="\240\159\141\146 Auto-Harvest Fruits",Default=c.cooking_autocollect_required,Tooltip="Auto-harvests fruits needed for recipes.",Callback=
function(G)c.cooking_autocollect_required=G n()
local V=G and"Enabled"or"Disabled"Z.Notify(V,2)end
})V:AddToggle("autocook_autoplant",{Text="\240\159\140\177 Auto Plant Missing";Default=c.cooking_autoplant_required,Tooltip="Auto Places missing plants needed for recipes.";Callback=
function(G)c.cooking_autoplant_required=G n()
local V=G and"Enabled"or"Disabled"Z.Notify(V,2)end
})V:AddSpacer(40)end
 
function Z.UiCollectionTab()
local G=y9:AddTab({Name="Fruit Collection",Description="Collect fruits with mutation lists";Icon="list-checks"})
local V=G:AddLeftGroupbox("Fruit Collection","shopping-basket")
local y=G:AddRightGroupbox("Safe Fruits","book-heart")if y then
 y:AddLabel({Text="\240\159\142\132\226\154\160\239\184\143 Safe Fruits \226\128\148 Select any fruits you want the system to protect from being deleted whenever sell or submit commands are triggered. Prevents events from Submitting these fruits aswel.",DoesWrap=true})
local G=y:AddDropdown("safefruitsselect",{Values={};Default={};Multi=true,Text="\240\159\141\137 Select Fruits";Searchable=true;MaxVisibleDropdownItems=10,Changed=
function(G)if G==nil then
 
return end
 T.safe_fruits=G R()end
})
local V=r.GetTableFruitToolNames()G:SetValues(V)G:SetValue(T.safe_fruits)
local j=y:AddButton({Text="\226\153\187\239\184\143 Reload Fruits",Tooltip="Reloads fruit list.",Func=
function()
local V=r.GetTableFruitToolNames()G:SetValues(V)G:SetValue(T.safe_fruits)end
})y:AddButton({Text="\240\159\146\176 Sell Fruit Inventory";Tooltip="Sells all inventory, applies all filters from sell fruits.";Func=
function()Z.GetAllFruitsToSell()end
})end
 V:AddDivider()j.lbl_fruit_collect_live=V:AddLabel({Text="\240\159\148\180 Not running";DoesWrap=true})V:AddDivider()
local i=V:AddDropdown("SeedSelector",{Values={};Default={};Multi=true,Text="\240\159\141\137 Select Fruit to Collect";Searchable=true;MaxVisibleDropdownItems=10;Changed=
function(G)c.collection_plants={}for G,V in pairs(G)do
 c.collection_plants[G]=V end
 u.ResetBucketCache()n()end
})i:SetValues(F(P))i:SetValue(c.collection_plants)V:AddDivider()
local J=V:AddDropdown("_whitelist",{Values={};Default={},Multi=true;Text="\226\156\133 Whitelist Mutations",Tooltip="Fruits matching the selected mutations are collected, otherwise all fruits are collected.",Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)c.mutation_whitelist={}for G,V in pairs(G)do
 c.mutation_whitelist[G]=V end
 u.ResetBucketCache()n()end
})J:SetValues(F(o))J:SetValue(c.mutation_whitelist)
local d=V:AddDropdown("_blacklis",{Values={};Default={},Text="\226\157\140 Blacklist Mutations";Multi=true;Searchable=true;Tooltip="Fruits carrying selected mutations will not be gathered.",MaxVisibleDropdownItems=10;Changed=
function(G)c.mutation_blacklist={}for G,V in pairs(G)do
 c.mutation_blacklist[G]=V end
 u.ResetBucketCache()n()end
})d:SetValues(F(o))d:SetValue(c.mutation_blacklist)
local q=V:AddDropdown("_variants",{Values={},Default={},Text="\226\156\168 <color=\'#FF00CF\'>Variant</font>";Multi=true;Searchable=true,Tooltip="Collects any selected Variants (Gold, Rainbow etc). if nothing is selected then
 collects everything.";MaxVisibleDropdownItems=10;Changed=
function(G)c.fruit_variants_select=G u.ResetBucketCache()n()end
})q:SetValues(F(Z.All_Variants))q:SetValue(c.fruit_variants_select)
task.spawn(
function()while 
task.wait()do
 if not q then
 break end
 
local G=(tick()%5)/5 
local V=Color3.fromHSV(G,1,1)
local y=V:ToHex()q:SetText("\226\156\168 <font color=\'#"..(y.."\'>Variant</font>"))end
 end
)V:AddDivider()
local 
function g()
local G=string.format("\226\156\168 Mutation Count <font color=\'#7CFC00\'>%s</font>",c.max_mutation_count)
return G end
 
local E E=V:AddInput("max_mutation_count",{Text=g(),Default=c.max_mutation_count;Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false,Placeholder="12",Tooltip="Enter amount of mutations should the fruit to collect it. e.g. 12. ",Callback=
function(G)
local V=jJ(G)if not V then
 Z.Notify("Invalid number : "..G,3)E:SetValue(c.max_mutation_count)
return end
 if V<0 then
 Z.Notify("Enter value 0 or more",3)E:SetValue(c.max_mutation_count)
return end
 c.max_mutation_count=V u.ResetBucketCache()n()E:SetText(g())end
})V:AddDivider()V:AddLabel({Text="\226\154\160\239\184\143 Applies to <font color=\'#FFFACD\'>events</font> and other parts of game where <font color=\'#FFA07A\'>fruits</font> are collected.",DoesWrap=true})
local a 
local H="\226\172\135\239\184\143 <font color=\'#7CFC00\'>Minimum</font> Weight [KG]"a=V:AddInput("MyInputmin",{Text=H;Default=c.g_fruit_weight_min,Numeric=true,AllowEmpty=true;Finished=true,ClearTextOnFocus=false;Placeholder="Min Weight Value",Callback=
function(G)
local V=iJ(G)if not V then
 Z.Notify("Invalid number : "..G,3)a:SetValue(c.g_fruit_weight_min)
return end
 if V<0 then
 Z.Notify("Enter value 0 or more",3)a:SetValue(c.g_fruit_weight_min)
return end
 if V>tonumber(c.g_fruit_weight_max)then
 Z.Notify("Minimum should be lower than maximum",3)a:SetValue(c.g_fruit_weight_min)
return end
 c.g_fruit_weight_min=V n()u.ResetBucketCache()a:SetText("\226\156\133 <font color=\'#00FF00\'>Minimum Weight Updated</font>")
task.wait(1.5)a:SetText(H)end
})
local Y="\226\172\134\239\184\143 <font color=\'#FF6B6B\'>Maximum</font> Weight [KG]"
local e e=V:AddInput("MyInputmax",{Text=Y;Default=c.g_fruit_weight_max;Numeric=true,AllowEmpty=true,Finished=true;ClearTextOnFocus=false;Placeholder="Max Weight Value";Callback=
function(G)
local V=iJ(G)if not V then
 Z.Notify("Invalid number : "..G,3)e:SetValue(tostring(c.g_fruit_weight_max))
return end
 if V<=0 then
 Z.Notify("Enter value more than 0",3)e:SetValue(tostring(c.g_fruit_weight_max))
return end
 if V<tonumber(c.g_fruit_weight_min)then
 Z.Notify("Maximum should be higher than minimum",3)e:SetValue(tostring(c.g_fruit_weight_max))end
 c.g_fruit_weight_max=V n()u.ResetBucketCache()e:SetText("\226\156\133 <font color=\'#00FF00\'>Maximum Weight Updated</font>")
task.wait(1.5)e:SetText(Y)end
})V:AddDivider()V:AddToggle("collect_fruits_togglefruit_collector_turbo",{Text="\240\159\148\165<font color=\'#FF8900\'> Turbo Mode</font>";Default=c.fruit_collector_turbo;Tooltip="If enabled, Uses faster collection mode.";Callback=
function(G)c.fruit_collector_turbo=G n()u.ResetBucketCache()end
})V:AddToggle("collect_fruits_toggle",{Text="\226\154\161 Enable Collector";Default=c.is_collect_fruit;Tooltip="Automatically collects fruits when available.",Callback=
function(G)c.is_collect_fruit=G n()u.ResetBucketCache()
local V=G and" Started "or" Stopped"Z.Notify(V,2)end
})V:AddSpacer(100)end
 
function Z.MSellUI()
local G=y9:AddTab({Name="Selling";Description="Sell fruits and more",Icon="store"})
local V=G:AddLeftGroupbox("Backpack","briefcase-business")
local y=G:AddLeftGroupbox("Sell Pets","briefcase-business")
local J=G:AddRightGroupbox("Sell Pet Type","dog")J:AddLabel({Text="\226\157\140 <font color=\'#FF4444\'><b>[\226\154\160 WARNING]</b> Any pets selected here will be <b>auto-sold!</b> Select with caution!</font> \226\157\140";DoesWrap=true})
local d=J:AddDropdown("sell_pettype_dd",{Values={};Default={};Multi=true;Text="\240\159\166\156 Select Pet Type",Searchable=true,MaxVisibleDropdownItems=10,Changed=
function(G)if G==nil then
 
return end
 T.sellingpets.auto_sell_selected=G R()end
})d:SetValues(Z.all_pets_names_list,true)d:SetValue(T.sellingpets.auto_sell_selected)J:AddToggle("autosellfavpets",{Text="\226\157\164\239\184\143 Sell Favorite";Default=T.sellingpets.auto_sell_override_fav,Tooltip="If enable it will also sell pets that are marked as Favorite.";Callback=
function(G)T.sellingpets.auto_sell_override_fav=G R()end
})J:AddToggle("autosellfavpets",{Text="\226\154\160\239\184\143 Enable Auto Sell";Default=T.sellingpets.auto_pet_sell;Tooltip="If enable it will sell selected pets when they are in inventory.",Callback=
function(G)T.sellingpets.auto_pet_sell=G R()end
})y:AddLabel({Text="Select pets to sell.",DoesWrap=true})j.lbl_sell_inventory_pets=y:AddLabel({Text="Status: ";DoesWrap=true})i.dropdown_sell_inventory_pets=y:AddDropdown("ddsellpet_list",{Values={};Default={},Multi=true,Text="\240\159\166\156 Select Pets Sell",Searchable=true,MaxVisibleDropdownItems=10;Changed=
function(G)if G==nil then
 
return end
 Z.sell_selected_pets={}for G,V in pairs(G)do
 if V then
 
local V=xJ(G)if V then
 table.insert(Z.sell_selected_pets,V)end
 end
 end
 end
})y:AddToggle("manualsellfavpets",{Text="\226\157\164\239\184\143 Sell Favorite";Default=T.sellingpets.manual_sell_fav,Tooltip="If enable it will also sell pets that are marked as Favorite.",Callback=
function(G)T.sellingpets.manual_sell_fav=G R()end
})
local u=y:AddButton({Text="\226\157\140 Sell Selected Pets";Tooltip="Sells selected pets";Func=
function()W.SellSelectedPets(Z.sell_selected_pets)end
})
local q=y:AddButton({Text="\226\153\187\239\184\143 Reload Pets";Func=
function()cl()end
})V:AddLabel({Text="Select how you want to sell from your backpack";DoesWrap=true})V:AddToggle("sell_backpack_toggle",{Text="Auto Sell Backpack";Default=c.auto_sellbackpack;Tooltip="Automatically sells backpack when full",Callback=
function(G)c.auto_sellbackpack=G n()
local V=G and" Started "or" Stopped"Z.Notify(V,2.5)end
})
local g=V:AddDropdown("sellFruitList",{Values={},Default={},Multi=true;Searchable=true,MaxVisibleDropdownItems=10,Text="\240\159\141\140 Sell Fruits",Tooltip="Select fruit to sell. if nothing is selected it will sell all.",Changed=
function(G)c.sell_fruit_list={}for G,V in pairs(G)do
 c.sell_fruit_list[G]=V end
 n()end
})
local E=V:AddDropdown("sellWhiteListMut",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Text="\226\156\133 Sell Selected Mutations";Tooltip="Sells any mutations selected. if nothing is selected it will sell all.",Changed=
function(G)c.sell_mutation_whitelist={}for G,V in pairs(G)do
 c.sell_mutation_whitelist[G]=V end
 n()end
})
local a=V:AddDropdown("sellBlackListMut",{Values={};Default={};Multi=true,Searchable=true,MaxVisibleDropdownItems=10,Text="\226\157\140 Don\'t Sell Selected Mutations";Tooltip="Won\'t sell any selected mutations. if nothing is selected it will sell all.",Changed=
function(G)c.sell_mutation_blacklist={}for G,V in pairs(G)do
 c.sell_mutation_blacklist[G]=V end
 n()end
})g:SetValues(I(P))g:SetValue(c.sell_fruit_list)E:SetValues(I(o))E:SetValue(c.sell_mutation_whitelist)a:SetValues(I(o))a:SetValue(c.sell_mutation_blacklist)V:AddDivider()
local H="\226\154\161 <font color=\'#FF9E1F\'>Backpack Sell Timer</font>"
local r r=V:AddInput("inputbackpacktimer",{Text=H;Default=c.auto_sell_backpack_every;Numeric=true;AllowEmpty=true;Finished=true;ClearTextOnFocus=false;Placeholder="Sell backpack every X seconds",Tooltip="Set the interval (in seconds) to automatically sell your backpack contents.",Callback=
function(G)
local V=iJ(G)if not V then
 Z.Notify("\226\157\140 Invalid number: "..tostring(G),3)r:SetValue(tostring(c.auto_sell_backpack_every))
return end
 if V<=0 then
 Z.Notify("\226\154\160\239\184\143 Please enter a number greater than 0",3)r:SetValue(tostring(c.auto_sell_backpack_every))
return end
 c.auto_sell_backpack_every=V n()r:SetText("\226\156\133 <font color=\'#00FF00\'>Backpack timer updated</font>")
task.wait(1.5)r:SetText(H)end
})V:AddToggle("auto_sell_every_toggle",{Text="Auto Sell Every";Default=c.auto_sell_backpack_time;Tooltip="Toggle automatic selling of backpack at the set interval.",Callback=
function(G)c.auto_sell_backpack_time=G n()
local V=G and"\226\156\133 Auto-sell started"or"\226\143\185\239\184\143 Auto-sell stopped"Z.Notify(V,2.5)end
})V:AddToggle("autoselltpback",{Text="\240\159\148\132 Teleport Back",Default=T.sellinventorytpback,Tooltip="If enabled it will tp back.";Callback=
function(G)T.sellinventorytpback=G R()end
})V:AddSpacer(10)end
 
function Z.MShopUi()
local G=y9:AddTab({Name="Shops",Description="Shops",Icon="store"})
local V=G:AddLeftGroupbox("\240\159\141\131 All Shops","store")
local y=G:AddRightGroupbox("Shop Settings","settings-2")
local J=G:AddRightGroupbox("Market","banknote")
local d=G:AddLeftGroupbox("\240\159\140\159 Season Shop","tickets")
local u=G:AddLeftGroupbox("\240\159\147\141 Traveling Merchants","store")
local g=G:AddRightGroupbox("\240\159\148\183 Stock Details","store")if g then
 
local G=g:AddLabel({Text="-";DoesWrap=true})
task.spawn(
function()while true do
 
task.wait(2)
local V=t.Shops.GetTextStockSeeds()
local y=t.Shops.GetTextStockEggs()
local Z=t.Shops.GetTextStockGear()
local j=string.format("%s\n%s\n%s",V,Z,y)G:SetText(j)end
 end
)end
 if V then
 
local G G=V:AddDropdown("seedStock_dd",{Values={};Default={};Multi=true;Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\140\190 Avoid Seeds";Tooltip="Any seeds selected will not be purchased.",Changed=
function(G)if type(G)~="table"then
 
return end
 c.shop_stocks.seed_shop_avoid=G n()end
})G:SetValues(Z.seed_stock_list_array)G:SetValue(c.shop_stocks.seed_shop_avoid)V:AddToggle("EnableSeedShop",{Text="\226\154\161 Enable SeedShop";Default=c.shop_stocks.enabled_seedshop,Tooltip="If enabled will purchase seeds.",Callback=
function(G)c.shop_stocks.enabled_seedshop=G n()end
})V:AddDivider()
local y y=V:AddDropdown("gearStock_dd",{Values={};Default={};Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text="\226\154\148\239\184\143 Avoid Gear";Tooltip="Any gear selected will not be purchased.",Changed=
function(G)if type(G)~="table"then
 
return end
 c.shop_stocks.gear_shop_avoid=G n()end
})y:SetValues(Z.gear_stock_list_array)y:SetValue(c.shop_stocks.gear_shop_avoid)V:AddToggle("EnableGearShop",{Text="\226\154\161 Enable GearShop";Default=c.shop_stocks.enabled_gearshop;Tooltip="If enabled will purchase gear.";Callback=
function(G)c.shop_stocks.enabled_gearshop=G n()end
})V:AddDivider()
local j j=V:AddDropdown("eggStock_dd",{Values={},Default={};Multi=true,Searchable=true;MaxVisibleDropdownItems=10;Text="\240\159\165\154 Avoid Eggs",Tooltip="Any selected eggs will not be purchased.",Changed=
function(G)if type(G)~="table"then
 
return end
 c.shop_stocks.egg_shop_avoid=G n()end
})j:SetValues(Z.egg_stock_list_array)j:SetValue(c.shop_stocks.egg_shop_avoid)V:AddToggle("EnableEggShop",{Text="\226\154\161 Enable EggShop",Default=c.shop_stocks.enabled_eggshop,Tooltip="If enabled will purchase eggs.";Callback=
function(G)c.shop_stocks.enabled_eggshop=G n()end
})V:AddDivider()V:AddSpacer(200)end
 do
 u:AddLabel({Text="\240\159\155\146 Select items to buy when Traveling Merchant are available on the map.";DoesWrap=true})for G,V in pairs(K.AllTravelingMerchantData)do
 
local y=V.Chance 
local Z="#FFFFFF"if y<=0 then
 Z="#C21F00"end
 
local j=string.format("<font color=\'%s\'>%s</font>",Z,G)
local i=T.merchant_shop_data[G]or{}
local c c=u:AddDropdown(G.."_dropdown",{Text=j,Values=V.ShopItems;Default=i,Multi=true,Searchable=true,MaxVisibleDropdownItems=10;Tooltip="Choose items for "..G;Changed=
function(V)if V~=nil then
 T.merchant_shop_data[G]=V or{}R()end
 end
})c:SetValue(i)end
 u:AddSpacer(220)end
 d:AddDivider()d:AddLabel({Text="\240\159\155\146 Welcome to the Season Pass Shop! Select items to buy with your season points. \226\156\133 Selected items will be automatically purchased.",DoesWrap=true})d:AddDivider()
local E=d:AddDropdown("SeasonPassGroupDropdown",{Values={};Default={},Multi=true;Searchable=true;MaxVisibleDropdownItems=10,Text="\240\159\140\159 Select Season Shop Items",Tooltip="Pick your favourite items to auto-buy them with your season points.",Changed=
function(G)if not G then
 
return end
 c.season_pass_shop_items={}for G,V in pairs(G)do
 c.season_pass_shop_items[G]=true end
 n()end
})E:SetValues(q.Season.GetAllSeasonShopItems())E:SetValue(c.season_pass_shop_items)d:AddDivider()d:AddToggle("season_autoclaim",{Text="\240\159\159\161 Auto-Claim Points",Default=T.auto_claim_season_points;Tooltip="Claim seasion points.",Callback=
function(G)T.auto_claim_season_points=G R()end
})if J then
 if Z.GetCheckIfPro()then
 Z.UI_Toggles.ToggleUnlockStore=J:AddToggle("secretstore",{Text="Unlock Secret store",Default=false;Tooltip="Magic",Callback=
function(G) end
})j.lbl_market_item_info=J:AddLabel({Text="";DoesWrap=true})i.DropDownMarket=J:AddDropdown("DropDownMarket",{Values={},Default={},Multi=false,Searchable=true;MaxVisibleDropdownItems=10;Text="Products",Tooltip="Buy";Changed=
function(G)if not G then
 
return end
 L.CurrentSelectedProductId=G L.Market.UiMarketText(G)end
})
local G=J:AddButton({Text="Load products",Tooltip="Load products. you must wait until all products are loaded.",Func=
function()if next(L.Market.products)~=null then
 Z.Notify("Already loaded",2)
return end
 Z.Notify("Loading products please wait...",7)L.Market.LoadProducts()end
})
local V=J:AddButton({Text="Buy Product",Tooltip="Purchase ",Func=
function()if next(L.Market.products)==null then
 Z.Notify("Not loaded",2)
return end
 L.Market.BuySelected()end
})
local y=J:AddButton({Text="Token Buy",Tooltip="Only works on some products.",Func=
function()if next(L.Market.products)==null then
 Z.Notify("Not loaded",2)
return end
 L.Market.BuySelectedToken()end
})
local c=J:AddButton({Text="\240\159\142\129 Gift Selected",Tooltip="Only works on some products.",Func=
function()if next(L.Market.products)==null then
 Z.Notify("Not loaded",2)
return end
 L.Market.GiftSelected()end
})if Z.UI_Toggles.ToggleUnlockStore then
 Z.UI_Toggles.ToggleUnlockStore:SetVisible(false)end
 
else
 J:AddLabel({Text=Z.GetProMessage(),DoesWrap=true})end
 end
 end
 W.is_dex_loaded=false W.LoadDexTool=
function()if W.is_dex_loaded then
 
return end
 
local G,V=
pcall(
function()(loadstring(game:HttpGet("https://raw.githubusercontent.com/jodta/my-scripts/refs/heads/main/Dex%2B%2B/Decompiler%20Fix.lua")))()W.is_dex_loaded=true end
)end
 W.is_spy_loaded=false W.LoadSpyTool=
function()if W.is_spy_loaded then
 
return end
 
local G,V=
pcall(
function()(loadstring(game:HttpGet("https://raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua",true)))()W.is_spy_loaded=true end
)end
 
function Z.SettingsUi()
local G=y9:AddTab({Name="Settings",Description="Settings";Icon="settings"})
local V=G:AddLeftGroupbox("Game Visuals","triangle-dashed")
local j=G:AddLeftGroupbox("Webhook URL","link")
local i=G:AddRightGroupbox("Other Settings","settings-2")
local d=G:AddRightGroupbox("Web API","webhook")
local u=G:AddLeftGroupbox("Interface","layout-dashboard")
local q=G:AddLeftGroupbox("Logout","layout-dashboard")
local g=G:AddRightGroupbox("<font color=\'#F52727\'>Config</font>","brush-cleaning")
local E if Z.dev_tools then
 E=G:AddLeftGroupbox("Dev Tools","align-center-horizontal")end
 if g then
 g:AddLabel({Text="\226\154\160\239\184\143 Delete all your config. rejoin after!";DoesWrap=true})g:AddButton({Text="\226\157\140 Delete All Settings";Func=
function()Z.is_forced_stop=false Z.mark_save_disabled=true Y.StopThread()z.StopCustomTeams()z.StopThread()Z.Notify("Deleting please wait.",4)
task.wait(3)
pcall(
function()Z.ConfigDeleter()end
)Z.Notify("Config deleted. Please exit and rejoin.",20)
task.wait(1)nJ()end
})end
 if q then
 q:AddLabel({Text="\226\154\160\239\184\143 Use this to reset login and login with new key. REJOIN to login again.";DoesWrap=true})q:AddButton({Text="\226\157\140 Reset Login Details";Func=
function()
local G="exologin.json"if not isfile(G)then
 G=string.format("%s_exologin.json",Z.player_userid)end
 if isfile(G)then
 
print("Safe")Z.Notify("Reset completed. Rejoin..",5)
else
 Z.Notify("Done",2)end
 end
})end
 if E then
 
local G=E:AddButton({Text="DEX",Func=
function()W.LoadDexTool()end
})
local V=E:AddButton({Text="SPY",Func=
function()W.LoadSpyTool()end
})E:AddDivider()E:AddDivider()E:AddDivider()end
 if V then
 
local G=t.Inventory.GetSettings()for G,y in pairs(G)do
 if G=="PetUpdateRate"or G=="ShowDetails"then
 continue end
 V:AddToggle("toggle_"..G,{Text=tostring(G),Default=y,Tooltip="Enable or disable",Callback=
function(V)W.vfx.SetVisualEffect(G,V)end
})end
 end
 u:AddToggle("autoshowsc",{Text="Auto Show Script";Default=T.autoshowuisc,Tooltip="Enable or disable script ui when it loads";Callback=
function(G)T.autoshowuisc=G R()end
})
local a={45,50;60;65,70;75,80;90;93;96;99,100;103;106;108;110;115,120,125,130;135;140;145,150}
local H=u:AddDropdown("UIScaleDropdown",{Text="\226\134\148\239\184\143 UI Scale",Values=a;Default=T.ui_rescale_val;FormatDisplayValue=
function(G)
return tostring(G).."%"end
,Changed=
function(G)if not G then
 
return end
 T.ui_rescale_val=G y:SetDPIScale(G)R()end
,Tooltip="Controls the overall size of the user interface."})H:SetValue(T.ui_rescale_val)d:AddLabel({Text="\240\159\140\144 Log in to the website to get your API key. \240\159\148\145 Enter it here to sync your data \240\159\147\138.",DoesWrap=true})d:AddInput("inputApiWeb",{Text="Web API KEY",Default=c.web_api_key,Numeric=false,ClearTextOnFocus=false,Finished=false;Placeholder="API Key";Callback=
function(G)c.web_api_key=G n()Z.Notify("Web API Key Updated",3)end
})
local r=j:AddLabel({Text="Please enter your webhook url for discord";DoesWrap=true})i:AddToggle("togglePlayerStats",{Text="Player Stats";Default=c.is_playerstats_running,Tooltip="Show/Hide Player Stats Ui",Callback=
function(G)c.is_playerstats_running=G n()Z.Notify("Updated",3)end
})i:AddDivider()i:AddToggle("toggleacui",{Text="Active Pets UI";Default=T.show_activepets_ui;Tooltip="Show/Hide Active Pets UI";Callback=
function(G)T.show_activepets_ui=G R()end
})i:AddToggle("toggleacuistttt",{Text="\226\173\144 Hide Status UI",Default=T.hide_log_ui;Tooltip="Hide Status ui used to show what system are working.",Callback=
function(G)T.hide_log_ui=G R()end
})i:AddDivider()i:AddDivider()i:AddLabel({Text="\240\159\146\161 When enabled, the game\'s original notifications will be hidden and replaced with custom ones. To restore them, simply disable this option and rejoin the game.",DoesWrap=true})i:AddToggle("toggle_delete_notification",{Text="\226\157\140 Delete Notifications",Default=T.use_noti,Tooltip="Removes the game\'s default notification UI.",Callback=
function(G)T.use_noti=G if G then
 W.DestroyNotification()end
 R()end
})i:AddToggle("potmodeis_highperformance_mode",{Text="\240\159\148\171 Potato Mode",Default=J.is_highperformance_mode,Tooltip="Disables logs and other effcts";Callback=
function(G)J.is_highperformance_mode=G if G then
 W.ActivateFlatMode()end
 W.NotifyButton()h.SaveSessionSettings.SaveFile()end
})i:AddToggle("disable_event_notify_button",{Text="\240\159\148\148 Disable Event Notify Btn";Default=T.disable_event_notify_button,Tooltip="Show or hide the event notify button";Callback=
function(G)T.disable_event_notify_button=G W.NotifyButton()R()end
})i:AddToggle("only_show_baseweight",{Text="\240\159\143\139\239\184\143Show BaseWeight";Default=T.only_show_baseweight;Tooltip="If enabled only shows you the base weight everywhere. Reload teams to see changes.";Callback=
function(G)T.only_show_baseweight=G R()end
})i:AddToggle("betterinvenfruits",{Text="\226\154\161Fruit Names";Default=c.show_better_fruitnames,Tooltip="If enabled shows fruit names";Callback=
function(G)c.show_better_fruitnames=G n()end
})i:AddToggle("removevisualswater",{Text="\226\154\161Remove Weather/Visuals",Default=c.remove_visuals_weather,Tooltip="Removes weather and other visuals. Must rejoin to take affect.";Callback=
function(G)c.remove_visuals_weather=G n()end
})
local e=j:AddInput("inputWebhook",{Text="Webhook Url";Default=T.webhook_url;Numeric=false;ClearTextOnFocus=false;Finished=false;Placeholder="Must start with https://";Callback=
function(G)T.webhook_url=G 
print("Input updated:",G)R()Z.Notify("Webhook saved",3)end
})
local s=j:AddToggle("toggleDetailedHatchReport",{Text="Detailed Hatch Report",Default=T.send_everyhatch_alert,Tooltip="Every hatch sends a report",Callback=
function(G)T.send_everyhatch_alert=G 
print("Toggle changed to:",G)R()Z.Notify("Updated Hatch Report",3)end
})
local N=j:AddButton({Text="Send Test WebHook",Func=
function()Z.SendTestMessage()Z.Notify("Sent Test Webhook",3)end
})j:AddDivider()
local X="<font color=\'#EB27F5\'>\240\159\167\172 Mutation URL</font>"
local l=j:AddInput("mutinputWebhook",{Text=X,Default=T.mut_webhook_url,Numeric=false;ClearTextOnFocus=false,Finished=false;Placeholder="If empty, they will be sent to normal hatching webhook.",Callback=
function(G)T.mut_webhook_url=G R()Z.Notify("Mut Webhook saved",3)end
})end
 E.AutoStartEvents=
function()if T.is_running_custom_teams then
 Z.Notify("Starting teams system in 10s",9)
task.wait(10)z.StartCustomTeams()end
 if T.mut_system.is_ruuning then
 Z.Notify("Auto resume pet mutation in 10s",9)
task.wait(10)z.StartThread()
return end
 if c.mut_was_running then
 if T.is_running then
 c.mut_was_running=false n()end
 Z.Notify("Auto resume mutation machine in 10s",9)
task.wait(10)Y.StartThread()
return end
 if T.is_running then
 
task.spawn(
function()Z.Notify("Auto resume hatching in 10s",7)
local G=10 while G>0 do
 
task.wait(1)if not T.is_running then
 break end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 continue end
 G=G-1 if G<=1 then
 Z.StartHatchingSystem()break end
 end
 end
)end
 end
 
function Z.LoadUiAll()if not y then
 
return end
 Z.HomeDashboardUi()Z.ProUi()Z.UpdateDropDownPlayersGiftPets()Z.PetTeamsUi()Z.MEggUi()Z.PetSellSettingsUi()Z.M_UI_PLANTS()Z.MEventsUi()z.mut_ui.UpdateTeamsDropdowns()Z.UiPetsSideTab()Z.UiCraftsideTab()Z.UiCollectionTab()Z.MSellUI()Z.MShopUi()Z.SettingsUi()end
 Z.LoadUiAll()d.chipmunk_cd_max=10 d.chipmun_cd_current=0 d.event_delayed_start=15 d.havesubmittedforhatch=false if not _G.FallEventLoop then
 _G.FallEventLoop=
task.spawn(
function()while true do
 
task.wait(d.event_delayed_start)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 d.event_delayed_start=2 Z.QUEST_TASK_RUNNING=false if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(15)continue end
 if true then
 break end
 if not c.is_fall_event_running then
 d.UpdateStatsText("\240\159\148\180 Event is not enabled.")continue end
 if Z.IS_HATCHING==true then
 d.UpdateStatsText("\240\159\165\154 Paused: Hatching in Progress.")if not d.havesubmittedforhatch then
 d.SubmitFruits()d.havesubmittedforhatch=true end
 
task.wait(3)continue end
 d.havesubmittedforhatch=false 
local G=c.is_fall_event_fastmode d.UpdateStatsText("\240\159\159\162 Active and running...")
local V=d.GetLookingForTrait()
local y=d.GetCooldown()
local j=d.GetFallBlooms()if j then
 d.UpdateStatsFallBloomText("\240\159\140\184 Fall Blooms: <b>"..(j.."</b>"))end
 
local i=d.GetProgressPercent()if i then
 d.UpdateStatsProgressText("\240\159\148\132 Progress: "..(i..""))end
 if V then
 d.UpdateStatsRequiredText("\226\156\168 Looking for: <font color=\'#FF7800\'>"..(V.."</font> "))end
 
local J={Vamp=true;Ghostly=true;Blight=true;Necrotic=true}
local T={Frozen=true,Chilled=true;Snowy=true;Ornamented=true;Glacial=true;Pepermint=true,Arctic=true}
local q={}for G,V in pairs(P)do
 q[G]=true end
 
local g={amount=20;batch_mode=true,whitelist_mutation=T}if y then
 d.UpdateStatsProgressText("\226\143\179 Cooldown: <b>"..(y.." </b>"))
task.wait(2)continue end
 d.SubmitFruits()d.ClaimRewardsTrack()if d.GetCooldown()then
 
task.wait(3)continue end
 if V and V~="Any"then
 
local y=q if y then
 
local j="<font color=\'#F5BB27\'>--- "..(V.."</font> Fruits ---\n")for G,V in pairs(y)do
 
local y=string.format("%s\n",G)j=j..y end
 if r.IsBackpackFull()then
 d.SubmitFruits()continue end
 
local i=false if G then
 while true do
 
task.wait(.5)if not c.is_fall_event_running then
 break end
 
local V=false if not G then
 break end
 if Z.IsPaused()then
 break end
 if d.GetCooldown()then
 break end
 d.UpdateStatsText("\240\159\159\162 Fast collect...")
local y=u.CollectFruitByNamesSortedRarityConfig(q,g)
task.wait(.2)if not y then
 break end
 d.SubmitFruits()if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 end
 
task.wait(.1)
else
 while true do
 
task.wait(.5)if not c.is_fall_event_running then
 break end
 if Z.IS_HATCHING or r.IsBackpackFull()then
 break end
 if G then
 break end
 if d.GetCooldown()then
 break end
 if Z.IsPaused()then
 break end
 d.UpdateStatsText("\240\159\159\162 Normal collect...")g.amount=9 g.batch_mode=false 
local V=u.CollectFruitByNamesSortedRarityConfig(q,g)if not V then
 i=false break end
 d.SubmitFruits()i=true end
 
task.wait(.1)end
 if i then
 d.UpdateStatsText("\226\156\133 Fruits Submitted")
task.wait(.1)
else
 d.UpdateStatsText("\226\152\185\239\184\143 No fruits available.")
task.wait(2.5)end
 end
 
elseif V and V=="Any"then
 
local G=50 
local V=0 
local y=r.GetFruitCount()if y<10 then
 V=u.CollectFruitsRandomWithIgnoreMut(G,J)
else
 V=y end
 if V>0 then
 d.SubmitFruits()d.UpdateStatsText("\226\156\133 Fruits Submitted")
task.wait(.5)
else
 d.UpdateStatsText("\226\152\185\239\184\143 No fruits available.")
task.wait(2.5)end
 
task.wait(.1)
else
 d.UpdateStatsText("\226\157\140 Failed to find fruit category! restart game.")
task.wait(3)end
 end
 end
)end
 
task.spawn(
function()while true do
 
task.wait(5)if true then
 break end
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(5)continue end
 if Z.IS_HATCHING or Z.IS_FEEDING then
 
task.wait(5)continue end
 if not T.feedevent.feed_birds_enabled then
 
task.wait(5)continue end
 if not K.FeedEvent.GetEventActive()then
 
task.wait(5)continue end
 if K.FeedEvent.GetAlreadyFed()then
 
task.wait(5)continue end
 K.FeedEvent.FeedRandomFood()if SJ()then
 yJ()
task.wait(1)end
 end
 end
)if S.loop_tradeevent then
 task.cancel(S.loop_tradeevent)S.loop_tradeevent=nil end
 S.loop_tradeevent=
task.spawn(
function()while true do
 
task.wait(3)if true then
 break end
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
local G=K.TraderEvent.UpdateUITradeEventStatus if not T.tradeevent.enable_trade_event then
 G("\240\159\148\180 Not enabled or running.")
task.wait(5)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 G("\226\154\170 Farm still loading.")
task.wait(5)continue end
 if not K.TraderEvent.GetEventPlatform()then
 G("\226\157\140 Event not found.")
task.wait(5)continue end
 if Z.IS_HATCHING then
 G("\240\159\159\161 Hatching.")
task.wait(3)continue end
 
local V,y=K.TraderEvent.GetRequiredFruit()if not V then
 G("\226\154\160\239\184\143 Already Traded.")
task.wait(5)continue end
 
local j=r.GetFruitCountUsingNameFromData(V)
local i=math.max(0,y-j)
local c=string.format("Required: %s\nAmount: %s/%s\nMissing Amount: %s",V,j,y,i)G(c)
task.wait(.5)if j>0 then
 K.TraderEvent.SubmitRequirements()
task.wait(1)end
 if u.HasPlantByName(V)then
 if T.tradeevent.fruit_collect then
 
local G={}G[V]=true u.CollectFruitByNamesSortedRarity(G,15)K.TraderEvent.SubmitRequirements()end
 
else
 if T.tradeevent.seed_place then
 if not Z.is_garden_full_seed then
 
pcall(
function()if Z.IsSingleHarvest(V)then
 u.PlaceSeedSmart(V,i)
task.wait(.5)
else
 u.PlaceSeedSmart(V,3)
task.wait(.5)end
 end
)end
 end
 end
 
task.wait(1)end
 end
)if S.task_trade_tp then
 
pcall(
function()task.cancel(S.task_trade_tp)end
)S.task_trade_tp=nil end
 S.task_trade_tp=
task.spawn(
function()while true do
 
task.wait(3)if not Z.AllTradeWorld()then
 break end
 if not J.is_trading_world_mode then
 
task.wait(1)continue end
 Z.TEXT_TRADE_WORLD="\240\159\148\180 [TRADE MODE ACTIVE] waiting for farm to load."if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(5)continue end
 
local G=0 while true do
 
task.wait(1)G=G+1 if G>=J.trade_worldtp_delay then
 break end
 if not J.is_trading_world_mode then
 break end
 
local V=J.trade_worldtp_delay-G Z.TEXT_TRADE_WORLD="\226\143\179 <font color=\'#FF2D00\'>[TRADE MODE ACTIVE]</font> teleport in "..(V.."s")end
 if not J.is_trading_world_mode then
 continue end
 Z.TEXT_TRADE_WORLD="\226\156\133 [TRADE MODE ACTIVE] trying to teleport..."
local V=d.findInWorkspace("PermPortalPlatform","Model")if V then
 
local G=V:FindFirstChild("TradeWorldPrompt",true)if G then
 fireproximityprompt(G)
task.wait(10)end
 end
 
task.wait(1)end
 end
)if S.loop_smithman then
 task.cancel(S.loop_smithman)S.loop_smithman=nil end
 S.is_busy_smith=
function()if Z.IS_COOKING or Z.IS_FEEDING or Z.IS_HATCHING or Z.IS_LEVELUP_RUNNING or Z.IS_SEEDING or Z.IS_Sprinkler or Z.IS_WATERING or Z.IS_MUTATION_RUNNING then
 
return true end
 
return false end
 S.loop_smithman=
task.spawn(
function()while true do
 
task.wait(.5)if true then
 break end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 K.Furnace.UpdateUIStatus("\226\154\170 Farm still loading.")
task.wait(10)continue end
 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
local G=K.Furnace.FindEventModel()if not G then
 K.Furnace.UpdateUIStatus("\226\157\140 Event not found.")continue end
 if not T.craftevent.smith_auto then
 K.Furnace.UpdateUIStatus("\240\159\148\180 Not enabled or running.")
task.wait(5)continue end
 
task.wait(.1)if Z.IS_CRAFTING then
 
task.wait(4)continue end
 K.Furnace.UpdateUIStatus("\240\159\159\162 Running.")if Z.IS_HATCHING then
 K.Furnace.UpdateUIStatus("\240\159\159\161 Hatching.")
task.wait(3)continue end
 
local V=1.1 
local y=K.Furnace.EquipEggToSubmit()if not y then
 K.Furnace.UpdateUIStatus("\226\157\140 No eggs found.")
task.wait(3)continue end
 if S.is_busy_smith()then
 
task.wait(3)continue end
 while not S.is_busy_smith()do
 K.Furnace.UpdateUIStatus("\226\156\133 Submit Egg.")
task.wait(.3)K.Furnace.SubmitEggHeld()
task.wait(V)
local G=K.Furnace.EquipGearToSubmit()if not G then
 K.Furnace.UpdateUIStatus("\226\157\140 No gears found.")
task.wait(3)continue end
 K.Furnace.UpdateUIStatus("\226\156\133 Submit Gear.")
task.wait(.3)K.Furnace.SubmitGearHeld()
task.wait(V)
local y=K.Furnace.EquipFruitToSubmit()if not y then
 K.Furnace.UpdateUIStatus("\226\157\140 No fruits found.")
task.wait(3)continue end
 K.Furnace.UpdateUIStatus("\226\156\133 Submit Fruit.")
task.wait(.3)K.Furnace.SubmitFruitHeld()
task.wait(V)break end
 end
 end
)Z.QuestLoop=
function()if not c.is_fall_questline_auto then
 f.UpdateStatsText("<font color=\'#FF0000\'>\240\159\148\180 Quests not enabled or running\226\128\166</font>")
return end
 if c.is_fall_questline_spin then
 for G=1,2,1 do
 S.Quests.QuestAutoSpin()
task.wait(.5)end
 end
 f.UpdateStatsText("\240\159\159\162 Active and running\226\128\166")
local G,V=S.Quests.GetQuestsTodo()if not G or#G==0 then
 f.UpdateStatsInfo("\226\143\179 No tasks or quests found...")
return end
 f.UpdateStatsInfo(V)for G,V in ipairs(G)do
 
local y=V.action 
local Z=V.current_amount 
local j=V.target_amount 
local i=V.needed 
local J=V.target_item 
local T=V.required_plant 
local d=V.required_weight if not c.is_fall_questline_auto then
 break end
 if y=="OpenSeedPack"then
 
local G,V=
pcall(
function()
local G=r.GetSeedPackUsingName(J)if G then
 yJ()
task.wait(.1)VJ(G)
task.wait(.3)r.OpenSeedPack(J)
task.wait(1)end
 end
)if not G then
 
warn("Error "..(y..": "),V)end
 
return end
 if y=="HarvestTargetWithWeight"then
 if T and d then
 u.CollectFruitByNameAndWeight(T,i,d)end
 
return end
 if y=="EarnSheckles"then
 
local G,V=
pcall(
function()
return S.Quests.ActionEarnSheckles(J,i)end
)if not G then
 
warn("Error"..(y..": "),V)end
 
return end
 if y=="Plant"then
 
local G,V=
pcall(
function()
return S.Quests.ActionPlant(J,i)end
)if not G then
 
warn("Error"..(y..": "),V)end
 
return end
 if y=="HarvestButtercup"then
 J="Buttercup"
local G,V=
pcall(
function()
return S.Quests.ActionHarvest(J,i)end
)if not G then
 
warn("Error"..(y..": "),V)end
 
return end
 if y=="Harvest"then
 
local G,V=
pcall(
function()
return S.Quests.ActionHarvest(J,i)end
)if not G then
 
warn("Error"..(y..": "),V)end
 
return end
 end
 end
 if not _G.EventsQuestLineLoop then
 _G.EventsQuestLineLoop=
task.spawn(
function()while true do
 Z.QUEST_TASK_RUNNING=false if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if true then
 break end
 f.UpdateStatsInfo("\226\143\179 Waiting for tasks...")
task.wait(7)while c.is_fall_questline_auto==false do
 f.UpdateStatsText("<font color=\'#FF0000\'>\240\159\148\180 Fall Questline not enabled or running\226\128\166</font>")
task.wait(3)continue end
 if Z.IS_HATCHING then
 
task.wait(3)continue end
 f.UpdateStatsText("<font color=\'#00FF00\'>\240\159\159\162 Active and running\226\128\166</font>")
local G=f.CanClaimRewards()if G==true then
 f.UpdateStatsInfo("\240\159\142\129 Claiming Rewards\226\128\166")f.ClaimRewards()
task.wait(5)f.UpdateStatsInfo("\240\159\142\137 Rewards Claimed!")continue end
 
local y=f.GetAvailableActivites()if not y then
 f.UpdateStatsText("\226\154\160\239\184\143 Error with event, retrying...")
task.wait(10)continue end
 
local j={}for G,V in ipairs(y)do
 
local y=false for G,V in pairs(V)do
 for Z,j in ipairs(f.AvoidQuests)do
 if j.Type==G and j.tbl.name==V.name then
 y=true break end
 end
 if y then
 break end
 end
 if not y then
 table.insert(j,V)end
 end
 y=j 
local i=E.mFarm.Center_Point.Position 
local J=XJ(i)Z.QUEST_TASK_RUNNING=true 
local T="Orange Tulip"for G,y in ipairs(y)do
 for G,y in pairs(y)do
 
local j=y.use_current 
local c=y.use_max 
local d=c-j 
local q=y.name 
local g=15 while Z.IS_HATCHING or Z.IS_SEEDING or Z.IS_COOKING or Z.IS_SHOVELING do
 g=g-1 if g<=0 then
 break end
 
task.wait(3)continue end
 if d<=0 then
 continue end
 
local a=r.GetShovel()if zJ(a)then
 f.UpdateStatsInfo("\226\154\160\239\184\143 You are holding a tool <font color=\'#ff00ff\'>[Shovel]</font>, waiting for you to unequip it...")
task.wait(math.random(4,10))continue end
 f.UpdateStatsInfo("\240\159\155\160\239\184\143 Attempting quest: "..(G..(" \226\134\146 "..q)))
task.wait(.5)if G=="Fall Bloom"or G=="Harvest Spirit"then
 
task.wait(10)continue end
 if G=="Bonfire"then
 
local V=r.GetBonfire()
local Z=3 
local j=E.GetObjectCountByName(q)if j>=Z then
 table.insert(f.AvoidQuests,{tbl=y,Type=G})
task.wait(5)continue end
 if not V then
 table.insert(f.AvoidQuests,{tbl=y,Type=G})
task.wait(2)continue end
 
local i=J[math.random(1,#J)]yJ()
task.wait(.1)VJ(V)r.PlaceBonfire(i)
task.wait(.6)yJ()
task.wait(3)continue end
 if G=="WATERCAN"then
 
local Z=r.GetWateringCan(q)if not Z then
 
warn("watering can not found")table.insert(f.AvoidQuests,{tbl=y;Type=G})
task.wait(1)continue end
 
local j=J[math.random(1,#J)]
local i=V.Character:WaitForChild("HumanoidRootPart")
local c=i.CFrame 
local g=r.GetSeedUsingName(T)if g then
 v(W.Vector3ToCFrame(j))
task.wait(1)yJ()
task.wait(.1)VJ(g)u.PlantSeed(j,T)
task.wait(.6)yJ()
task.wait(.5)
else
 
warn("Don\'t have seed "..T)table.insert(f.AvoidQuests,{tbl=y,Type=G})continue end
 if Z then
 yJ()
task.wait(.1)VJ(Z)
task.wait(.1)for G=1,d,1 do
 r.UseWateringCan(j)
task.wait(.1)end
 yJ()
task.wait(.5)end
 v(c)
task.wait(3)continue end
 if G=="Tool"then
 
local V=r.GetToolUsingName(q)if V then
 yJ()
task.wait(.1)VJ(V)
task.wait(.3)r.UseAnyToolOnScreen()
task.wait(1)
else
 table.insert(f.AvoidQuests,{tbl=y,Type=G})continue end
 yJ()
task.wait(3)continue end
 if G=="SeedPack"then
 
local V=r.GetSeedPackUsingName(q)if V then
 yJ()
task.wait(.1)VJ(V)
task.wait(.3)r.OpenSeedPack(q)
task.wait(1)
else
 table.insert(f.AvoidQuests,{tbl=y;Type=G})
task.wait(3)continue end
 yJ()
task.wait(3)continue end
 if G=="FeedFood"then
 
local V=u.GetFoodForFeedUsingName(q)if not V then
 
warn("Dont have food "..q)table.insert(f.AvoidQuests,{tbl=y;Type=G})
task.wait(1)continue end
 
warn("Have food "..q)e.FeedPetsFood(q,d)
task.wait(2)continue end
 if G=="Seed"then
 if Z.is_garden_full_seed then
 if u.HasPlantByName(T)then
 u.HarvestFruitsUsingNames({T},5)
task.wait(2)end
 
warn("Garden is full")f.UpdateStatsInfo("\226\154\160\239\184\143 Garden is full, unable to place a seed. Waiting...")
task.wait(5)continue end
 
warn("Checking Seeds to place")
local j=V.Character:WaitForChild("HumanoidRootPart")
local c=j.CFrame 
local g=J[math.random(1,#J)]
local E=r.GetSeedUsingName(q)if E then
 v(W.Vector3ToCFrame(i))
task.wait(.3)yJ()
task.wait(.1)VJ(E)for G=1,d,1 do
 u.PlantSeed(g,q)
task.wait(.6)
warn("Placed seed")end
 
task.wait(.3)yJ()
else
 
warn("Don\'t have seed "..q)table.insert(f.AvoidQuests,{tbl=y,Type=G})end
 v(c)
task.wait(3)continue end
 if G=="Harvest"then
 
task.wait(.1)if not u.HasPlantByName(q)then
 
warn("Don\'t have this plant in farm")
local Z=J[math.random(1,#J)]
local j=r.GetSeedUsingName(q)
local c=V.Character:WaitForChild("HumanoidRootPart")
local T=c.CFrame if j then
 
local G=3 v(W.Vector3ToCFrame(i))
task.wait(.3)yJ()
task.wait(.1)VJ(j)for G=1,G,1 do
 u.PlantSeed(Z,q)
task.wait(.6)end
 
task.wait(.3)yJ()
else
 table.insert(f.AvoidQuests,{tbl=y,Type=G})end
 v(T)
task.wait(3)continue end
 u.HarvestFruitsUsingNames({q},d)
task.wait(3)continue end
 if G=="Sprinkler"then
 
local V=r.GetSprinklerUsingName(q)if not V then
 table.insert(f.AvoidQuests,{tbl=y,Type=G})
task.wait(3)continue end
 yJ()
task.wait(.4)VJ(V)
task.wait(.4)for G=1,d,1 do
 
task.wait(.5)if fJ(V)then
 
local G=J[math.random(1,#J)]r.PlaceSprinkler(G)
task.wait(.9)end
 end
 yJ()
task.wait(.1)continue end
 if G=="Feed"then
 
task.wait(.1)e.FeedHungryPets(true,true)
task.wait(7)continue end
 end
 end
 f.UpdateStatsInfo("\226\156\133 Quest done, moving to next...")Z.QUEST_TASK_RUNNING=false 
task.wait(math.random(1,2))end
 end
)end
 Z.EventShop_CD=5 if not _G.EventsShopBuyStuff then
 _G.EventsShopBuyStuff=
task.spawn(
function()while true do
 
task.wait(Z.EventShop_CD)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if Z.IS_HATCHING then
 continue end
 if not K.shutdown_event_jungle_event then
 K.JungleShops.BuyStage1Seeds()K.JungleShops.BuyStage2Seeds()end
 q.Halloween.BuyItems()q.Season.BuySeasonShopItem()q.Season.ClaimSeasonPoints()if not Z.IS_HATCHING then
 q.FallBuyPetsShop()end
 q.FallBuyCosmeticsShop()q.FallBuyGearsShop()q.FallBuySeedsShop()Z.EventShop_CD=math.random(10,15)end
 end
)end
 Z.trowel_count_total_to_move=0 Z.trowel_current_moved=0 if S.task_sellpets then
 task.cancel(S.task_sellpets)S.task_sellpets=nil end
 S.sell_pet_delay_start=25 S.task_sellpets=
task.spawn(
function()while true do
 
task.wait(S.sell_pet_delay_start)S.sell_pet_delay_start=3 if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if Z.IS_HATCHING then
 continue end
 if not T.sellingpets.auto_pet_sell then
 
task.wait(3)continue end
 
pcall(
function()W.SellSelectedPetsTypes()end
)
task.wait(4)end
 end
)Z.FastCraftCancel=
function()
local G="GearEventWorkbench"N.CancelWorkbenchUsingName(G)
local V=N.GetWorkbenchStateUsingName(G)if V==nil then
 
return end
 if V==N.CraftStats.SELECT_RECIPE then
 
local V,y=
pcall(
function()N.SetRecipeUsingName(G,true)end
)
return end
 if V==N.CraftStats.START_CRAFTING then
 N.CancelWorkbenchUsingName(G)end
 end
 if S.seedeventtasker then
 task.cancel(S.seedeventtasker)S.seedeventtasker=nil end
 S.seedeventtasker=
task.spawn(
function()while true do
 Z.IS_SEEDING=false if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 
task.wait(5)if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(5)continue end
 if not Z.event_seeding_active then
 continue end
 if next(Z.event_seeding_list)==nil then
 Z.event_seeding_active=false continue end
 if Z.IS_HATCHING then
 
task.wait(4)continue end
 
local G=Z.event_seeding_list 
local V=E.mFarm.Center_Point.Position 
local y=XJ(V)
local j=y[math.random(1,#y)]
local i=false Z.IS_SEEDING=true for G,V in pairs(G)do
 if Z.is_garden_full_seed or Z.IS_HATCHING then
 break end
 if not Z.event_seeding_active then
 break end
 
local y=V.placeamount 
local c=E.GetPlantCountBySeed(G)
local J=y-c if J<=0 then
 continue end
 
local T=r.GetSeedUsingName(G)if T then
 if not zJ(T)then
 yJ()
task.wait(.3)if not VJ(T)then
 continue end
 
task.wait(.3)end
 Z.Notify("Placing seed: "..G)for V=1,J,1 do
 u.PlantSeed(j,G)
task.wait(.4)i=true if not Z.event_seeding_active then
 break end
 if Z.is_garden_full_seed or Z.IS_HATCHING then
 break end
 end
 Z.Notify("Done Placing seed: "..G)if Z.is_garden_full_seed or Z.IS_HATCHING then
 break end
 end
 end
 Z.IS_SEEDING=false if not i then
 Z.Notify("Stopped no seeds placed.",3)Z.event_seeding_active=false end
 end
 end
)if not _G.JungleEvent then
 _G.JungleEvent=
task.spawn(
function()
local 
function G()if Z.IS_HATCHING then
 
return true end
 
return false end
 while true and K.shutdown_event_jungle_event==false do
 Z.IS_JUNGLE_RUNNING=false 
task.wait(5)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not c.is_auto_jungle then
 K.JungleUI.UpdateStatsText("\240\159\148\180 Not Running")
task.wait(.3)continue end
 K.JungleUI.UpdateStatsText("\240\159\159\162 Active and Running")if G()then
 K.JungleUI.UpdateInformationText("\226\132\185\239\184\143 Other tasks in progress..")
task.wait(1)continue end
 
local V=10 
local y=c.jungle_auto_plants_list 
local j=false for G=1,V,1 do
 if j then
 break end
 
local V for G,y in pairs(y)do
 V=r.GetFruitUsingName(G)if V then
 j=true break end
 end
 end
 if j then
 K.JungleUI.UpdateInformationText("\226\132\185\239\184\143 Submit fruit success..")K.JungleActions.SubmitAll()
else
 K.JungleUI.UpdateInformationText("\226\132\185\239\184\143 No fruits found, trying to collect.")
local G={}for V,y in pairs(y)do
 if u.HasPlantByName(V)then
 table.insert(G,V)end
 end
 if#G>0 then
 K.JungleUI.UpdateInformationText("\226\132\185\239\184\143 Collecting fruits")u.HarvestFruitsUsingNames(G,5)
task.wait(1)end
 end
 
task.wait(1)end
 end
)end
 if not _G.sp_service_task then
 _G.sp_service_task=
task.spawn(
function()while true do
 Z.IS_Sprinkler=false 
task.wait(5)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(math.random(2,5))continue end
 if not c.is_auto_place_sprinkler_hatch then
 
task.wait(3)continue end
 
local G="Grandmaster Sprinkler"
local V=E.GetSprinklerOnFarm(G)if V then
 
task.wait(9)continue end
 if Z.IS_HATCHING and T.is_running then
 
warn("Hatching in progress: ",Z.IS_HATCHING)
task.wait(5)continue end
 Z.IS_Sprinkler=true 
task.wait(2)b.Sprinkler.PlaceGrandMaster(G)Z.IS_Sprinkler=false end
 end
)end
 
task.spawn(
function()while true do
 
task.wait(1)if Z.IsPaused()then
 
task.wait(4)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(4)continue end
 
pcall(
function()Z.QuestLoop()end
)if S.FavouriteFruit.is_unfav_running then
 S.FavouriteFruit.UnfavouriteFruits()S.FavouriteFruit.is_unfav_running=false end
 S.FavouriteFruit.FavFruitsLoop()S.Sprinklers.AutoPlaceSprinklersTemp()if T.auto_remove_sprinklers_nearexpire then
 l.Sprinklers.DeleteSprinklersAboutToExpire()
else
 S.Sprinklers.DeleteSprinklers()end
 K.HoneyBee.AutoTeleportMiddle()K.HoneyBee.LoopSeedHoney()K.BeeHiveUpgrateSystem.HoneyUpgradeLoop()K.BeeEggShop.AutoBuyLoopTick()K.BeeHatchUpgrader.HatcherBeeLoop()S.CleanSystem.CleanPetsOnFarm()S.TradeSystem.LoopSendTicket()t.PackOpen.MainLoopPacks()b.UI.WaterLoop()B.SeedLoop()a.TrowelLoop()l.Fruit.DoFruitsDeleteTask()l.Plant.PlantShovelTask()e.FeedPetsLoop()s.LevelSystem.LevelPetsLoop()N.CraftLoop()X.CookLoop()E.GetAllFarmPlantsNamesAndCount()end
 end
)W.activepets_cache_ui={}W.MakeActivePetUi=
function()
local G={}
local V=t.Inventory.GetEquippedPets()
local y=os.time()
local j={}for G,V in ipairs(V)do
 j[V]=true end
 
local i=
function(G)
local V=""for y,Z in pairs(Z.cooldown_pets)do
 if y~=G then
 continue end
 for G,y in ipairs(Z)do
 
local Z=y.Name 
local j=y.Passive 
local i=y.Time if not i or not Z then
 continue end
 
local c=W.ShortNameNoDots(j,4)
local J=W.fmt_time(i)
local T=string.format("%s:<font color=\"#A6FF00\">%s</font>",c,J)V=V..(" "..T)end
 end
 
return V end
 for G,V in ipairs(V)do
 
local y=WJ(V)if not y then
 continue end
 
local Z=y.PetData 
local j=y.PetType or"Unknown"
local c=Z.Name or"Unknown"
local J=Z.Level or 1 
local d=Z.BaseWeight or 0 
local u=k(d,1)
local q=i(V)
local g if J>=100 then
 g="#FFD700"
elseif J>=50 then
 g="#66BB6A"
else
 g="#FF1100"end
 
local E=string.format("<font color=\"%s\">Lv.%d</font>",g,J)
local a={}if W.IsByPassPetsTeamEnabled()then
 for G,V in ipairs(T.team_bypass_alwaysactive)do
 a[V]=true end
 end
 
local H="#E800FF"if a[V]then
 H="#00F51E"end
 
local r=string.format("<stroke th=\"1\" joins=\"round\" sizing=\"fixed\" color=\"#000000\"><font color=\"%s\">[%.2fKG]</font></stroke> <stroke th=\"0.9\" joins=\"round\" sizing=\"fixed\" color=\"#000000\">%s <font color=\"#FFFFFF\">%s</font> %s</stroke>",H,u,E,W.ShortNameNoDots(j,9),q)W.activepets_cache_ui[V]={info=r;removed_at=nil;sort_level=J,sort_name=j}end
 for G,V in pairs(W.activepets_cache_ui)do
 if not j[G]then
 if not V.removed_at then
 V.removed_at=y end
 end
 end
 
local c={}
local J={}for G,V in pairs(W.activepets_cache_ui)do
 
local Z=""
local i=false if V.removed_at then
 if(y-V.removed_at)>2 then
 table.insert(c,G)
else
 Z=string.format("<font color=\"#FF2A00\">%s</font>",V.info)i=true end
 
else
 Z=V.info i=true if not j[G]then
 Z=string.format("<font color=\"#FF2A00\">%s</font>",V.info)end
 end
 if i then
 table.insert(J,{str=Z,lvl=V.sort_level or 0,name=V.sort_name or""})end
 end
 table.sort(J,
function(G,V)if G.lvl~=V.lvl then
 
return G.lvl>V.lvl end
 
return G.name<V.name end
)for V,y in ipairs(J)do
 table.insert(G,y.str)end
 for G,V in ipairs(c)do
 W.activepets_cache_ui[V]=nil end
 
return G end
 if t.ui_task_slower then
 task.cancel(t.ui_task_slower)t.ui_task_slower=nil end
 t.ui_task_slower=
task.spawn(
function()while true do
 
task.wait(3)if Z.IsPaused()then
 
task.wait(math.random(2,5))continue end
 W.UI.updateHomeStats(t.Inventory.GetPetsCount_UI_TEXT())end
 end
)if not _G.service_ui_labelupdates then
 _G.service_ui_labelupdates=
task.spawn(
function()while true do
 
task.wait(.5)
local G={}
pcall(
function()if j.lbl_watering_information then
 j.lbl_watering_information:SetText(Z.WATER_TEXT or"")end
 if j.lbl_watering_stats then
 j.lbl_watering_stats:SetText(Z.WATER_TEXT_STATS or"")end
 end
)
local V,y=
pcall(
function()if j.lbl_seed_location then
 j.lbl_seed_location:SetText(Z.TEXT_SEED or"")end
 end
)if not V then
 
warn("SEED TEXT:1:",y)end
 
local i,c=
pcall(
function()if j.lbl_seed_status then
 j.lbl_seed_status:SetText(Z.TEXT_SEED_STATS or"")end
 end
)if not i then
 
warn("SEED TEXT:2:",c)end
 
local d,u=
pcall(
function()if j.lbl_seed_information then
 j.lbl_seed_information:SetText(Z.TEXT_SEED_INFO or"")end
 end
)if not d then
 
warn("SEED TEXT:3:",u)end
 if Y.is_running or z.is_running then
 
local V=string.format(" %s ",Y.TEXT_STATUS)table.insert(G,V)end
 if T.is_running_custom_teams then
 table.insert(G,Z.TEXT_TEAM_SYSTEM)end
 if T.bee_hiveautohatch then
 table.insert(G,Z.TEXT_BEEHATCHER_STATS)end
 if T.bee_hiveautoupgrade then
 table.insert(G,Z.TEXT_HIVEUPGRDE_STATS)end
 if Z.GetCheckPPByPass()==true then
 
local V="<stroke color=\'#FFFFFF\' thickness=\'2\'><font color=\'#FF4444\'>\226\157\140 [Team Placer Failure] Sync issue detected due to interruptions. Please rejoin to restore team placement. \226\157\140</font></stroke>"table.insert(G,V)end
 if Z.WAS_PRO_END==true then
 
local V="<stroke color=\'#FFFFFF\' thickness=\'2\'><font color=\'#FF4444\'>\226\157\140 [Premium Disabled] Did you login into a new device? please rejoin to restore. Ending in 20s \226\157\140</font></stroke>"table.insert(G,V)end
 if T.is_running then
 
local V="hatchtimer"
local y=W.GetTimerFormatted(V)
local j=string.format(" %s\n%s",Z.TEXT_HATCH_SYSTEM,y)table.insert(G,j)if T.is_test then
 
local V="<font color=\'#FF5555\'>\226\157\140 [Test Mode] Disable to hatch! Home > Test Mode \226\157\140</font>"table.insert(G,V)end
 end
 if T.honeymachine_enabled then
 
local V=string.format("<stroke color=\'#000000\' thickness=\'1\'><font color=\'#F1C40F\'>\240\159\141\175 [Honey Machine 2026]</font> %s </stroke>",Z.TEXT_HONEYMACHINE2026)table.insert(G,V)end
 if T.agebreak.is_active_agebreak then
 table.insert(G,Z.TEXT_AGEBREAK)end
 if T.allcraft.teams_enabled then
 table.insert(G,Z.TEXT_CRAFT_TEAMS)end
 if T.giftpets.enabled_gift_pets or T.giftpets.enabled_auto_trade then
 table.insert(G,Z.TEXT_GIFT)end
 if J.is_trading_world_mode then
 table.insert(G,Z.TEXT_TRADE_WORLD)end
 if T.seedpack.is_active then
 
local V=Z.TEXT_PACK_REWARD or""
local y=string.format("\240\159\142\129 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#FFC857\'>[Pack Open]</font> <font color=\'#FFFFFF\'>%s</font></stroke>",V)table.insert(G,y)end
 if T.clean_system_enabled then
 
local V=Z.CLEAN_TEXT or""
local y=string.format("\226\156\168 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#03FFBC\'>[Cleanse System] </font> %s </stroke>",V)table.insert(G,y)end
 if T.pause_systems then
 
local V="<font color=\'#FF5555\'>\226\157\140 All Systems Are Paused \226\157\140</font>"table.insert(G,V)end
 if Z.GetIsRNGStable()then
 
local V="\240\159\148\165 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#07E600\'>Possibly Stable RNG Detected.</font></stroke>"table.insert(G,V)end
 if Z.was_enhancerpro_success then
 
local V="<stroke color=\'#FFFFFF\' thickness=\'2\'><font color=\'#FF4444\'>\226\156\133 [Enhance Pro Success] Do not run enhancer pro again unless you see bad returns.</font></stroke>"table.insert(G,V)end
 if T.nice_fruit then
 
local V=string.format("\240\159\148\165 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#FB00FF\'>%s</font></stroke>",Z.TEXT_ENHANCE_PRO)table.insert(G,V)end
 if Z.show_expire_key then
 
local V="\240\159\148\180 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#FF0303\'>[KEY SYSTEM] "..(Z.expire_key_text.."</font></stroke>")table.insert(G,V)end
 if r.IsBackpackFull()then
 
local V="\240\159\167\176 <stroke color=\'#000000\' thickness=\'1\'><font color=\'#FF038E\'>Max Inventory </font> [Fruits] </stroke>"table.insert(G,V)end
 
local q=W.CountEffectsByPets()if q then
 for V,y in ipairs(q)do
 table.insert(G,y)end
 end
 
local g={}if T.show_activepets_ui then
 g=W.MakeActivePetUi()end
 if not T.hide_log_ui then
 W.updateStatusList(G)
else
 G={}W.updateStatusList(G)end
 W.updateStatusList(G)W.updateCompactStatus(g)end
 end
)end
 if not _G.mt_webhook then
 _G.mt_webhook=
task.spawn(
function()
local G=0 while true do
 
task.wait(2)if#m.HatchDataWebhook>0 then
 
local G=table.remove(m.HatchDataWebhook,1)W.HatchReportWebhook(G)
task.wait(1)end
 if#Y.MaxLevelReachedWantedPets_webhook>0 then
 
local G=table.remove(Y.MaxLevelReachedWantedPets_webhook,1)
local V=Y.AllMutationListEnum[G.MutationType]
local y={pet_name=G.PetType;nickname=G.Name;level=G.Level;found_mutation=V,wanted=true}
local j=W.getWebhookMutMaxLevel(y)
local i=W.getWebhookMutMaxLevel(y,true)W.SendLiveWebhook(j,T.mut_webhook_url)
task.wait(1)W.SendLiveWebhookPublicDiscord(i,Z.webhook_category.mut)end
 if#Y.AgeBreakWebHook>0 then
 
local G=table.remove(Y.AgeBreakWebHook,1)
local V=W.getWebhookMockupDataAgeBreak(G)
local y=W.getWebhookMockupDataAgeBreak(G,true)W.SendLiveWebhook(V,T.mut_webhook_url)
task.wait(1)W.SendLiveWebhookPublicDiscord(y,Z.webhook_category.agebreak)end
 if#D>0 then
 
local G=table.remove(D,1)
local V=G.PetType 
local y=G.Level 
local j=Y.AllMutationListEnum[G.MutationType]
local i=G.Name 
local J=G.IsWeight 
local d=G.Weight 
local u=false if J and J==true then
 u=true end
 
local q=false if next(c.mut_target_mutations)~=nil then
 if c.mut_target_mutations[j]then
 q=true end
 end
 if T.mut_system.wanted[j]then
 q=true end
 
local g={pet_name=V;nickname=i;level=y,found_mutation=j;wanted=q;weight=d,isw=u}
local E=W.getWebhookMockupData(g)
local a=W.getWebhookMockupData(g,true)W.SendLiveWebhook(E,T.mut_webhook_url)
task.wait(1)W.SendLiveWebhookPublicDiscord(a,Z.webhook_category.mut)end
 end
 end
)end
 E.AutoStartEvents()
task.spawn(
function()cl()end
)
function OnDcMd()(game:GetService("GuiService")).ErrorMessageChanged:Connect(
function()
local G=(game:GetService("GuiService")):GetErrorMessage()if G and G~=""then
 Z.is_dc=true 
warn("Detected disconnect or error: "..G)gl("Disconnect Alert: "..tostring(G))
task.wait(3)J.was_dc=true h.SaveSessionSettings.SaveFile()
task.wait(math.random(3,9))if T.disconnect_rejoin then
 
pcall(
function()(game:GetService("TeleportService")):Teleport(game.PlaceId,V.LocalPlayer)end
)end
 end
 end
)end
 OnDcMd()if J.was_dc then
 El("Connection has been restored. You are back online.")J.was_dc=false h.SaveSessionSettings.SaveFile()end
 W.AutoActivateGameData=
function()
pcall(
function()
local G={[1]=(game:GetService("Players")).LocalPlayer};(game:GetService("ReplicatedStorage")).GameEvents.LoadScreenEvent:FireServer(unpack(G))end
)end
 W.AutoActivateGameData()Z.cache_fruit_fav_abuse={}Z.cache_reset_timer=0 Z.valid_rarity_filter={Prismatic=true;Transcendent=true}Z.already_tested={}Z.current_test={}Z.was_hatch_done=false Z.gains=0 Z.enhancer_locked=0 Z.StopEnhancer=
function(G)Z.enhancer_locked=G 
task.wait(.4)end
 Z.lock_enhance=true Z.GetFruitToFavAbuseNew=
function()
local G={}
local V=3 
local y=r.GetFruitCount()if y==0 then
 
return{}end
 
local j=r.GetFruitOfRarity(Z.valid_rarity_filter,10,true)
local i=0 for V,y in ipairs(j)do
 table.insert(G,y)end
 
return G end
 Z.cache_t={}Z.GetAllToolsBg=
function()
local G="Sprinkler"for V,y in ipairs(V.Backpack:GetChildren())do
 
local j=y.Name if string.find(j,G,1,true)then
 table.insert(Z.cache_t,y)continue end
 end
 
return Z.cache_t end
 Z.GetPetEnhanceTargets=
function()
local G={}if not T.enhance_targets_enabled then
 
return G end
 if W.IsSellAllUnFav()==true then
 
return G end
 for G,V in ipairs(T.team_enhance_targets)do
 
local y=r.GetPetUsingUUID(V)if y then
 mJ(y)end
 end
 
return G end
 W.FruitEquipEnhancer=
function()
local G=r.GetFruitRandom()if r.IsToolHeldAny()then
 yJ()end
 VJ(G)end
 W.fav_toolcache=nil W.FarmEnhancerFavUnfav=
function()if not c.farmfav_fruit_enhancer then
 
return end
 
local G=u.GetFruitSinlgeObject()if#G>0 then
 if not W.fav_toolcache then
 W.fav_toolcache=r.GetFavouriteTool()end
 if not W.fav_toolcache then
 
return end
 for G,V in ipairs(G)do
 
local y=u.IsFavoriteFruitOnFarm(V)if y then
 S.FavouriteFruit.FavouriteFruit(W.fav_toolcache,V,false)
task.wait(.1)S.FavouriteFruit.FavouriteFruit(W.fav_toolcache,V,true)
else
 S.FavouriteFruit.FavouriteFruit(W.fav_toolcache,V,true)
task.wait(.1)S.FavouriteFruit.FavouriteFruit(W.fav_toolcache,V,false)end
 end
 
return end
 end
 W.EnhanceFavFaster=
function()
local G=Z.GetFruitToFavAbuseNew()LJ(G)end
 if S.loop_egg_enhancer then
 task.cancel(S.loop_egg_enhancer)S.loop_egg_enhancer=nil end
 S.loop_egg_enhancer=
task.spawn(
function()while true do
 
local G=tonumber(c.enhance_cooldown)or.35 
task.wait(G)if not T.fav_fruit_enhancer or not T.is_running then
 
task.wait(2)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(2)continue end
 if not Z.GetCheckIfPro()then
 break end
 if Z.hatch_state==Z.HATCH_STATES.EGG_PHASE then
 end
 if Z.is_eggs_reduction_active==false then
 end
 if Z.hatch_state==Z.HATCH_STATES.EGG_PLACE_PHASE then
 end
 if Z.hatch_state==Z.HATCH_STATES.EGG_HATCH_PHASE then
 end
 if Z.lock_enhance==true then
 
task.wait(.2)continue end
 if T.enhancer_auto_favallow then
 W.EnhanceFavFaster()end
 Z.GetPetEnhanceTargets()W.FarmEnhancerFavUnfav()if c.swap_enchancer then
 
pcall(
function()W.FruitEquipEnhancer()end
)end
 end
 end
)
function W.RCinputKil()
pcall(
function()
local G=V.GameEvents.RCSafariJeep G:Destroy()end
)end
 
function W.DisableAnalytics()
local G=V.ReplicatedStorage 
local y=game:GetService("ScriptContext")
local Z=G.GameAnalyticsError 
local j=G.GameAnalyticsRemoteConfigs if Z then
 Z:Destroy()Z=nil end
 if j then
 j:Destroy()j=nil end
 if getconnections then
 for G,V in pairs(getconnections(y.Error))do
 V:Disconnect()end
 end
 end
 
local Z9,j9=
pcall(
function()W.DisableAnalytics()end
)if not Z9 then
 
warn("Error",j9)end
 W.LoadBypass=
function()
pcall(
function()V.GameEvents.Finish_Loading:FireServer()end
)end
 W.LoadBypass()Z.checkprm=
function()
local G="exologin.json"if not isfile(G)then
 G=string.format("%s_exologin.json",Z.player_userid)end
 if isfile(G)then
 
print("Safe")
else
 end
 
task.wait(20)Z.is_pro=true Z.is_forced_stop=false if M then
 task.cancel(M)end
 if x then
 task.cancel(x)end
 if A then
 task.cancel(A)end
 
print("Bypass Blocked a Kick!")end
 Z.SendHpstats=
function(G)
local y="https://exotichub.app/alivestats"
local j,i=
pcall(
function()
local Z=V.HttpService:JSONEncode(G)
local j=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)or(krnl and krnl.request)if j then
 
local G=j({Url=y,Method="POST",Headers={["Content-Type"]="application/json"},Body=Z})
return G.Body 
else
 
local G=V.HttpService:PostAsync(y,Z)
return G end
 end
)if j then
 
local G=V.HttpService:JSONDecode(i)if G.invalidp then
 Z.is_pro=true Z.WAS_PRO_END=true Z.checkprm()end
 if G.key_info then
 Z.expire_key_text=tostring(G.key_info)if G.show_key then
 Z.show_expire_key=true end
 end
 if G.offn then
 end
 
else
 end
 end
 Z.SingleFruitDetails=
function()
local G={}
local V=r.GetFruitCount()if V==1 then
 
local V=r.GetFruitRandomOrHeld()if V then
 
local y=V:GetAttributes()if y then
 table.insert(G,y)
else
 end
 end
 end
 
return G end
 Z.MakePetData=
function()
local G=3 
local V=t.Inventory.GetPetInventory()
local y=W.GetAllTeamsUUIDSet()
local j={}
local i={}
local c={}
local J={}for V,c in pairs(V)do
 
local T=c.PetData 
local d=c.PetType 
local u=T.Level or 0 
local q=T.BaseWeight or 0 
local g=T.MutationType or""
local E=k(q,1)
local a=(E>=G)
local H=y[V]~=nil 
local r=W.GetEggNameUsingPetName(d)
local e=Z.GetAssetId(d,Z.ItemTypes.Pet)
local s=Z.GetAssetId(r,Z.ItemTypes.Egg)if H then
 
local G={e=r,petname=d;pet_icon_id=e;egg_icon_id=s,weight=cJ(E),level=u;fav=T.IsFavorite;mutation=Y.AllMutationListEnum[g]or""}table.insert(i,G)
elseif a then
 
local G={e=r;petname=d,weight=cJ(E),level=u;pet_icon_id=e,egg_icon_id=s,fav=T.IsFavorite;mutation=Y.AllMutationListEnum[g]or""}table.insert(j,G)
else
 if J[d]then
 J[d]=J[d]+1 
else
 J[d]=1 end
 end
 end
 for G,V in pairs(J)do
 
local y=W.GetEggNameUsingPetName(G)
local j=Z.GetAssetId(G,Z.ItemTypes.Pet)
local i=Z.GetAssetId(y,Z.ItemTypes.Egg)table.insert(c,{petname=G;e=y;amount=V,pet_icon_id=j;egg_icon_id=i})end
 
return{BigPets=j;UsedPets=i,NormalPets=c}end
 Z.MakeEggDataForApi=
function()
local G={}
local V=r.GetAllEggsInBackpack()if#V<=0 then
 
return G end
 for V,y in ipairs(V)do
 
local j=y:GetAttribute("h")
local i=y:GetAttribute("e")if not j or not i then
 continue end
 
local c=Z.GetAssetId(j,Z.ItemTypes.Egg)
local J={eggname=j;a=i;icon=c}table.insert(G,J)end
 
return G end
 Z.MakeDataForInventory=
function()
local G={}
local y={}for V,y in ipairs(V.Backpack:GetChildren())do
 if r.IsFruit(y)then
 table.insert(G,y.Name)end
 end
 
local j=r.GetHeldTool()if j and r.IsFruit(j)then
 table.insert(y,j.Name)end
 
local i,c=t.Inventory.GetPetsInventoryCounts()
local J={current_pets=i,max_pets=c}
local d=V.LocalPlayer:GetAttributes()
local u={sc=_G.codemx or 0;fruits=G,fdetails=Z.SingleFruitDetails();holding=y;username=V.LocalPlayer.Name;uid=Z.player_userid;hatching_team=r.GetPetTeamData(T.team3),seal_team=r.GetPetTeamData(T.team1),koi_team=r.GetPetTeamData(T.team2),bronto_team=r.GetPetTeamData(T.team4),inventory=J;playerstatus=d;is_pro=Z.GetCheckIfPro();serverv=V.CurentV,mutation=Y.is_running or false;pet_mutation=z.is_running or false,agebreak=T.agebreak or false,hatchingeggs=T.is_running or false,gameserver=RJ();giftsystem=T.giftpets.enabled_gift_pets or false,backpackpets=Z.MakePetData(),eggdata=Z.MakeEggDataForApi(),abctest=_G.abcex or 0,isfun=asbshdfsjkdss or 0}
return u end
 if S.task_sendhp then
 task.cancel(S.task_sendhp)S.task_sendhp=nil end
 S.task_sendhp=
task.spawn(
function()while true do
 
task.wait(1)if Z.WAS_PRO_END then
 break end
 
task.wait(15)while Z.IS_HATCHING and T.is_running do
 
task.wait(1)continue end
 if Z.is_dc then
 break 
else
 
local G,V=
pcall(
function()
local G=Z.MakeDataForInventory()Z.SendHpstats(G)end
)if not G then
 
warn("er: ",V)end
 end
 end
 end
)if S.stuck_var_check then
 task.cancel(S.stuck_var_check)S.stuck_var_check=nil end
 S.stuck_var_check=
task.spawn(
function()while true do
 
task.wait(5)if not T.is_running then
 Z.IS_HATCHING=false end
 end
 end
)W.ClickGiftAccept=
function()if W.IsSellAllUnFav()and T.is_running then
 
return end
 
local G=V.PlayerGui 
local y=G:FindFirstChild("Gift_Notification")if not y or not y.Enabled then
 
return end
 
local Z=y:FindFirstChild("Frame")if not Z then
 
return end
 
local j=game:GetService("VirtualInputManager")for G,V in ipairs(Z:GetChildren())do
 if not V:IsA("ImageLabel")then
 continue end
 
local y=false if V:FindFirstChild("Holder")and(V.Holder:FindFirstChild("Frame")and V.Holder.Frame:FindFirstChild("Accept"))then
 
local G=V.Holder.Frame.Accept if getconnections then
 for G,V in pairs(getconnections(G.MouseButton1Click))do
 V:Fire()y=true end
 for G,V in pairs(getconnections(G.Activated))do
 V:Fire()y=true end
 end
 
else
 end
 if y then
 
task.wait(4)end
 end
 end
 W.ClickTradeAccept=
function()if W.IsSellAllUnFav()and T.is_running then
 
return end
 
local G=V.PlayerGui 
local y=G:FindFirstChild("Gift_Notification")if not y or not y.Enabled then
 
return end
 
local Z=y:FindFirstChild("Frame")if not Z then
 
return end
 
local j=Z:FindFirstChild("TradeRequest")if j then
 
local G=j:FindFirstChild("Wrapper")
local V=G and G:FindFirstChild("Canvas")
local y=V and V:FindFirstChild("Segment")
local Z=y and y:FindFirstChild("Buttons")
local i=Z and Z:FindFirstChild("ACCEPT_BUTTON")
local c=i and i:FindFirstChild("Main")
local J=c and c:FindFirstChild("SENSOR")if J then
 
local G=false if getconnections then
 for V,y in pairs(getconnections(J.MouseButton1Click))do
 y:Fire()G=true end
 for V,y in pairs(getconnections(J.Activated))do
 y:Fire()G=true end
 end
 if G then
 
task.wait(4)end
 
else
 end
 end
 end
 if S.task_auto_accept then
 task.cancel(S.task_auto_accept)S.task_auto_accept=nil end
 S.task_auto_accept=
task.spawn(
function()while true do
 
task.wait(2)
local G,V=
pcall(
function()if T.giftpets.trade_auto_accept then
 if not S.TradeSystem.IsTradeActive()then
 W.ClickTradeAccept()end
 end
 if T.is_auto_accept_gift then
 W.ClickGiftAccept()end
 end
)if not G then
 
print("Error: ",V)end
 end
 end
)W.BackPackUiElements=
function()
local G={}
pcall(
function()
local y=V.PlayerGui:FindFirstChild("BackpackGui")if not y then
 
return end
 
local Z=y.Backpack.Hotbar for V,y in ipairs(Z:GetChildren())do
 if y:IsA("TextButton")then
 table.insert(G,y)end
 end
 
local j=y.Backpack.Inventory.ScrollingFrame.UIGridFrame for V,y in ipairs(j:GetChildren())do
 if y:IsA("TextButton")then
 table.insert(G,y)end
 end
 end
)
return G end
 W.CreateTextOnElement=
function(G,V,y,Z)
local j=Z or Color3.fromRGB(255,255,255)
local i=Instance.new("TextLabel")i.Name=G i.Parent=y i.AnchorPoint=Vector2.new(.5,0)i.Position=UDim2.new(.5,0,0,2)i.Size=UDim2.new(1,-4,0,20)i.BackgroundTransparency=1 i.RichText=true i.TextScaled=true i.Font=Enum.Font.GothamBold i.TextColor3=j i.ZIndex=5 i.Text=string.format("<stroke color=\"#FF0084\" thickness=\"1.3\">%s</stroke>",V)
return i end
 W.BackpackFruitDetails=
function(G)if not G then
 
return nil end
 
local V=G:FindFirstChild("Weight",true)
local y=G:FindFirstChild("Item_String",true)
local Z=G:FindFirstChild("Item_Seed",true)and G.Item_Seed.Value or 0 
local j=V and string.format("%.2f",V.Value)or"?"
local i=y and y.Value or"Unknown"
return i,j,Z end
 W.HighLightBackPack=
function()
local G=W.BackPackUiElements()
local V=r.GetAllFruitsInBackpack()
local y={}for G,V in ipairs(V)do
 y[V.Name]=V end
 
local Z=os.clock()for G,V in ipairs(G)do
 if os.clock()-Z>.005 then
 
task.wait()Z=os.clock()end
 
local j=V:FindFirstChild("ToolName")if not j then
 continue end
 
local i=j.Text 
local c=y[i]if not c then
 
local G=V:FindFirstChild("Label_kg")if G then
 G:Destroy()end
 continue end
 
local J,T,d=W.BackpackFruitDetails(c)
local u=string.format("%s [%s KG] ",J,T)
local q=string.format("<stroke color=\"#FF0084\" thickness=\"1\">%s</stroke>",u)
local g=V:FindFirstChild("Label_kg")if not g then
 W.CreateTextOnElement("Label_kg",u,V)
else
 if g.Text~=q then
 g.Text=q end
 end
 end
 end
 
task.spawn(
function()while true do
 
task.wait(4)if not c.show_better_fruitnames then
 
task.wait(4)continue end
 W.HighLightBackPack()end
 end
)W.CreateFruitESP=
function(G,y,j)if not G or not G:IsA("Instance")then
 
return end
 
local i=G:IsA("Model")and G or G:FindFirstAncestorOfClass("Model")if not i then
 
return end
 
local c=i.PrimaryPart or i:FindFirstChild("Base")if not c then
 
return end
 
local J=i:FindFirstChild("exof")if J and not j then
 
return end
 
local T,d,q,g if not J then
 G:SetAttribute("has_esp",true)J=Instance.new("BillboardGui")J.Name="exof"J.Adornee=c J.Size=UDim2.fromOffset(400,50)J.StudsOffset=Vector3.new(0,3,0)J.AlwaysOnTop=true J.LightInfluence=0 J.Parent=i T=Instance.new("Frame")T.Name="Container"T.Size=UDim2.fromScale(1,0)T.AutomaticSize=Enum.AutomaticSize.Y T.BackgroundTransparency=1 T.Parent=J g=Instance.new("UIListLayout")g.FillDirection=Enum.FillDirection.Vertical g.HorizontalAlignment=Enum.HorizontalAlignment.Center g.VerticalAlignment=Enum.VerticalAlignment.Top g.Padding=UDim.new(0,2)g.Parent=T d=Instance.new("TextLabel")d.Name="MainLabel"d.Size=UDim2.fromScale(1,0)d.AutomaticSize=Enum.AutomaticSize.Y d.BackgroundTransparency=1 d.TextScaled=false d.TextSize=13 d.RichText=true d.TextWrapped=true d.Font=Enum.Font.GothamBold d.TextStrokeTransparency=.4 d.TextStrokeColor3=Color3.new(0,0,0)d.TextColor3=Color3.fromRGB(255,215,90)d.Parent=T 
else
 T=J:FindFirstChild("Container")if T then
 g=T:FindFirstChildOfClass("UIListLayout")d=T:FindFirstChild("MainLabel")q=T:FindFirstChild("MutLabel")end
 end
 if not d then
 
return end
 
local E=i.Name 
local a=W.StringToColor3Light(E)
local H=u.GetFruitVariant(G)
local r=cJ(u.GetFruitWeight(G))
local Y=W.StringToColor3Light(H)
local e=string.format("<font color=\'%s\'>%s</font> - <font color=\'%s\'>%s</font>",Y,H,a,E)
local s=string.format("%skg",r)
local N=require((game:GetService("ReplicatedStorage")).Modules.CalculatePlantValue)
local X=V.CalculatePlantValue(G)or 0 
local h="$"..W.formatShecklesNumber(X)d.Text=string.format("<stroke color=\'#000000\' thickness=\'2\'><font color=\'#000000\'>%s</font> <font color=\'#FFFFFF\'>%s</font></stroke> \226\128\162 <stroke color=\'#000000\' thickness=\'2\'><font color=\'#00F51E\'>%s</font></stroke> ",e,s,h)
local l=false if y then
 
local V=G:GetAttributes()
local y={}for G,V in pairs(V)do
 if Z.AllFruitMutations[G]then
 
local V=string.format("<font color=\'%s\'>%s</font>",W.StringToColor3Light(G),G)table.insert(y,V)end
 end
 if#y>0 then
 l=true 
local G=#y 
local V=table.concat(y," \226\128\162 ")
local Z=string.format("[%s] <stroke color=\'#000000\' thickness=\'1\'><font color=\'#FFFFFF\'>%s</font></stroke>",G,V)if not q then
 q=Instance.new("TextLabel")q.Name="MutLabel"q.Size=UDim2.fromScale(1,0)q.AutomaticSize=Enum.AutomaticSize.Y q.BackgroundTransparency=1 q.TextScaled=false q.TextSize=11 q.RichText=true q.TextWrapped=true q.Font=Enum.Font.GothamBold q.TextStrokeTransparency=.6 q.TextStrokeColor3=Color3.new(0,0,0)q.TextColor3=Color3.fromRGB(255,230,160)q.Parent=T end
 q.Text=Z q.Visible=true 
else
 if q then
 q.Visible=false end
 end
 end
 if g then
 g:ApplyLayout()end
 
local B=g.AbsoluteContentSize.Y if B<50 then
 B=50 end
 J.Size=UDim2.fromOffset(400,B+10)end
 Z.FruitMakeSmall=
function()
local G=J.fruitesp.plants_list or{}if next(G)==nil then
 
return end
 
local V=E.Get_Plants_Physical_Objects()
local y=1.5 for V,Z in ipairs(V)do
 if not G[Z.Name]then
 continue end
 
local j=Z:FindFirstChild("Fruits")if not j then
 W.CreateFruitESP(Z,true,true)continue end
 for G,V in ipairs(j:GetChildren())do
 if V:GetAttribute("IsSmallx")then
 W.CreateFruitESP(V,true,true)continue end
 
local Z=V.PrimaryPart or V:FindFirstChild("Base")if not Z then
 continue end
 
local j=Z.CFrame V:SetAttribute("IsSmallx",true)
local i=V:GetPivot()V:ScaleTo(y)V:PivotTo(i)for G,V in ipairs(V:GetDescendants())do
 if V:IsA("BasePart")then
 V.CanCollide=false end
 end
 end
 end
 end
 
task.spawn(
function()while true do
 
task.wait(1)if not J.fruitesp.enable_esp then
 
task.wait(.2)continue end
 if not E.IsDataFullyLoaded()or not E.IsFarmFullyLoaded()then
 
task.wait(5)continue end
 
pcall(
function()Z.FruitMakeSmall()end
)end
 end
)W.DisabledLog=
function()
local G=game:GetService("LogService")
local V=game:GetService("ScriptContext")
print("\240\159\154\171 KILLING CONSOLE OUTPUT...")
local y=0 for G,V in pairs(getconnections(G.MessageOut))do
 V:Disable()y=y+1 end
 
local Z=0 for G,V in pairs(getconnections(V.Error))do
 V:Disable()Z=Z+1 end
 
pcall(
function()G:ClearOutput()end
)end
 
task.spawn(
function()while true do
 
task.wait()if not J.is_highperformance_mode then
 
task.wait(2)continue end
 
local G,V=
pcall(
function()W.DisabledLog()end
)if not G then
 
print("Error , ",V)end
 
task.wait(10)end
 end
)if J.is_highperformance_mode then
 
pcall(
function()W.ActivateFlatMode()end
)end
 V.ReplicatedStorage.GameEvents.Finish_Loading:FireServer()Z.SimulateRealMobileTap=
function()
local G=game:GetService("Players")
local V=game:GetService("VirtualInputManager")
local y=G.LocalPlayer if not y then
 
return false end
 
local Z=y:FindFirstChild("PlayerGui")if not Z then
 
return false end
 
local j=Instance.new("ScreenGui")j.IgnoreGuiInset=true j.ResetOnSpawn=false j.DisplayOrder=999999 j.Parent=Z 
local i=Instance.new("TextButton")i.Size=UDim2.fromScale(1,1)i.BackgroundTransparency=1 i.TextTransparency=1 i.Text=""i.Parent=j 
task.wait(.15)
local c=i.AbsolutePosition 
local J=i.AbsoluteSize 
local T=c.X+J.X/2 
local d=c.Y+J.Y/2 
local u=
pcall(
function()V:SendTouchEvent(1,0,T,d)
task.wait(.08)V:SendTouchEvent(1,2,T,d)end
)j:Destroy()
return u end
 Z.SimulateScreenTapWithGui=
function()
local G=game:GetService("Players")
local V=game:GetService("VirtualInputManager")
local y=G.LocalPlayer if not y then
 
return false end
 
local Z=y:FindFirstChild("PlayerGui")if not Z then
 
return false end
 
local j=Instance.new("ScreenGui")j.IgnoreGuiInset=true j.ResetOnSpawn=false j.Parent=Z 
local i=Instance.new("TextButton")i.Size=UDim2.fromScale(1,1)i.Position=UDim2.fromScale(0,0)i.BackgroundTransparency=1 i.TextTransparency=1 i.AutoButtonColor=false i.ZIndex=999999 i.Parent=j 
task.wait(.1)
local c=i.AbsolutePosition 
local J=i.AbsoluteSize 
local T=c.X+J.X/2 
local d=c.Y+J.Y/2 
pcall(
function()V:SendMouseButtonEvent(T,d,0,true,game,1)
task.wait(.05)V:SendMouseButtonEvent(T,d,0,false,game,1)end
)j:Destroy()
return true end
 if W.UserDevice.IsMobile()then
 Z.SimulateRealMobileTap()
else
 Z.SimulateScreenTapWithGui()end

