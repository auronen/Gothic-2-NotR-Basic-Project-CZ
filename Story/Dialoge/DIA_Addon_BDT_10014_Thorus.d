//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Znáš pravidla. Bez červené kamenné desky se nikdo do dolu nedostane.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Zapomeŕ na důl - musím se dostat k Ravenovi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//I tak. Máme pravidla, která platí pro každého. I pro tebe.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Vraă se. Pokud se pokusíš vstoupit na horní místo bez povolení, stráže tę zabijí. TO jsou pravidla.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Pokud chceš mít námitky, promluv si s Estebanem. Je zodpovędný za tábor.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Je velmi důležité, abych se dostal k Ravenovi ...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Je velmi důležité, abych se dostal k Ravenovi ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Ano? Opravdu veâíš, že se k nęmu dostaneš?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jeho stráže mají rozkaz nikoho nevpouštęt. Budeš mrtev dâiv, než ho vůbec spatâíš.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak na to zapomeŕ.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven je vůdce banditů. Budu muset se k nęmu dostat podle pravidel, která tu jsou."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Vzpomínáš si na mę? Ze Starého tábora ...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Vzpomínáš si na mę? Ze Starého tábora ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Jsi jeden z vęzŕů? Možná jsi byl jeden z mých stráží. Ano? Dęlá to z nás spojence?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Ne, nedęlá.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Možná jsi človęk, který strhl bariéru - možná jsi zabil moje lidi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//Tak co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Tyhle dny jsou pryč.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chceš vstoupit? Získej červený kámen a už neplýtvej mým časem.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "No tak, pusă mę. Kvůli starým dobrým časům.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //No tak, pusă mę. Kvůli starým dobrým dnům.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Dobrá - nech mę to vysvętlit. Víš, proč jsem stále naživu?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Protože jsem byl vždy loajální ke svým lidem.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nemám rád to, co Raven dęlá. Ale budu se držet pravidel.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //A ty taky budeš!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(rozhodný) NE!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Mám pro tebe kamennou desku ...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Mám pro tebe kamennou desku ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Ta je špatná. Počítá se jen červená.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Mám červenou kamennou desku ...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mám červenou kamennou desku ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Dobrá.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Vyâídil jsi Estebana - to znamená, že ty teë dęláš jeho práci.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//V dole mají pár problému s důlními červy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Tâi kopáči jsou již po smrti. Je tvůj úkol opatâit nové.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A kdy se můžu konečnę dostat do toho zatraceného dolu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Udęlej svoji práci - potom můžeš dęlat, co chceš.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Protože jsem teë dostal Estebanův úkol, męl bych poslat tâi kopáče do dolu.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Poslal jsem tâi chlapy.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Poslal jsem tâi chlapy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//Dobrá. Dokud se tady o to starám já, tak můžeš dovnitâ.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Hej, a co tvoje brnęní? Kde dostanu takové?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hej, a co tvoje brnęní? Kde dostanu takové?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Nikde. Zbroj je určena pro Ravenovy stráže.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Nevęâím, že je tu možnost, pro nové žadatele. Ale konečné rozhodnutí není moje, ale spíše na Ravenovi.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "A co s vęzni?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//A co s vęzni?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Mmh, jejich práce skončila. Co já vím, tak teë dolují zlato.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A pokud se pokusí o útęk ... ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//... Bloodwyn za nimy pošle své stráže. Ale nevęâím, že jsou dost šílení, aby se pokusili o útęk.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Jestliže ...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Jestliže co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//... je nękdo jiný nebude podporovat. Ale vím, že nikdo není tak blbý aby to udęlal ... v každém pâípadę, dokud je tu Bloodvyn.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co máš vlastnę v úmyslu dęlat?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Co??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Teë jsi odstranil z cesty Bloodwyna. Ptám se sám sebe: Kdo další. Raven? Nebo já?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Bojíš se?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Nebojím se bitvy. Ale důsledku tvých činů.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Tenhle tábor je jediná vęc, co nám zbyla.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Nepracuje to sice tak aby to každého uspokojilo - Ale PRACUJE to.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A s každým chlapem, kterého zabiješ se naše kolonie tenčí.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Jsme bandité. Zadržovaní, nezákonní, opovrhovaní.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Kamkoli jdeme, loví nás, vęzní nás, zabíjí nás.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Není lepšího místa, než tohohle, a lepší čas než teë.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Tak co tedy chceš?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Tihle muži potâebují nękoho, kdo by je vedl. Kdo by to męl dęlat? Ty? Nękdo, kdo neustále chodí z místa na místo?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Dobrá - proč se ty nestaneš vůdcem v táboâe?";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dobrá - proč se ty nestaneš vůdcem v táboâe?
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Dobrá, ale co Raven?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven bude mít brzy jiné problémy. Postarám se o to.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//A postarej se, že vęzni budou moci odejít.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Oukej. Postarám se o všechny stráže venku.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn je mrtev a Thorus se postará, aby otroci mohli odejít."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teë si promluvím ještę jednou se 'Strážcem otroků', potom může Patrick a jeho hoši zmizet."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Poté co jsem promluvil se 'Strážcem otroků', Patrick a jeho chlapi můžou zmizet."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Dokázal jsem to. Raven je mrtev.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Dokázal jsem to. Raven je mrtev.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//Tím jsi zkrvavil Beliarovi nos.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Půjdeš teë?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje práce v tomhle údolí skončila. Můžu pár dní odpočívat.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(smęje se) Ano, jsi stále na cestę? (vážnę) Pâeji dobrou cestu.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kdo ví, možná na sebe znovu natrefíme.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kdo ví. Je tady mnoho bran a dveâí, kterými projdeš. A u nękteré z nich mę najdeš ...
	
	AI_StopProcessInfos (self);
	
};



