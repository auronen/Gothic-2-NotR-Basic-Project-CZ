///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Erol_EXIT   (C_INFO)
{
	npc         = VLK_4303_Addon_Erol;
	nr          = 999;
	condition   = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Erol_PICKPOCKET (C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 900;
	condition	= DIA_Addon_Erol_PICKPOCKET_Condition;
	information	= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen (43, 42);
};
 
FUNC VOID DIA_Addon_Erol_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
	
func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Hallo_Condition;
	information	 = 	DIA_Addon_Erol_Hallo_Info;

	description	 = 	"Co se dęje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co se dęje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(rozmrzele) Co se dęje? Podívej se na ten nepoâádek tam pod mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(rozmrzele) Za celý život jsem nevidęl nic podobného. Nękdo by je z tama męl vykouâit, to ti âeknu.
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_what_Condition;
	information	 = 	DIA_Addon_Erol_what_Info;

	description	 = 	"Co se stalo?";
};

func int DIA_Addon_Erol_what_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_what_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co se stalo?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Byl jsem na cestách se svými asistenty, když nęjací pâíšerní muži skočili na můj vozík a každého srazili dolů.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Díky bohu se umím trochu bránit, a tak mę nedostali.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Obchodník Erol byl pâepaden bandity. Vzali mu veškeré jeho zboží. Bandité pod mostem nedaleko hospody U mrtvé harpyje stále mají jeho cenné kamenné desky. Erol by je chtęl získat zpęt"); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "To pod mostem je tvé?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co to bylo za muže?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //To pod mostem je tvé?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Kára, zboží, prostę vše.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Vzal jsem nęco ze tvého zboží ...
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Nech si to. Nic z toho pro mę nemá žádnou cenu.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Nic z toho pro mę nemá žádnou cenu.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jedinou pro mę nenahraditelnou vęcí jsou tâi kamenné desky. Samozâejmę, že mi je vzali.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamenné desky?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamenné desky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Mágové vody ve męstę je chtęjí ode mę koupit a já jsem jim je slíbil.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Musím je mít zpęt za každou cenu, nebo velice poškodí moji dobrou reputaci.

	Info_AddChoice	(DIA_Addon_Erol_what, "Kde jsi získal tyto kamenné desky?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co s nimi chtęjí Mágové vody dęlat?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Co s nimi chtęjí Mágové vody dęlat?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Chtęjí je studovat a povęâili mę, abych jim je pâinesl.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Odkud máš tyto kamenné desky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Našel jsem je blízko starých budov vypadajících jako mausolea a ostatní v nękterých jeskyních.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Do dnes jsem byl schopen dodat mnoho vęcí, o které mágové žádali.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Tady dole jsou celkem vzácné. Severovýchodnę od Khorinisu jsem jich ale našel spoustu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Proč prostę nenajdeš další?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Proč prostę nenajdeš další?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Vyvrtnul jsem si kotník v boji s bandity.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Můžu chodit, ale nechci cestovat tak daleko se špatnou nohou.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Co to bylo za muže?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Banditi. Kdo jiný? Skočili na mę z mostu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Každý, kdo chce pâejít most, je jimi okraden.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Vędęl jsem, že jsou nahoâe, proto jsem šel pod ním.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Ale můj vozík a mé zboží asi vzbudily pâíliš mnoho pokušení, zdá se.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ti bastardi skočili z mostu - pâímo na můj vozík.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Zkoušel jsem se za nimi v noci plížit ...
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Erol_FernandosWeapons_Info;

	description	 = 	"Potâebuji informace o zásilkách zbraní banditům.";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
 	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potâebuji informace o zásilkách zbraní banditům.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Zásilka zbraní? Jasnę, jedna tu je. Nęjaký hajzl z męsta jim prodal mnoho zbraní. Taktak je mohli odnést.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Nękteâí z nich jsou i ti, kteâí na mę zaútočili u mostu.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Ostatní museli cestovat nękam na pastvinu za Bengarovou farmou.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Možná chtęli dosáhnout  průsmyku.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Kde je ta pastvina?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Kde je ta pastvina?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Pâibližnę uprostâed ostrova Khorinisu leží Orlanova hospoda. Nazývá se "U mrtvé harpyje".
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Z tama vede cesta na jih. Tam nękde je ta pastvina a poblíž také vchod do Hornického údolí.
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};


///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Stoneplates_Condition;
	information	 = 	DIA_Addon_Erol_Stoneplates_Info;
	permanent	 = 	TRUE;

	description	 = 	"O kamenných deskách ...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle für eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //O kamenných deskách ...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Mám jednu z nich.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Mám nękteré z nich.
		
					if ((StoneplatesCount + StoneplatesCounter) >= 3)
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
						XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
						StoneplatesCounter = 3;
					}
					else
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
						XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
						StoneplatesCounter = (StoneplatesCounter + StoneplatesCount); 
					};
					B_GivePlayerXP (XP_Addon_BringStoneplates);
				};
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Velmi ti dękuji.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Už pouze dvę chybí.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Už jen jedna chybí.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To stačí, nyní můžu dodržet svůj slib Mágům vody ve męstę a pak jít domů.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Zaplatím ti za nę, samozâejmę.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Jdu domů. Jestli chceš, tak se ke mnę můžeš pâidat.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Možná ti budu schopen nęco prodat, když se dostanu domů.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Start");
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
	}
	else
	{
			if (C_ScHasMagicStonePlate () == TRUE)
			{
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //A co tyhle?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Ne, tento druh kamenných desek je magicky nabitý.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Mágové vody tyto bohužel nechtęjí koupit.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Kolik ti jich chybí?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Abych si zachránil svou reputaci ve męstę u Mágů vody, potâebuji 3 kamenné desky.
			}; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Buerger_Condition;
	information	 = 	DIA_Addon_Erol_Buerger_Info;

	description	 = 	"Jsi občanem męsta?";
};

func int DIA_Addon_Erol_Buerger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_Buerger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Jsi občanem męsta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Už ne dlouho, můj synu. Nemám rád tyto zkorumpované lidi z Horní čtvrti v Khorinisu.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Míval jsem velký vliv. Jen abys vędęl. Ale to bylo pâed mnoha męsíci.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_PreTeach_Condition;
	information	 = 	DIA_Addon_Erol_PreTeach_Info;

	description	 = 	"Tys dokázal zahnat bandity?";
};

func int DIA_Addon_Erol_PreTeach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Tys dokázal zahnat bandity?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Ano. Jsem si jist, že jsou stále na mostę.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Můžeš mi ukázat, jak udęâit tak tvrdę jako ty?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Jistę, že můžu.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_PreTrade_Condition;
	information	 = 	DIA_Addon_Erol_PreTrade_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Addon_Erol_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")>2000)
	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_PreTrade_Info ()
{
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Nemůžu ti nic prodat, všechno, co jsem męl, leží pod mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Můžu začít prodávat znova, až se vrátím domů.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale dokud nedostanu zpęt mé kamenné desky, nemůžu odsud odejít.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_SLD_Condition;
	information	 = 	DIA_Addon_Erol_SLD_Info;

	description	 = 	"To je TVŮJ dům?";
};

func int DIA_Addon_Erol_SLD_Condition ()
{
	if	((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<2000) )
		{
			return TRUE;
		};
};
var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(pâekvapenę) To je TVŮJ dům?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ano. Proč? Co je na tom špatného?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nemáš problémy se žoldáky?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Dokud jsem je nevyrušoval je a jejich práci, nechávali mę napokoji.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Kromę toho, jsou tam mí dobâí zákazníci a já jsem jim zaplatil, aby dohlídli na můj majetek, zatímco jsem pryč.
	B_GivePlayerXP (XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine	(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_Trade_Condition;
	information	 = 	DIA_Addon_Erol_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Ukaž mi, co nabízíš.";
};

func int DIA_Addon_Erol_Trade_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<3000) )
	{
		return TRUE;
	};
};
var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Nabídka není moc velká.
	
	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
		B_LogEntry (Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine	(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Addon_Erol_Teach(C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 99;
	condition	= DIA_Addon_Erol_Teach_Condition;
	information	= DIA_Addon_Erol_Teach_Info;
	permanent	= TRUE;
	description = "Ukaž mi, jak udeâit tvrdęji.";
};                       

FUNC INT DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Erol_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Ukaž mi jak udęâit tvrdęji.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Chci nęco vrátit.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomoz mi zachránit mou reputaci tím, že mi vrátíš kamenné desky.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //A já ti ukážu, jak lépe využít svou sílu v souboji.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobâe, sleduj, znám jeden dobrý trik.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Když bouchneš, použij sílu celého tęla, ne pouze paže.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Otoč se bokem, natáhni rameno dopâedu a současnę vymršti svou paži.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(smęje se) Když to udęláš správnę, poznáš ten rozdíl!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jestli chceš být ještę lepší, musíš ještę více na sobę pracovat ...
		Info_ClearChoices (DIA_Addon_Erol_Teach);
		Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
	};
};

FUNC VOID DIA_Addon_Erol_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_Erol_Teach);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};






