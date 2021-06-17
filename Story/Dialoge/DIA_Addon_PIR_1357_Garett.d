// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Ani se mę neptej, jestli se pâipojím k tvé lodní partę.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Co si myslíš, že by si tu beze mę počali, co?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Až bych se vrátil, nezbyla by mi tu ani JEDNA plná krabice!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Zůstávám tady a budu se starat o zásoby!
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Copak to tu máme, nová tváâ? Doufám, že nejsi žádný z tęch všivých banditů!
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Já jsem Garett. Když budeš nęco potâebovat, pâijë nejprve za mnou.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Mám témęâ všechno. Víno, zbranę a ještę mnoho dalšího, co lidé potâebují.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Kromę koâalky - jestli hledáš kvalitní koâalku, jdi za Samuelem.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Kdo je Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Kdo je Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //Náš palič. Jeho jeskynę je támhle o kousek dál, napravo od pláže.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Není tęžké to najít, jdi prostę na sever.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Ale poradím ti - zásob se grogem.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Nękteâí mladíci tady nemají moc rádi nové chlapy, jestli chápeš ...
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //V tom pâípadę může troška kvalitního grogu urovnat situaci!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Od koho bereš své zboží?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Od koho bereš své zboží?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip vždycky doveze hodnę z Khorinisu, kam chodívá.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Až do teë prodával hodnę vęcí banditům.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale jak teë s bandity válčíme, všechno to zboží končí u mę.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Co víš o banditech?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Co víš o banditech?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Na to je odborník Skip.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Âeknu ti, on męl s tęmi idioty hodnę schůzek.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg rozkázal zlikvidovat každého banditu, co se pâiblíží k táboru.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Tvůj kapitán Greg. Jaký je?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Tvůj kapitán Greg. Jaký je?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Je to tuhý chlápek, to určitę.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //A chamtivý jako nikdo jiný.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Nechal našeho pokladníka Francise, aby nám platil akorát tolik, abychom se nevzbouâili.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A když jeden z nás nęco opravdu zamýšlel, postaral se o nęho osobnę.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Jednou jsem ukradl kompas z jedné královké fregaty.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //Greg, ten bastard, mi ho samozâejmę zabavil.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Pf! Asi ho nękam schoval, jako všechny jeho poklady.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Kde mohl Greg ukrýt ten kompas?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Kde mohl Greg ukrýt ten kompas?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg mi jednou âekl, že o můj kompas se stará smrt a pak se začal smát.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Nęco dalšího?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Na jižním pobâeží je pláž. Dá se tam dostat jen po moâi.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Âíká se, že Greg tam občas chodí. Možná bys tam nęco našel.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Jednou jsem tam byl, ale je tam plno potvor.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Jestli to chceš opravdu risknout, nezapomeŕ si krumpáč.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg sebral Garretovi vzácný kompas. Garett si myslí, že ho schoval nękde na jižní pláži.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Tady je tvůj kompas.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Tady je tvůj kompas.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(raduje se) Jo, to je on. Nečekal jsem, že ho ještę nękdy uvidím.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Díky, chlape!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tentokrát už ho Greg NEDOSTANe ...
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Tady, vezmi si za to tenhle opasek. Je celkem hodnotný.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Tento pásek si ode mę koupil, pamatuješ?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Zaplatil jsi za nęj hodnę - (rychle) a je opravdu cenný. Tady - vezmi si ty peníze zpęt.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret byl velmi potęšen, když jsem mu vrátil jeho kompas.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Co mi můžeš âíct o Francisovi?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co mi můžeš âíct o Francisovi?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mu pâedal velení, dokud tu není.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Ale jako kapitán je Francis absolutnę nemožný!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Ani nedokázal vytáhnout Morgana z postele.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry a jeho chlapci jsou jediní, kdo tu nęco dęlá.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Ti ostatní se jen flákají.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Doufám, že se Greg vrátí brzy.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //Pak je pęknę nakope do prdele.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Nęco nového?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Nęco nového?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Co je Greg pryč, nic se tu nedęje.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Teë, když je Greg zpęt, vęci se vrací do normálu.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


