// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Brandon_EXIT(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 999;
	condition	= DIA_Addon_Brandon_EXIT_Condition;
	information	= DIA_Addon_Brandon_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Brandon_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo 
// ************************************************************
INSTANCE DIA_Addon_Brandon_Hello(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 1;
	condition	= DIA_Addon_Brandon_Hello_Condition;
	information	= DIA_Addon_Brandon_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Brandon_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Brandon_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_00"); //Podívejme, novic!
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_01"); //A k tomu suchozemská krysa!
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_02"); //Nejsi trochu suchý na piráta.
};

// ************************************************************
// 							PERM 
// ************************************************************
INSTANCE DIA_Addon_Brandon_AnyNews(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 99;
	condition	= DIA_Addon_Brandon_AnyNews_Condition;
	information	= DIA_Addon_Brandon_AnyNews_Info;
	permanent	= TRUE;
	description = "Nęco nového?";
};                       
FUNC INT DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Brandon_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_AnyNews_15_00"); //Nęco nového?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_01"); //Vskutku. Jsem ranęn. Mohl bys mi dát léčivý lektvar?
		}
		else
		{
			if (C_AllCanyonRazorDead() == FALSE)
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_02"); //Co pak? Půjdeme dále nebo co?
			}
			else //alle platt
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_03"); //Můžeš se na nęco zeptat! Myslím že tu nejsou jednotlivé bâitvy!
			};
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	&& (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_04"); //Ne, ale doufám že když je Greg zpátky, že se to rychle zmęní.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_06"); //Počkej chvíli ...
		AI_PlayAni (self, "T_SEARCH");
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_07"); //Nic se nezmęnilo, vše je jako pâedtím.
	};
};



// ************************************************************
// ***														***
// 			  			Teach STR und DEX
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_WannaLearn (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_WannaLearn_Condition;
	information	= DIA_Addon_Brandon_WannaLearn_Info;

	description = "Můžeš mę nęco naučit?";
};                       
FUNC INT DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};
func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output (other, self,"DIA_Addon_Brandon_WannaLearn_15_00"); //Můžeš mę nęco naučit?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_01"); //Tebe? Můžu tę naučit jak být silnęjší a lépe použitelný.
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_02"); //Nicménę proč bych to męl dęlat?
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00"); //Protože ti koupím drink?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_03"); //To nezní špatné, tak nęco dones.
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_04"); //Ale nenos mi nęjaký levný dryák!
	MIS_Brandon_BringHering = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry		(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	
	Log_CreateTopic (TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BrandonBooze,LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_BrandonBooze,"Musím koupit Bradonovi drink. Pouze pak mę bude učit.");
};

// ------------------------------------------------------------
// 						Hole Grog
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_HoleGrog (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 12;
	condition	= DIA_Addon_Brandon_HoleGrog_Condition;
	information	= DIA_Addon_Brandon_HoleGrog_Info;

	description = "Mám pro tebe grog.";
};                       
FUNC INT DIA_Addon_Brandon_HoleGrog_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00"); //Mám pro tebe grog.
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_01"); //Chceš mę otrávit???
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_02"); //Zkoušíš mę otrávit? Víš vůbec co uvnitâ je?
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_03"); //Starý Samuel má dobrý chlast, dones mi nęco od nęj!
	if (Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_05"); //Myslíš 'Rychlého sleëe'?
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_04"); //Jo, to myslím!
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_05"); //Už máš Samuelův speciál?
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_07"); //Ne, ještę ne.
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_06"); //Stůj, męls to pouze zkusit!
	};
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_08"); //Miluji tento Ëábelský nápoj!
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"Grog není pro Brandona dost dobrý. Chce 'Rychlého sleëe'. Pouze Samuel má tento chlast.");
};
// ------------------------------------------------------------
// 					Schnellen Hering geben
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_SchnellerHering (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_SchnellerHering_Condition;
	information	= DIA_Addon_Brandon_SchnellerHering_Info;

	description = "Zkus to!";
};                       
FUNC INT DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	&& (Npc_HasItems (other, ItFo_Addon_SchnellerHering) > 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00"); //Zkus to!
	B_GiveInvItems (other, self, ItFo_Addon_Schnellerhering, 1);
	B_UseItem (self, ItFo_Addon_Schnellerhering);
	AI_Output (self ,other,"DIA_Addon_Brandon_GiveGrog_04_01"); //Ahh! Jde to dolů jak tekutý oheŕ!
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"Dal jsem Bradonovi drink. Nyní mę bude rád učit.");
	
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP (XP_AMBIENT);
};


// ------------------------------------------------------------
// 			 Bring mir was bei! 
// ------------------------------------------------------------
var int	Brandon_Merke_Str;
var int	Brandon_Merke_Dex;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TeachPlayer(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 777;
	condition	= DIA_Addon_Brandon_TeachPlayer_Condition;
	information	= DIA_Addon_Brandon_TeachPlayer_Info;
	permanent	= TRUE;
	description = "Nauč mę nęco!";
};                       
FUNC INT DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_TeachPlayer_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_TeachPlayer_15_00"); //Nauč mę nęco!
	
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	if MIS_Brandon_BringHering == LOG_SUCCESS
	{
		Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_04_01"); //Pâedpokládal jsem, že mi pâineseš nęco slušného, chlapče.
	};
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_Back()
{
	if other.attribute[ATR_STRENGTH] > Brandon_Merke_Str
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00"); //Dobrá práce chlape, zase jsi o trochu silnęjší.
	};
	
	if other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01"); //Čím jsi obratnęjší, tím lépe zasáhneš cíl.
	};
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Brandon_Anheuern(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_Anheuern_Condition;
	information	= DIA_Addon_Brandon_Anheuern_Info;
	permanent	= FALSE;
	description = "Męl bys mi pomoct.";
};                       
FUNC INT DIA_Addon_Brandon_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_00"); //Męl bys mi pomoct.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_01"); //To jsou opravdu velké novinky. Kdo to âíkal?
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_02"); //Greg, męli bychom zabít bâitvy v kaŕonu.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_03"); //Tak máme tady konečnę boj!
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_04"); //Pro mę za mę, čím dâív zabijeme ty bestie, tím dâív se vrátíme.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Brandon_ComeOn(C_INFO)
{
	npc			= 	PIR_1366_Addon_Brandon;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Brandon_ComeOn_Condition;
	information	= 	DIA_Addon_Brandon_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Pojë se mnou.";
};
func int DIA_Addon_Brandon_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brandon_Weiter_15_00"); //Pojë se mnou.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_02"); //Pojëme trochu zpęt.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_01"); //Jako obvykle!
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_GoHome(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_GoHome_Condition;
	information	= DIA_Addon_Brandon_GoHome_Info;
	permanent	= TRUE;
	description = "Už tę více nepotâebuji.";
};                       
FUNC INT DIA_Addon_Brandon_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Brandon_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_DontNeedYou_15_00"); //Už tę více nepotâebuji.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_01"); //V poâádku, bez problému.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_02"); //Možná se ještę jednou spolu napijem.

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TooFar(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 14;
	condition	= DIA_Addon_Brandon_TooFar_Condition;
	information	= DIA_Addon_Brandon_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Brandon_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Brandon_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_00"); //Chceš celý ostrov liduprázdný???
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_01"); //Jdeme zpátky do tábora.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_02"); //Jdu zpęt do tábora.	
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};







