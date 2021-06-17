// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Malcom_EXIT(C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 999;
	condition	= DIA_Addon_Malcom_EXIT_Condition;
	information	= DIA_Addon_Malcom_EXIT_Info;
	permanent	= TRUE;
	description = "Musím jít.";
};                       
FUNC INT DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Malcom_EXIT_Info()
{	
	AI_Output (other, self, "DIA_Addon_Malcom_perm_15_00"); //Musím jít.
	
	if (MalcomBotschaft == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_perm_04_01"); //Nenech se nęčím sežrat. Je to tu velmi nebezpečné potulovat se kolem.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_03"); //Hej, jestli půjdeš do tábora, vyâië Henrymu nęco ode mę.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_04"); //Stromy tady kolem jsou velmi nezdolné.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_05"); //Nemęl by očekávat dâevo v blízké dobę. Âekni mu to.
		MalcomBotschaft = TRUE;
	};
	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Malcom_PICKPOCKET (C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 900;
	condition	= DIA_Addon_Malcom_PICKPOCKET_Condition;
	information	= DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Malcom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
	
func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
// ************************************************************
//								Hello
// ************************************************************
instance DIA_Addon_Malcom_Hello		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 1;
	condition	= DIA_Addon_Malcom_Hello_Condition;
	information	= DIA_Addon_Malcom_Hello_Info;

	important 	= TRUE;
};

func int DIA_Addon_Malcom_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_01"); //Ty nejsi odtud, že ne?
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_02"); //Zdá se, že jsi cestoval pomęrnę dlouho, aby ses zde dostal.
};

// ************************************************************
//					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Malcom_WasMachen		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 2;
	condition	= DIA_Addon_Malcom_WasMachen_Condition;
	information	= DIA_Addon_Malcom_WasMachen_Info;

	description	= "Zaneprázdnęn?";
};
func int DIA_Addon_Malcom_WasMachen_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Malcom_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //Zaneprázdnęn?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //Neruš mę. Henry chce, abych zde pokácel co nejvíc stromů.
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //Henry?
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_00"); //Vede naši skupinu.
	};
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //Stojí pâed vstupem do tábora a mírnę kontroluje pâíchozí.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //Stará se o bezpečnost nášeho tábora.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //Pochopitelnę ale nemůže ovlivnit každého.
};

// ************************************************************
// 					Holz - Nachricht für Henry
// ************************************************************
instance DIA_Addon_Malcom_Entertrupp		(C_INFO)
{
	npc		 = 	PIR_1368_Addon_Malcom;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Malcom_Entertrupp_Condition;
	information	 = 	DIA_Addon_Malcom_Entertrupp_Info;

	description	 = 	"Henry je tvůj vůdce?";
};
func int DIA_Addon_Malcom_Entertrupp_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Entertrupp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //Henry je tvůj vůdce?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //Ano, vůdce naší stravovací skupiny.
	AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_01"); //Náš KAPITÁN je ale Greg.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_Add_04_02"); //Ale nyní je zrovna pryč.
	};
};

// ************************************************************
// 						Wo ist Lager
// ************************************************************
instance DIA_Addon_Malcom_Lager		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 3;
	condition	= DIA_Addon_Malcom_Lager_Condition;
	information	= DIA_Addon_Malcom_Lager_Info;

	description	= "Kde je tvůj tábor?";
};
func int DIA_Addon_Malcom_Lager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Lager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Lager_15_00"); //Kde je tvůj tábor?
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_01"); //Jen bęž touto cestou na západ.
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_02"); //Tam uvidíš Henryho, jak postává kolem.
};

