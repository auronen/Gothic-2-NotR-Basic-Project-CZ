///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lee_DI_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee_DI;
	nr          = 999;
	condition   = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_Hallo		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_Hallo_Condition;
	information	 = 	DIA_Lee_DI_Hallo_Info;

	description	 = 	"Co za práci si vezmeš?";
};
func int DIA_Lee_DI_Hallo_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_Hallo_15_00"); //Co za práci si vezmeš?
	AI_Output			(self, other, "DIA_Lee_DI_Hallo_04_01"); //Nękdo musí na loë dohlížet. Zůstanu tady a postarám se o to, aby tady zůstala, až se vrátíš.
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM6
///////////////////////////////////////////////////////////////////////

instance DIA_Lee_DI_PERM6		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_PERM6_Condition;
	information	 = 	DIA_Lee_DI_PERM6_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co moje loë?";
};

func int DIA_Lee_DI_PERM6_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lee_DI_Hallo))
	&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_PERM6_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_PERM6_15_00"); //Co moje loë?

	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_01"); //Neboj se. Mám všechno pod kontrolou.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_02"); //Všechno je v poâádku. Jen aă se ti mizerní skâeti vrátí. Uštędâím jim další výprask.
	};
	
	AI_StopProcessInfos (self);
};
 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Lee_DI_Teach(C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 10;
	condition	= DIA_Lee_DI_Teach_Condition;
	information	= DIA_Lee_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "Potâebuji se vycvičit.";
};                       

FUNC INT DIA_Lee_DI_Teach_Condition()
{
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
 
FUNC VOID DIA_Lee_DI_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DI_Teach_15_00"); //Potâebuji se vycvičit.
	AI_Output (self,other ,"DIA_Lee_DI_Teach_04_01"); //V čem pâesnę se chceš zlepšit?
	
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
};

FUNC VOID DIA_Lee_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_1_04_00"); //Tvoje obrana je strašná, ale bude to muset stačit.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_5_04_00"); //Máš moc tuhá zápęstí. Zbraŕ musíš držet volnęji.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00"); //Vždycky męj na pamęti, že švih vychází z boků, ne ze zápęstí.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00"); //I ten nejsilnęjší výpad je k ničemu, když nic nezasáhne. Svou sílu tedy používej s rozvahou.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Lee_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Můžeme vyrazit. Nepâítel je mrtvý.";
};

func int DIA_Lee_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lee_DI_UndeadDragonDead_OneTime;
func void DIA_Lee_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_00"); //Můžeme vyrazit. Nepâítel je mrtvý.
	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_01"); //Výbornę. V tom pâípadę âekni kapitánovi, aă zvedne kotvy.

	if (DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE)
	&& (hero.guild == GIL_DJG)
		{
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_02"); //Vezmeš mę na pevninu, že?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_03"); //Ano. Khorinis to bez tebe zvládne.
			//AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_04"); //Dann kann ich dem König endlich meine lang ersehnte Aufwartung machen. Er ist schon zu lange vor mir davon gelaufen.
			AI_Output (self ,other, "DIA_Lee_Add_04_26"); //A pak se konečnę půjdu podívat na Krále.
			AI_Output (self ,other, "DIA_Lee_Add_04_27"); //Na tuhle chvíli jsem čekal strašnę dlouho.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_05"); //Co myslíš? Nemęla by být trpęlivost nakonec odmęnęna?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_06"); //Trpęlivost a pár pádných argumentů.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_07"); //(zasmęje se) Jo. Bez trochy hrubé síly by to nešlo. Byla čest jít do bitvy po tvém boku.
			DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_08"); //Snad se po tomhle dobrodružství naše cesty zase nękdy zkâíží.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lee_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 900;
	condition	= DIA_Lee_DI_PICKPOCKET_Condition;
	information	= DIA_Lee_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Lee_DI_PICKPOCKET_Condition()
{
	C_Beklauen (110, 570);
};
 
FUNC VOID DIA_Lee_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};
	
func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};


