// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BenchPirate_EXIT(C_INFO)
{
	npc 		= PIR_1363_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_BenchPirate_EXIT_Condition;
	information	= DIA_Addon_BenchPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_BenchPirate_Hello (C_INFO)
{
	npc 		= PIR_1363_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_BenchPirate_Hello_Condition;
	information	= DIA_Addon_BenchPirate_Hello_Info;
	permanent	= TRUE;
	description = "Co se dęje?";
};                       
func INT DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Pir_7_Hello_15_00"); //Co se dęje?
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_01"); //Greg už je konečnę zpátky. Byla to otázka času.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_02"); //Sežeŕ Francise, aby nám donesl nęjaké dâevo na palisádu. On to má na starosti.
		}
		else 
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_03"); //Pro mę za mę, banditi teë můžou klidnę pâijít. S Gregem na naší stranę nás nemůže nic porazit!
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_04"); //Francis, šéf tábora, je idiot . Nicménę, nikdo ho nebere vážnę.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_05"); //Greg vęâí Francisovi, protože on je pâíliš blbý na to, aby ho napálil! Ale dát mu kvůli tomu velení ...
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_06"); //Jestli se Greg brzo nevrátí a já se nedostanu zase do cviku, bude ze mę suchozemská krysa.
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
INSTANCE DIA_Addon_BenchPirate_Anheuern(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_BenchPirate_Anheuern_Condition;
	information	= DIA_Addon_BenchPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Męl bys mi pomoct.";
};                       
FUNC INT DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_BenchPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_00"); //Męl bys mi pomoct.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_Anheuern_07_01"); //Gregův rozkaz?
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_08"); //Jo, pâesnę tak.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_ComeOn(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_BenchPirate_ComeOn_Condition;
	information	= DIA_Addon_BenchPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Kaŕon čeká...";
};
func int DIA_Addon_BenchPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_BenchPirate_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_BenchPirate_ComeOn_15_01"); //Kaŕon čeká...
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_02"); //Pâesnę! Ano, vrátím se TAM zpátky ...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_01"); //Á, Á, kapitán!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_BenchPirate_GoHome(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_BenchPirate_GoHome_Condition;
	information	= DIA_Addon_BenchPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Už tę víc nepotâebuji.";
};                       
FUNC INT DIA_Addon_BenchPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_BenchPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_BenchPirate_GoHome_15_00"); //Už tę víc nepotâebuji.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_01"); //Jsem zpęt v táboâe, kapitáne!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_BenchPirate_TooFar(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_BenchPirate_TooFar_Condition;
	information	= DIA_Addon_BenchPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_BenchPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_BenchPirate_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_BenchPirate_TooFar_07_01"); //Jsme pâíliš daleko od tábora.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_02"); //Tohle se mi vůbec nelíbí.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_02"); //Vrátím se do tábora!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_03"); //Já a chlapci se vrátíme do tábora!
	};
		
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};
