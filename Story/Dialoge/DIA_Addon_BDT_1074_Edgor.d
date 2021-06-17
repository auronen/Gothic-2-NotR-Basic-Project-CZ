var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Potęšení tę zmlátit ...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Jak to jde?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Jak to jde?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chceš vędęt jak to jde? Âeknu ti jak to jde.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Byl jsem na tohle místo pâivezen nękolika piráty. V bouâlivé noci. Chlape, vyzvracel jsem všechno pâes palubu.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Dobrá, a potom Raven zamkl důl, protože nękolik debilů bylo pâíliš chtivých.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //A Franco se stal velitelem lovců a má sklony zabíjet každého, kdo je proti nęmu.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Tak, âekl bych, že to jde docela špatnę.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Jak se Franco stal velitelem téhle party?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Jak se Franco stal velitelem téhle party?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //To bylo velice lehké. Zabil Fletchera, minulého velitele.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher byl dobrý. Franco, nicménę, nás opravdu vytáčí.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco se mę zaptal na kamenné desky. Našel jsi je?";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco se mę zaptal na kamenné desky. Našel jsi je?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Chlape, ani jsem je nehledal. Všechno co vím, je, že to má být ve staré budovę v pravo v bažinę.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A víš, můj vnitâní hlas mi âíká, Edgore zůstaŕ hezky daleko od tęch starých budov umístęných hluboko v bažinę.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Jako bych męl riskovat svůj zadek, kvůli tomu arogantnímu idiotovi Francovi!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor nikdy nepůjde hledat kamenné desky . Myslí, že jsou nękde ve staré budovę v bažinę.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "Kde že je ta stará budova?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Kde že je ta stará budova?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Vidíš tu velkou skálu tady? Následuj stezku od ní nelevo. Po chvíli se dostaneš skrz další skály.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Tady se musíš dát doleva ... nebo doprava. Chlape, nepamatuji se, už je to nęjaká doba.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ruiny jsou umístęny na malém kopci, skryté uvnitâ rostlinstva.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Možná budeš mít štęstí a nenajdeš to ...
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "Našel jsem kamennou desku!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(šăastný) Našel jsem kamennou desku!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(znudęnę) Opravdu. Jsi statečný chlap.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(znudęnę) Hádám, že tím si možná vydęláš propustku do tábora. (zívá)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "Je tady nęco, co by jsi mę mohl naučit?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Je tady nęco, co by jsi mę mohl naučit?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Znám pár vęcí o krvavých mouchách. Nenávidím tyhle stvoâení málem víc než Franca!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Ale vím, jak můžeš odtrhnout kâídla a žihadlo z jejich mrtvých tęl. (nepatrnę šílenę) Ano, urvat ...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//K tomu vím jak získat extrakt z jejich žihadel.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Můžu tę to naučit všechno, pokud chceš.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Ne zadarmo samozâejmę ...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor toho hodnę ví o krvavých mouchách a jejich trofejích.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Pâines trochu zlata. Pâijímaám pouze mince, ne nęjaké drobky.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "O krvavých mouchách ...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//O krvavých mouchách ...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chceš vędęt?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Vyndat žihadlo. (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Utrhnout kâídla. (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Získat sekret z žihadla (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak můžu vyjmout žihadlo?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Zakruă jím a usekni ho široce rozevâené. Teë rozsekni maso okolo ocasní části.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Teë můžeš lehce vyndat žihadlo.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jaká je nejlepší cesta k vyjmutí kâídel?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Lehké. vezmi kâídlo jednou rukou a usekni horní část kůže skrz ostatní.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak můžu získat sekret krvavých much?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Usekni horní vrstvu otevâeného žihadla - męl by jsi vidęt léčivý sekret vykapávající ven.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Není žádný risk v pití nebo používaní toho sekretu na lektvary.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


