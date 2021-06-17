FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Co pro tebe mohu udęlat? Hledáš duchovní útęchu?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Chceš odeslat modlitbu našemu Pánu Innosovi, nebo darovat kostelu nęjaké peníze?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Potâeboval bych si promluvit s paladiny...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Potâeboval bych si promluvit s paladiny. Můžeš mę k nim nęjak dostat?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//No, budeš potâebovat povolení ke vstupu do horní části męsta. To však mají jen občané męsta a męstská stráž.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//A pochopitelnę my, ohniví mágové.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Jak bych se mohl stát ohnivým mágem?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Musíš se pâipojit k našemu âádu jako novic. Až budeš sloužit určitý čas, možná budeš pâijat do âad mágů.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Tahle cesta je ovšem dlouhá a plná práce a studia.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "Pâišel jsem si pro tvé požehnání!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Pâišel jsem si pro tvé požehnání!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //To je dobâe, to je dobâe - v tom pâípadę bys jistę chtęl pâispęt nęjakým tím zlaăákem ve prospęch svaté církve Innosovy, že?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //No, ve skutečnosti bych rád dostal tvé požehnání, abych se mohl zapsat jako učedník v dolní části męsta.
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ale já už ti své požehnání dal, můj synu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Nechă tę Innos doprovází, můj synu!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ale můj synu! Bez pâimęâeného daru církvi ti požehnání dát nemohu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Jak jinak bych si mohl být jistý tvými dobrými úmysly?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "Takže jak vysoký dar se tady vętšinou dává?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Takže jak vysoký dar se tady vętšinou dává?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//No, to záleží na tom, jak velký majetek máš. Nech mę se podívat, kolik u sebe máš.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(nahlíží do męšce) Mmmmh hmmm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Hm, jsi ubohá duše, že? Nech si to málo, co máš.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, mág ohnę, mi nechtęl požehnat. Nejspíš mu budu muset nejdâív poskytnout nęjaké zlato jako milodar.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//No, nemáš mnoho, ale ani nejsi chudý. 10 zlatých pro Innose - žijeme skromnę.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Máš víc než 50 zlatých. Daruj Innosovi 25 a dostaneš jeho požehnání.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Máš víc než sto zlatých - Pán âíká, že když máš, męl bys dát.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//Církev pâijímá tvůj štędrý dar.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Žehnám ti ve jménu Innosovę. On je svętlo a spravedlnost.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, mág ohnę, mi dal své požehnání.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "Odkud jsi pâišel?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Odkud jsi pâišel?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Pâicházím z kláštera mágů, který leží v horách.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//U nás je vítán každý, jehož srdce je čisté a cítí potâebu sloužit našemu všemocnému Pánu Innosovi.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Âekni mi nęco o Innosovi.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Âekni mi nęco o Innosovi.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, náš všemocný pán, je svętlo a oheŕ.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Rozhodl se, že lidé budou jeho nástrojem, a dal jim magii a zákony.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Jednáme jeho jménem. Vykonáváme spravedlnost dle jeho vůle a kážeme jeho slovo.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Povęz mi o klášteâe.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Povęz mi o klášteâe.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Učíme naše studenty všechny formy magie. Ale umęní ohnivých mágů spočívá i v nęčem jiném než jen v tomhle.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Jsme též zbęhlí v umęní alchymie a ve vytváâení mocných run.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//Také dęláme skvęlé víno.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "Co dęláš ve męstę?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Co dęláš ve męstę?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Vedu jednání s paladiny a jsem nápomocen občanům radou a můžu tu tam ztratit slovo.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Obzvláštę v takovýchto tęžkých dobách je naší povinností být lidu ku pomoci a starat se o chudé.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"Slyšel jsem nęco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //Slyšel jsem nęco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Taktak. Tos mohl slyšet pouze od mága vody Vatrase.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Jaký je problém?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Cenná soška byla poslána do kláštera z pevniny. Tys ji nikdy nedonesl do kláštera.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Byla loë vylodęna?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(vyveden z míry) Ne. Pâistála bezpečnę v Khorinisu a bezpečnę jsem ji vyzvedl.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Nicménę skončila v rukou nęjakých goblinů, když jsem ji nesl do kláštera.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(nevrle) Nedívej se na mę takto. My mágové také nejsme neomylní.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Âíkáš, že ji nyní mají goblini?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Kde jsi tu sošku ztratil?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Nezkoušels dostat tu sošku zpęt?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Nezkoušels dostat tu sošku zpátky?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Samozâejmę! Prozkoumal jsem vstup do jeskynę, ale bez úspęchu.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Âíkáš, že ji nyní mají goblini?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Vzali ji a zmizeli s ní kdesi v kâoví.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Už jsem ji znovu nevidęl. Mohli se odplazit do nęjaké díry.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Kde jsi tu sošku ztratil?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Blízko Orlanovy hospody. Je to na cestę do kláštera.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Slyšel jsem dost. Najdu to pro tebe.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Orlanova hospoda? Kde je to?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //Orlanova hospoda? Kde je to?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Vyjdeš tady tou branoua a půjdeš dokud neuvidíš osamęlý barák.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //To je Orlanova hospoda. 'U mrtvé harpyje'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Slyšel jsem už dost. Najdu tu sošku.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Aă tę Innos vede a odvrátí od tebe všechna nebezpečí, která na tebe číhají za tęmito vraty.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron byl okraden nęjakými gobliny. Od té doby postrádá cennou sošku, která nęco pro klášter znamenala. Daron vęâí, že goblini se skrývají nedaleko hospody 'U mrtvé harpyje'."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"Našel jsem tvou sošku.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Našel jsem tvou sošku.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Díky Innosovi!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Co s tím budeš dęlat nyní?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Pâineslo mi to pouze neštęstí.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Dones to do kláštera, synu.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //(Uznale) Můžeš být vpuštęn dovnitâ jestli zasvętíš zbytek svého života klášteru.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Ale jsem si jist, když jsi âádnę splnil MŮJ požadavek, jsi už pâipraven, neníliž pravda?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Innos s tebou, synu!
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"Donesl jsem tu sošku do kláštera, nyní můžeš v klidu odpočívat.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Donesl jsem tu sošku do kláštera, nyní můžeš v klidu odpočívat.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Konečnę dobrá zpráva. Aă tę Innos ochraŕuje.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Pâijmi toto jako malou odmęnu, synu.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "Já jsem chudý!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//Já jsem chudý!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//Vida, jsi bez penęz. Žádný div, v takovéto dobę. Vezmi si tyhle zlaăáky, snad ti budou ku prospęchu.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Ale męl by ses pokusit najít si práci, peníze se k tobę pak jen pohrnou. A pak bys mohl obdarovat Innosovu církev, stejnę jako ona obdarovala tebe.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "Rád bych vęnoval nęjaký dar.";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Rád bych vęnoval nęjaký dar.
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ale nemám dost zlata... (ZPĘT)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 zlatých)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 zlatých)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 zlatých)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//Celkem jsi mi daroval více než 1000 zlatých.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//Požehnání Pána Innose bude neustále s tebou.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Ale nepâinesl jsem dost penęz.
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //To nevadí, můj synu. Můžeš dát pozdęji, kolik jen budeš chtít.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Žehnám ti ve jménu Innosovę. On je svętlo a spravedlnost.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, mág ohnę, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Svůj dar můžeš dát kdykoliv pozdęji, až u sebe budeš mít dost penęz.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innosi, jsi svętlo, jež záâí na cestu spravedlivých.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//Tvým jménem žehnám tomuto muži. Nechă na nęj záâí tvé svętlo.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, mág ohnę, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Pán âíká - chceš-li se modlit, otevâi svou duši. A chceš-li vęnovat dar, pâines jej s sebou.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos, požehnej tomuto muži. Nechă na nęj záâí tvé svętlo.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Dej mu sílu chovat se spravedlivę.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, mág ohnę, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Pokud bys chtęl darovat tolik penęz, męl bys je s sebou také pâinést.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};










