
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(podráždęnę) Tady jsi, konečnę. Čekal jsem tu hodiny.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(zmatenę) Počkat. Ty nakonec nejsi obchodník z męsta, že?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(kysele) Kde je Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kdo jsi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Nevím, co ti je do toho. Ale ... pokud to chceš opravdu vędęt, moje jméno je Skip. Zazvonil nęjaký zvonec?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(jako kdyby nepochopil) Kdo?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Neâíkej mi, že jsi neslyšel jméno Skip. Bože, odkud vlastnę jsi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Jsem jeden z nejhledanęjších kriminálníků v Khorinisu. Já a mí hoši jsme se plavili tęmito vodami okolo tohoto ostrůvku po mnoho let.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(pobouâenę) Už jsi o tom musel slyšet.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ty jsi pirát.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Męl bych tę znát?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ano, jasnę. Už si vzpomínám.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ano, jasnę. Už si vzpomínám.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(užasle) Čestnę? Ty už jsi o mę slyšel?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Oh do prdele! Uvažoval jsem, jestli se nemám potloukat okolo męsta.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Pak je štęstí, že jsem to neudęlal.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Domobrana by mę rychle nękam zamkla.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Ty jsi mę nepâišel uvęznit, že?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Nooooo ...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Vęâ mi, to není moudré. Kdokoli, kdo si začne se starým Skipem skončí jako krmivo pro ryby.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //Męl bych tę znát?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Dej bacha na to, co mluvíš, chlapče, nebo poznáš nepâátelskou stranu starého Skipa.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Ty jsi pirát.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(rozlobenę) Ano, zatracenę. Nemůžeš to âíct? A rozlobenný z toho.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Můžu kousat do fošen jenom z nudy.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Čekáš na obchodníka?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Čekáš na obchodníka?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Ty jsi mi ale chytrý, že?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //To jsem âekl, nebo ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Vypadá to, že tenhle špatný podomní obchodník na mę zapomnęl.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Rád bych na nęj položil své ruce, to ti âeknu.
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pirát Skip mi âekl, že męstský obchodník Baltram dęlá obchody s piráty."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"Mám pro tebe balík od Baltrama.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Mám pro tebe balík od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Co? Teë posílá poslíčka?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Zdęsil se, že? Hehe, jo, co jiného jsem taky mohl čekat od všivého obchodníka?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Âíkal, že za to chce 3 láhve rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(smęje se) To by se mu líbilo, huh? Nechal mę tu čekat navždy, nepâišel k človęku, kterému na tom záleželo.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tady, dej mu 2 láhve. Ta nula teë bude šăastná.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Odkud jsi pâišel?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Odkud jsi pâišel?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chceš vędęt, kde máme skrýš?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Proč bych to męl âíkat chlapovi z domobrany jen tak?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Když ti to âeknu, bude to jako, kdybych se šel do Khorinisu dobrovolnę vzdát.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //To ti nepomůže, pokud jsi pomýšlel o našem narušení.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Ostrov Khorinisu je velký a to, kde my jsme je pro ostatní nezjistitelné tak jako tak. Jestliže nemáš loë.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Ani pak, musíš znát cestu skrz útesy. Nikdo se pâes nę nedostal, pokud neznali tajnou cestu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Jsou jen dva lidé, kteâí znají cestu a ty nejsi jeden z nich.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Znáš nękoho se záplatou na oku?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Znáš nękoho se záplatou na oku?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Znám mnoho mužů se záplatou na oku.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Tady je nękdo, kdo se potuluje po Khorinisu, a vypadá to, že tę dobâe zná.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Nedovedu si to pâedstavit. Lidé, které znám nejsou farmáâi.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ale ...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Nech to bejt, opravdu mę to nezajímá.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Spousta lidí z męsta zmizela. A spouta lidí âíká, že ty v tom máš taky prsty.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Spousta lidí z męsta zmizela. A spouta lidí âíká, že ty v tom máš taky prsty.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(cítí se bezradný) Er ... zatracenę. Ale není to tak, jak si myslíš.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Vypadám jako otrokáâ? Ne, já pâevážím vęci. Co je to za vęci, nebo odkud jsou, není moje vęc.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Pâevážíme všechny možné vęci pro ty prasata.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Na začátku to bylo jenom obyčejné zboží. Jasnę, bylo to pašované zboží.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Poté ale začali unášet lidi z męsta. Nevím, co od nich chtęli.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Prostę jsme je pâeplavili.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"O kom mluvíš?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //O kom mluvíš?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //O banditech chlape. Kdo jiný? Ta spodina, která se teë rozlézá po celé zemi.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //A není to jen okolo Khorinisu.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Vzpomnęl jsem si na jeho jméno. Dexter. Ano, myslím, že jeho jméno je Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zmizelí lidé byli uneseni bandity na pâíkaz vůdce banditů Dextera. Âíká se, že se skrývá nękde na západę od Onarovy farmy."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"Bandité! To nestačí. Chci jména ...";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Bandité! To nestačí. Chci jména ...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Jména? Chceš vędęt, kdo je hlava banditů? Zatracenę, jak se to psisko vlastnę jmenovalo ...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Hhm. Nemůžu si vzpomenout na jméno toho chlapa. I když myslím, že to bylo lehké na zapamatování.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale můžu ti ukázat, kde najít velitele banditů v této části ostrova.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Máš s sebou dobrou mapu?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Tady, mám mapu.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Už to bylo označeno. Je to sranda ti ničit mapu.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Ne.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Tak ti to mám tedy popsat?
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Daleko na východę je rozlehlá farma. Myslím, že farmáâ se jmenuje Onar.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Má tam pęknę velká pole. Na západę od tęch polí je malá pevnost na vršku vysokého útesu.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //A tam je tvůj muž.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Tady, mám mapu.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Tady, mám mapu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //To je dobâe. Vyznačím ti, kde asi ten chlap pobývá.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Tady. Tvoje mapa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kam jsi odvezl lidi?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Kam jsi odvezl lidi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Už jsem ti âekl, že ti neâeknu, kde máme pâístav.
};
