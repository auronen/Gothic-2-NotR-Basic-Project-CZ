//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Co poâád chceš? Táhni!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Na co čekáš? Jdi do hospody!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Na první pohled je jasné, že víš co dęláš.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Na první pohled je jasné, že víš co dęáš.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Jednou jsem to už slyšel ... pâinesl jsi tu ocel?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Ocel? Ne, myslím, že si mę s nękým pleteš ...
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hm ... pâipadáš mi známý. Nepotkali jsme se už?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Jasnę, ve Starém táboâe.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nepamatuji se.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno prodává kováâské vybavení.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Jasnę, ve Starém táboâe.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//Starý tábor ... aha ... ty jsi ten zvędavý chlápek ... myslel jsem, že jsi mrtvý.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//No jo, to si myslí všichni. Kdo ještę pâežil?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Pár lidí. Nękteâí prchli s Ravenem jako já. Hodnę chlapů však zahynulo v táboâe.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Nepamatuji se.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm ... mám hlavu jak stâep ... k čertu s tím ...
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Âekni mi o tvém útęku.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Âekni mi o tvém útęku.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//V den, kdy padla bariéra, nastal obrovský zmatek.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Nękteâí se schovali - jiní utekli a všechno bylo vyplenęno.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Co jsi udęlal?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Zkusil jsem utéct z tábora, jenomže se náhle vyjasnilo a mou kůží projela žhavá bolest.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//trefil mę ten zatracený blesk! Ale vypadá to, že jsem neohluchl ...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Až pozdęji mi âekli, že mę Thorus našel a vzal s sebou.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Potâebuju lepší zbroj.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Potâebuju lepší zbroj.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Takže - můžeš ho mít. To, že je tak drahé, je Estebanovo naâízení.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten zmetek si bere podíl z každé zbroje co prodám.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Koupit tęžkou zbroj bandity (Ochrana proti zbraním: 50, šípům: 50, cena: 2100)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk mi âekl, že bys pro mę mohl udęlat speciální cenu.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Tak Fisk? Hm, fajn. Stejnę mu dlužím laskavost.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Koupit tęžkou zbroj bandity (Ochrana proti zbraním: 45, šípům: 45, cena: 1400)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Ok, vezmu si tu zbroj.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Vypadá dobâe.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Nemáš peníze, nebude zbroj.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "O tom pokusu zavraždit Estebana ...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //O tom pokusu zavraždit Estebana ...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(výhružnę) Co ode mę chceš?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Hledám zamęstnavatele ...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //A proč s tím lezeš za mnou?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Myslel jsem, že o tom nęco víš.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Kašlu ti na to!
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(vzdychá) Teë poslouchej! Aă už tę tu nevidím nebo se neznám!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "Slyšel jsem o tobę nęjaké zvęsti ...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Slyšel jsem o tobę nęjaké zvęsti ...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //No?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Zase ty? (hrozí) Doufám, že tentokrát je to nęco důležitého ...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Slyšel jsem, že v dobę toho pokusu o vraždu jsi nebyl tam kde bys męl ...
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(výhružnę) Pokračuj?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul âíkal, že Estebana nenávidíš.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(výhružnę) Jo? Opravdu? A co ještę âíkal?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio tę prozradil! Tutovę o té vraždę nęco víš!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(klidnę) Tak ti jsi mluvil se starým Emiliem, jo??
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //A on není jediný, kdo tę podežrívá.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //No a?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Potâebuji si nęco vyjasnit se zamęstnavatelem!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Jestli jsi za tou vraždou, zaplatíš za to!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Vypadá to, že mám Huna v hrsti.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(vyhrožuje) Možná by si si s ním męl promluvit ještę jednou. Jsem si jistý, že POZDĘJI bude tvrdit pâesnę opak!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nic dalšího ...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Jestli jsi za tou vraždou, zaplatíš za to!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(dochází mu trpęlivost) Jsi idiot! Opravdu si myslíš, že se tím Estebanovi zavdęčíš?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Táhni!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Potâebuji si nęco vyjasnit se zamęstnavatelem!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //S Estebanem? Fakt? Posluž si!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Už na tu dodávku oceli od pirátů čekám pâíliš dlouho.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Tipnul bych, že Esteban ji zabavil, aby mi ji pak mohl prodat dráž.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Nedęlá to osobnę. Má na to pár prašivých banditů, kteâí jsou na jeho výplatní pásce.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Kde jsi to slyšel?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Opilí banditi moc mluví ...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Znáš jméno toho sdílného bandity?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //To nestojí za pozornost. Ale ten chlápek, kterého hledáš, je Juan. Ale už jsem ho dlouho nevidęl v táboâe.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Budeš ho muset najít nękde v té žumpę venku.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno čeká na dodávku oceli od pirátů. Myslí si, že nęjaký chlápek Juan ji zastavil na Estebanův pâíkaz a schovává se nękde v bažinách.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Nejprve mi âekni, kdo je ten, co tę zamęstnal!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Ok, udęlám to pro tebe!", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Ok, udęlám to pro tebe!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dobâe. Uvidíme, jestli se ti dá vęâit.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Nejprve mi âekni, kdo je ten, co tę zamęstnal!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Ne. Nevęâím ti.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Dávej pozor. Další můj rozhovor bude s tím zamęstnavatelem nebo s Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //S kým se bavíš je tvoje vęc.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(vzdychá) Tak dobâe! Zprostâedkuju ti s ním setkání. Ale bude po mém, rozumíš?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Jdi do hospody a promluv si s barmanem. On ti âekne, co dál.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno mi âekl, že bych si męl promluvit se Snafem.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Mám tu ocel.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Mám tu ocel.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //A? Byl tam i Juan?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Byl.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Vędęl jsem to. Ta krysa Esteban v tom byl namočený.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jsi fajn. Abych byl upâímný, tak jsem to od tebe nečekal.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Tady, vezmi si tuhle odmęnu.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //A co teë bude s naší dohodou?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Muž, se kterým chceš mluvit, tę čeká v hospodę. Promluv si s barmanem.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno mi âekl, že bych si męl promluvit se Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






