// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Co chceš?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Chtęl jsem se tu trochu porozhlédnout.
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //A kam pâesnę máš namíâeno?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Co je tu zajímavého k vidęní?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Co je tu zajímavého k vidęní?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Najdeš tu nevęstinec i hospodu. Hostinský se jmenuje Kardif a jestli hledáš nęjaké informace, pak je on ten pravý, s kým si máš promluvit.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //Mimochodem, nepotâebuješ peníze?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, hospodský z pâístavní krčmy, prodává krom koâalky i informace.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "Ty se jich chceš zbavit?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //Ty se jich chceš zbavit?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(znudęnę) Ne, ale pâímo naproti pâes ulici sídlí Lehmar - lichváâ.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Určitę ti pár zlaăáků půjčí, jen bęž dál.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Ty pro Lehmara pracuješ?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Ty pro Lehmara pracuješ?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Bystrej hoch.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "Vlastnę jsem męl namíâeno do horní čtvrti.";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //Vlastnę jsem męl namíâeno do horní čtvrti.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(sarkasticky) No jasnę. A já si zase chtęl najmout loë, aby mę zavezla pâímo na královský dvůr k audienci.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Od té doby, co sem pâišli paladinové, nemají takoví jako ty nebo já v horní čtvrti co pohledávat.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Ty jsi občanem tohoto męsta?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Ty jsi občanem tohoto męsta?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Pokud tím myslíš, jestli tu bydlím, pak ano. Ale stejnę mę do horní čtvrti nepustí.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Tam se mohou dostat jenom nabubâelí hejskové nebo obchodníci a âemeslníci z dolní části.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //Lidé z pâístavu v Khorinisu nemají velkou moc. Dokonce tu nemáme ani stálou hlídku domobrany.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Nevíš, kde bych sehnal nęjaké kuâivo?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Nevíš, kde bych sehnal nęjaké kuâivo?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(odhaduje) Ne, nemám ponętí.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Hmm, být tebou, zkusím štęstí u Červené lucerny.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "Stalo se v poslední dobę nęco zajímavého?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //Stalo se v poslední dobę nęco zajímavého?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //Pâed nedávnem obrátily stráže celou pâístavní čtvră vzhůru nohama.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Hledaly nęjakou odcizenou vęc - poslední dobou se tu krádeže dost rozrostly, zvláštę v lepších čtvrtích.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Očividnę se snaží ty chudáky z pâístavu obvinit úplnę ze všeho.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Doneslo se mi, že dole ve stokách byl rozprášen nęjaký zlodęjský klan. Všichni kradáci byli zabiti.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //V Hornickém údolí jsou prý draci. Zajímalo by mę, jestli odsud teë paladinové vyrazí a pustí se s nimi do boje.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Podle toho, co se âíká, tak už jsou všichni draci mrtví. Nękdo je vymetl železným koštętem.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //Ne.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Hej, počkej...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Nesu ti zprávu od Lehmara.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































