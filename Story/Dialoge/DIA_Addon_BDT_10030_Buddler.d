//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10030_Buddler_EXIT   (C_INFO)
{
	npc         = BDT_10030_Addon_Buddler;
	nr          = 999;
	condition   = DIA_Addon_10030_Buddler_EXIT_Condition;
	information = DIA_Addon_10030_Buddler_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10030_Buddler_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10030_Buddler_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10030_Buddler_Hi   (C_INFO)
{
	npc         = BDT_10030_Addon_Buddler;
	nr          = 2;
	condition   = DIA_Addon_10030_Buddler_Hi_Condition;
	information = DIA_Addon_10030_Buddler_Hi_Info;
	permanent   = TRUE;
	description = "Vše v poâádku?";
};
FUNC INT DIA_Addon_10030_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10030_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10030_Buddler_Hi_15_00");//Vše v poâádku?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_01");//Otroci se staraj o velký skály.
		AI_Output (self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_02");//(úškrn) A my jsme ti, kdo potom sbíra zlato.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_03");//Teëka získavame sladký zlato.
		AI_StopProcessInfos(self);
	};
};
