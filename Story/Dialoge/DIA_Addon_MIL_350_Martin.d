///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //Tak ty jsi ten nový chlapík? Vítej mezi námi, bratâe "Kruhu".
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Bež a podívej se za Vatrasem. Možná na tebe budu mít čas pozdęji.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej, ty. Ty tu nemáš co pohledávat. Pouze paladinové a domobrana tam může.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"Co je tam k vidęní?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Co je tam k vidęní?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Stojíš na půdę královských paladinů.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Já zde velím a jsem zodpovędný za to, že se nic z paladinských vęcí neztratí. A ty tu nejsi vítán.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Tak drž své prsty radęji dál, jinak tę pâes nę klepnu.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"Nemůžeš mi prodat nęjaké paladinské vęci?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Nemůžeš mi prodat nęjaké paladinské vęci?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chceš nęco koupit? Udęláme to takto: Když mę odškodníš za potíže, které mi nastanou, pokud se znova nęco ztratí, pak možná budeme moci spolu obchodovat.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Je toho hodnę, co se ztratilo?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Důstojníci âíkají, že je vše v poâádku. Ne, nic nechybí.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Vidím.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"Rybáâ Farim má problém s domobranou. Frajírci ho okrádají.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Rybáâ Farim má problém s domobranou. Frajírci ho okrádají.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //A proč by mę to męlo zajímat?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Máš zde jistý vliv mezi paladiny.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim potâebuje tvou ochranu. Rád ti dá část svého úlovku jako odškodné.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Vím, co tím myslíš.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(sarkasticky) Ryby! Jako bych se nemęl o co starat.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Âekni mu, aă pâijde ke mnę. Chci pâesnę vędęt, jak to s tou domobranou bylo.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Podívám se na to.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Důstojník Martin to prošetâí."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Co mi nabídneš?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Co mi nabídneš?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Pojë se podívat blíž.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"Lares mę poslal. Âekl, že mi pomůžeš.";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Lares mę poslal. Âekl, že mi pomůžeš.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Opravdu? Tak to tu máme. Co bys ode mę chtęl?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chci se pâidat k domobranę.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(smęje se) Opravdu bys to chtęl? Obvykle nepâijímáme takové hlupáky jako jsi ty. Ne bez dobrého důvodu.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Hmmm musel bys prvnę ...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Nech hloupostí. Âekni mi, co musím udęlat, abys mę tam dostal.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(pâekvapenę) Ok. Poslouchej.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Být důstojníkem je peklo, to ti âíkám. Organizovat všechno tyhle bedny a pytle na tomto molu je špatné dost samo o sobę.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Ale kdykoliv si zajdu večer ke Kardifovi do hospody, nękdo pohýbe s bednami a když jsem ráno zpátky, nęco chybí.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(nevrle) Divné, paladinové nikdy nikoho nevypátrali.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(rozzlobenę) Kašlu na to. Nemůžu tu pâece zůstat celou noc jako nejaký idiot.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Nicménę ty ...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //A, beru to. Pâedpokládám, že tu budu strážit celou noc, zatímco ty budeš v hospodę odpočívat.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Ber nebo nech být.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Budu dohlížet na Martinovy bedny v noci. Jestliže chytím toho, kdo bere bedny, Martin mi pomůže pâidat se k domobranę."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Nespustím dnes večer oči z tvých dopravních beden.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Nespustím dnes večer oči z tvých dopravních beden.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(potęšenę) Výbornę.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //Jdu tedy ke Kardifovi do baru. A ne aby nęco chybęlo, jak se vrátím.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dobrá. Pâië večer a dohlížej na celé molo. Já budu u Kardifa v hospodę.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(weiter)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "Hledáš muže, který prodává zbranę banditům?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Hledáš muže, který prodává zbranę banditům?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //Âíká kdo?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Âíká Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Oh. Co o tom víš?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Ne mnoho, ale mohl bych zjistit více.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(uvędomęle) Uvidím, co âekneš ...
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Âekneš mi, co víš o tom dealerovi zbraní?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Âekneš mi, co víš o tom dealerovi zbraní?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Ok, poslouchej. Víme, že za tím stojí nękdo z Horní čtvrti.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Nękteré zbranę dokonce pocházejí ze zbrojnice domobrany.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale nevíme kdo se pâesnę za tím skrývá.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Kdybys męl dost odvahy zbouchat skupinu aspoŕ pęti banditů, pak bys možná zjistil více ...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Prodejce zbraní je podle Martina nękdo z Horní čtvrti."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "Co víš o banditech?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //Co víš o banditech?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Víme, že banditi se skrývají po cestę mezi farmáâi a męstem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //A také víme, že jim musela nedávno dojít dodávka zbraní.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Možná najdeme nęjakou stopu mezi bandity, která by nás dovedla k dealerovi zbraní.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Banditi se skrývají na cestę mezi farmáâi a pâístavním męstem. Možná u nich najdu nęjakou stopu vedoucí k dopadení dealera zbraní."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"O prodejci zbraní ...";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //O prodejci zbraní ...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Ukaž, co máš ...
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //Vezmi si tento kord od banditů. Je na nęm vyryto písmeno "F".
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //Tento prsten je od jednoho z banditů. Vypadá to na zámoâského obchodníka.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Tento seznam zbraní a ostatního zboží doručeného banditům jasnę ukazuje na Fernanda.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Navíc Fernando, obchodník v horní čtvrti, se pâiznal, že obchoduje s bandity.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando se pâiznal, že podporoval bandity zbranęmi.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Myslím, že je to jasné. Je to Fernando. Půjde do vęzení.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //Divné. Vždy vypadal jako občan Horní čtvrti.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Můžu tę ubezpečit, že neuvidí denní svętlo ještę hodnę dlouho.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Udęlal jsi to opravdu dobâe. Velmi dobâe.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras bude potęšen tęmito dobrými zprávami.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin mę ujistil, že Fernando dostane, co si zasluží. Męl bych o tom Vatrase informovat."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //Nęco dalšího?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To je vše.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //(Odmítavę) Velmi pękné, ale bez pádného důkazu nemůžu nic udęlat.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nechci ze sebe udęlat hlupáka pâed lordem Hagenem. Musíš najít víc důkazů.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nestačí. Může to být kdokoliv z Horní čtvrti.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Vypadá to, že budeme muset sledovat bandity a kradené zboží ještę trochu dál. Dokud nezjistíme, kdo za tím stojí.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Možná bys męl s Vatrasem promluvit znova.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Co to, znovu?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Byls povęâen zjistit, kdo stojí za dodávkama zbraní banditům. Tak mi pâines důkaz.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //A bude to muset být vážnę obviŕující důkaz, nebo ho nebudeme moci zatknout.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bedny zde stále jsou?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Bedny zde stále jsou?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(rozzlobenę) Ty zkurvysyne. Byl jsi povęâen hlídat bedny. Nyní chybí nęco dalšího.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(hlasitę) Půjdeš k skladišti na druhé stranę pâístavu a dostaneš toho hajzla, který mę okradl.
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Dnes večer se budeš dívat poâádnę, jak odejdu. Rozumęls?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Á, Á, smęje se jak jen může. Rád se budu dívat, jak zde stojíš po celý den, a zkoušíš udęlat poâádek v tomto svinstvu.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladinové rozvážející binec, jak deprimující.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Na nic nešahej nebo zavolám stráže, slyšels mę?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"Našel jsem toho zlodęje.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Našel jsem toho zlodęje.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //Je to Rangar, kdo rozebírá váš sklad.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //Konečnę, aspoŕ vím, na koho si mám počkat. Ten darebák. Ten dostane lekci, až ho dostanu do rukou.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Ale opravdu by mę zajímalo, proč paladinové nic nevidęli.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //A? Proč?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //Není to zâejmé. Ti blbci nám nemohou âíci nic o domobranę. Pâesto se jim divím.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Byla to ale dobrá práce, kámo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Kdyby bylo cokoliv, s čím bych ti mohl pomoci, jen dej vędęt.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"Ty víš, co chci.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Ty víš, co chci.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Ano, samozâejmę. Chceš se pâidat k domobranę, neníliž pravda?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Prokázal jsi dobâe své schopnosti.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //Oh, dobâe, udęláme to takto. Radši bych vędęl, zdali jsi na naší stranę, nebo na nęčí jiné.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //To je proč jsem ti pomáhal. Vezmi si tento doporučující dopis a ukaž ho Andremu, našemu velícímu paladinu.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Najdeš ho v kasárnách. Jsem si jist, že využije chlapa jako ty.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin mi dal doporučující list pro velícho paladina Andreho. Andre mę nyní pâijme k domobranę. Můžu ho nalézt v kasárnách."); 
};


