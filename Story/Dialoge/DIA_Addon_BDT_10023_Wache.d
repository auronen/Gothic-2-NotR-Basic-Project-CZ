//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hej, kde jdeš? Zamýšlíš sledovat dále tuto stezku?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Proč ne?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Tam dole je víc otroků. Můžeš vstoupit, jestli chceš. Nebij je moc, jinak nebudou moc dále pracovat.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Nechceme, aby posedávali tady. Musejí dolovat zlato.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Vidím. A kdo za tím stojí?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//Je to pod pâímým dohledem Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//A myslím, že Raven je tu nejvyšší šéf.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To je v poâádku. Otroci jsou vlastnę jeho dar Bloodwynovi. Už je víc nepotâebuje.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven nemá další použití pro otroky. Nyní jsou zotročeni Bloodwynem."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Osvoboë otroky!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Osvoboë otroky!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Poslouchej kámo, Bloodwyn tady dává rozkazy. Otroci jsou jeho a jen on je může osvobodit.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Taky Thorus tady má nęjakou autoritu. A co ty?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Pouze Bloodwyn a Thorus můžou osvobodit otroky.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Jsi tu vůbec důležitý?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(Ukaž Bloodwynovu hlavu)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Jsem ten, kdo rozhoduje o vstupu do dolu.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//Jsem ten, kdo rozhoduje o vstupu do dolu.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Tak ty nyní dęláš Estebanovu práci? Tak to znamená, že tu nemáš žádný vliv. Vypadni!
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//To stačí?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(odpudivę) Dej to pryč! Nechci to vidęt.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Takže nyní už pustíš otroky?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Poslouchej, Bloodwyn není jedinný, kdo o tom rozhoduje. Nemůžu je pustit, dokud mi to Thorus nepovolí.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Ale âekls, že Bloodwyn vlastní otroky.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Jo. Nicménę je nemohu pustit bez Thorusova svolení
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Ty jsi jeden z tęch chlápků, co bez svolení neudęlá ani prd, že?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Chtęl jsem âíct, že ...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//... jo, jo, vše v poâádku. Šetâi slovy.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Mluvil jsem s Thorusem. Propusă ty otroky!
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Okay, když Thorus chce. Ale zajímalo by mę, proč to udęlal ...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//... ale ty nejsi placený za to, aby ses divil.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Okay, okay - tady už mę není potâeba. Jdu si dát dobrou polévku.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
