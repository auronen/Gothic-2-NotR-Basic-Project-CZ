// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_EXIT (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
FUNC INT DIA_Addon_Raven_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	
// ************************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_Hi (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 1;
	condition	= DIA_Addon_Raven_Hi_Condition;
	information	= DIA_Addon_Raven_Hi_Info;
	permanent	= FALSE;
	important	= TRUE;
};        
FUNC INT DIA_Addon_Raven_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Raven_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Á, podívejme se, kdo to sem pâišel.
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Můj pán mę varoval, že Innos na mę pošle svého oblíbence.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Neočekával jsem tę ale tak brzy.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Dobâe, nyní když jsi tu tak rychle, můžu tę ujistit, že zemâeš stejnę.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ty jsi ten, kdo zemâe.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Tys zaprodal svou duši Beliarovi!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//Ty jsi ten, kdo zemâe.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(posmęšnę) Ty pro mę nejsi hrozba. Já ovládám Beliarův meč.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Já povedu draky na pevninu. Společnę pak pâinesem temnotu na svęt lidí.
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Tys zaprodal svou duši Beliarovi!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Byl to ale dobrý obchod. Budu hlavním vůdcem jeho armád.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//A ty? Jaká je cena za TVOU duši?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojëme na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Dęlám pouze to, co musí být udęláno.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Dęlám pouze to, co musí být udęláno.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(usmęvavę) Poslouchej ho. Opravdový služebníku Innosův! (hlasitý smích)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojëme na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Jsi si jistý, že jsem Innosův služebník?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Jsi si jistý, že jsem Innosův služebník?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Co? O čem to mluvíš?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//A co když jsem služebník Adanose?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(posmęšnę) Nesmysl!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//Možná * JÁ * také sloužím Beliarovi - nebo pouze sám sobę.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(posmívá se) Dobâe, když je to tak, pak pro mę nejsi vůbec nepâítel.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojëme na to ...",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Okay, slyšel jsem dost. Pojëme na to ...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(posmívá se) Ty fakt chceš tak rychle zemâít? Okay, když to tak chceš ...
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Á, podívejme se, kdo to sem pâišel.
10 *NEU* DIA_Addon_Raven_Add_10_01 //Můj pán mę varoval, že Innos na mę pošle svého oblíbence.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Neočekával jsem tę ale tak brzy.
10 *NEU* DIA_Addon_Raven_Add_10_03 //(posmęšnę) Ty pro mę nejsi hrozba. Já ovládám Beliarův meč.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //Ty jsi ten, kdo zemâe.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(posmęšnę) Ty pro mę nejsi hrozba. Já ovládám Beliarův meč.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Já povedu draky na pevninu. Společnę pak pâinesem temnotu na svęt lidí.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Tys zaprodal svou duši Beliarovi!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Byl to ale dobrý obchod. Budu hlavním vůdcem jeho armád.
10 *NEU* DIA_Addon_Raven_Add_10_07 //A ty? Jaká je cena za TVOU duši?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Dęlám pouze to, co musí být udęláno.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(usmęvavę) Poslouchej ho. Opravdový služebníku Innosův! (hlasitý smích)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Jsi si jistý, že jsem Innosův služebník?
10 *NEU* DIA_Addon_Raven_Add_10_09 //Co? O čem to mluvíš?
15 *NEU* DIA_Addon_Raven_Add_15_04 //A co když jsem služebník Adanose?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(posmęšnę) Nesmysl!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Možná * JÁ * také sloužím Beliarovi - nebo pouze sám sobę.
10 *NEU* DIA_Addon_Raven_Add_10_11 //(posmívá se) Dobâe, když je to tak, pak pro mę nejsi vůbec nepâítel.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Okay, slyšel jsem dost. Pojëme na to ...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(posmívá se) Ty fakt chceš tak rychle zemâít? Okay, když to tak chceš ...
--------------

*/




 

