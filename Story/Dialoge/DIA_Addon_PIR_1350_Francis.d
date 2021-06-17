// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "To je tvá chatrč?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //To je tvá chatrč?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Ne, patâí Gregovi.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Musím se dostat dovnitâ do Gregovy chatrče.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Musím se dostat dovnitâ do Gregovy chatrče.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Nikdy!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg tu není. Zamkl jsem dveâe a ujistil se, že nikdo nedostal nápad se tam vloupat.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Odjeë nebo nedopadneš dobâe.
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg je tvůj šéf?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg je tvůj šéf?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Nyní tu není, ale znám ho!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Každý námoâník, jak âíkám, každý suchozemec na tomto ostrovę zná strašného kapitána Grega!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(nadâazenę) Svęâil mi zde velení!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Jsem zodpovędný za tento tábor, který mi byl svęâen!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Nękteâí hoši si myslí, že si mohou dęlat, co chtęjí, když tu kapitán Greg není.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Ale budou velice pâekvapeni, až se Greg vrátí.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Âeknu mu vše, co se zde stalo, slyšíš?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //A taky vęci, jako kdo chce vstoupit do jeho chatrče.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Tak radši vypadni, jestli je ti život milý.
};
// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Dej mi klíč od Gregovy chatrče!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Dej mi klíč od Gregovy chatrče!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Musíš si dęlat legraci!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Popâemýšlím o tom...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dám ti 2000 zlata!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dám ti 1000 zlata!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Dám ti 1000 zlata!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //To je trochu málo za zradu kapitána, nemyslíš?
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Dávej si víc pozor, co âíkáš! Jinak bych ti byl nucen dát asi poâádný výprask!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Dám ti 2000 zlata!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Chlape, ty po mnę žádáš vzpouru
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(k sobę) Ale když se nad tím zamyslím ...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Ah, ruku na to, nikdo na to nepâijde.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Tu je klíč!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Ale rychle, dokud se Greg nevrátí! A ani slovo ostatním, slyšíš?!
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(smęje se) Ha! Ty nemáš tolik penęz!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "Dobâe, podíváme se, jak na tom jsi.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //Dobâe, podíváme se, jak na tom jsi.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(pronikavę) Co? Já jsem tady kapitán!
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Já tę naučím způsobům, ty suchozemská kryso!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "Našel jsem tvoje malé doupę...";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Našel jsem tvoje malé doupę. Tvůj poklad a výplatní listinu. To je tvá knížečka, nebo ne?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Er ... Nikdy jsem tu knížku nevidęl ...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //A ... er ... a kdyby to bylo moje ...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //A ty si skutečnę myslíš, že hoši uvęâí nęjakému zažloutlému kusu papíru?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Ty jsi je ošidil o část jejich podílu!
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Er ... Počkej ...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(tiše) Nechtęls klíč od Gregovy chatrče ...
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Dám ti klíč ke Gregovę chatrči!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //There's alot of valuable things in there ...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(rozrušenę) Ale dáš mi tu knihu a budeš o tom mlčet, jasné?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Jen neudęlej nic hloupého!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Tady máš 2000 zlata!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //A 500 navíc.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Tady máš 500 zlata!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(naštvanę) A nyní mę nech ...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tento klíč bude jednoduché.)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(nahlas) Protože by mę Greg  jinak nechal kácet stromy do posedního zbylého keâíčku.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Ztraă se!
	AI_StopProcessInfos (self);
};


