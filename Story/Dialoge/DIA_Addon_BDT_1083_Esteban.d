//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Takže, ty jsi ten chlápek co si vybojoval pâístup do tábora.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//No, tady se novinky šíâí rychle ...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco byl tuhý chlápek. Nikdo se mu neodvážil odporovat. Nikdo kromę tebe.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Ale romumnęj, zabil bych tę, kdyby jsi zkusil stejnou vęc se mnou.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Chci se dostat do dolu!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chci se dostat do dolu!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(šklebí se) Jak jinak. A mluvíš se správnou osobou.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Každý, kdo kope v dole, si může ponechat slušnou porci zlata.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A já mám na starosti červené kameny, které potâebuješ, aby tę Thorus pustil.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Dej mi jeden z tęch červených kamenů.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dej mi jeden z tęch červených kamenů.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Jistę, ale nebude to zadarmo.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Obvykle sice beru slušnou sumu zlata abych se nechal pâesvędčit.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//A co tvoje kopáčské schopnosti?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Už znáš pár triků, že?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Ještę poâád nejsi expert ...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(arogantnę) Nedám ti červený kámen, jen protože jsi celkem zkušený kopáč.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Ne, mám pro tebe jiný úkol ...
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "A jaký úkol by to męl být?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//A jaký úkol by to męl být?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden ze zdejších banditů se mę pokusil zabít. Nicménę, ON byl zabit mými strážemi.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Asi chtęl na tvé místo, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Byl to idiot! Vygumovaný kriminálník. Pochybuju, že to byl jeho nápad mę zavraždit.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Ne, dęlal pro nękoho jiného ...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//A teë je na mę, abych našel lidi, co jsou za to odpovędní.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Aă to byl kdokoliv, zaplatí za to. Najdi ho a já tę pustím do dolu.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Senyan mę za tebou kvůli tomu poslal.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Ten pro mę dęlá taky. Âekl jsem mu, aby męl oči otevâené.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Byl tady pokus o zavraždęní Estebana. Mám zjistit, kdo za tím stojí.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "Kde mám začít s pátráním?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Kde mám začít s pátráním?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Každý v táboâe o tom ví. Není to žádné tajemství.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Zkus zjistit, kdo je na mé stranę a kdo ne. A nenech ty chlápky, aby tę dostali.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Promluv si se Snafem. Ten tlustý kuchaâ toho ví hodnę.
	
	B_LogEntry (Topic_Addon_Esteban, "Abych tomu pâišel na kloub, męl bych si promluvit s lidmi v táboâe a zjistit, na čí stranę jsou. Snaf je dobrý pro začátek. Zaslechne hodnę klepů.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Potâebuju lepší brnęní.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potâebuju lepší brnęní.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Na co? Vždyă už jedno máš. To ti musí stačit.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Zeptej se mę znovu až splníš svůj úkol.
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "O tom úkolu ...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//O tom úkolu ...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Poslouchej, je tady ještę hodnę vęcí o které se musím starat.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//No jo, ale myslel jsem si, že tę bude zajímat, kdo stojí za tím pokusem o vraždu ...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Kdo? âekni mi jeho jméno a moje stráže ho okamžitę podâežou ...
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Fisk, ten obchodník, je za to zodpovędný. Teë je zrovna v hospodę a nasává. Nemá o ničem ani tušení ...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Dobrá práce, kámo. Stráže se o nęho postarají ...
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Hoši, slyšeli jste. Jdęte a dostaŕte Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Vraă se až zase nęco zjistíš o tom pachateli.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "A teë?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//A teë?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Teë? Já ti âeknu, co bude teë.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk zemâe bolestivou smrtí a každý v táboâe se o tom dozví.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//To bude varování.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Ok, dáš mi teë ten červený kámen?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Ok, dáš mi teë ten červený kámen?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Pracovals dobâe. Nękdo jako ty, nemá v dole co napráci.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Budeš užitečnęjší tady v táboâe. Zůstaneš tady a budeš dále pracovat pro mę.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Budu o tom pâemýšlet.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Budu o tom pâemýšlet.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Asi jsi zapomnęl, s kým mluvíš. Jsem jeden z pâedních lidí tohoto tábora a budeš dęlat, co ti âeknu.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A já âíkám, že budeš dęlat pro mę a pro nikoho jiného. Rozumíš?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "To si dęláš srandu!";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//To si dęláš srandu! O tomhle naše dohoda nebyla.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Vidíš, je tady pár lidí co mohou dęlat takové nabídky jako tahle. Samozâejmę, pokud se ti nelíbí, můžeš kdykoliv odejít z tábora ...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A co takhle dodržet svůj slib a dát mi, co mi patâí?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hej - ještę jedno slovo a moje stráže se o tebe postarají.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(šklebí se) Jaké stráže ... ?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Co ... ? Aha, chápu ... snažíš se mę zradit. Špatný nápad ...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "Okamžitę mi dej ten šutr nebo si ho vezmu sám!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //Okamžitę mi dej ten šutr nebo si ho vezmu sám!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Život tę už musí nudit. Tak jo, nęco s tím udęláme...
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




