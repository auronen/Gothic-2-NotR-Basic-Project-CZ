//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Musím jít ...";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Čau.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Čau.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Ahoj, jmenuji se Lennar. Vítej v táboâe kopáčů.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kopáčů? Myslel jsem, že toto je tábor banditů ...
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Jasnę, však bandité tady kopou taky. (škubne ramenem) Takže ...
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "O tom pokusu zavraždit Estebana ...";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //O tom pokusu zavraždit Estebana ...
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naivnę) Ano?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Máš tušení, kdo za tím je?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(nadšenę) Samozâejmę!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(hoâečnę) Tutovę je za tím Emilio!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(hoâečnę) Utíkal do dolu jako šílenec a pak kopal jako krtek.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(chytâe) Ale od toho pokusu o vraždu jen sedí na lavičce a nepohne se ani o píë.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(pochopí) To je ono! Aby mohl do dolu, musel mít červený kámen od Estebana.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //Jak se tak dívám do jeho očí, vsadím se, že nebude vzdorovat dlouho.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podezâívá Emilia, protože se Estebanovi vyhýbá.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "Co by mohl Emilio mít z Estebanovy smrti?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //Co by mohl Emilio mít z Estebanovy smrti?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Co já vím? Možná má kamaráda, který by pâevzal po Estebanovi jeho místo.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(pro sebe) Ano, to by mohlo dávat smysl ...
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Opravdu pro mę máš červený kámen.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Perfektní. Teë konečnę rozbiju ty zatracené šutry na padră - vím pâesnę, kde začnu!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//Jedna vęc - když půjdeš kopat, dávej pozor, abys neuhodil pâíliš tvrdę. Jinak se ti krumpáč zaklíní do zlata!
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "Můžeš mę naučit jak nakopat zlato?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Můžeš mę naučit jak nakopat zlato?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Jasnę, ale pokud tę to naučím, tak nakopeš více zlata.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //O to mi právę jde.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Jo. Ale pokud nakopeč víc, tak je fér, abych já z toho nęco dostal.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Takže ...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Bude lepší, když mi dáš část pâedem. Dej mi ...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //50 zlaăáků.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "Zasvęă mę do kopání zlata!";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Zasvęă mę do kopání zlata!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Takže. Musíš být v prvé âadę trpęlivý. Nespęchat - dokonce ani v pâípadę, že už budeš usínat.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //A taky nesmíš kopat ani do stejného místa - snaž se to kolem nugetu pęknę osekat.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Drž se mých rad a budeš na dobré cestę stát se kopáč - mistr.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Nejprve chci vidęt svůj díl.
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Všechno v poâádku?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Všechno v poâádku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Hej, musím ti podękovat! Mám povolení ke vstupu do dolu!
};


