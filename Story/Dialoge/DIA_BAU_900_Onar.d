// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Kdo tę sem pustil?!
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Co dęláš na mé farmę?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Je tady na farmę všechno v poâádku?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Je tady na farmę všechno v poâádku?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //Nechápu, co se staráš. Nepatâíš na farmu!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Samozâejmę doufám, že ano! Za to pâece platím!!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Udęláš nejlíp, když zajdeš za Torlofem a požádáš o nęjakou práci.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Jo, jasnę. Jen si bęž lovit ty své draky.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Vy pokrytečtí bastardi z kláštera tu nejste vítáni!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Naše pohostinnost se na královská vojska nevztahuje.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Chci pro tebe pracovat!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Chci pro tebe pracovat!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Teë nepotâebuju žádného dalšího nádeníka.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Moji lidé se starají o všechno ostatní.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Nemáš tady co dęlat, tak mazej!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Chci se stát žoldnéâem!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Chci se stát žoldnéâem!
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Ty? Žoldnéâ? Nenech se vysmát! Pokud bys jako žoldák za nęco stál, musel by mi o tom Lee nęco âíct.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //A teë vypadni, pronto!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "Vzbouâili jste se proti męstu, nebo co jsem to zaslechl?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //Vzbouâili jste se proti męstu, nebo co jsem to zaslechl?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Teë mę poslouchej. Zdędil jsem tuhle farmu a tuhle půdu po svém otci.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //A on ji zase zdędil po SVÉM otci.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Nedovolím tęm nenažranejm královskejm pitomcům odjet s tím vším jen proto, aby nakrmili tu svojí armádu budižkničemů.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Ta válka se skâety nikdy neskončí. A kde budeme my? Mezi prvními, co padnou.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //Ne - radęji budu svou farmu bránit sám! Peníze, které takhle našetâím, mi zaplatí celou armádu.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Díky Bullcovi teë máte o pár ovcí míŕ.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Díky Bullcovi teë máte o pár ovcí míŕ.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //O čem to mluvíš? Kdo je Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Jeden ze žoldnéâů.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //Proč by mę to męlo zajímat? Jestli má zálusk na moje ovce, bude se muset zodpovídat Leeovi.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Tak co mę otravuješ s takovejma nepodstatnejma hloupostma?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "Pâišel jsem kvůli Sekobovu nájmu...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Pâišel jsem kvůli Sekobovu nájmu...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //A proč s tím ksakru lezeš za mnou? Dej ty peníze Torlofovi.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Proč si zatracenę myslíš, že to je TVOJE starost?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Chci se stát žoldnéâem. Výbęr nájemného je součástí zkoušky.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Ale Sekob nemá žádný peníze. Už jsem mu to nandal.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Âíká, že to je kvůli špatné úrodę.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(âve) Ty pitomče! Myslíš, že nechá ty peníze jen tak nękde povalovat? Nękam je ukryl!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Víš, kolik napršelo? Špatná úroda, tupče.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Bęž a vymlaă z nęj ty prachy.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Poslal mę Lee. Chci tady pracovat jako žoldnéâ!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Poslal mę Lee. Chci tady pracovat jako žoldnéâ!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Už mi o tom âekl.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Když jsem tę poprvé vidęl, nemęl jsem o tobę valné mínęní.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ale když si Lee myslí, že to zvládneš, jsem ochoten dát ti šanci.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //On je za tebe zodpovędný. Tak se koukej činit.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ale žádný blbosti! Nech farmáâe a služky na pokoji a hlavnę si nic nepâivlastŕuj, jasný?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //S čimkoli dalším se obraă na Leeho.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //Všechno, o čem se potâebujeme bavit, se týká tvého žoldu.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar mi dal svůj souhlas. Teë už mi nic nezabrání, abych se pâidal k žoldákům!");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Tak co je s tím žoldem?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Tak co je s tím žoldem?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Fajn, podívejme...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Nevypadáš moc k svętu.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Ty sis vážnę nebyl dvakrát, když Innos rozdával rozum. To se pozná podle tý vęci se Sekobem.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Už jsi tu nejednou způsobil problémy.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //A poâád mi za zády vyvádíš samý ptákoviny.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Nech mę hádat...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Co âikáš?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "Nęjaký námitky?", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "To není zrovna moc ...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Za den?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Za den?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //Cos myslel? Za týden? Vážnę ti to moc nepálí.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Tak zvedni ten svůj zadek a bęž pro ty peníze.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Nehodlám se o to za tebe postarat.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //To není zrovna moc.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Jasnę, jestli chceš, můžeš u mę pracovat zadarmo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Mimochodem, tohle je všechno, co dostaneš!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Svůj plat si mohu u Onara vyzvednout každý den.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //Nęjaký námitky?
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Taky si myslím. Teë zajdi za Leem.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Svůj plat si mohu u Onara vyzvednout každý den.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Dej mi můj žold!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Dej mi můj žold!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Platím žoldákům, ne drakobijcům.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Nestarej se to, co dostaneš za úkol!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Ptal jsem se Torlofa, jak ti to jde. A âíkal, že ti trvá vęčnost, než nęco udęláš.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Nebudu plýtvat penęzi na darmošlapy.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Teë budeš nękolik týdnů makat bez nároku na žold! To tę možná naučí.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Slyšel jsem, žes to zpackal. Nejdâív zajdi za Leem a dej tu vęc do poâádku.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Pâeskočilo ti snad?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Nejdâív budeš pár dní pracovat pro mę. Žold budeš dostávat vždycky následující den.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Kdes byl včera?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Kdes byl posledních pár dní?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Nikdy ses tu neukázal.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Kdo ví, kde ses flákal.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(zkroušenę) No dobrá. Tady je tvůj žold.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Co? Nedęlal jsi nic jiného, než že ses poflakoval kolem? Teda když jsi zrovna nespal?
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Za to ti platit nebudu!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria si myslí, že jsem nedostal dost.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria si myslí, že jsem nedostal dost.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Co?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Âíkala, že bys mi męl platit víc.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(remcá) Ta ženská taky musí do všeho strkat nos.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //Âekla ti kolik?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Ne.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Dobrá, počínaje pâíštím žoldem budeš dostávat o 10 zlatých víc.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ale ani o minci víc, jasný?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci koupit ovci!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Chci koupit ovci!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Tak co s tím lezeš sem? Vidíš tu snad nęjakou ovci?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Já...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Jestli chceš koupit ovci, zajdi na pastvinu, je napravo od mého domu.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Pepe ti nęjakou prodá.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Pepe je mrtvý, je mi líto.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Ó! V tom pâípadę... nech mi tu za ni 200 zlatých a vezmi si ji z pastviny sám.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady máš, 200 zlatých. Dej mi tu ovci.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Tady máš, 200 zlatých. Dej mi tu ovci.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Můžeš si ji z pastviny vzít sám.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Jedna z nich za tebou určitę půjde. Vętšina jich slyší na jméno Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Nemáš tolik zlata. Neplýtvej mým drahocenným časem.
	};
};
