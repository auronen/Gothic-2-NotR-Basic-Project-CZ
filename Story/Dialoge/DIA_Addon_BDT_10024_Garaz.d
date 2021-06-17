//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Počkej chvíli.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Nęjaký problém?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Důlní červi. Je jich pękná âádka. Vypadá to, jako kdybychom narazili na hnízdo.nest.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Proč nezaútočíme na ty červy?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Proč nezaútočíme na ty červy?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Tomu bych se dost divil. Stráže męli pravdępodobnę jiné 'důležité' vęci na práci.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn mi nakázal zbavit se toho problému.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Tuším, že ve skutečností nezamýšlíš s červama bojovat.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//Proč bych męl? Copak takhle se můžeme dostat ke zlatu v jeskyni?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn bude stejnę vętšinu chtít. A já rozhodnę nehodlám riskovat svůj zadek pro tu trochu co by zbyla.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Pokud chceš TY s nima bojovat - klidnę, bęž dál. Hlavnę je nenalákej sem nahoru.
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Ještę nęco co mi můžeš âíct o Bloodwynovi?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Ještę nęco co mi můžeš âíct o Bloodwynovi?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Jo, je to chamtivý bastard. Kontroluje každou zlatou žilku a hrudku.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Zlato je to, co ho zajímá. Nám by nedal ani hovno.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Ještę nęco?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Myslí si, že je nejlepší. Bloodwyn nedokáže vystát nękoho, kdo je lepší než on. Jasnę, já bych se mu rozhodnę netroufl vzepâít.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Nejlepší je vyhnout se jeho pâítomnosti a neprovokovat ho - leda že bys ho chtęl fakt nasrat.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn určitę opustí chrám, pokud se objeví povídačky o nalezení nové zlaté žíly tady v dole.");
	B_LogEntry (Topic_Addon_Tempel,"Pokud bude Bloodwyn pâekvapený, pâestane se ovládat. To se mi určitę bude hodit."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Červi jsou mrtví.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Skvęle, to je ono. Červi jsou mrtví.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn je na cestę dolů. To je to, cos chtęl, ne?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Tím myslím - povraždil jsi ty červy, abys dostal Bloodwyna sem dolů, ne? Takže, cokoliv jsi zamýšlel udęlat, udęlej to TEĎ.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Dal jsi tomu bastardovi co proto. Dobrá práce.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Pak se tedy podívám tady okolo.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Wow, chlape, tady je spousta zlata.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Potâebovali bychom se pozdęji v poâádku k tomu zlatu nahoâe dostat.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Nicménę, nikdo už žebâíky od pádu bariéry nepoužívá....jaká škoda...
};




