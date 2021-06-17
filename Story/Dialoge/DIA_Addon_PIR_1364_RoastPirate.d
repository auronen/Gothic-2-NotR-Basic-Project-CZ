// ************************************************************
// 								Exit
// ************************************************************
instance DIA_Addon_RoastPirate_EXIT(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_RoastPirate_EXIT_Condition;
	information	= DIA_Addon_RoastPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_RoastPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Diese Hitze
// ************************************************************
var int PIR_1364_Grog;
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_GimmeGrog(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information	= DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent	= TRUE;
	Important 	= TRUE;
};                       
func INT DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if (Npc_IsInState (self,ZS_Talk) == TRUE)
	&& (Npc_WasInState (self,ZS_Roast_Scavenger) == TRUE)
	&& (PIR_1364_Grog == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_Info()
{	
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_00"); //O, od toho ohnę jde horko. Mám žízeŕ.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_01"); //Hej ty, dáš mi grog?
	
	Log_CreateTopic (TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RoastGrog,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Pirát u táborového ohnę nutnę potâebují grog.");
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Ne, nic nemám.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);

	if (Npc_HasItems (other,ItFo_addon_Grog) >= 1)
	{
		Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Tady, dej si hlta.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00"); //Ne, nic nemám.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00"); //Sakra, já snad žízní umâu.
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00"); //Tady, dej si hlta.
	B_GiveInvItems (other,self ,ItFo_Addon_Grog,1);
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01"); //Dík.
	B_UseItem (self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Zdá se, že grog ho zachránil od smrti žízní.");
	
	Npc_ExchangeRoutine (self, "START");
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_RoastPirate_SeichtesWasser	(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr		 	= 2;
	condition	= DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information	= DIA_Addon_RoastPirate_SeichtesWasser_Info;

	description	= "Co dęláš?";
};
func int DIA_Addon_RoastPirate_SeichtesWasser_Condition ()
{
	return TRUE;
};
func void DIA_Addon_RoastPirate_SeichtesWasser_Info ()
{
	AI_Output	(other, self, "DIA_Addon_PIR_6_SeichtesWasser_15_00"); //Co dęláš?
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_01"); //Musím nasytit hladové mužstvo.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_02"); //To je , proč tu sedím ve dne v noci, starý vlku.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_03"); //Namísto toho bych byl mnohem radęji na męlčinę u pláže a hledal vyplavené zboží.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_04"); //Minulý týden velká obchodní loë najela na korálový útes.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_05"); //A náklad je nyní vyplavován na bâeh.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_06"); //Doufám, že odsud jednou vypadnu.
};

// ************************************************************
// 							Francis	
// ************************************************************
instance DIA_Addon_RoastPirate_Francis(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 3;
	condition	= DIA_Addon_RoastPirate_Francis_Condition;
	information	= DIA_Addon_RoastPirate_Francis_Info;
	permanent	= FALSE;
	description = "Co mi můžeš âíci o Francisovi?";
};                       
func INT DIA_Addon_RoastPirate_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_RoastPirate_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_PIR_6_FRANCIS_15_00"); //Co mi můžeš âíci o Francisovi?
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_01"); //Francis? Jedná s námi jako by byl náš kapitán, ale který okamžitę zastaví, když je Greg zpátky.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_02"); //Pak by se plazil zpęt pod jeho skálu jako rak.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_04"); //Když se mę ptáš, myslím, že s námi všemi chce vybęhnout. Vsadil bych se, že pracuje jen pro svou vlastní kapsu.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_05"); //Tohle ze mę nedostaneš. A dokud to nebude podložené, nechal bych si to pro sebe, být tebou.
};	

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Addon_RoastPirate_PERM (C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 99;
	condition	= DIA_Addon_RoastPirate_PERM_Condition;
	information	= DIA_Addon_RoastPirate_PERM_Info;
	permanent	= TRUE;
	description = "A jinak?";
};                       
func INT DIA_Addon_RoastPirate_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_RoastPirate_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_Job_15_00"); //A jinak?
	
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_02"); //Poslal bych Francise na Gregovę místę do močálu.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_03"); //Nyní když je Greg zpęt, pochybuji, že na nás banditi zaútočí.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_01"); //Gregův návrat bude určitę znamenat víc práce, ale aspoŕ dostaneme dost penęz.
		};
	}
	else
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_06"); //Francis je velký tlučhuba. Vše se zde rozpadá od doby, kdy se stal vůdcem tábora.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_05"); //Jen aă bandité zaútočí. Budou nemile pâekvapeni.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_04"); //Doufám, že se Greg vrátí. Chtęl bych být zpęt na otevâeném moâi.
		};
	};
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_Anheuern(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_RoastPirate_Anheuern_Condition;
	information	= DIA_Addon_RoastPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Męl bys mi pomoct.";
};                       
FUNC INT DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_RoastPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_01"); //Męl bys mi pomoct.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_03"); //Pâíkaz od Grega.
	B_Say(self, other, "$ABS_GOOD");
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_ComeOn(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_RoastPirate_ComeOn_Condition;
	information	= DIA_Addon_RoastPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Pojë.";
};
func int DIA_Addon_RoastPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_RoastPirate_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_RoastPirate_ComeOn_15_00"); //Pojë.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_Say(self, other, "$ABS_GOOD");
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_GoHome(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_RoastPirate_GoHome_Condition;
	information	= DIA_Addon_RoastPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Už tę víc nepotâebuji.";
};                       
FUNC INT DIA_Addon_RoastPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_RoastPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_RoastPirate_GoHome_15_00"); //Už tę víc nepotâebuji.
	B_Say(self, other, "$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_TooFar(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_RoastPirate_TooFar_Condition;
	information	= DIA_Addon_RoastPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_RoastPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_RoastPirate_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};


		







