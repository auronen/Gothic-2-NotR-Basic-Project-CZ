//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Wache_02_EXIT   (C_INFO)
{
	npc         = BDT_10005_Addon_Wache_02;
	nr          = 999;
	condition   = DIA_Addon_Wache_02_EXIT_Condition;
	information = DIA_Addon_Wache_02_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Wache_02_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Wache_02_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Wache_02_PICKPOCKET (C_INFO)
{
	npc			= BDT_10005_Addon_Wache_02;
	nr			= 900;
	condition	= DIA_Addon_Wache_02_PICKPOCKET_Condition;
	information	= DIA_Addon_Wache_02_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Wache_02_PICKPOCKET_Condition()
{
	C_Beklauen (38, 101);
};
 
FUNC VOID DIA_Addon_Wache_02_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Wache_02_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Wache_02_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Wache_02_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Wache_02_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Wache_02_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_02_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Wache_02_PICKPOCKET);
};
	
func void DIA_Addon_Wache_02_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Wache_02_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Wache_02_Hi   (C_INFO)
{
	npc         = BDT_10005_Addon_Wache_02;
	nr          = 2;
	condition   = DIA_Addon_Wache_02_Hi_Condition;
	information = DIA_Addon_Wache_02_Hi_Info;
	permanent   = FALSE;
	description = "Všechno v poâádku?";
};
FUNC INT DIA_Addon_Wache_02_Hi_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Wache_02_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Wache_02_Hi_15_00");//Všechno v poâádku?
	AI_Output (self, other, "DIA_Addon_Wache_02_Hi_13_01");//Počkej chvíli - neznáme se odnękud?
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Addon_Wache_02_Hi_13_02");//Hmmm..ne. Ty nejsi on. Ztraă se.
};
//--------------------------------------------------------------------
//	Info Attentat
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Wache_02_Attentat   (C_INFO)
{
	npc         = BDT_10005_Addon_Wache_02;
	nr          = 2;
	condition   = DIA_Addon_Wache_02_Attentat_Condition;
	information = DIA_Addon_Wache_02_Attentat_Info;
	permanent   = FALSE;
	description = "Co víš o tom pokusu vraždy?";
};
FUNC INT DIA_Addon_Wache_02_Attentat_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Wache_02_Hi)
	&& (MIS_JUDAS == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Wache_02_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Wache_02_Attentat_15_00");//Co víš o tom pokusu vraždy?
	AI_Output (self, other, "DIA_Addon_Wache_02_Attentat_13_01");//Co o tom vím? (Smích) Zlomil jsem mu obę nohy.
	AI_Output (self, other, "DIA_Addon_Wache_02_Attentat_13_02");//(výhružnę) a udęlám to komukoliv kdo se chce dostat do potíží s Estebanem...
};
//--------------------------------------------------------------------
//	Info perm
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Wache_02_perm   (C_INFO)
{
	npc         = BDT_10005_Addon_Wache_02;
	nr          = 99;
	condition   = DIA_Addon_Wache_02_perm_Condition;
	information = DIA_Addon_Wache_02_perm_Info;
	permanent   = TRUE;
	description = "Nęco nového?";
};
FUNC INT DIA_Addon_Wache_02_perm_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Wache_02_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Wache_02_perm_Info()
{
	AI_Output (other, self, "DIA_Addon_Wache_02_perm_15_00");//Nęco nového?
	AI_Output (self, other, "DIA_Addon_Wache_02_perm_13_01");//Všude ticho.
	
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Wache_02_perm_13_02");//Ty najdeš zrádce - a pak se s ním vypoâádáme ...
	};
};




