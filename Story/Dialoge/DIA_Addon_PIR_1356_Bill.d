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
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //V??e ok?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co je? Henry t?? tu poslal?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //??ekni mu, ??e dostane sv?? prkna, jakmile je dod??l??m.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Jestli se mu to nebude l??bit, m????e si je j??t ud??lat s??m.
	
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

	description = "Co d??l???? s t??mi deskami?";
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
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Co d??l???? s t??mi deskami?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //Jsou na palis??du.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg si mysl??, ??e je dobr?? n??pad opevnit t??bor.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale kdy?? se m?? pt????, mo??n?? bychom se nem??li ru??it.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Jestli na n??s cht??j?? banditi za??to??it, tyto sm????n?? palis??dy je jist?? nezastav??.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Nikdy jsme je nem??li tolerovat v na??em ??dol??.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Kdybych to v??d??l d????v, z??stal bych v Khorinisu.
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
	description	= "M????u ti pomoct?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //M????u ti pomoct?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Bez starost??, zvl??dnu to s??m.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //P??idal jsem se teprve ned??vno a kdybych nechal d??lat lidi svou pr??ci, dlouho bych tu nebyl. Ch??pe???
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
	description	= "Co d??l?????";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co d??l?????
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Zaprv?? odpo????v??m.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(radostn??) Francis mi dal mou starou pr??ci.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Pro m??, za m??, m????u tu d??lat desky, dokud peklo nezamrzne.
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
	description = "Hled??m Anguse a Hanka.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Hled??m Anguse a Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(povzdechne si) Nem??m ani pon??t??, kde by mohli b??t. H??dal bych, ??e je dostali banditi.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Byli jste p????tel??, nebo ne?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //V??e, co v??m, je, ??e se cht??li setkat s bandity v nedalek?? jeskyni.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //M??lo by to b??t n??kde na v??chod od t??bora.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Nev??m ale p??esn?? kde. Nikdy jsem tam nebyl.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Nejlep???? se zeptat Aligatora Jacka. Je v??dy n??kde p??ed t??borem.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank m??li jeskyni na v??chod od t??bora. Aligator Jack by mohl v??d??t v??c.");
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
	description = "Na??el jsem tv?? p????tele.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Na??el jsem tv?? p????tele.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //A? Kde jsou?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Jsou mrtv??.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(na??tvan??) To byli ti proklet?? banditi!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Mo??n??.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Ti hnusn?? bastardi. P??eji si, aby ode??li do pekla.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(k sob??, na??tvan??) R??d bych znal jm??na t??ch, co to ud??lali ...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill byl ??pln?? rozru??en, kdy?? jsem mu pov??d??l o smrti Angude a Hanka. Chce zn??t jm??na vrah??.");
};	

// ------------------------------------------------------------
// 						Ich kenne den M??rder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "V??m, kdo zabil Anguse a Hanka.";
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
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //V??m, kdo zabil Anguse a Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(rozru??en??) Kdo? Kdo to byl?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Jeho jm??no je Juan a je jedn??m z bandit??.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Budu ho pron??sledovat a?? do konce, sly?????? m???
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Nesm?? se odtud dostat ??iv??!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"J?? zabiju Juana. Pomst??m Anguse a Hanka.");
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

	description = "O Juana je postar??no.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //O Juana je postar??no.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(horliv??) A? Trp??l?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Nech to b??t.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(povzdechne si) M???? pravdu. Kone??n?? je mrtev.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan je mrtev. Bill je celkem pot????en.");
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

	description	= "B??v??vals v Khorinisu?";
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
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //B??v??vals v Khorinisu?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Ano, b??val jsem mal??m kapesn??m zlod??jem a podvodn??kem.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale kdy?? p??ij????d??lo m??n?? a m??n?? lod??, obchod trp??l.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A nemohl jsem v??d??t, jak domobrana prahne po p??n??z??ch.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //Tak jsem se p??idal k Gregovi. A nyn?? jsem zde.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(povzdechne si) ??e??u cel?? den desky na palis??du, kter?? bude stejn?? k ni??emu.
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
	
	description	= "M????e?? m?? n??co nau??it?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //M????e?? m?? n??co nau??it?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //M????u t?? nau??it, jak vypr??zdnit kapsy ostatn??m, ani?? by si toho v??imli.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale mus???? b??t aspo?? trochu obratn??, jinak to nem?? v??znam.

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
	description	= "Uka?? mi, jak vyb??rat kapsy(10 LP).)";
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
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Uka?? mi, jak vyb??rat kapsy.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man f??r Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Kdy?? bude?? cht??t n??koho okr??st, ujisti se, ??e jsi v bezpe???? a nikdo t?? nesleduje.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //P??ijde?? k nim a norm??ln?? s nimi promluv????.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Kdy?? n??co bere??, ujisti si, ??e ob???? si ni??eho nev??imla.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //N??co dal????ho?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Ano, zlep??uj se v obratnosti. ????m jsi obratn??j????, t??m l??pe ti to p??jde.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //A hlavn?? se nenech chytit.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //To je v??e, co se t????e teorie.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapome?? na to, jsi p????li?? nemotorn??.
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Bu?? se sta?? obratn??j????m nebo si se??e?? lep????ho u??itele.
	};
};

