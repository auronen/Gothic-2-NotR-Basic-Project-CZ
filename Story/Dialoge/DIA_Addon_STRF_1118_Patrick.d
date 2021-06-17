//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_EXIT   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 999;
	condition   = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hi   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent   = FALSE;
	description = "Jsem zde na rozkaz mágů Vody a všechny vás osvobodím.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Jsem zde na rozkaz mágů Vody a všechny vás osvobodím.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(podezâívavę) Opravdu? Proč bych ti męl vęâit?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Tak chcete odsud vypadnout nebo ne?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Samozâejmę, že chci - ale ...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Vatras mę poslal. Jestli se vám to nezdá dobré, pak můžete hnít v této díâe, o což se postarám.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(rychle) V poho, vęâím ti.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(zaraženę) Opravdu? Bylo to jednodušší, než jsem očekával. OK, vše, co nyní potâebujeme, je plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Pokusit se o útęk je pâíliš riskantní. William to zkoušel a koupil si farmu.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Vęzni jsou farmáâi a dęlníci - vęâí mi, ale nebudou riskovat nebezpečí
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Očekáváte mne, abych dostal pro vás od Ravena milost?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"To musím zabít všechny bandity, abyste si pohli?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Ale to není plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Jen nás ujisti, že stráže na nás nezaútočí, a my půjdeme pryč odsud.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Okay, postarám se o to. Âekni ostatním, aby se pâipravili.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Otroci se nepokusí o útęk. Musím najít způsob, aby odešli bez námitek.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Očekáváte mne, abych dostal pro vás od Ravena milost?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(usmęvavę) To by nebylo tak špatné.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//To musím zabít všechny bandity, abyste si pohli?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(pâekvapenę) To by bylo šílenství!
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};

//---------------------------------------------------------------------
//	ready
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_ready   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent   = FALSE;
	description = "Vše v pohodę, můžete jít.";
};
FUNC INT DIA_Addon_Patrick_ready_Condition()
{	
	if (Ready_Togo == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	
	|| (Npc_IsDead (PrisonGuard)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Thorus_Answer)) 
	
	|| (Npc_IsDead (Thorus)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_IsDead (PrisonGuard))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_ready_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Vše v pohodę, můžete jít.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Dobâe, znám jeskyni v bažinách. Shromáždíme se tam, ale co budeme dęlat pak?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Dejte se močálem pâímo k jihozápadu. Mágové vody si tam v ruinách založili tábor.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Ukážou vám cestu z tohohle údolí.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Dękuji ti, dękuji ti moc. (formálnę) Jsme vám hluboce zavázáni ...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Nechte to tak!
	
	Sklaven_Flucht = TRUE; 
	B_GivePlayerXP (XP_Addon_Flucht);
	
	AI_StopProcessInfos (self);
	
	//AI_UseMob			(self,"ORE",-1);

	Npc_ExchangeRoutine (self,"FLUCHT");
	
	B_StartOtherRoutine (Telbor, "FLUCHT");
	B_StartOtherRoutine (Tonak, "FLUCHT");
	B_StartOtherRoutine (Pardos,"FLUCHT");
	B_StartOtherRoutine (Monty,"FLUCHT");	
	
	B_StartOtherRoutine (Buddler_1,"WORK");
	B_StartOtherRoutine (Buddler_2,"WORK");
	B_StartOtherRoutine (Buddler_3,"WORK");
	
	B_RemoveNpc (STRF_1128_Addon_Sklave);
	B_RemoveNpc (STRF_1129_Addon_Sklave);
	B_RemoveNpc (STRF_1130_Addon_Sklave);
	
	B_RemoveNpc (STRF_1136_Addon_Sklave);
	B_RemoveNpc (STRF_1137_Addon_Sklave);
	B_RemoveNpc (STRF_1138_Addon_Sklave);
	B_RemoveNpc (STRF_1139_Addon_Sklave);
	B_RemoveNpc (STRF_1140_Addon_Sklave);
	
	
};
//---------------------------------------------------------------------
//	Killer
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Killer   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent   = FALSE;
	description = "Stráže jsou vyâízeny, můžete jít.";
};
FUNC INT DIA_Addon_Patrick_Killer_Condition()
{	
	if Npc_IsDead (PrisonGuard)
	&& (Ready_Togo == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Killer_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Stráže jsou vyâízeny, můžete jít.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co se stane, když opustíme důl? Ostatní stráže nás zabijí, kdekoliv si stoupneme. Nikdy. Pâíliš riskantní.
};
//---------------------------------------------------------------------
//	Hoehle
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hoehle   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent   = TRUE;
	description = "Nechcete odejít???";
};
FUNC INT DIA_Addon_Patrick_Hoehle_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_BL_HOEHLE_04") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Nechcete odejít???
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Samozâejmę, že chceme. Pouze čekáme na vhodou pâíležitost.
};



	
	
