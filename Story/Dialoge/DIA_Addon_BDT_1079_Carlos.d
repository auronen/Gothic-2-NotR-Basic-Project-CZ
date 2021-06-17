//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_EXIT   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 999;
	condition   = DIA_Addon_Carlos_EXIT_Condition;
	information = DIA_Addon_Carlos_EXIT_Info;
	permanent   = TRUE;
	description = "Uvidíme se pozdęji.";
};
FUNC INT DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Carlos_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Carlos_PICKPOCKET (C_INFO)
{
	npc			= BDT_1079_Addon_Carlos;
	nr			= 900;
	condition	= DIA_Addon_Carlos_PICKPOCKET_Condition;
	information	= DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	C_Beklauen (71, 85);
};
 
FUNC VOID DIA_Addon_Carlos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Carlos_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Carlos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Carlos_PICKPOCKET);
};
	
func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Carlos_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_HI   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 1;
	condition   = DIA_Addon_Carlos_HI_Condition;
	information = DIA_Addon_Carlos_HI_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Carlos_HI_Condition()
{
	if Npc_IsDead (Franco)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Carlos_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Carlos_HI_12_00"); //Hej, ty jsi ten, kdo zabil Franca?

	Info_ClearChoices (DIA_Addon_Carlos_HI);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Co? Ja? Ne!" ,DIA_Addon_Carlos_HI_No);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Ano, proč?" ,DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_Yes_15_00"); //Ano, proč?
	AI_Output (self,other,"DIA_Addon_Carlos_HI_Yes_12_01"); //(nazlobenę) Protože jsem ten, kdo męl dęlat jeho práci. Opravdu, díky moc. Hotovo!
	Info_ClearChoices (DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_No_15_00"); //Co? Ja? Ne!
	AI_Output (self,other,"DIA_Addon_Carlos_HI_No_12_01"); //Ah, vidím. Nechtęl jsem tę rušit.
	Info_ClearChoices (DIA_Addon_Carlos_HI);
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_Attentat   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 2;
	condition   = DIA_Addon_Carlos_Attentat_Condition;
	information = DIA_Addon_Carlos_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Carlos_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Carlos_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_00");//Thorus mi âekl, abych dostal nękoho nového do tábora po tom, co byl vrah zabit.
	
	if (Logan_Inside == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_01");//A Franco poslal Logana.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_02");//A Franco poslal nové chlapy.
	};
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_03");//Hej, pouze dęlám, co Thorus chce. Nevím nic o tom atentátu. Skutečnę.
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_PERM   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 3;
	condition   = DIA_Addon_Carlos_PERM_Condition;
	information = DIA_Addon_Carlos_PERM_Info;
	permanent   = TRUE;
	description	= "Tak jaké to je být šéfem lovců?";
};
FUNC INT DIA_Addon_Carlos_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Carlos_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Carlos_PERM_15_00"); //Tak jaké to je být šéfem lovců?
	AI_Output (self, other, "DIA_Addon_Carlos_PERM_12_00"); //Nehrab se v tom!
	AI_StopProcessInfos (self);
};

