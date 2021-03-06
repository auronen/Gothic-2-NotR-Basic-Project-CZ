///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rick_EXIT   (C_INFO)
{
	npc         = Mil_336_Rick;
	nr          = 999;
	condition   = DIA_Rick_EXIT_Condition;
	information = DIA_Rick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rick_HALLO		(C_INFO)
{
	npc		 	= Mil_336_Rick;
	nr		 	= 1;
	condition	= DIA_Rick_HALLO_Condition;
	information	= DIA_Rick_HALLO_Info;
	permanent	= TRUE;
	description	= "Jak se vede?";
};

func int DIA_Rick_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rick_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Rick_HALLO_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Rick_HALLO_10_01"); //Jestli si chceš promluvit, bęž za Rumboldem. Já tady jsem jen pro pâípad, že by nękdo chtęl dęlat problémy.

	AI_StopProcessInfos (self);		
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rick_PICKPOCKET (C_INFO)
{
	npc			= Mil_336_Rick;
	nr			= 900;
	condition	= DIA_Rick_PICKPOCKET_Condition;
	information	= DIA_Rick_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rick_PICKPOCKET_Condition()
{
	C_Beklauen (10, 45);
};
 
FUNC VOID DIA_Rick_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rick_PICKPOCKET);
	Info_AddChoice		(DIA_Rick_PICKPOCKET, DIALOG_BACK 		,DIA_Rick_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rick_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rick_PICKPOCKET_DoIt);
};

func void DIA_Rick_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rick_PICKPOCKET);
};
	
func void DIA_Rick_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rick_PICKPOCKET);
};







