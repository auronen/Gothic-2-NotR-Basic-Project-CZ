//************************************************************
//		  					EXIT
//************************************************************
INSTANCE DIA_Addon_Henry_EXIT(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 999;
	condition	= DIA_Addon_Henry_EXIT_Condition;
	information	= DIA_Addon_Henry_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Henry_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// -----------------------------------------------------------
	func void B_Henry_Gold (var int gold)
	{
		if (gold == 500)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold500_04_00"); //500 zlatych.
		}
		else if (gold == 400)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold400_04_00"); //400 zlatych.
		}
		else if (gold == 300)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold300_04_00"); //300 zlatych.
		}
		else if (gold == 200)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold200_04_00"); //200 zlatych.
		}
		else if (gold == 100)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold100_04_00"); //100 zlatych.
		}
		else
		{
			B_Say_Gold (self, other, gold);
		};
		
	};
// -----------------------------------------------------------

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Henry_PICKPOCKET (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 900;
	condition	= DIA_Addon_Henry_PICKPOCKET_Condition;
	information	= DIA_Addon_Henry_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Henry_PICKPOCKET_Condition()
{
	C_Beklauen (40, 60);
};
 
FUNC VOID DIA_Addon_Henry_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
	
func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";	
// ------------------------------------------------------------
instance DIA_Addon_Henry_Hello(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 5;
	condition	= DIA_Addon_Henry_Hello_Condition;
	information	= DIA_Addon_Henry_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_Hello_Condition()
{
	if (Npc_GetDistToWP(other, PIR_1354_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};
	
	if (self.aivar[AIV_Guardpassage_Status]			== GP_NONE)
	&& (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) 						== FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_00"); //STÁT!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_01"); //Pâítel nebo nepâítel?
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Nepâítel!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Pâítel!",DIA_Addon_Henry_Hello_Freund);
};
var int Henry_SC_Frech;
FUNC VOID DIA_Addon_Henry_Hello_Feind()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Feind_15_00"); //Nepâítel!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_01"); //Hlupáku. Jsi pâipravený  na výprask?
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_02"); //Povęz co chceš, nebo vypadni.
	
	Henry_SC_Frech = TRUE;

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

FUNC VOID DIA_Addon_Henry_Hello_Freund()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Freund_15_00"); //Pâítel!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Freund_04_01"); //To může âíct každý! Ani tę neznám. Co tu vlastnę dęláš?
	
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_Henry_SecondWarn (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 2;
	condition	= DIA_Addon_Henry_SecondWarn_Condition;
	information	= DIA_Addon_Henry_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_SecondWarn_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_henry_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Henry_SecondWarn_04_00"); //Pâiblíž se ještę o krok blíž k táboru a nakrmím s tebou žraloky.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_Henry_Attack (C_INFO)
{
	npc			= Pir_1354_Addon_Henry;
	nr			= 3;
	condition	= DIA_Addon_Henry_Attack_Condition;
	information	= DIA_Addon_Henry_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
func INT DIA_Addon_Henry_Attack_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,Pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Henry_Attack_04_00"); //Koledoval sis o to ...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};



// ************************************************************
// ***														***
// 						Ich will ins Lager
// ***														***
// ************************************************************
// ------------------------------------------------------------
var int Henry_Zoll_WhatFor;
// ------------------------------------------------------------
// 		  				Ich will da rein	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WantEnter(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_WantEnter_Condition;
	information	= DIA_Addon_Henry_WantEnter_Info;
	permanent	= FALSE;
	description	= "Chci jít do tábora!";
};                       
FUNC INT DIA_Addon_Henry_WantEnter_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WantEnter_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_00"); //Chci jít do tábora!
	AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_01"); //Fakt? Tak to tę výjde pęknę draze. 

	B_Henry_Gold (500);

	if (Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_02"); //Cože? A proč?
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_03"); //Ty seš nęjak neodbytnej.
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_04"); //Tu v táboâe je mnoho vęcí o které by ses mohl zajímat ...
		Henry_Zoll_WhatFor = TRUE;
	};
		 
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	||   (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_07"); //Vypadáš, že maš dostatek zlata.
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_08"); //Menší poplatek tę určitę nezabije.
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_09"); //Nebo jsi ty fajné hadry nękomu ukradl?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_10"); //Určitę máš nęjaké zlato, že?
	};
};

// ------------------------------------------------------------
// 							500 zahlen!
// ------------------------------------------------------------
func void B_Henry_NoJoin()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_00"); //Jestli se chceš k nám pâidat, tak tę asi musím zklamat, mládenče!
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_01"); //Kapitán s polovinou chlapů z tábora odplul na moâe. A on je jediný, kdo pâíjmá nové členy. 
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_02"); //Ale můžeš počkat, dokud se nevrátí.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_03"); //Nesnaž se tu ovšem zpusobit nęjaký problém! 
};
// ------------------------------------------------------------



instance DIA_Addon_Henry_Einigen2		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 2;
	condition	= DIA_Addon_Henry_Einigen2_Condition;
	information	= DIA_Addon_Henry_Einigen2_Info;

	description	= "Tu máš 500 zlatých.";
};
func int DIA_Addon_Henry_Einigen2_Condition ()
{
	if (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Gold) >= 500)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Einigen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen2_15_00"); //Tu máš 500 zlatých.
	B_GiveInvItems (other, self, ItMi_Gold, 500);		
	AI_Output (self, other, "DIA_Addon_Henry_Einigen2_04_01"); //Výbornę. Vítám tę v táboâe.
	B_Henry_NoJoin();
	
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ------------------------------------------------------------
// 								Einigen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Einigen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 3;
	condition	= DIA_Addon_Henry_Einigen_Condition;
	information	= DIA_Addon_Henry_Einigen_Info;

	description	= "Nemohli bychom se dohodnut nęjak líp?";
};

func int DIA_Addon_Henry_Einigen_Condition ()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen_15_00"); //Nemohli bychom se dohodnut nęjak líp?
	AI_Output (self, other, "DIA_Addon_Henry_Einigen_04_01"); //Možná. Dej mi nęjaký dobrý důvod a možná tę to vyjde levnęji.
};

// ------------------------------------------------------------
// 		  			Grund 1 - Fleisch für Morgan
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_MeatForMorgan(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 4;
	condition	= DIA_Addon_Henry_MeatForMorgan_Condition;
	information	= DIA_Addon_Henry_MeatForMorgan_Info;
	permanent	= FALSE;
	description	= "Mám pâinést Morganovi tohle maso.";
};                       
FUNC INT DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& 	(MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&&	(Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_MeatForMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_00"); //Mám pâinést Morganovi tohle maso.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_01"); //(ostâe) A kdo tę poslal?
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_02"); //Alligator Jack. Âekl mi, že Morgan na nej už čeká.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_03"); //Rozumím, rozumím. Pâece se nebude obtęžovat sám, že? 
};

// ------------------------------------------------------------
// 		  			Grund 2 - Holz von Malcom
// ------------------------------------------------------------
instance DIA_Addon_Henry_Malcom		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 5;
	condition	= DIA_Addon_Henry_Malcom_Condition;
	information	= DIA_Addon_Henry_Malcom_Info;

	description	= "Posíla mę Malcom...";
};
func int DIA_Addon_Henry_Malcom_Condition ()
{
	if  (self.aivar[AIV_PASSGATE]	== FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&&  (MalcomBotschaft == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Malcom_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Malcom_15_00"); //Posíla mę Malcom. Mám ti vzkázat, že na ty trámy potâebuje ještę nęjaký čas.
	AI_Output (self, other, "DIA_Addon_Henry_Malcom_04_01"); //(lamentování) Och ano, ano. To jsem si mohl myslet. Určitę mu to bude trvat celou vęčnost.

	B_MalcomExident();
};

// ------------------------------------------------------------
// 		  			Grund 3 - Paket für Skip
// ------------------------------------------------------------
instance DIA_Addon_Henry_BaltramPack		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 6;
	condition	= DIA_Addon_Henry_BaltramPack_Condition;
	information	= DIA_Addon_Henry_BaltramPack_Info;

	description	= "Mám zásilku pro Skipa. Je v táboâe?";
};
func int DIA_Addon_Henry_BaltramPack_Condition ()
{
	if (self.aivar[AIV_PASSGATE]	== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_BaltramPack_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_BaltramPack_15_00"); //Mám zásilku pro Skipa. Je v táboâe?
	AI_Output (self, other, "DIA_Addon_Henry_BaltramPack_04_01"); //Ano. Skip tu je. A co ještę chceš?
};

// ------------------------------------------------------------
// 						ICH WILL JETZT REIN
// ------------------------------------------------------------
var int Henry_Amount;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Tribut		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 7;
	condition	= DIA_Addon_Henry_Tribut_Condition;
	information	= DIA_Addon_Henry_Tribut_Info;
	permanent	= TRUE;
	description = "Pusă mę dovnitâ.";
};
func int DIA_Addon_Henry_Tribut_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (self.aivar[AIV_PASSGATE] == FALSE)		
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Tribut_Info ()
{
	Henry_Amount = 500;

	AI_Output	(other, self, "DIA_Addon_Henry_Tribut_15_00"); //Pusă mę dovnitâ.
	
	AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_01"); //Hmm ...

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_02"); //Pâinesl jsi mi vzkaz od dâevorubce.
		Henry_Amount = (Henry_Amount - 100);
	};	

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_03"); //Chceš si hrát na poslíčka Aligatora Jacka a doručit maso z močálových krys Morganovi.
		Henry_Amount = (Henry_Amount - 100);
	};
	
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_BaltramPack))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_04"); //Máš zásilku pro Skipa.
		Henry_Amount = (Henry_Amount - 100);
	};

	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if (Henry_Amount < 500) //schon was anderes gesagt
		{
			AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_00"); //A nejlepší na tom je:
		};
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_01"); //Postaral JSI se o ty spráskaný psy na vęži.
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_02"); //Nemyslel jsem si, že bys s to zvládl! 
		Henry_Amount = (Henry_Amount - 200);
	};

	if (Henry_Amount <= 0)
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_03"); //Víš co, můžeš jít dovnitâ zadarmo.
		
		//patch M.F. 
		self.aivar[AIV_PASSGATE] = TRUE; 
		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold (Henry_Amount);   

		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_05"); //... anebo znovu zmizneš. Je to jednoduché.

		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
		Info_AddChoice	(DIA_Addon_Henry_Tribut, "To je dost.", DIA_Addon_Henry_Tribut_nein );

		if (Npc_HasItems (other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice	(DIA_Addon_Henry_Tribut, "Dobrá. Tu je tvé zlato.", DIA_Addon_Henry_Tribut_ja );
		};
	};
};
func void DIA_Addon_Henry_Tribut_ja ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_ja_15_00"); //Dobrá. Tu je tvé zlato.
	B_GiveInvItems (other, self, ItMi_Gold, Henry_Amount);		
	AI_Output (self, other, "DIA_Addon_Henry_Tribut_ja_04_01"); //Dękuji. Vítam tę v našem táboâe.
	B_Henry_NoJoin();
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE; 
};
func void DIA_Addon_Henry_Tribut_nein ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_nein_15_00"); //To je dost.
	if (Henry_Amount < 500)
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_03"); //No tak, už jsem ti to dost zlevnil. 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_04"); //Tak potom vypadni.
	};
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
};



// ************************************************************
// ***														***
// 				Palisade - Banditen - Turmbanditen
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  				Hallo 2 	(Was machst du)	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Condition;
	information	= DIA_Addon_Henry_Palisade_Info;
	permanent	= FALSE;
	description	= "Co tu delaš?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_15_00"); //Co tu delaš?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_01"); //Co si myslíš? Musím dohlídnut na tyhle slabochy, aby dostavęli hradbu.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_02"); //Jak to nepostavíme, tak mę kapitán Greg nakope do zadku. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_03"); //Navíc musím dohlížet na to, aby sem nenapochodoval každý, komu se zachce!
};

// ------------------------------------------------------------
// 		  				Palisade + Turmbanditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_WhatFor(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 12;
	condition	= DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information	= DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent	= FALSE;
	description	= "Proč tu stavíte palisadu?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_WhatFor_15_00"); //Proč tu stavíte palisadu?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10"); //Aby to banditi nemęli TAK jednoduché!
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02"); //Ti bastardi jsou čímdál drzejší. Již nękolik dní obkličují náš tábor. Pâesnę jako žraloci obkličují ztroskotance na moâi. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11"); //Nękolik tęch bastardů se ukrylo do vęže na jih od tábora.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12"); //Ale jsem si jist, že je to jen výzvędná hlídka.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03"); //Jestli jsou tak blbí, že na nás zaútočí, tak je pâivítáme jak se patâí.

	Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditsTower,"Nękolik banditů se usadilo ve vęži na jih od pirátského tábora a zabarikádovali se tam.");

};

// ------------------------------------------------------------
// 		  				Turmbanditen Report
// ------------------------------------------------------------
func void B_Henry_WhereIsTower()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_08"); //Kde pâesnę je ta vęž?
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_07"); //Vyjdi odsud a drž se vpravo.
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_08"); //Tam, na malém útesu, najdeš vęž.
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Turmbanditen(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 13;
	condition	= DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information	= DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent	= TRUE;
	description	= "Ohlednę tęch banditů z vęže ...";
};                       
FUNC INT DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade_WhatFor))
	&& (MIS_Henry_FreeBDTTower != LOG_SUCCESS)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Turmbanditen_15_00"); //Ohlednę tęch banditů z vęže ...
	
	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_01"); //Ano?
		AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_01"); //Postaral jsem se o to.
		if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_02"); //Vybornę! O jeden problém míŕ.  
		}
		else //auf eigene Faust
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_03"); //Fakt jsi je vyhnal sám? JSeš dobrej!
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_04"); //Kdo ví, možná se z tebe jednou stane opravdový pirát! 
		};
		//-----------------------------------------			
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(HammerPirate,"START");
		//-----------------------------------------	
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		
		B_LogEntry (TOPIC_Addon_BanditsTower,"Banditi z vęže jsou mrtví.");
		
		B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);
	}
	else if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_07"); //Co teë?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_05"); //Jestli se chystáš jít na nę SÁM, tak na to zapomeŕ! 
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_06"); //Pâinejhorším tam pošlu dva své chlapy. Oni se o ty bandity postarají. 
		Knows_HenrysEntertrupp = TRUE;
	};
};

// ------------------------------------------------------------
// 		  			Warum Krieg mit Banditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_Bandits(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 14;
	condition	= DIA_Addon_Henry_Palisade_Bandits_Condition;
	information	= DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent	= FALSE;
	description	= "Proč na vás banditi útočí?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Bandits_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Bandits_15_00"); //Proč na vás banditi útočí?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_04"); //Protože boj mezi námi a nimi pokračuje! Co sis myslel?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_05"); //Na začátku to bylo v poâádku. Pâivezli jsme je sem, a oni se usadili v bažinách, nechajíc nás na pokoji.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_06"); //Od té doby začali napadat každého kdo k nim nepatâí.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_07"); //Co jsem se doslechl, démoni je vyhnali.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_08"); //Myslel jsem že chtęjí naše lodę. Prece jen - není žádnej jinej způsob jak se odsud dostat.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_09"); //Zeptej se na to Skipa. Byl tam - a vyvázl živej.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_10"); //Je to zajímavý pâíbęh. Už mi o tom hodnę âíkal. 
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_11"); //(podezâívavę) Škoda že si to nemůžete poslechnout, když teë nemáte na zaplacení cla.
		Henry_Zoll_WhatFor = TRUE;
	};
};



// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  		Ich will in deinen Entertrupp
// ------------------------------------------------------------
var int Henry_EnterCrewMember;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Entercrew(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 31;
	condition	= DIA_Addon_Henry_Entercrew_Condition;
	information	= DIA_Addon_Henry_Entercrew_Info;
	permanent	= TRUE;
	description	= "Chci se pâidat do vaší party.";
};                       
FUNC INT DIA_Addon_Henry_Entercrew_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_EnterCrewMember == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Entercrew_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_00"); //Chci se pâidat do vaší party.
	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_00"); //(smích) To není tak jednoduchý dostat se k nám, chlapče!
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_01"); //Nejdâív si musíme popovídat, zda tę vůbec pustím do tábora. 
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_06"); //Jó, vítám tę v naší partę!
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_07"); //O jednoho muže víc, který nám pomůže ubránit se pâed bandity.
		if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_02"); //Hmm, chtęl jsem âíct, aby sis vzal jednoho chlapa a vymydlil ty lumpy z vęže.
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_03"); //Ale ty jsi to už udęlal.
		}
		else 
		{
			if (Npc_IsDead(SawPirate))
			&& (Npc_IsDead(HammerPirate))
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_04"); //Oba moji chlapi jsou mrtví. Vypadá to tak, že si budeš muset poradit sám.
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_05"); //Zbav sa tęch banditů ve vęži.
				
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z vęže. Nedal mi ovšem nic na obranu.");
			}
			else
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_06"); //Seber si jednoho chlapa a vyžeŕte ty bandity z vęže.
				Henry_GetPartyMember = TRUE;
			
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z vęže. Můžu sebou vzít jednoho muže.");
			};

			B_Henry_WhereIsTower();
			
			AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_09"); //Vždy s váma, pane.
	
			MIS_Henry_FreeBDTTower = LOG_RUNNING;
		};
		Henry_EnterCrewMember = TRUE;
	};
};

// ------------------------------------------------------------
// 						Dann geh zu Owen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 32;
	condition	= DIA_Addon_Henry_Owen_Condition;
	information	= DIA_Addon_Henry_Owen_Info;

	description	= "Je ještę nęco, s čím bych mohl pomoct?";
};
func int DIA_Addon_Henry_Owen_Condition ()
{
	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	&& (Henry_EnterCrewMember == TRUE)
	&& (!Npc_IsDead (Malcom))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen_15_01"); //Je ještę nęco, s čím bych mohl pomoct?
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_01"); //Už nękolik dní čekáme na zásilku trámů na hradby.
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_05"); //Malcom a Owen to męli donést už dávno.
	if (!Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_06"); //Dâevorubecký tábor je nedaleko odsud, u jezera na jihovýchodę. 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_07"); //Malcom síce âekl že to může trvat trochu déle, ale neâekl že to bude trvat celou vęčnost.
	};
	
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_08"); //Âekni jim, že čekáme na ty trámy.
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_09"); //Nezdržuj se. Povęz to radši OWENOVI. Malcom není spolehlivý.
	
	
	B_MalcomExident();
	
	MIS_Henry_HolOwen = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_HolOwen,"Henry čeká na trámy na hradby. Oznámil jsem to Owenovi. Stojí u jezera spolu s Malcomem.");  
};

// ------------------------------------------------------------
// 						Owen2 Report
// ------------------------------------------------------------
func void B_Addon_Henry_MalcomsDead()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_00"); //Stalo se nęco Malcomovi?
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_Add_15_01"); //Je mrtvý.
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_02"); //Vypadá to, že jeho štestí pominulo, co?
		
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen2		(C_INFO)
{
	npc		 	= 	PIR_1354_Addon_Henry;
	nr		 	= 	33;
	condition	= 	DIA_Addon_Henry_Owen2_Condition;
	information	= 	DIA_Addon_Henry_Owen2_Info;
	permanent	= 	TRUE;
	description	= 	"O dâevorubci Owenovi ...";
};
func int DIA_Addon_Henry_Owen2_Condition ()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_00"); //O dâevorubci Owenovi ...
	
	if ((Npc_IsDead(PIR_1367_Addon_Owen)) == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_01"); //Je mrtvý.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_02"); //Sakra! To znamená, že se o to musí postarat nękdo jiný. 
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_03"); //(podráždęnę) Je načase aby Morgan začal dęlat svoji práci poâádnę, a vyčistil oblast od všech pâíšer.
		B_Addon_Henry_MalcomsDead();
		//AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_01"); //Was? Er auch? Verdammte Mistviecher!
		MIS_Henry_HolOwen = LOG_OBSOLETE;
	
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen a Malcom jsou mrtví.");	
		Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	  
	}
	else if (Owen_ComesToHenry == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_03"); //Owen brzo pošle trámy.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_04"); //Výbornę, už bylo načase.
		B_Addon_Henry_MalcomsDead();
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_05"); //Tu je tvá odmęna.
		B_GiveInvItems (self, other, ItMi_Gold, 200);
		B_StartOtherRoutine	(PIR_1367_Addon_Owen,"PostStart");
		
		
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen pošle trámy Henrymu.");
		
		MIS_Henry_HolOwen = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_06"); //Kde se zase utáboâil? 
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_07"); //Není to daleko odsud, smęrem na jihovýchod, blízko jezera. 
	};
};

// ************************************************************
// 		  						PERM
// ************************************************************
var int Henry_PERM_Once;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_CanHelp(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 34;
	condition	= DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information	= DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent	= TRUE;
	description	= "Potâebuješ pomoc?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if (MIS_Henry_HolOwen == LOG_SUCCESS)
	|| (MIS_Henry_HolOwen == LOG_OBSOLETE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_CanHelp_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_00"); //Potâebuješ pomoc?
	if (Henry_PERM_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01"); //Máš zkušenosti se stavęním hradeb?
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_02"); //Ne, vůbec.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03"); //Tak potom pro tebe nemám využití. Jdi pomoct nękam jinam. 
		Henry_PERM_Once = TRUE;
	};
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04"); //UH! A teë bęž pro mę za mę pryč, ale hlavnę nevyrušuj mé dęlníky.  
};



// ************************************************************
// 							Teach 2h
// ************************************************************
// ------------------------------------------------------------
// 		  					Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WhatTeach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 21;
	condition	= DIA_Addon_Henry_WhatTeach_Condition;
	information	= DIA_Addon_Henry_WhatTeach_Info;
	permanent	= TRUE;
	description	= "Můžeš mi pomoct vylepšit se v boji?";
};                       
FUNC INT DIA_Addon_Henry_WhatTeach_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_Addon_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WhatTeach_Info()
{	
	AI_Output (other, self, "DIA_Addon_Henry_WhatTeach_Add_15_00"); //Můžeš mi pomoct vylepšit se v boji?
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_01"); //(smích) Nejrpve si splŕ povinnosti. Až potom ti povím nęco o vylepšení boja!
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_02"); //(šibalsky) Moje povolení zahrnuje vše.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_03"); //Jistę, proč ne? 
		Henry_Addon_TeachPlayer = TRUE;
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};

// ------------------------------------------------------------
// 		  					Teach 2h
// ------------------------------------------------------------
var int Henry_merke2h;
var int Henry_Labercount;
// ------------------------------------------------------------
func VOID B_Henry_CommentFightSkill ()
{
	if (Henry_Labercount == 0)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_01"); //Učíš se rychle, jako správnej pirát.
		Henry_Labercount = 1;
	}
	else if (Henry_Labercount == 1)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_02"); //Jak budeš takhle pokračovat, můžeš nastoupit na galeje celkem sám.
		Henry_Labercount = 2;
	}
	else if (Henry_Labercount == 2)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_03"); //A pamatuj, kdo se kryje, žije déle.
		Henry_Labercount = 0;
	};
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Teach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 6;
	condition	= DIA_Addon_Henry_Teach_Condition;
	information	= DIA_Addon_Henry_Teach_Info;
	permanent	= TRUE;
	description	= "Uč mę!";
};                       
FUNC INT DIA_Addon_Henry_Teach_Condition()
{
	if (Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Teach_15_00"); //Uč mę!
					
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];  
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] > Henry_Merke2h)
	{
		B_Henry_CommentFightSkill ();
	}
	else if  (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Teach_Back_04_00"); //Pekelnę ses zlepšil.
	};
	Info_ClearChoices (DIA_Addon_henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func VOID DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
		
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};



// ************************************************************
// 		  						Greg
// ************************************************************
INSTANCE DIA_Addon_Henry_Palisade_Train(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Train_Condition;
	information	= DIA_Addon_Henry_Palisade_Train_Info;
	permanent	= FALSE;
	description	= "Greg je tvuj šéf?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Train_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_00"); //Greg je tvuj šéf?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_01"); //Pâesnę tak. A pro tebe je to KAPITÁN Greg. Mám ti to vysvętlit?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_02"); //Je to skvęlý muž. Když ho potkáš tak na nęj nezkoušej žadnej podraz. Nemusela by se ti líbit jeho reakce. 
	
	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_03"); //Ve skutečnosti jsem se s ním už potkal.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_04"); //Pâesnę tak. Takže víš o čem mluvím.
	};

	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_05"); //Nanešăęstí teë není v táboâe.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_06"); //Jeho zástupce se jmenuje Francis.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_07"); //Po celý den sedí pâed Gregovou chatrčí, a zírá na nás jak pracujeme.
};

// ************************************************************
// 		  				Dein eigener Entertrupp
// ************************************************************
INSTANCE DIA_Addon_Henry_YourOwnTrupp (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_YourOwnTrupp_Condition;
	information	= DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_YourOwnTrupp_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_04"); //Kapitán z vás udelal âádnou partu, co?
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_05"); //Ano, dâív než se ujistíme že chlapi začali pracovat!
	AI_StopProcessInfos (self);
};



/*
AI_Output (other,self ,"DIA_Addon_Henry_HenrysCrew_15_00"); //Wer gehört zu deinem Trupp?
AI_Output (other,self ,"DIA_Addon_Henry_Morgan_15_00"); //Wo finde ich Morgan?
*/
