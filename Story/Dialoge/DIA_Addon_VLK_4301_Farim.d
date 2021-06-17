///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Ty jsi rybáâ?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Ty jsi rybáâ?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cynicky) Jak si to uhodl?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Nemůžeš mę prostę nechat na pokoji?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Nevykládej si to špatnę, ale já nemám domobranu moc v lásce.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Nevykládej si to špatnę, ale v poslední dobę mám špatnou náladu. Problémy s domobranou ...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Problémy s domobranou?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Problémy s domobranou?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ti šmejdi sem prostę normálnę pâišli a vzali si, co chtęli.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //Minulý týden mi vzali celý úlovek. 'Je to pro dobrou vęc', âíkali.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Vím, že se teë všichni musíme starat sami o sebe, ještę když farmáâi pâestali obchodovat.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Nękdy musím chodit spávat s prázdným žaludkem. Nezajímá je to. Seberou mi všechny ryby a já nemůžu nic dęlat.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //A pokud to tak půjde dál, nebudu mít co jíst.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Dej mi všechny tvé ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Možná bych ti mohl pomoci.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mluvil jsi o tom s paladiny?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Mluvil jsi o tom s paladiny?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(smęje se) To si dęláš srandu? Myslíš, že je zajímá, že nęjaký chudák jako já má problém s domobranou?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Dej mi všechny tvé ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(naštvanę) Vędęl jsem to. Další z tęch parchantů.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Ale myslím, že jdeš pozdę. Tvoji kámoši mi všechno vzali už včera.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Âekl bych, že bys męl radši odejít.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Možná bych ti mohl pomoci.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Nevím. Musel bys znát nękoho z domobrany, kdo se zná s paladiny ...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Paladinové moje ryby jen stęží vykoupí.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Uvidím, co se dá dęlat.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Rybáâ Farim má problémy s domobranou. Berou mu pâíliš mnoho ryb. Musím najít nękoho z domobrany, kdo má kontakt na paladiny a kdo mu pomůže."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Mám âešení tvého problému.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Mám âešení tvého problému.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Fakt? A jaké?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Trošku jsem to tady omrknul.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //A znám nękoho, kdo by mohl pomoci.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, důstojník paladinů, si vyslechne tvůj problém s domobranou.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //A myslíš, že může zajistit, aby mę domobrana už neotravovala?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Pâesnę tak.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Paráda. Díky. Nemůžu ti toho moc dát. Ale počkej ...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Našel jsem tenhle zvláštní modrý kámen na ostrovę blízko khorinisu.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Nemyslím, že je to nęjak cenné, ale nękdo jako ty, by to mohl využít.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Můžeš mi âíct nęco o chybęjících lidech?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Can you tell me anything about the missing people?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Můj kamarád Wiliam se zapletl s podezâelými lidmi. A co se mu stalo?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Jednoho dne pâestal pracovat a od té doby jsem o nęm neslyšel.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Tvůj kamarád William zmizel?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Tvůj kamarád William zmizel?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Asi jo. Mohl z nęho být rybáâ, ale to by na sobę musel pracovat, ale to on ne - je trochu náladový.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Nikdy se nemęl zaplést s tęmi chlápky.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "O kom pâesnę mluvíš?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Jsem si jistý, že se znovu objeví.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Co s ním bylo pak?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kdy jsi je vidęl naposled?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Co s ním bylo pak?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William a ti hrdloâezové se zapletli do nęjaké špinavé práce.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Myslím, že ho to męlo pâivést na jejich stranu.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //O kom pâesnę mluvíš?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nevím kdo jsou ani co dęlají v Khorinisu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Vím jen, kde se setkali s Wiliamem.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Jen co jsem Wiliama poprvé vidęl, âekl jsem si, že je to rozený rybáâ.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Kde se pâesnę setkali?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Kde se pâesnę setkali?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Na druhé stranę pâístavu, na severu, je tam zátoka.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Dá se tam dostat jen lodí nabo plaváním.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Je tam pláž a malý rybáâský tábor. Tam jsem je vidęl.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Rybáâ Farim postrádá svého kamaráda Williama. Farim âíká, že William se setkával s nęjakými hrdloâezy v zátoce na severu pâístavu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Myslím, že jsem slyšel dost.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kdy jsi je vidęl naposled?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Pâed nękolika dny.

	Info_AddChoice	(DIA_Addon_Farim_William, "Nešel jenom nękam dál rybaâit?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Nešel jenom nękam dál rybaâit?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //To ne. Jeho loë zůstala v pâístavu.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Jsem si jistý, že se znovu objeví.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //To si nemyslím. Už je pryč pâíliš dlouho.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Bojím se, že jednoho dne z moâe vylovím jeho mrtvolu.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Myslím, že jsem slyšel dost.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Nedęlej si s tím starosti. Nemyslím si, že bys ho našel.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Takže, jak jdou obchody?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Takže, jak jdou obchody?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Ah. Nedęlej, že tę to nezajímá.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Už jsem zažil lepší časy. Pâíliš málo pro život a pâíliš mnoho pro smrt.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Jsi zpęt!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Slyšel jsi nęco o Wiliamovi?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Je mrtvý.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(vzdychne) Ano, to jsem čekal.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Díky, že jsi mi to pâišl âíct.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Půjdu do hospody a za jeho podíl na posledním úlovku se napiju - on by to tak chtęl ...
};






