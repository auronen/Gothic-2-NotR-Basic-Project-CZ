// ************************************************************
//             EXIT
// ************************************************************
INSTANCE DIA_1061_Wache_EXIT   (C_INFO)
{
 npc         = BDT_1061_Wache;
 nr          = 999;
 condition   = DIA_1061_Wache_EXIT_Condition;
 information = DIA_1061_Wache_EXIT_Info;
 permanent   = TRUE;
 description = DIALOG_ENDE;
};
FUNC INT DIA_1061_Wache_EXIT_Condition()
{
 return TRUE;
};
FUNC VOID DIA_1061_Wache_EXIT_Info()
{
 AI_StopProcessInfos (self);
};
// ************************************************************
//       Hallo
// ************************************************************
INSTANCE DIA_1061_Wache_Hallo   (C_INFO)
{
 npc         = BDT_1061_Wache;
 nr          = 1;
 condition   = DIA_1061_Wache_Hallo_Condition;
 information = DIA_1061_Wache_Hallo_Info;
 permanent   = FALSE;
 important  = TRUE;
};
FUNC INT DIA_1061_Wache_Hallo_Condition()
{
 return TRUE;
};
FUNC VOID DIA_1061_Wache_Hallo_Info()
{
 AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//Stůj - tudy nemůžeš projít.
 AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Chtęl bych mluvit s vaším šéfem.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//(ironicky) Ó, já vím, ty chceš mluvit s mým šéfem. Tak to tę SAMOZÂEJMĘ nechám projít.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//(smrtelnę vážnę) Ale jen v tom pâípadę, že znáš jeho jméno. Protože jestli ne, tak tę budu muset zabít! Jasný?

 Info_ClearChoices (DIA_1061_Wache_Hallo);
 Info_AddChoice (DIA_1061_Wache_Hallo,"Lee",DIA_1061_Wache_Hallo_Lee);
 if (Bdt13_Dexter_verraten == TRUE)
 || (Ranger_SCKnowsDexter == TRUE)//ADDON
 {
  Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter",DIA_1061_Wache_Hallo_Dexter);
 };
 Info_AddChoice (DIA_1061_Wache_Hallo,"Diego",DIA_1061_Wache_Hallo_Diego);
 Info_AddChoice (DIA_1061_Wache_Hallo,"Nemám tušení.",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
 AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//Fajn, co na to mám âíct? Právę jsi propadl životem, chlape!

 Info_ClearChoices (DIA_1061_Wache_Hallo);
 AI_StopProcessInfos (self);
 B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
 AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//Dobrá... Hádám, že šéfa znáš. Fajn, dovolím ti projít. Ale varuju tę.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//Kâivej pohyb a nedostaneš se odsud vcelku!
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//Takže se zhluboka nadechni a nech tady všechny svoje zbranę. Dextera nejdeš v domę.

 Knows_Dexter = TRUE;
 BanditGuard.aivar[AIV_PASSGATE] = TRUE;
 Info_ClearChoices (DIA_1061_Wache_Hallo);
 AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
 AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//Správnę!
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//Ne, to byl jen žert. Nemáš ani ponętí, kdo je můj šéf.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//Takže nevidím žádnej důvod, proč bych tę męl nechat naživu.

 Info_ClearChoices (DIA_1061_Wache_Hallo);
 AI_StopProcessInfos (self);
 B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
 AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Nemám tušení.
 AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//Tak to seš mrtvej ignorant.

 Info_ClearChoices (DIA_1061_Wache_Hallo);
 AI_StopProcessInfos (self);
 B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
// ************************************************************
//      Perm
//**************************************
INSTANCE DIA_1061_Wache_Perm   (C_INFO)
{
 npc         = BDT_1061_Wache;
 nr          = 2;
 condition   = DIA_1061_Wache_Perm_Condition;
 information = DIA_1061_Wache_Perm_Info;
 permanent   = TRUE;
 important  = TRUE;
};
FUNC INT DIA_1061_Wache_Perm_Condition()
{
 if Npc_IsInState (self, ZS_Talk)
 && (Knows_Dexter == TRUE)
 {
  return TRUE;
 };
};
FUNC VOID DIA_1061_Wache_Perm_Info()
{
 AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Pamatuj, buë v pohodę a dostaneš se odsud živý.
 AI_StopProcessInfos (self);
};

