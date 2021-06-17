//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_EXIT   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 999;
	condition   = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Crimson_PICKPOCKET (C_INFO)
{
	npc			= BDT_1095_Addon_Crimson;
	nr			= 900;
	condition	= DIA_Addon_Crimson_PICKPOCKET_Condition;
	information	= DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	C_Beklauen (66, 66);
};
 
FUNC VOID DIA_Addon_Crimson_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
	
func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Hi   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent   = FALSE;
	description = "Co to dęláš? Tavíš zlato?";
};
FUNC INT DIA_Addon_Crimson_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Hi_15_00");//Co to dęláš? Tavíš zlato?
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_01");//Ne, vaâím zeleninu - samozâejmę, že tady tavím zlato a dęlám z nęj mince.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_02");//Zkus si pâedstavit krásný večer, když pâide Raven a vmáčkne mi do ruky známku za dęlání mincí.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_03");//Z jednoho zlatého nugetu udęlám kopu mincí - má práce je dobrá, nikdo nepozná rozdíl.
};
//---------------------------------------------------------------------
//	Info How
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_How   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent   = FALSE;
	description = "Kolik mincí mi dáš za nuget?";
};
FUNC INT DIA_Addon_Crimson_How_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_How_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_How_15_00");//Kolik mincí mi dáš za nuget?
	AI_Output (self, other, "DIA_Addon_Crimson_How_10_01");//Nevím to jistę, ale víš co, udęlám ti pâátelskou cenu, dám ti ...
	B_Say_Gold (self, other, 10);
};	
//---------------------------------------------------------------------
//	Info Feilsch
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Feilsch   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent   = FALSE;
	description = "Chci víc zlatých!";
};
FUNC INT DIA_Addon_Crimson_Feilsch_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_00");//Chci víc zlatých!
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_01");//Hmm ... ne. To je normální cena, jakou dostane každý.
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_02");//Myslím, že toto je cena pro pâítele.
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_03");//To je, tady jsme všichni pâátelé.
};	
//---------------------------------------------------------------------
//	Info Gold tauschen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Gold   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 99;
	condition   = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent   = TRUE;
	description = "Obchodujme ...";
};
FUNC INT DIA_Addon_Crimson_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Gold_15_00");//Obchodujme ...
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_Gold_10_01");//Ale ty nemáš žádné nugety
	};
};	
FUNC VOID DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
};
FUNC VOID DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems (other, ItMi_GoldNugget_Addon);
	
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems (self, other, ItMI_Gold, (CurrentNuggets * 10));
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (self, other, ItMI_Gold, 10);
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Vymęn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID B_Say_CrimsonBeliar()
{
	AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_LOS_10_00");//(beschwörend) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};

//---------------------------------------------------------------------
//	Info Raven
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Raven   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 9;
	condition   = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent   = FALSE;
	description = "Co víš o Ravenovi?";
};
FUNC INT DIA_Addon_Crimson_Raven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Raven_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Raven_15_00");//Co víš o Ravenovi?
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_01");//Nebudeš tomu vęâit. Byl jsem tam. Vidęl jsem, co dęlal v hrobce!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_02");//(bázlivę) Mumlal a âíkal jakási divná slova. Znovu a znovu ...
	B_Say_CrimsonBeliar();
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_03");//(hlasitę) A potom jsem uvidęl oslepující svętlo a slyšel ten strašný výkâik.
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_04");//Můj bože, ten zvuk. Bylo to, jako by se hroutil svęt.
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_05");//Raven s tím mluvil, rozprávęli - Raven a TEN zvuk!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_06");//Nevzpomínám si, o čem spolu mluvili - vzpomínám si pouze, že jsem se nemohl ještę dlouho pohnout.
};	
//---------------------------------------------------------------------
//	Info FATAGN
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_FATAGN   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 98;
	condition   = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent   = TRUE;
	description = "Můžeš mi zopakovat Ravenova slova jęštę jednou?";
};
FUNC INT DIA_Addon_Crimson_FATAGN_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Raven)
	&& (Crimson_SayBeliar < 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = (Crimson_SayBeliar +1);
	
	AI_Output (other, self, "DIA_Addon_Crimson_FATAGN_15_00");//Můžeš mi zopakovat Ravenova slova jęštę jednou?
	
	if (Crimson_SayBeliar <= 3)
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_01");//Jistę, můžu.
		
		Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
		Info_AddChoice (DIA_Addon_Crimson_FATAGN,"Ano?",DIA_Addon_Crimson_FATAGN_LOS);	
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_02");//Myslím že bude lépe, když toho necháme ...
	};
};	
FUNC VOID DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play ("Mystery_09");
	B_Say_CrimsonBeliar();
	
	if (Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	};
	Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
};
