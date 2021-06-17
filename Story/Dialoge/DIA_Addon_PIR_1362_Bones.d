// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Je mi líto, ale nemám čas.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Musím trénovat.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Kaŕon čeká.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Kaŕon čeká.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Jak to jde?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Jak to jde?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //V pohodę. Je to trochu nuda, ale aspoŕ nemusím pracovat.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Právę se pâipravuji na další úkol, který mi Greg dá.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jaký úkol?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //To ti nemůžu âíct.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Bez urážky kámo, pracoval jsem dlouho a nechci tuto práci ztratit.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "Můžeš mę nęco naučit?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Můžeš mę nęco naučit?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Kdo mę tu může nęco naučit?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kdo mę tu může nęco naučit?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry a Morgan âídí stravování našich lidí.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Ti tę mohou naučit, jak lépe bojovat.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Všichni Henryho lidé umí zacházet s obouručníma zbranęma.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan dává pâednost rychlejším jednoručním zbraním.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kdo dál?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Nemám páru, já se o toto nezajímám.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Nicménę jsem si jist, že Alligator Jack nebo Samuel by ti mohli nęjaký trik ukázat.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Co mi můžeš âíct o Francisovi?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
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

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Co mi můžeš âíct o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Jen se rozhlédni kolem. Jediní lidé, co nęco dęlají, jsou Henry a jeho chlapi.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan stráví celý den v posteli nebo chlastá.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Nedęlá vůbec nic. A kdo se neâídí podle nęj, má problém!
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Dej mi brnęní bandity.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dej mi brnęní bandity.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Nejsem blázen, Greg by mi săal hlavu.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Âíkál, že bez jeho rozkazu nemůžu nikomu dát to brnęní..
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nemůžu ti ho dát. Aspoŕ dokud není zpęt.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones mi nechce dát brnęní banditů bez Gregova svolení."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Gregův rozkaz je, že mi máš dát brnęní.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Gregův rozkaz je, že mi máš dát brnęní.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Gregův pâíkaz? Puh, a myslím, že bych pak musel jít sám.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Být špionem v tom táboâe je holá sebevražda.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Radęji strpím Gregovo vęzení než aby mę zabili banditi.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //Brnęní.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Tady to máš.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ale nezahrávej si s tęma chlápkama.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Zdá se, že gregův rozkaz může dęlat zázraky. Mám brnęní banditů!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

