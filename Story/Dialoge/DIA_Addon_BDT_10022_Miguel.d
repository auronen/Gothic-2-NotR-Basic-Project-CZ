//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Co tu dęláš?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu dęláš?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Hledáš nęco?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Rostliny - hledám rostliny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Obvykle hledám rostliny.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Vętšina z vęcí, které zde rostou, mohou být k nęčemu užitečné.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Mnoho rostlin má léčivý efekt a droga z bažin se dá kouâit.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Pracoval jsem pro alchymistu pâedtím, než mę hodili za bariéru.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Čím ses provinil?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Čím ses provinil?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Experimentoval jsem s lektvary, které mohou ovlivŕovat a manipulovat s myslí.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Ignaz, můj mistr, vypil jednou jeden z mých experimentů místo jeho večerního vína.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Dobâe, to ho poznamenalo ... trochu nerozumný čin. A od té doby je jeho mysl trochu ... Jakoby zamlžená.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//Mágové jsou zodpovędní za to, že mę hodili do vęzęŕské kolonie. Prý za výzkum "zakázaných vędomostí".
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Co mi můžeš âíci o táboâe?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co mi můžeš âíci o táboâe?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Ne mnoho. Nikdy jsem tam nebyl.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Pouze Ravenovi lidé jsou zde od začátku. Všichni ostatní pâišli pozdęji nebo stále čekají na najmutí nových dęlníků. Jako já.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Odkud jsi?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Odkud jsi?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Dobâe, hádám, že stejnę jako ty. Pâes moâe s piráty.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Údolí je kompletnę oddęleno od zbytku ostrova. Můžeš ho pouze dosáhnout ze strany od moâe.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(vędomę) Pâesnę.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Kdy obvykle potâebují nové pracovníky?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Kdy obvykle potâebují nové pracovníky?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //O, kdykoliv jim nękdo chybí.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Náhradník je potâeba, když je nękterý z dęlníků zabit důlním červem.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //A nękdy se chlapi pozabíjejí také mezi sebou. Ale není to tak zlé, jak to bývalo kdysi.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven to z nęjakého důvodu organizuje a stará se o to, aby nikdo nepracoval v dole ve stejnou dobu.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Nevím, jak to pâesnę funguje. Nikdy jsem tam nebyl.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "O Fortunovi ...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno se zdá "pomatený". Hádal bych, že nęjaký lektvar by mu mohl vrátit pamęă.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? To je jeden z Ravenových služebníků.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Dobrá, byl. Nyní je z nęj troska. A to je Ravenova chyba.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Raven? Nikdy jsem si o nęm moc nemyslel. Hmm, okay. Bohužel, nemohu namíchat lektvar zde v bažinách.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Mohl bych namíchat lektvar. V táboâe je alchymistická kolona. Pouze kdybych męl recept ...
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Buë opatrný. Namíchat tento lektvar je nebezpečné.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Tento lektvar je smrtící, pokud je nęco udęláno špatnę. Aă už v ingrediencích nebo v procesu.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Budu opatrný.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi dal recept na lektvarm tak můžu pomoci Fortunovi znovu získat pamęă. Męl bych namíchat lektvar pouze pokud budu mít plné vędomosti s všemi ingrediencemi. Jinak by mohl být smrtelný.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Co mę dál můžeš naučit?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Co mę dál můžeš naučit?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Nic. Pâišel jsem zde, abych si vydęlal nęjaké peníze. Vydęlávám si prodáváním rostlin dokud mę nepustí do tábora.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Nicménę, mohu ti poskytnout nękolik lektvarů, jestli potâebuješ.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"U Miguela si mohu kupovat rostliny a lektvary");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



