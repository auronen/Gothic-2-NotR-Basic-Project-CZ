////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Co jsi to udęlal mizero?
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //My z âádu Vody jsme tę opakovanę varovali pâed oddáváním se zlu.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //K mým uším se doneslo, že jsi opustil cestu trvalé rovnováhy.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Vraždící a plundrující procházel jsi krajem, obtęžkán pocitem viny z mnoha zločinů.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Bezpočet nevinných lidí bylo zavraždęno TVOU rukou.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Teë jsi spojen s temnými silami.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Od teë již nemůžeš počítat s mou podporou.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Odejdi. Jsi pro mę vyvrhel.
	
	if (Vatras_IsOnBoard == LOG_SUCCESS)
	{
		crewmember_Count = (Crewmember_Count -1);
	};

	Vatras_IsOnBoard = LOG_FAILED;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	self.flags = 0;
	VatrasPissedOffForever = TRUE;

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"PRAY"); 
};
