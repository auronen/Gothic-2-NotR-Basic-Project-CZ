
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14010_Addon_Cronos_ADW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Cronos_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14010_Addon_Cronos_ADW;
	nr			= 900;
	condition	= DIA_Addon_Cronos_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Cronos_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Karte zu stehlen)";
};                       

FUNC INT DIA_Addon_Cronos_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Cronos_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Cronos_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Cronos_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItWr_Map_AddonWorld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Cronos_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Cronos_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Cronos_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14010_Addon_Cronos_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cronos_ADWHello_Condition;
	information	 = 	DIA_Addon_Cronos_ADWHello_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Cronos_ADWHello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Cronos_ADWHello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_00"); //Ještę že jsi tu. Máme strašný strach.
	AI_Output	(other, self, "DIA_Addon_Cronos_ADWHello_15_01"); //To sotva. Co se dęje?
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_02"); //Męj očí nastražené a jílec pâi ruce, je tu velmi nebezpečno.
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_03"); //Nękterá zvíâata jsme pâedtím nikdy nevidęli.
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_04"); //Nedaleko je rozlehlá tůŕ, může tam být už stovky let.
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_05"); //Nebylo dne, kdy na nás bestie od tůnę neútočily.
	AI_Output	(self, other, "DIA_Addon_Cronos_ADWHello_04_06"); //Varuji tę, buë opatrný kdykoli kolem procházíš.
};

///////////////////////////////////////////////////////////////////////
//	Info WaechterADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WaechterADW		(C_INFO)
{
	npc		 = 	KDW_14010_Addon_Cronos_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WaechterADW_Condition;
	information	 = 	DIA_Addon_Cronos_WaechterADW_Info;

	description	 = 	"Víš nęco nového ohlednę kamenných strážců?";
};

func int DIA_Addon_Cronos_WaechterADW_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WaechterADW_15_00"); //Víš nęco nového ohlednę kamenných strážců?
	AI_Output	(self, other, "DIA_Addon_Cronos_WaechterADW_04_01"); //Část jsme jich zneškodnili.
	AI_Output	(self, other, "DIA_Addon_Cronos_WaechterADW_04_02"); //Stojí jako kamenné sochy a za boha se nepohnou.
	AI_Output	(self, other, "DIA_Addon_Cronos_WaechterADW_04_03"); //Vzhled dokáže oklamat. Octneš-li se moc blízko, zaútočí na tebe.
	AI_Output	(self, other, "DIA_Addon_Cronos_WaechterADW_04_04"); //Tedy není pochybností. Zdroj jejich síly musí být nękde tady, kdekoli.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADW_Trade		(C_INFO)
{
	npc		 = 	KDW_14010_Addon_Cronos_ADW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Cronos_ADW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_ADW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Chtęl bych nęco koupit.";
};

func int DIA_Addon_Cronos_ADW_Trade_Condition ()
{
		return TRUE;
};

var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};

