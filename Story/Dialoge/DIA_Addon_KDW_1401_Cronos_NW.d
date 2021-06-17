///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Mohu tę vyrušit?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mohu tę vyrušit?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //To jsi TY? Nemyslel jsem, že tę ještę nękdy uvídím.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Máš odvahu tu zase ukazovat svůj ksicht. Byly časy, kdy jsme tę chtęli stáhnout z kůže.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Můžeš být rád, pár týdnů a každý chtęl aby byl zase klid.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Co to dęláš?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co to dęláš?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmatenę) Mým úkolem je zjistit více o strážcích chrámu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Mají kamenité tęlo, to dává smysl. Tyhle kamenní strážci mají neznámé, dá se âíct výjimečné schopnosti.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chvíli nehnutę stojí a ani se nestihneš nadechnout už se to âítí na tebe a ničí vše co mu pâijde do cesty, jsou nęčím posedlí.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Nepâišel jsem ještę na jejich âídící sílu, ale jedno je jisté. Jsou magického původu.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Povídej mi o kamenných strážcích.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Povídej mi o kamenných strážcích.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //Neâeknu ti mnoho. Naneštęstí jsme je zničili. Nyní jsou neškodní.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Sotva jsme sem pâišli a už jsme od nich dostávali.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Âídí je prazvlaštní síla, ale to není důležité. Mám strach, že na druhé stranę portálu na nás čeká ještę nęco horšího.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Tohle musí být cesta k jejich âídící síle, ale pozor vypadají jako obyčejné sochy - nedáš-li si pozor, můžou ti pęknę zatopit.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Nemęl bys pro mę nęjaký vybavení?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Nemęl bys pro mę nęjaký vybavení?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Proč ne? Když si to dobâe zapamatuji, nęco časem obstarám.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Tak co bys rád?

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
