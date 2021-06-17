//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "Jak jde obchod?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak jde obchod?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Hůâ od doby, co byla otevâena krypta ...
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Raven už nepotâebuje otroky. Teë kutají zlato na Bloodwynův pâíkaz.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kopáči si dávají oraz. (mumlá) Kopáči, kteâí mají pauzu nejsou dobâí pro můj obchod.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty prodává různé vęci.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "Bloodwyn? Má tady nęjaký úkol?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? Má tady nęjaký úkol?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Kontroluje důl. Ale je tady dole jen săeží. Vętšinu času je s Ravenem v chrámu.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co to "tęžce" znamená doopravdy?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Naposled jsem ho vidęl, když opouštęl kryptu ...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(uvažuje) Ne, počkej! Myslím, že to bylo když posílal otroky dolů, aby kopali zlato.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Narozdíl od Ravena, ON je velmi zaujat zlatem.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "O jaké kryptę mluvíš?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//O jaké kryptę mluvíš?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Je to prokletá krypta! Její ochránci zabili mnoho mužů!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Ochránci? Mluvíš o kamenných stvoâeních? Plochý a kulatý obličej?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Ano! Nesčetnękrát se objevili z hluboké skály.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Vędęl jsem, že otevâení krypty není dobrý nápad, už od začátku.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Ale Raven byl posedlý nápadem tady dolovat. A jen co byla krypta odkryta, on a jeho strážce do ní vstoupili.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "Proč chtęl Raven do té krypty?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Proč chtęl Raven do té krypty?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(uvažuje) Hmm ... jsi hodnę nosatý. Podobáš se chlápkovi, kterého jsem znal.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Byl stejnę nosatý jak ty. A jednoho dne se obrátil k osudu.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Nezakecávej to. Co se stalo v kryptę?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//Dobrá ... uhm ... Je trochu sucho a mę by nevadilo nęco k pití ...
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hej Scatty, NE TEĎ. Tohle je důležité, takže, co tam dole Raven dęlal?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Dobrá, dobrá. (dýchá) On ... pâivolal ... nęco. Používal slova jazyka, který neznęl známę.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Oslŕující svętlo se uvolnilo z vnitâku krypty a potom jsem slyšel výkâik. Byl to šokující, démonický výkâik.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//A potom?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//To je vše, co jsem vidęl. Bloodwyn vyšel z krypty a âekl mi, abych odešel. A to jsem také udęlal.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Raven a jeho chlapi opustili chrám krátce potom. A potom už tady dole nebyl vůbec.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "Chtęl by jsi nęco k pití?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Chtęl by jsi nęco k pití?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Určitę jsem nemyslel pivo. To je velice vzácné v tomhle táboâe.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Možná má Lucia stále nękde láhev ...
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Na zdraví! (dát pivo)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Na zdraví!
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Oh, tohle chutná skvęle. Díky, chlape, jseš můj hrdina.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Získat krumpáč a bušit zlaté mince ... Každý to může dęlat.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Nicménę, pokud do toho bušíš mince se roztâíští na mnoho malých nugetů. Proto zkušení lidé mohou dolovat.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Můžu ti dát pár informací, pokud jsi dostatęčnę zkušený.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Naučit se dolovat zlato (Stojí: 1 VB - 10 procent)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Co víš o dolování zlata?
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Musíš si být vędom, že zlato není jako ruda. Je jemné jako máslo. Pokud udeâíš moc silnę, rozpadne se na malé kousky.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Každý kopáč má své vlastní triky, jak ze skály získat nęjaké pękné nugety.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//A právę tyto triky odlišují dobré a špatné kopáče.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//Také, je to všechno o praxi. Budeš se zlepšovat, pokud tady budeš chvíly pracovat.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn je mrtvý.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn je mrtvý.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hm, normálnę nepâipíjím na takovéhle zprávy - nicménę, Bloodwyn byl náhodou jeden z chlapů, kteâí jsou lepší mrtví.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


