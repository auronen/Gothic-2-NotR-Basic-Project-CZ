
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Nechă tę Adanos ochraŕuje.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tento svitek bude jednoduché)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Díky Adanosovi. Konečne jsi tady. Mysleli jsme, že už se neukážeš.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(rozzlobenę) Cože? Jakto že už tady jste?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Když jsi prošel skrz portál tak jsme tę následovali. Krátce poté jsme se objevili zde.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Ale ty jsi tady nebyl. Už jsme tady nękolik dní.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(pâekvapenę) NĘKOLIK DNÍ? Jak se to mohlo stát?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Nebyl jsi k nalezení, Nefarius se snažil zjistit, co se mohlo pokazit. Nevędęl si s tím rady.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Dobâe. Teë jsi tady a můžeme začít s naší prací.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se mezitím stalo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co se mezitím stalo?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Zjistili jsme toho docela dost.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Zęmętâesení stále sílí. Nejsme daleko od epicentra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Stavitelé tęchto starých staveb tu nejdâív postavili tohle męsto, jenž jsme již objevili.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Bez zjevných důvodů jejich kultura zanikla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Teë bychom mohli už jenom spekulovat proč.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Našli jste nęco nového ohlednę tęch ztracených lidí?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se dęje s Ravenem?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Co se dęje s Ravenem?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //V Ravenovę dopise se hovoâí o nęjaké svatyni, do které se pokouší dostat. 
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Shodli jsme se na tom, že by to mohl být Adanosův chrám a Raven se jej pokusí znesvętit.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Zemętâesení jsou zâejmę důsledkem poskvrŕujícího zaklínadla, které neustále naráží na mocná protikouzla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Brány tohoto chrámu jsou magicky uzavâené a pâi pokusech o sejmutí kouzla oživují kamenné strážce.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Chrám zatím odolává. Musíme zastavit Ravena dâíve, než se dostane dovnitâ.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co teë udęláme?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Proč se chce Raven do chrámu dostat?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Proč se chce Raven do chrámu dostat?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Víme jen to, že mu jde o mocný artefakt, který nęjak souvisí s Adanosem a Beliarem.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //(rozzuâenę) Męli jsme vędęt, že má nęco za lubem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Víme jen to, že mu jde o mocný artefakt, který nęjak souvisí s Adanosem a Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(rozzuâenę) Męli jsme vędęt, že má nęco za lubem.
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Možná to nedęlá on. Možná je to jiný mág, který poslouchá jeho rozkazy.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Každopádnę musíme odvrátit tohle zlo.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Našli jste nęco nového, ohlednę tęch ztracených lidí?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Zrovna včera jsme našli mrtvolu rybáâe. Leží v ruinách na východ.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Vypadá jako rybáâ z Khorinisu. Męl by ses tam jít podívat.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co teë udęláme?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //My tady zůstaneme a budeme nadále studovat tuhle kulturu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Staré svitky stavitelů zachovávají mnoho tajemství, které musíme vyâešit - pokud chceme zjistit, co se tu v minulosti stalo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Ty musíš pro nás ještę udęlat pár vęcí.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co bych męl udęlat?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Co bych męl udęlat?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Najdi Ravena a nedovol mu znesvętit chrám.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Âíkaš že ho mám zabít?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Pokud to bude jediná možná cesta jak ho zastavit, tak ve jménu Adanosovę... Ano!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Posbírej všechny pozůstatky po stavitelích, které najdeš a pâines nám je.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musíme se dozvędęt nęco víc o tomto národę a jeho osudu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Jestli chceme Ravena zastavit, musíme vędęt, co plánuje.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Navíc musíš nęjakým způsobem osvobodit otroky.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynicky) To je všechno? To udęlám i se zavázanýma očima.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(mrzutę) Vím, že to bude tvrdý oâíšek, ale podívej - máš šanci získat si mou důvęru.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven znesvęcuje Adanosův chrám. Musím ho zastavit. I kdybych ho męl zabít."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, abych osvobodil vęznę."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas chce, abych mu donesl všechno, co by mohlo souviset se starými staviteli tęchto budov."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Ja tedy už půjdu.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Ja tedy už půjdu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Ještę nęco ... pro Ravena pracuje mnoho banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Po dobu tvé nepâítomnosti jsme pâijali dalšího člena 'Kruhu vody'
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Poslali jsme ho do bažin. Ještę se nevrátil.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Pâedpokládáme, že bandité útočí na všechno, co nevypadá jako oni. 
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Obstarej si zbroj banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //Budeš mít šanci dostat se blíž bez toho, aby na tebe zaútočili.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bandité útočí na všechno co nevypadá jako oni. Musím si najít bandití zbroj, abych se mohl dostat blíž."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Co za blázna jsi poslal do močálu?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Co za blázna jsi poslal do močálu?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Jmenuje se Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Myslím, že se nedostal moc daleko.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas poslal do močálu nękoho jménem Lance. Obává se, že se nedostal moc daleko."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"Kde získam tu potâebnou zbroj banditů?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Kde získam tu potâebnou zbroj banditů?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na zapadę je tábor pirátů.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Pokud vím, mají s bandity nęjaké kontakty.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Nemyslím, že na tebe zaútoči, když tę spozorují.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Možná ti tam pomohou.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas vęâí, že piráti mi pomohou získat banditskou zbroj."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"Našel jsem Lanceho mrtvolu.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Našel jsem Lanceho mrtvolu.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Nechă jeho duše vstoupí do âíše Adanosovy.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Buë opatrný synu. Nechci pâijít o dalšího člena.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Mám Lanceho akvamarínový prsten.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Mám Lanceho akvamarínový prsten.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Bude nejlepší, když mi ho dáš dâív, než se dostane do nesprávných rukou.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"O relikviích ...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //O relikviích ...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Myslím, že tady pro tebe nęco mám.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //O tęchto kamenných tabulkách už víme. Ty nám již nepomůžou.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Musí tam toho být víc než jen tohle.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //Máš pro to využití?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Vypadá to dobâe. Kde jsi to našel?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Saturas si odemne vzal tato učení:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Bandité používali tyhle kamenné tabulky jako nęjaký druh penęz.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Tabulky nesou symbol Quarhodona, velkého bojovníka.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Byl to vojevůdce a jeho syn Rhademes zničil celé męsto.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(opovrženę) Tse. Vsadím se, že bandité ani netuší, s čím to obchodují.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Červenou kamennou desku, kterou bandité používají jako peníze. Je na ní zobrazen velký válečník Quarhodon."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tuhle tabulku jsem našel v jedné budovę na jihu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ach! Tabulka strážců smrti. Pomocí ní vyvolávali duchy smrti.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Souvislost mezi staviteli a jejich původem je velmi blízká.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Fialováou kamennou desku ze sídla Strážců smrti na jihu."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Našel jsem tuhle tabulku v budovę na jihozápadę.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Soudę podle toho, co âíka tahle tabulka, byl Dům knęze ve męstę.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Veleknęz se jmenoval KHARDIMON. Zatím toho o nęm moc nevíme.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Modrou kamenou desku z obydlí veleknęze na jihozápadę."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Tahle vęc ležela v budovę blízko bažiny.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //To by mohl být Dům léčitelů.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Zatím o nich moc nevíme. Zdá se, že byli první, co odsud zmizeli.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Zelenou kamennou desku z Domu léčitelů v jižní části bažiny."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Tahle část ležela ve velké budovę v kaŕonu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Tohle je z knihovny starého národa.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Podle všeho je to tabulka učenců.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Vętšina rukopisů, které jsme našli se vztahovaly na vůdce 'Domu učenců'
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Zvláštní, že na tęch zápiscích nenechal své jméno ...
				Log_AddEntry (TOPIC_Addon_Relicts,"- Žlutou kamenou desku z knihovny učenců na severu."); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Velmi dobâe. Obrázek męsta se poâád vyjasŕuje, ale stále toho nevíme dost.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //V téhle oblasti musí být ukryto pęt kamenných desek.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Nájdi je a pâines je sem.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Pâíjmi tohle zlato za svou ochotu.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Teë jsme už posbírali všechny relikvie, které potâebujeme.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Udęlal jsi pro nás velkou službu, díky ti.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Je to veliký pokrok pro naše studia.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Uvidím, jestli se mi nęco podaâí najít.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobâe. Pospęš si. Čas utíká.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobâe že ses vrátil. Musím ti sdęlit nęco nového.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Poslouchám.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //Ztracene męsto se jmenovalo Jharkendar. Bylo tady pęt vládců, kteâí âídili svůj lid.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Každý s tęchto vládců męl své sídlo ve kterém žil a męl svůj majetek.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Myslím si, že by jsi męl hledat ony relikvie po staré kultuâe zrovna v tęchto místech.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Co když už ta učení neexistují?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Kde pâesnę bych męl ta učení hledat?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Kde pâesnę bych męl ta učení hledat?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian tę obeznámí s uspoâádáním staveb v Jharkendaru.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Poví ti, kde je máš hledat.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, abych se poohlédl po nęjakych užitečných záznamech stavitelů. Riordian mi poví, kde je mám hledat."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //Co když už ta učení neexistují?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Jestli nenajdeš nękterý z onęch Domů, tak potom byly zrejmę zničeny spolu s męstem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale pokud ještę stále existují, budou neocenitelnou pomocí pro naše studium.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Na co potâebuješ tęch pęt kamenných desek?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Na co potâebuješ tęch pęt kamenných desek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Záznamy, které jsi našel v ruinách nejsou kompletní. 
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale v zápisech stavitelů se âíka o pęti vládcích, kteâí âídili męsto.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Každý z tęchto vládců męl jednu z tabulek, které symbolizovali jeho autoritu.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Myslím, že tyhle tabulky jsou klíčem na mé otázky.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius mi âekl o pâílivu.";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi âekl o pâílivu.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Ukázalo se, že Adanos sestoupil z nebes, aby potrestal nevęâících a vyhnal je do svęta mrtvých.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Ve svém svatém hnęvu nechal moâem pohltit męsto a smetl jej pryč. 
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Bažina na východę je ještę stále svędectvím tęchto událostí.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Co se Adanosovi stalo, že se tak rozhnęval?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Co se Adanosovi stalo, že se tak rozhnęval?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Chrámem tohto męsta byla kdysi velká záâivá budova.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Všichni ji obdivovali a modlili se k nášemu bohu Adanosovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rhademes, syn vojevůdce Quarhodrona, znesvętil chrám.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Jeden po druhém podlehli zlu.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Pâedpokládam, že Adanos jim nemohl odpustit a jeho pomsta postihla celý kraj. 
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Proto je tak důležité, aby jsme Ravena zastavili.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ohlednę Ravena ...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Ohlednę Ravena ...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byl jsem v táboâe banditú. Raven je jejich vůdce.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ale na to, abych se dostal blíž k Ravenovi, se budu muset zbavit nękolika banditů.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobâe. Hodnę štęstí. Ale nezapomęŕ, že to musíš udęlat rychle.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Raven nesmí za žádnych okolností dosáhnout svého cíle.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Má svůj zlatý důl, a nutí zajatce hledat zlato.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To se mu podobá. Musíš zajatce osvobodit.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(povzdych) Jasnę. Pracuji na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Mezi bandity je jeden chlap, který tvrdí, že zná Ravenův plán.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Jmenuje se Fortuno. Myslí si, že Raven se chce dostat do chrámu, aby získal mocný artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //A? Ví nęco víc o tom artefaktu?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Âekl mi jen to, že Raven nechal vykopat hrob jednoho z Adanosových kneží.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Možná ten hrob obsahuje klíč ke chrámu. Snad bychom se tam męli porozhlédnout.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Raven pâinutil zajatce, aby hrob vykopali.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To je zlé. Musíš si pospíšit a zastavit Ravena.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Vtrhl jsem do Ravenova doupęte.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //A? Co se stalo?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Pâišel jsem pozdę. Ztratil se v Adanosovę chrámu pâímo pâed mýma očima.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(rozzuâene) Cože? To je KATASTROFA! Proč jsi ho nesledoval?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Pâišel jsi oznámit nęjaké nové zprávy?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Zatím ne.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Dám ti radu. Nepodceŕuj Ravena, rozumíš?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Nemohu Ravena sledovat. Uzavâel bránu zevnitâ.";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nemohu Ravena sledovat. Uzavâel bránu zevnitâ.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(rozrušenę) Musím pâemýšlet ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Otázkou je, jak se Raven dostal dovnitâ ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co udęlal pâedtím, než prošel skrz bránu?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Vyslovil na bránu zaklínadlo.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A pâed tím?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otevâel hrob.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Už jsem ti to jednou âíkal.
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Správnę!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Už vím, musel tam vykonat nęjaký ritual.
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //Rituál ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //Ano! To je ono!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obávám se, že Raven získal sílu Strážců smrti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //A teë získá vędomosti ze svatynę!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musíš jít za Myxirem a âíct mu to!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Raven ovládl Strážce smrti. Taky získal od ducha informace o Adanosovę chrámu. Męl bych to oznámit Myxirovi.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"Mluvil jsem s Quarhodronem.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Mluvil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //A co âíkal?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Pomůže mi, jen když mu odpovím na jeho otázky.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //V čem je problém?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nevím správné odpovędi.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm ... víme, že učenci z tohoto męsta postavili na severu knihovnu.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Byli velice usilovní a snažili se zapisovat všechny své dęjiny.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Možná nalezneš odpovędi na Quarhodronovy otázky pravę tam.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas pâedpokládá, že bych mohl najít odpovędi na Quarhodronovy otázky v knihovnę učenců. Ta je daleko na severu."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Problém se vstupem do chrámu jsem vyâešil.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problém se vstupem do chrámu jsem vyâešil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Duch promluvil?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Jo, promluvil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Víš jak se dostat do chrámu?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Ano. A navíc mi prozradil, co se skrývá uvnitâ
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Âíkal nęco o mocném meči a o komnatách Adanose.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(zoufale) Ach Adanosi. Jsme ale hlupáci. Jakto že jsme nic netušili?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(šokovanę) Podle tvých slov ...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //Ten meč může být jedinę 'Beliarův dráp'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musíme pâekonat komnaty tak rychle jak to jen jde a získat tu zbraŕ. 
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co je to 'Beliarův dráp'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co jsou Adanosovy komnaty?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co je to 'Beliarův dráp'?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Je to pâevtęlené zlo. Sestrojil ho sám Beliar. 
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Každý kdo ho používá, má hroznou zbraŕ ničení.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Čím silnejší je nositel, tím mocnęjší je i 'dráp'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jen ten, kdo má silného ducha a pevnou vůli, může odolat kletbę.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Teë je mi už jasné, proč stavitelé zablokovali tohle údolí.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Pâinesli tuto ëábelskou zbraŕ do svého męsta a oddali se jejímu kouzlu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ti arogantní blázni zabili jeden druhého kvůli nenasytnosti.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Krutost neskončila, Adanosův hnęv se stáhnul okolo této krajiny a vše se potopilo do hlubin moâe.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Vskutku. Stavitelé portálu velmi dobâe ukryli tyto vęci pâed zbytkem svęta.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Jak tragický konec pro tak úžasnou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Pochopil jsi naléhavost naší mise?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Raven je silný bojovník a je zaslepen touhou po moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //V jeho rukou se 'dráp' stává nástrojem zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nesmí získat tu zbraŕ, jinak jsme všichni odsouzeni k záhubę.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"V Adanosovę chrámu je silná zbraŕ. Jmenuje se 'Beliarův dráp'. Raven se ji nesmí zmocnit."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Co jsou Adanosovy komnaty?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Zjistili jsme, že brána není jediná pâekážka na cestę do svatynę.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //V chrámu jsou tâi komnaty, jenž mají zastavit vetâelce.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Barevné tabulky stavitelů jsou klíčem.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Jen když máš všechny tabulky a vyâešíš jejich hádanku, smíš vstoupit dovnitâ.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nevím, jestli Raven rozluštil tajemství chrámu, ale pokud ano, tak máme velký problém.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Co pâesnę mám  v chrámu s učeními udęlat?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co pâesnę mám  v chrámu s učeními udęlat?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //To zatím nevíme. Ale doufame, že to zjistíš, hned jak vstoupíš dovnitâ.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Je mi líto, že ti nemohu âíct víc. Teë už je všechno jenom na tobę.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Vem si ty relikvie a okamžitę bęž do chrámu.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas mę posíla do Adonosova chrámu s pęti relikviemi po stavitelích. Musím se dostat dovnitâ a zastavit Ravena."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Adanosi slituj se nad ním a ochraŕ nás všechny.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Možná ještę není pozdę.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Zemętâesení se zastavilo a ty jsi ještę stále naživu.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Splnil jsi svůj úkol?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ano. Raven je mrtev.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Potom je už po všem. Díky Adanosovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vedl sis dobâe synu. Jsme tvými dlužníky.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Zbav se této zlé a mocné zbanę a pâines rovnováhu zpęt do téhle části svęta.  
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Po dobu zemętâesení jsme se radili, co budeme dęlat dál. A máme výsledek.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Bęž a získej 'Beliarův dráp'. Je ti pâedurčen.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //V tvých rukách, by mohl být mocným spojencem pro nás všechny.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Používej jej moudâe, můj synu. Adanos ti bude pomahat.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //Zůstaneme zde, a ujistíme se, že chrám bude znovu záâit tak jako kdysi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Jen Myxir půjde do Khorinisu a oznámí Vatrasovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras byl velmi dlouho v tom męstę sám.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir šel do męsta vystâídat Vatrase."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"Osvobodil jsem vęznę.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Osvobodil jsem vęznę.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Velmi dobâe. Teë se mohou vrátit zpęt domú.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"Našel jsem 'Beliarův dráp'.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Našel jsem 'Beliarův dráp'.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nemohu ho použít.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Beliarův dráp je velice zvláštní zbraŕ.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Má vlastní vůli i ducha.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Ty, majitel této mocné zbranę, jsi její pán.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Ta zbraŕ je časă tebe a pâizpůsobuje se tvým schopnostem. 
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale nemůžeš ji donutit, aby dęlala, co si zamaneš. 
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Jenom sám Beliar ji může donutit, aby tę poslouchala.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Proč by mi męl Beliar pomoci?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co můžu dęlat s touhle zbraní?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Co můžu dęlat s touhle zbraní?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To záleží na tobę. Ovládl jsi tu zbraŕ a teë jsi její pán. 
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Mohu ti dát jenom radu, co s ní můžeš udęlat.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Buë mi ji odevzdáš, a já zaručím, že už nikdy nezpůsobí žádnou škodu ...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //... nebo využiješ její moc a použiješ ji k boji.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Nemůžeš si tu zbraŕ nechat?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nemůžeš si tu zbraŕ nechat?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Pokud mi ji dáš, zničím ji, takže už ji nikdo nebude moci zneužít. 
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Takže si promysli, co chceš.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Můžu 'Beliarův dráp' odevzdat Saturasovi anebo si ho nechat."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Proč by mi męl Beliar pomoci?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Jenom pobožný človęk ho může vyprovokovat.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Buë opatrný. Beliar je nejhorší.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Pokud ho rozzuâíš, brzo to pocítíš.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Abych mohl ovládat 'Beliarův dráp', musím se pomodlit k Beliarovi.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co teë budete dęlat?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co teë budete dęlat?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zůstaneme tady a zajistíme, aby chrám opęt odhalil svou krásu a velikost.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Pâílíš dlouho tyto zdi chátrají.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //Díky ti synu ...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Velmi jsem se v tobę mýlil. Jsi ochránce rovnováhy. O tom není pochyb.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Bez tvé pomoci a statečnosti by ostrov Khorinis zanikl. Dękujeme ti a budeme oslavovat tvou čest.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Soustâeë se na své další úlohy, které leží pâed tebou a udržuj tento svęt v rovnováze a míru.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Jdi a pâíjmi svůj osud ochránce. Budeme se za tebe modlit.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Vem si 'Beliarův dráp' a znič ho.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Vem si 'Beliarův dráp' a znič ho.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jako chceš, synu. Dej mi ho.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Už nikdy nikomu neublíží. Zahodím ho do hlubin moâe.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Adanos na to dohlédne.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"Můžeš mę naučit kruhy magie?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Můžeš mę naučit kruhy magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Jsi ohnivý mág. Co by âekl Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //To neví nikdo.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(povzdych) Vidím, že to opravdu myslíš vážnę, jsem opravdu pâekvapen tvojí žádostí.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Pokud budu mít dojem, že svoje vędomosti používáš k ubližování nevinným, tak se mnou víc nepočítej.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Doufám, že mę nezklameš.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci se naučit další kruh magie.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chci se naučit další kruh magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ano, jsi pripraven naučit se o tom nęco víc.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Vstoupils do druhého kruhu magie. Adanos ti dává moudrost, abys použil svou novou moc chytâe. 
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ano, nastal správný čas. Vstup do tâetího kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Tvé vędomosti ti dovolují používat nová kouzla. Používej je opatrnę.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Už je načase. Jsi pâipraven, abys vstoupil do čtvrtého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Tvá slova a činy jsou teë velmi mocná. Vybírej si svá nová kouzla opatrnę a s rozumem.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Dostal jsi oprávnęní vstoupit do pátého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Kouzla, která teë dostaneš, jsou velice ničivá.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Uvędom si svou moc a nepodléhej zlu.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To už teë není má úloha.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Na to, aby ses naučil šestý a zároveŕ poslední kruh magie, bys męl navštívit klašter mágů ohnę.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Je ještę stále pâílíš brzy. Vraă se pozdęji.
	};
};

















