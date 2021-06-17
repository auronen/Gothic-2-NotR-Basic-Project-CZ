//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jestli hledáš férového obchodníka, tak jsi ho právę našel.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Moje chatrč stojí pâesnę za Estebanovous. Takže, pokud budeš nęco potâebovat, zastav se.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk obchoduje se všemi druhy zbraní.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachfüllen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachfüllen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Pozornę poslouchej, nemám s tím nic společného, jasný?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(nevinnę) Mám své vlastní problémy, jsem jen obęă.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Proč?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Za svoji poslední dodávku jsem zaplatil kopu zlata.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale ta nikdy nedorazila! Nęjaká svinę ji musela sebrat!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(zhnusenę) Nękdo mi ji ukradl - asi od jednoho z mojich chlapů!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Co to bylo za dodávku?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to bylo za dodávku?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Balíček plný paklíčů. Nękdo by je mohl stâelit pirátům.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale ten chlápek se jí zmocnil.(naštvaný) Se vším zlatem co jsem mu dal.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten zkurvysyn se schovává nękde v bažinę ...
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Nęjaký chlápek jménem Juan byl povęâen obchodovat s bandity. Âíká se, že se ukryl nękde v bažinách.");
	B_LogEntry (Topic_Addon_Fisk,"Juan ukradl Fiskovu dodávku (balíček s paklíči). Schovává se nękde v bažinę.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Je mrtvý.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobrý, už nemůže dále podvádęt!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Poâád žije ...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Ty jsi tu svini nechal žít?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nebyl sám ...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Co už - zlikviduju i ty chlápky co jsou s ním ...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //Pokud jde o tebe ...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Mám dobré styky s Hunem.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Zajistím, abys dostal zbranę velmi levnę.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Podívej, jednou jsem dostal tenhle kámen od Corrista.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Je to moje jediná vęc, kterou jsem zachránil po úniku z bariéry. Myslím, že se ti bude hodit více než mę.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //A ještę navíc ti dám jednu z mých zbraní.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(podivínsky) Podrazíš mę a já podrazím tebe - to platí poâád.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mám tvůj balíček.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mám tvůj balíček.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(štastnę) Fakt! (podezâívavę) A co Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "Otevâel jsem tvůj balíček!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otevâel jsem tvůj balíček!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(smęje se) To se dalo čekat! Nemohl ses dočkat, že?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Máš aspoŕ ty paklíče?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A co je důležitęjší - co se stalo s Juanem?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Tady máš tucet paklíčů ...";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Tady máš tucet paklíčů ...

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Perfektní. Kdo si počká, ten se dočká.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //To není tucet! (chytâe) Nechceš jen zboží pâenášet, co?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan pracoval pro Estebana!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracoval pro Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(ohromenę) Cože?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nehraj si se mnou! Vędęl jsi to!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(s jistotou) Dobâe. Máš pravdu. Doufám, že ale chápeš, proč jsem ti to neâekl.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Všichni v tomhle táboâe ví, že dęláš pro Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Nechci se to doho moc míchat jenom kvůli tomu, že ty chceš ten svůj červený kámen.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Já nedęlám pro Estebana ...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nevęâím ti.",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Tomu rozumím!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Tomu rozumím!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Dobâe! Teë zavâi hubu! Jinak nás nękdo uslyší.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nevęâím ti.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Vęâ si čemu chceš! Ale dám ti radu - pokud bys chtęl o mę Estebanovi navykládat nęjaké lži, tak tę nakopu!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Já nedęlám pro Estebana ...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Aha? Tak ty bys chtęl toho blba ošidit?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Potom ti poradím - nedęlej to.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Pokud jde o Estebana, nemůžeš nikomu vęâit - jenom sobę, chápeš?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Ale teë už dost tęch âečí - nękdo nás uslyší!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "TY jsi za tou vraždou.";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//TY jsi za tou vraždou.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Ano. Esteban je mi trnem v oku.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Žádného z banditů, kteâí pro mę dęlají, nepustí do dolu. Ujistíl se, že VŠICHNI dęlají pro nęho - jen pro nęho.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Takže si může vzít provizi z každého obchodu a tak může ovládat celý tábor.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"A co chceš dęlat?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chceš na jeho místo?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Mohl bych tę vydat Estebanovi ...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Chceš na jeho místo?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Ne, já jsem jen obchodník - jen nechci, aby se mi nękdo míchal do âemesla.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Mohl bych tę vydat Estebanovi ...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//A pak? A co by bylo potom? Ty fakt vęâíš, že ti dá, co chceš?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomeŕ na to - mám lepší nápad.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co cheš dęlat?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Zbavíme se Estebana. To znamená, že ho zabiješ a nastoupíš na jeho místo.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Ale jak, má kolem sebe ty stráže, nemám šanci.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Proto je musíme nęjak odlákat. A odlákáme je pravdou.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jakou pravdou?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Udęlal jsi svou práci. Víš, že já stojím za tou vraždou.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Âekni to Estebanovi a on pošle stráže, aby mę zabily. Budu je čekat.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Až budou pryč, můžeš si to s tím zkurvysynem vyâídit a já se postarám o stráže.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban je mrtvý. Budu se dál vęnovat své práci ...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Tady, to je pro tebe ...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk stojí za tou vraždou na Estebana.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban byl zabit.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban byl zabit.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Na to jsem čekal vęčnost.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Myslím, že máš ještę udęlat dost práce a já taky.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Pokud bys nęco potâeboval, víš, kde mę najít.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

