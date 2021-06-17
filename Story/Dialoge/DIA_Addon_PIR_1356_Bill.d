// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Vše ok?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co je? Henry tę tu poslal?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Âekni mu, že dostane svá prkna, jakmile je dodęlám.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Jestli se mu to nebude líbit, může si je jít udęlat sám.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "Co dęláš s tęmi deskami?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Co dęláš s tęmi deskami?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //Jsou na palisádu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg si myslí, že je dobrý nápad opevnit tábor.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale když se mę ptáš, možná bychom se nemęli rušit.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Jestli na nás chtęjí banditi zaútočit, tyto smęšné palisády je jistę nezastaví.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Nikdy jsme je nemęli tolerovat v našem údolí.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Kdybych to vędęl dâív, zůstal bych v Khorinisu.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Můžu ti pomoct?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Můžu ti pomoct?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Bez starostí, zvládnu to sám.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Pâidal jsem se teprve nedávno a kdybych nechal dęlat lidi svou práci, dlouho bych tu nebyl. Chápeš?
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Co dęláš?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co dęláš?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Zaprvé odpočívám.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(radostnę) Francis mi dal mou starou práci.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Pro mę, za mę, můžu tu dęlat desky, dokud peklo nezamrzne.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Hledám Anguse a Hanka.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Hledám Anguse a Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(povzdechne si) Nemám ani ponętí, kde by mohli být. Hádal bych, že je dostali banditi.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Byli jste pâátelé, nebo ne?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Vše, co vím, je, že se chtęli setkat s bandity v nedaleké jeskyni.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Męlo by to být nękde na východ od tábora.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Nevím ale pâesnę kde. Nikdy jsem tam nebyl.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Nejlepší se zeptat Aligatora Jacka. Je vždy nękde pâed táborem.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank męli jeskyni na východ od tábora. Aligator Jack by mohl vędęt víc.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Našel jsem tvé pâátele.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Našel jsem tvé pâátele.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //A? Kde jsou?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Jsou mrtví.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(naštvanę) To byli ti prokletí banditi!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Možná.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Ti hnusní bastardi. Pâeji si, aby odešli do pekla.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(k sobę, naštvanę) Rád bych znal jména tęch, co to udęlali ...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill byl úplnę rozrušen, když jsem mu povędęl o smrti Angude a Hanka. Chce znát jména vrahů.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Vím, kdo zabil Anguse a Hanka.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Vím, kdo zabil Anguse a Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(rozrušenę) Kdo? Kdo to byl?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Jeho jméno je Juan a je jedním z banditů.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Budu ho pronásledovat až do konce, slyšíš mę?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Nesmí se odtud dostat živí!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Já zabiju Juana. Pomstím Anguse a Hanka.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "O Juana je postaráno.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //O Juana je postaráno.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(horlivę) A? Trpęl?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Nech to být.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(povzdechne si) Máš pravdu. Konečnę je mrtev.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan je mrtev. Bill je celkem potęšen.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Bývávals v Khorinisu?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Bývávals v Khorinisu?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Ano, býval jsem malým kapesním zlodęjem a podvodníkem.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale když pâijíždęlo ménę a ménę lodí, obchod trpęl.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A nemohl jsem vędęt, jak domobrana prahne po pęnęzích.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //Tak jsem se pâidal k Gregovi. A nyní jsem zde.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(povzdechne si) Âežu celý den desky na palisádu, která bude stejnę k ničemu.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Můžeš mę nęco naučit?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Můžeš mę nęco naučit?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Můžu tę naučit, jak vyprázdnit kapsy ostatním, aniž by si toho všimli.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musíš být aspoŕ trochu obratný, jinak to nemá význam.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Ukaž mi, jak vybírat kapsy(10 LP).)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Ukaž mi, jak vybírat kapsy.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Když budeš chtít nękoho okrást, ujisti se, že jsi v bezpečí a nikdo tę nesleduje.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Pâijdeš k nim a normálnę s nimi promluvíš.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Když nęco bereš, ujisti si, že obęă si ničeho nevšimla.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Nęco dalšího?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Ano, zlepšuj se v obratnosti. Čím jsi obratnęjší, tím lépe ti to půjde.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //A hlavnę se nenech chytit.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //To je vše, co se týče teorie.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomeŕ na to, jsi pâíliš nemotorný.
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Buë se staŕ obratnęjším nebo si sežeŕ lepšího učitele.
	};
};

