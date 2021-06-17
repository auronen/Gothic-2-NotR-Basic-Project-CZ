// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //No kdo je to, zase kâíží cestu se starým Skipem.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(pâehnanę) Já tę znám!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Zátoka poblíž męsta, pamatuješ?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip! Správnę?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(hrdę) Můžu âíci, že jsem ti to natrvalo vtiskl.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale mezitím jsem tvoji tváâ musel vidęt nękde JINDE ...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Ah! Jasnę!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Tak dobrá. Špatnę nakreslené, ale jsi to TY.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Neboj. Mé plakáty vypadají stejnę hloupę.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Mám pro tebe balík od Baltrama.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Mám pro tebe balík od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(šklebí se) Musí být velmi chtivý po našem rumu, nebo by nemęl posílat vęci TOUHLE CESTOU.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Tady jsou pro nęj 2 láhve rumu. Tâetí jsem vylemtal, když jsem na nęj čekal.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tady dęláš?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tady dęláš?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Zrovna jsem se vrátil z Khorinisu a teë čekám, až se Greg vrátí.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Vidęl jsem Grega v Khorinisu.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Vidęl jsem Grega v Khorinisu.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Opravdu? Zatracenę! Nęco musí být špatnę.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Męl by být zpęt s naší lodí.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(zamyšlenę) Bude nejlepší, když se vrátím do Khorinisu a počkám tam na nęho ...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(povzdech) Ale určitę ne dnes. Zrovna jsem pâijel.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Můžeš mę vzít zpęt do Khorinisu?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Můžeš mę vzít zpęt do Khorinisu?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Ne. Ještę nejdu. Nejdâív si dám poâádný hlt grogu.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zbláznil jsi se? Ztratili jsme naši LOĎ, chlape!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nebudu používat naši poslední loë na plavbu pro potęšení, jenom proto, že ty jsi moc líný dostat tvůj zadek do Khorinisu SÁM!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Kolikrát? NE!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co mi můžeš âíct o banditech?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co mi můžeš âíct o banditech?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Bandité? ÚTOČÍ na nás!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Proč by jsme jinak stavili palisády?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //Vlastnę jsme ty šmejdy sem pâivedli my.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Také jsme s nimi obchodovali. Chlapče, męli moc zlata, męli ho i za ušima!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Byli pâipraveni zaplatit barel rumu za jakkoukoli cenu.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale tyhle dny skončili. Teë je válka!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co se stalo?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ti teplouši nezaplatili poslední zásilku.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Tak jsem se tam byl podívat, co se dęje s naším zlatem.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Ale když jsem vstoupil do bažiny, ti bastardi na mę začali útočit!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //To ale není vše. Odstranili Agnuse a Hanka! Dva z našich nejlepších chlapců!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Nechoë do bažiny, to ti âeknu!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Zaútočí na vše, co není tak otrhané jako oni sami.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Potâebuji zbroj banditů.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Potâebuji zbroj banditů.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Ty tam chceš jít? Teë jsi ztratil rozum dokonale.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Jestli tihle chlapi zjistí, že nejsi jeden z nich, nakrmí s tebou bažinné žraloky!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Nęjaký nápad, kde mohu najít takové brnęní?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(povzdech) Ty to nevzdáš, že? Dobrá. Męli jsme jedno.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg ho možná má ve své chatrči.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Když se vrátí, možná ti ho prodá ...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip pâedpokládá, že zbroj bude v Gregovę chatrči."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Nęjaký nápad, jak se můžu dostat do chatrče?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Nęjaký nápad, jak se můžu dostat do chatrče?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Muahaha! Spolehlivý!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Chystáš se šlohnout nęco z Gregovy sbírky?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Když odešel, dal Francisovi klíče a pâíkaz, že NIKDO nesmí vstoupit do chatrče.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis má klíč od Gregovy chatrče. Má pâíkaz nikoho nepouštęt dovnitâ."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co mi můžeš âíct o Francisovi?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co mi můžeš âíct o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis je náš pokladník.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapitán mu vęâí. Proto mu svęâil velení.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //I když ho nikdo nebere vážnę.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Jestli se chceš dovędęt víc, promluv se Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Jeho destilátor je v malé jeskyni na severu.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //V tomhle táboâe není nikdo, o kom by Samuel NĘCO zajímavýho nevędęl.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Męl bych si promluvit se Samuelem. Možná mę může dát tip."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Setkal jsi se nękdy s Ravenem?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Setkal jsi se nękdy s Ravenem?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Jasnę. Byl jsem u pâední brány s Henrym. Mohli jsme vidęt Ravena, jak posílal nękteré ze svých lidí do vęže na východ odsud.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Opravdu blízko k našemu táboru. (smęje se) Hádám, že jsou tam proto, aby nás špehovali.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //Také jsem vidęl, jak ošetâuje lidi, kteâí nedęlají co jim pâikáže.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Každý kdo nejde na slovo je bez rozmýšlení zabit.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Vyvaruj se Ravena, to ti povím.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Âekni mi více o Agnusovi a Hankovi.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Âekni mi více o Agnusovi a Hankovi.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus a Hank se byli pravdępodobnę setkat s pár bandity za táborem.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Męli s sebou všechno možné. Vše, o co si ti bastardi âekli.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kujné železo a paklíče.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Ale nikdy se nevrátili. Ty banditské svinę je musely odpravit!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgand a Bill se po nich byli podívat - bez výsledku.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill byl z toho pęknę špatný. Kamarádil se s nimi.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Je stále mladý a tenhle incident ho hodnę poznamenal.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Ostatní to brali v klidu. Ztráta vęci je snadná. (povzdech) Ale grog co męli s sebou ...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(kysele) Mluvíme nejménę o 20 láhvích!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Jak se zdá, tak Skip ztratil 20 láhví grogu. Chce je zpátky.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank byli vysláni za pár bandity na obchod. Potom už nebyli znovu spatâeni.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Morganovo a Billovo pátrání nepâineslo žádné výsledky ...");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "O Angusovi a Hankovi ...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //O Angusovi a Hankovi ...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Našel jsem je.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Jsou mrtví.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(pro sebe) Mrtvý jako dveâní hâebík - ubozí chlapi!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Dobrá, nic víc jsem nečekal.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Męl bys dát Billovi vędęt, pokud jsi to už neudęlal.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale âekni mu to jemnę - je stále mladý.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Znám vraha Agnuse a Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Znám vraha Agnuse a Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Dobâe pro tebe. Jsou oba mrtví. Kdo se o nęj postará?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Pomsta nikdy neudęlá piráta bohatého.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Nejdůležitęjší je, že mám svůj grog zpátky.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Vrah mę nezajímá! Co můj grog?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "O grogu ...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //O grogu ...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Tady je tvých 20 láhví.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Postrádáš 20 láhví, že?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Ano, zatracenę. To byly naše úplné zásoby.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Tady je tvých 20 láhví.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip má svých 20 láhví grogu a je spokojený.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Co to? Za nic?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Noo ...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Dobrá. Zaplatím ti.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Máš nęco více zajímavęjšího, než je zlato?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmm. Nech mę se kouknout. Mám tu tady ten prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Vyhrál jsem ho pâed mnoha roky v jednom dusném pâístavním baru pâi hâe na šanci.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Staroch âekl, že je magický. Což se zdá.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Chceš ho, nebo chceš zlato?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi peníze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi prsten.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Dej mi prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Tady máš.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Dej mi peníze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Jasnę.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Máš nęco k prodeji?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Máš nęco k prodeji?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Jestli chceš obchodovat, promluv si s Garettem. Stará se o zásoby.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Pojë, pomož mi.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Pojë, pomož mi.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Co se dęje?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Kaŕon čeká.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Vidím, že jsi shromáždil pár chlapců. To je dobâe!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Radši s sebou vezmi víc chlapců!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Kaŕon je smrtící!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Pojë se mnou.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Pojë se mnou.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Počkej. Nejdâív se vra»me do kaŕonu ...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Jasnę!
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
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Už tę více nepotâebuji.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Už tę více nepotâebuji.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Pak dobrá. Jsem v táboâe.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To je dost daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Jestli opravdu chceš jít dál, udęlej to bez nás!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Jestli opravdu chceš jít dál, udęlej to beze mę.
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Pokud se rozdęlíme, setkáme se u tohohle jezírka.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Pojëme!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Skâeti! Nenávidím tyhle bestie

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Vypadá to, že jsme dostali všechny bâitvy.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Můžeme se tu ještę trochu potulovat, jestli chceš.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Tak dlouho dokud zůstaneme v kaŕonu.
	
	AI_StopProcessInfos (self); 
};


