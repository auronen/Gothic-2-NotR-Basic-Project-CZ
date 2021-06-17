// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Hej, co se tam stalo?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Ztâískal jsem Franca.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //Tak? Dobrá, nyní je to TVŮJ úkol ujistit se, že ti hloupí osli dęlají svou práci každý den.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hej, nechci marnit svůj drahocený čas s lovci. Chci do tábora.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Tak jo, tys zabil Franca. Tím jsi ze sebe udęlal vůdce. Tak dęlej svou práci.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Dobâe, když jsem vůdce, tak si mohu vybrat další osobu, která vstoupí do tábora.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //A tak naâizuji, že * JÁ * jsem ta další.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(usmęvavę) Dobâe, nebylo to tak tęžké. Nepotâebujeme žádnou další osobu, tak se žádná další osoba pâijímat nebude.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus by mohl poslat nového vůdce lovcům, tak ten by uvolnil místo mę.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(usmęvavę) Nevzdáváš se, co? Okay, pak se dostaneš do tábora.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus se postará o nového vůdce a pošle nám ho.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Tak na co čekáš? A nezapomeŕ si krumpáč.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hej, kdo jsi? Neuvędomuji si, že by nękdo jako ty męl povolení vstoupit.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Franco mę poslal. Chce vędęt, zda-li nepotâebujete nové pracovníky.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Á, právę jednoho potâebujeme. Právę včera jeden z chlápků zdechl.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Ten idiot se dostal do problémů s Estebanem.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Kdo je Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //On je šéf tábora. On rozhoduje o tom, kdo může vstoupit do dolu.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Tak, âekni Francovi, že potâebujeme nové pracovníky. Chápeš?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus žádá nové muže pro tábor. To bude Franca zajímat.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? THORUS?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Nikdy jsem o nęm neslyšel...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Stůj! Nemůžeš jít dovnitâ - tak vypadni!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? THORUS?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Ano. THORUS. Ten, kdo se ptal po nových dęlnících.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Muž, který rozhoduje, zda-li může nový muž vejít z močálu do tábora.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Nechceš mi nyní âíct, že už ho znáš už z dâívęjška?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Dobâe ... Ano ...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Podívej ... KAŽDÝ zná Thoruse.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Nicménę, to ti nepomůže ke vstupu. A já tu nejsem na pâedávání jakýchkoliv zpráv.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? Nikdy jsem o nęm neslyšel ...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Ale kámo, ty ho neznáš? Býval velitelem stráží ve Starém táboâe.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Je to muž, kteréhu každý vęâí a respektuje ho.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //On je jedinný, kdo žádal nové lidi.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Poznáš ho, jestli budeš žít dost dlouho.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Ještę o krok blíž a bude to tvůj poslední.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Nękteâí lidé se nikdy nepoučí ...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Jsem nový chlápek.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Jsem nový chlápek.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Nezkoušej to na mę. Pouze Franco rozhoduje o tom, kdo vstoupí do tábora.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Franco mę poslal ...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Franco mę poslal ...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //On ne. Tak buë vypadneš nebo ti zpâelámu kosti ...
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "A? Vše v poâádku?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //A? Vše v poâádku?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Vše v poâádku - pokud vím, nikdo nemá povoleno jít dovnitâ.
	
	AI_StopProcessInfos (self);
};


