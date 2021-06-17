
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Bude velmi jednoduché, ukrást tento svitek)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"Máš nęjaké zprávy?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Máš nęjaké zprávy?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Stavitelé tęchto ruin mę fascinují!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Je to škoda, že jejich jazyk je mrtví jako oni sami.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(zamyšlenę) Jejich pozoruhodné rituály a pâivolávání také pro nę nebyli žádnou záchranou.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Pâivolávání?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Stavitelé męli silné spojení se svętem duchů.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Jestli jsem to pochopil správnę, jejich myšlení, męli spojení se svými pâedky celou dobu.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Kvůli tomu pravidelnę poâádali pâivolávání a rituály, aby dostali radu.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Jak funguje to pâivolávání?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Nemrtví, co já vím, toho moc nenamluví.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Jak funguje to pâivolávání?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Strážci mrtvých męli svá speciální kouzla, kterými klidnili duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Texty, které se zde dají najít, jsou docela zmatené. Pâesné odpovęëi na mé otázky nenalézám jen velmi málo kdy.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Nemrtví, co já vím, toho moc nenamluví.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Stavitelé nestvoâili bezduché nemrtvé jako zombie nebo jiné zlé nestvůry.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //S duchy jsou duše velkých bojovníků, knęží a vládců.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Doteë nemám žádné pochybnosti, že opravdu existují.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pokud potkám ducha, dám ti vędęt.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Pokud potkám ducha, dám ti vędęt.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(smęje se) Ano, to určitę udęlej.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Saturas mę poslal.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Saturas mę poslal.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven se ukryl do chrámu a zavâel za sebou portál.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas se domnívá, že získal znalosti o chrámu od ducha!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(zdrcený) Oh Adane!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Musel pâivolat vrchního knęze Khardimona, aby se ho zeptal na cestu do chrámu.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Podle zaznamenaného má hrob v jeskyních po pevností!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Musíš udęlat to samé.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale Khardimona se už zeptat nemůžeš ...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Hrob válečníka Quarhodrona leží na západę údolí.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Musíš ho najít ... a probudit Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //V tęchto nápisech je napsáno, jak vęâící Adanose může pâivolat ducha.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Myslíš, že opravdu fungují?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Pâečetl jsem hodnę materiálů.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Napâíklad zápisi Y'Beriona, vůdce Bratrstva Spáče.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale vęâím každému slovu autora TĘCHTO spisků!
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Myslíš to vážnę?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Proč Quarhodron? Proč ne vrchní knęz Khardimon osobnę?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bratrstvo Spáče neâíkalo jenom lži.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Proč Quarhodron? Proč ne vrchní knęz Khardimon osobnę?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Raven znesvętil hrob svým pâivoláváním. To je jisté.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Musíme se podívat po jiném duchovi.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Bratrstvo Spáče neâíkalo jenom lži. A navíc jejich mysl ovládal Spáč.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //To nebyly jenom jejich lži, to je nepravdępodobné, byli to jejich slova.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Slova byla nevysvętlitelnęjší než pâesvędčivá. Bylo to oveâené nadmęrným používáním bahenních rostlin, které kouâili.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Je to závažnęjší a rozvážnęjší ve slovech této kamenné desky, co mę pâesvędčilo o skutečnosti, že TEN muž sem napsal pravdu.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Myslíš to vážnę?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Nechci nechat jediný kámen nerozluštęný.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //I jestli jenom dech šance pro nás existuje potkat jednoho ze stavitelů, pak to musíme udęlat.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Raven to také dokázal.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Souhlasím, pâivolám ducha. Co mám udęlat?", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Souhlasím, pâivolám ducha. Co mám udęlat?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Najdi Quarhodronův hrob na západę údolí.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Se slovy Strážců mrtvých, které jsem napsal, bude jeho duch pâivolán.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //Toă vše. Teë musíme najít jeho hrob.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Hodnę štęstí synu!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce abych probudil ducha pradávného válečníka Quadrohona a zeptal se ho na radu. Dal mi dokument s magickou formulí, kterou mám nahlas pâečíst v Quarhodronovę hrobę na západę."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Jak to bylo znovu o válečníkovi 'Quarhodronovi'?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Jak to bylo znovu o válečníkovi 'Quarhodronovi'?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Męl bys najít jeho hrob a pâivolat ho pomocí slov Strážců mrtvých.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Napsal jsem ty slova. Musíš je jenom nahlas pâečíst.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"Promluvil jsem s Quarhodronem.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Promluvil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(nadšený) Pak ho opravdu můžeš probudit z království mrtvých?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To je opravdu zajímavé. Obdivuji tyto stavitele čím dál víc.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kdo ví, čeho mohli dosáhnout, pokud by stále existovali ...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Co ten duch âíkal?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //dal mi nęco, s čím se mohu dostat do chrámu.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Pak jdi pâímo k Saturasovi. Bude se o to zajímat.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Męl bych ohlásit Saturasovi, že jsem probudil Quarhodrona."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nauč mę cizí jazyk.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















