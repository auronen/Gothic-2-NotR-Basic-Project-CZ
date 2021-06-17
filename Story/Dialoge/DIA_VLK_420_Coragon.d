///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"Mohu tu dostat nęco k pití?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Mohu tu dostat nęco k pití?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Můžeš dostat dokonce nęco k jídlu, pokud máš zlato.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jídlo a pití můžu nakoupit u hostinského Coragona.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Ukaž mi své zboží.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Ukaž mi své zboží.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"Tak co, jak jdou kšefty?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Tak co, jak jdou kšefty?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Ani mi nemluv. Lord Andre dává pivo zadarmo.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Nyní se to stává celkem často, že lidé z horní čtvrti chodí sem posedęt.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //A co je s nimi?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(pobavenę) Nękteâí z tęch chlápků mi opravdu lezou na nervy.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Napâíklad Valentino - nemohu toho chlapa vystát.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale nemohu si vybírat zákazníky, potâebuji každou minci.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Všechno mi ukradli, dokonce i mé stâíbro.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"Víš nęco o zmizelých?";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Víš nęco o zmizelých?
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Slyšel jsem, že jsou to povętšinou lidé z pâístavu. Znám to tam a vůbec mę to nepâekvapuje.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Dokonce Thorben âíká, že mu zmizel učedník.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Hakon, jeden z obchodníků na tržišti mi âekl velmi podivnou historku.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Âíkal, že vídával jednoho chlápka každý den. Jednoho krásného zde prostę zmizel. Dokonce se na to ptal i domobrany.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Mnoho obyvatel pak propadlo panice. Nevím, co si o tom myslet,ale âekl bych, že je to nesmysl.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis je tvrdé męsto a za jeho branami na tebe čeká mnoho nebezpečí.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Mimo męsto můžeš být pâepaden bandity nebo divokými zvíâaty. Je to jednoduché.
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon - obchodník na tržišti - a Thorben - tesaâ - by mi mohli nęco povędęt."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"Cože, okradli tę?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Cože, okradli tę?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Ano, pâed pár dny. Toto místo bylo pâecpané a já jsem tu nebyl jen chvilku.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nebyl jsem za barem jen chviličku - ale tęm parchantům ta chvilka stačila.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Âekl jsem to domobranę - samozâejmę nic nenašli. Mají plno práce s pitím piva venku.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Tady je tvá odmęna.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Je to SPECIÁLNÍ pivo. Můj poslední sud.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //Toto je poslední doušek.
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"Tvoje stâíbro mám zrovna u sebe.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Tvoje stâíbro mám zrovna u sebe.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Opravdu!
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Podívej, co tady mám.";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Podívej, co tady mám.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm? To je Lehmarův dluhopis!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co s tím zamýšlíš dęlat?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Tady máš svou knihu.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Tady máš svou knihu.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Díky! Zachránils mę! Lehmar je docela nepâíjemný pokud jde o jeho peníze.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Co musím udęlat, abych se dostal do horní čtvrti?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Co musím udęlat, abych se dostal do horní čtvrti?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Musíš se stát občanem. Najdi si nęjakou práci.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Možná bys męl promluvit s obchodníky, co dęlají v dolní části męsta.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Pokud ti to nestačí, můžeš promluvit s lordem Andrem, který je v kasárnách.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Možná tę nechá stát se męstskou stráží. Pak můžeš také do horní čtvrti.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Co je s tím Valentinem?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Co je s tím Valentinem?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Je docela bohatý a nemusí pracovat. A dává to každému najevo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Bez ohledu jestli tę to zajímá nebo ne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Pije hodnę a odchází obvykle nad ránem. A pak se pomalu vrací zpęt do horní čtvrti.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Každý den.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino męl včera tęžkou noc.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Snažil se mi namluvit, že byl okraden a dušoval se, že zaplatí pâíštę. Vážnę!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //He, pâedtím se vytahoval, kolik penęz u sebe má.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //A pak se podíval do penęženky, hloupę se zatváâil a rozhlédl se kolem. Pak mi âekl, že byl okraden.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //A jak ses zachoval ty?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Dal jsem mu dal poâádnej výprask!
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Na, vezmi si tento prsten.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Na, vezmi si tento prsten.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Co? Nerozumím ...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Je to Valentinův prsten.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Můžeš ho pâedat dalšímu, kdo mu trochu vypráší kožich.

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























