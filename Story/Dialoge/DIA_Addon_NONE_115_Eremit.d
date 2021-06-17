// ********************************************************
// 							EXIT 
// ********************************************************
INSTANCE DIA_Addon_Eremit_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_115_Eremit;
	nr          = 999;
	condition   = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
func INT DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ********************************************************
// 							Hallo 
// ********************************************************
instance DIA_Addon_Eremit_Hello (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 1;
	condition	= DIA_Addon_Eremit_Hello_Condition;
	information	= DIA_Addon_Eremit_Hello_Info;

	important	= TRUE;
};
func int DIA_Addon_Eremit_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Hello_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_00"); //(Pâekvapenę) Co tady dęláš?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_00"); //Co tu dęlám?! A na kterého čerta jsi tu prosím tę ty?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_01"); //Šel jsem do co nejodlehlejší části ostrova, abych męl klid.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_02"); //Občanská válka, ůtočící banditi, hordy orků skoro na prahu ...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_03"); //To není pro mę. Nikdy víc. Vypadl jsem z tho šílenství.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_04"); //Tam je taky pár orků, ale ti jsou daleko a není jich tolik.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_05"); //A ostatní lidé sem - díky Innosovi - nechodí. (mrzutę) Dodnes.
};

// ********************************************************
// 					Suche Steintafeln
// ********************************************************
instance DIA_Addon_Eremit_SeekTafeln (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 2;
	condition	= DIA_Addon_Eremit_SeekTafeln_Condition;
	information	= DIA_Addon_Eremit_SeekTafeln_Info;

	description	= "Hledám kamenné desky. Nenašels náhodou nęjaké?";
};
func int DIA_Addon_Eremit_SeekTafeln_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_SeekTafeln_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_02"); //Hledám kamenné desky. Nenašels náhodou nęjaké?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_06"); //No jo ... Ale nechám si je!
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_07"); //Jsou tu jedinou vęcí, kterou mám, tak je čtu.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_08"); //Zatím všemu nerozumím, ale nekteré jsem už dešifroval.
};

// ********************************************************
// 				Wegen Steintafeln - TEACH
// ********************************************************
var int Eremit_Teach_Once;
// --------------------------------------------------------
instance DIA_Addon_Eremit_Teach (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 3;
	condition	= DIA_Addon_Eremit_Teach_Condition;
	information	= DIA_Addon_Eremit_Teach_Info;
	permanent 	= TRUE;
	description = "O kamenných deskách ...";
};
func int DIA_Addon_Eremit_Teach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Eremit_SeekTafeln))
	&& (Eremit_Teach_Once == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Teach_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_03"); //O kamenných deskách ...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_25"); //Mohl bych tę nęco o tom naučit?
	if (MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_26"); //(rychle) Ale ty mé desky nedostaneš! Budeš si muset sehnat vlastní.
	};

	Info_ClearChoices (DIA_Addon_Eremit_Teach);
	Info_AddChoice (DIA_Addon_Eremit_Teach, DIALOG_BACK, DIA_Addon_Eremit_Teach_No);
	
	
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

// ---------------------------------------------------------------
	func void B_Addon_Eremit_TeachLanguage()
	{	
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_27"); //Je to docela jednoduché, sleduj. 'G' je 'O',  'T' je 'H' , 'I' je 'C'.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_28"); //Jak to jednou udęláš, zbytek tę napadne sám ...
		
		/*
		
		if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		}
		else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		}
		else
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		};
			
		*/	
				
		Eremit_Teach_Once = TRUE;
	};
// ---------------------------------------------------------------
func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices (DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_29"); //Myslím, že už tę nic nemůžu naučit ...
		Eremit_Teach_Once = TRUE;
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else //Keine Language
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_1))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	};
};

// ********************************************************
// 					Klamotten geben
// ********************************************************
instance DIA_Addon_Eremit_Klamotten (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 4;
	condition	= DIA_Addon_Eremit_Klamotten_Condition;
	information	= DIA_Addon_Eremit_Klamotten_Info;
	permanent 	= TRUE;
	description = "Nęco pro tebe mám ...";
};
func int DIA_Addon_Eremit_Klamotten_Condition ()
{
	if (MIS_Eremit_Klamotten == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Klamotten_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_01"); //Nęco pro tebe mám ...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_19"); //Opravdu? Dej mi to! Podíváme se, zda-li se to bude hodit.
	
	Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	Info_AddChoice (DIA_Addon_Eremit_Klamotten, DIALOG_BACK, DIA_Addon_Eremit_Klamotten_BACK);
	if (Npc_HasItems (other, ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Lehké pirátské brnęní", DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if (Npc_HasItems (other, ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Stâední pirátské brnęní", DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if (Npc_HasItems (other, ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Kapitánské brnęní", DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	//if (Npc_HasItems (other, ITAR_Thorus_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Gardistenrüstung geben", DIA_Addon_Eremit_Klamotten_Thorus);
	//};
	//if (Npc_HasItems (other, ITAR_OreBaron_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Erzbaronrüstung geben", DIA_Addon_Eremit_Klamotten_OreBaron);
	//};
	//if (Npc_HasItems (other, ITAR_Bloodwyn_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Bloodwyn's Rüstung geben", DIA_Addon_Eremit_Klamotten_Bloodwyn);
	//};
	//if (Npc_HasItems (other, ITAR_Raven_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Raven's Rüstung geben", DIA_Addon_Eremit_Klamotten_Raven);
	//};
	if (Npc_HasItems (other, ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej brnęní kruhu vody", DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if (Npc_HasItems (other, ITAR_KDW_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Lehké roucho mága vody", DIA_Addon_Eremit_Klamotten_KDW_L);
	};
	if (Npc_HasItems (other, ITAR_KDW_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Tęžké roucho mága vody", DIA_Addon_Eremit_Klamotten_KDW_H);
	};
	if (Npc_HasItems (other, ITAR_Governor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Guvernérovu kazajku", DIA_Addon_Eremit_Klamotten_Governor);
	};
	if (Npc_HasItems (other, ITAR_JUDGE) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Soudcovu róbu", DIA_Addon_Eremit_Klamotten_Judge);
	};
	if (Npc_HasItems (other, ITAR_SMITH) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Kováâskou zástęru", DIA_Addon_Eremit_Klamotten_Smith);
	};
	if (Npc_HasItems (other, ITAR_BARKEEPER) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Hospodáâskoou zástęru", DIA_Addon_Eremit_Klamotten_Barkeeper);
	};
	if (Npc_HasItems (other, ITAR_VLK_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský odęv I", DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if (Npc_HasItems (other, ITAR_VLK_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský odęv II", DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if (Npc_HasItems (other, ITAR_VLK_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský odęv III", DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský šat I", DIA_Addon_Eremit_Klamotten_VlkBabe_L);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský šat II", DIA_Addon_Eremit_Klamotten_VlkBabe_M);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Męšăanský šat III", DIA_Addon_Eremit_Klamotten_VlkBabe_H);
	};
	/*
	if (Npc_HasItems (other, ITAR_MIL_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_L);
	};
	if (Npc_HasItems (other, ITAR_MIL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_PAL_SKEL) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Staré paladinské brnęní", DIA_Addon_Eremit_Klamotten_PAL_SKEL);
	};
	if (Npc_HasItems (other, ITAR_BAU_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Lehký farmáâský odęv", DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if (Npc_HasItems (other, ITAR_BAU_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Stâední farmáâský odęv", DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Lehký farmáâský šat", DIA_Addon_Eremit_Klamotten_BauBabe_L);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Stâední farmáâský šat", DIA_Addon_Eremit_Klamotten_BauBabe_M);
	};
	/*
	if (Npc_HasItems (other, ITAR_SLD_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_L);
	};
	if (Npc_HasItems (other, ITAR_SLD_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_M);
	};
	if (Npc_HasItems (other, ITAR_SLD_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Zbroj z krunýâe důlního červa", DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	/*
	if (Npc_HasItems (other, ITAR_DJG_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_L);
	};
	if (Npc_HasItems (other, ITAR_DJG_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_M);
	};
	if (Npc_HasItems (other, ITAR_DJG_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_H);
	};
	if (Npc_HasItems (other, ITAR_NOV_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Novizenrobe geben", DIA_Addon_Eremit_Klamotten_Nov_L);
	};
	if (Npc_HasItems (other, ITAR_KDF_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_L);
	};
	if (Npc_HasItems (other, ITAR_KDF_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_Leather_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Kožené brnęní", DIA_Addon_Eremit_Klamotten_Leather);
	};
	//if (Npc_HasItems (other, ITAR_BDT_M) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_M);
	//};
	//if (Npc_HasItems (other, ITAR_BDT_H) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_H);
	//};
	if (Npc_HasItems (other, ITAR_XARDAS) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Roucho temných umęní", DIA_Addon_Eremit_Klamotten_Xardas);
	};
	if (Npc_HasItems (other, ITAR_Lester) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Lesterovo roucho", DIA_Addon_Eremit_Klamotten_Lester);
	};
	if (Npc_HasItems (other, ITAR_Diego) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Diegovo brnęní", DIA_Addon_Eremit_Klamotten_Diego);
	};
	if (Npc_HasItems (other, ITAR_CorAngar) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Cor'Angarovu zbroj", DIA_Addon_Eremit_Klamotten_CorAngar);
	};
	if (Npc_HasItems (other, ITAR_Prisoner) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Kalhoty kopáče", DIA_Addon_Eremit_Klamotten_Prisoner);
	};
	if (Npc_HasItems (other, ITAR_Dementor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Dej Pátračovo roucho", DIA_Addon_Eremit_Klamotten_Dementor);
	};
};
// -------------------------------------------------------------
	func void B_Eremit_Tatsache()
	{
		AI_EquipBestArmor (self);
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_20"); //Jako ulité!
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_21"); //Hmm, co bych ti mohl dát? Všechno zlato jsem dal pirátům za vstup.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_22"); //Můžu ti dát nęjaké staré kamenné desky.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_23"); //Na, ber. Já si můžu najít další.
		
		B_GiveInvItems (self,other,ItWr_DexStonePlate3_Addon,1);
		B_GiveInvItems (self,other,ItWr_StonePlateCommon_Addon ,1);     
		
		MIS_Eremit_Klamotten = LOG_SUCCESS;
		B_GivePlayerXP (200);
		
		Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	};
// -------------------------------------------------------------

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_24"); //Skvęlé. První zvýšila mou nedočkavost a pak ... (povzdechne si)
	Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
};
func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GiveInvItems (other, self, ITAR_PIR_L_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GiveInvItems (other, self, ITAR_PIR_M_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GiveInvItems (other, self, ITAR_PIR_H_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Thorus()
{
	B_GiveInvItems (other, self, ITAR_Thorus_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_OreBaron()
{
	B_GiveInvItems (other, self, ITAR_OreBaron_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Bloodwyn()
{
	B_GiveInvItems (other, self, ITAR_Bloodwyn_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Raven()
{
	B_GiveInvItems (other, self, ITAR_Raven_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GiveInvItems (other, self, ITAR_RANGER_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KDW_L()
{
	B_GiveInvItems (other, self, ITAR_KDW_L_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KDW_H()
{
	B_GiveInvItems (other, self, ITAR_KDW_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Governor()
{
	B_GiveInvItems (other, self, ITAR_Governor, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Judge()
{
	B_GiveInvItems (other, self, ITAR_JUDGE, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Smith()
{
	B_GiveInvItems (other, self, ITAR_SMITH, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Barkeeper()
{
	B_GiveInvItems (other, self, ITAR_BARKEEPER, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GiveInvItems (other, self, ITAR_VLK_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GiveInvItems (other, self, ITAR_VLK_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GiveInvItems (other, self, ITAR_VLK_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_L()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_M()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_H()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_MIL_L()
{
	B_GiveInvItems (other, self, ITAR_MIL_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_MIL_M()
{
	B_GiveInvItems (other, self, ITAR_MIL_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_M()
{
	B_GiveInvItems (other, self, ITAR_PAL_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_H()
{
	B_GiveInvItems (other, self, ITAR_PAL_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_SKEL()
{
	B_GiveInvItems (other, self, ITAR_PAL_SKEL, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GiveInvItems (other, self, ITAR_BAU_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GiveInvItems (other, self, ITAR_BAU_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BauBabe_L()
{
	B_GiveInvItems (other, self, ITAR_BauBabe_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BauBabe_M()
{
	B_GiveInvItems (other, self, ITAR_BauBabe_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_L()
{
	B_GiveInvItems (other, self, ITAR_SLD_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_M()
{
	B_GiveInvItems (other, self, ITAR_SLD_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_H()
{
	B_GiveInvItems (other, self, ITAR_SLD_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GiveInvItems (other, self, ITAR_DJG_Crawler, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_L()
{
	B_GiveInvItems (other, self, ITAR_DJG_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_M()
{
	B_GiveInvItems (other, self, ITAR_DJG_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_H()
{
	B_GiveInvItems (other, self, ITAR_DJG_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Nov_L()
{
	B_GiveInvItems (other, self, ITAR_NOV_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KdF_L()
{
	B_GiveInvItems (other, self, ITAR_KDF_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KdF_H()
{
	B_GiveInvItems (other, self, ITAR_KDF_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GiveInvItems (other, self, ITAR_Leather_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BDT_M()
{
	B_GiveInvItems (other, self, ITAR_BDT_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BDT_H()
{
	B_GiveInvItems (other, self, ITAR_BDT_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Xardas()
{
	B_GiveInvItems (other, self, ITAR_XARDAS, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Lester()
{
	B_GiveInvItems (other, self, ITAR_Lester, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Diego()
{
	B_GiveInvItems (other, self, ITAR_Diego, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_CorAngar()
{
	B_GiveInvItems (other, self, ITAR_CorAngar, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GiveInvItems (other, self, ITAR_Prisoner, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Dementor()
{
	B_GiveInvItems (other, self, ITAR_Dementor, 1);
	B_Eremit_Tatsache();
};



// ********************************************************
// 							PERM
// ********************************************************
instance DIA_Addon_Eremit_PERM (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 99;
	condition	= DIA_Addon_Eremit_PERM_Condition;
	information	= DIA_Addon_Eremit_PERM_Info;
	permanent 	= TRUE;
	description = "Jaké je to žít jako poustevník?";
};
func int DIA_Addon_Eremit_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_PERM_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_04"); //Jaké je to žít jako poustevník?
	
	if (MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_09"); //(pyšnę) Dęlám si vše sám. Zbranę, nástroje, barák, prostę vše.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_10"); //Pâišel jsem zde a nemęl jsem nic, ale má píle ...
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_11"); //Jinak ...
		AI_Output (other, self, "DIA_Addon_Eremit_Doppelt_15_01"); //Ano? 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_12"); //Nękdy si pâeju, abych si s sebou vzal nęjaké oblečení.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_13"); //Nevím nic o stahování zvíâat ...
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_14"); //A noci v této části ostrova nejsou zrovna nejteplejší.
		MIS_Eremit_Klamotten = LOG_RUNNING;
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_15"); //Vystačím si.
		if (MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_18"); //S tęmito šaty pâežiju zimu a pak ... uvidíme ...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_16"); //Je to lepší jak v Khorinisu!
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_17"); //Dokonce bez pokrývek.
		};
	};
};	
	


