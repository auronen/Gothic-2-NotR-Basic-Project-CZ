//---------------------------------------------------------------------
//	Item Werte
//---------------------------------------------------------------------
const int 	Value_Goldnugget 			=  18;
const int	Value_WhitePearl			= 120;	
const int	Value_Addon_Joint_01		=  60;	
//---------------------------------------------------------------------
//	Goldbrocken
//---------------------------------------------------------------------
INSTANCE ItMi_GoldNugget_Addon(C_Item)
{
	name 		=	"Zlatý nugét";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	Value_Goldnugget;

	visual 		=	"ItMi_GoldNugget_01.3ds";
	material 	=	MAT_STONE;

	description	= 	name;
	
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
	INV_ZBIAS	= INVCAM_ENTF_MISC2_STANDARD;
	
};
//---------------------------------------------------------------------
//	Weiße Perle
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_WhitePearl (C_Item)
{
	name 				=	"Perla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WhitePearl;

	visual 				=	"ItMi_WhitePearl_01.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS			= INVCAM_ENTF_MISC_STANDARD;
};
//---------------------------------------------------------------------
//	Grüner Novize
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_Joint_01(C_Item)
{
	name 				=	"Zelený novic";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Addon_Joint_01;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Addon_Joint_01;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
var int FirstJoint;
func void Use_Addon_Joint_01()
{
	if (Npc_IsPlayer (self))
	{
		if (FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_GivePlayerXP (5); 
		};
		Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
	};
};

//****************************************************************************
//				Baltrams Lieferung von Akil
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_BaltramPaket(C_Item)
{
	name 				=	"Beltramova zásilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Tęžký balík";
	TEXT[3]				=	"plný dobrých vęcí";
	TEXT[4]				=	"od farmáâe Akila";
	
};

//****************************************************************************
//				Baltrams Lieferung für Skip
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_Packet_Baltram4Skip_Addon (C_Item)
{
	name 				=	"Balík pro Skipa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Tento tęžký balík";
	TEXT[3]				=	"plný dobrých vęcí";
	TEXT[4]				=	"je určen pro piráta Skipa";
	
};
/******************************************************************************************/
INSTANCE ItMi_BromorsGeld_Addon (C_Item)
{
	name 				=	"Bromorův zlatý pohár";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_GoldChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Jméno 'Bromor' je vyryto";
	TEXT[3]				=	"ostrým pâedmętem";
	TEXT[4]				=	"na podstavci kalichu";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItSe_ADDON_CavalornsBeutel	(C_Item)
{
	name 				=	"Cavalornova kožená brašna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_CavalornsBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"Na tom visí štítek";
	TEXT[2]				= 	"se jménem 'Cavalorn'";
	TEXT[3]				= 	"a kus rudy se dá nalézt uvnitâ.";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_CavalornsBeutel ()
{
		CreateInvItems (hero, ItMi_Nugget ,1);
		Print (PRINT_FoundOreNugget);
		SC_OpenedCavalornsBeutel = TRUE;
		Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CavalornTheHut,"Uvnitâ Cavalornovy chatrče v Hornickém údolí jsem našel brašnu s kusem rudy uvnitâ. Cavalorn, ten straý darebák, ji tu určitę zapomnęl.");
};

//**************************************
//		Diverser Kleinkram
//**************************************
instance ItMi_Skull(C_Item)
{
	name 				=	"Lebka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	10;

	visual 				=	"DT_SKELETON_V01_HEAD.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
};

















//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// 				INEXTREMO ITEMS
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


INSTANCE ItMi_IECello(C_Item)
{
	name 				=	"Cedr";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Cello.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"CELLO";
	on_state[0]			= 	Use_Cello;
		
	description			= 	name;
};

func void Use_Cello()
{
	
};

INSTANCE ItMi_IECelloBow(C_Item)
{
	name 				=	"Cedrový luk";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_CelloBow.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDrum(C_Item)
{
	name 				=	"Buben";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Drum.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"PAUKE";
	on_state[0]			= 	Use_Drum;
	
	description			= 	name;
};

func void Use_Drum()
{
	
};

INSTANCE ItMi_IEDrumScheit(C_Item)
{
	name 				=	"Dâevo na buben";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Drumscheit.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DRUMSCHEIT";
	on_state[0]			= 	Use_Drumscheit;
	
	description			= 	name;
};

func void Use_Drumscheit()
{
	
};

INSTANCE ItMi_IEDrumStick(C_Item)
{
	name 				=	"Palička k bubnu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DrumStick.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDudelBlau(C_Item)
{
	name 				=	"Modrá dýmka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DudelBlau.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DUDEL";
	on_state[0]			= 	Use_Dudel;
	
	description			= 	name;
};

func void Use_Dudel()
{
	
};

INSTANCE ItMi_IEDudelGelb(C_Item)
{
	name 				=	"Žlutá dýmka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DudelGelb.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DUDEL";
	on_state[0]			= 	Use_Dudel;

	
	description			= 	name;
};



INSTANCE ItMi_IEHarfe(C_Item)
{
	name 				=	"Harfa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Harfe.3ds";
	
	material 			=	MAT_WOOD;

	scemeName			=	"HARFE";
	on_state[0]			= 	Use_Harfe;

	
	description			= 	name;
};

func void Use_Harfe()
{
	
};

INSTANCE ItMi_IELaute(C_Item)
{
	name 				=	"Loutna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Laute.3ds";
	
	material 			=	MAT_WOOD;

	scemeName			=	"IELAUTE";
	on_state[0]			= 	Use_Laute;

	description			= 	name;
};

func void Use_Laute()
{
};
//****************************************************************************
//				Lennar'S Dietrich Paket
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_Addon_Lennar_Paket(C_Item)
{
	name 				=	"Rachotící balík";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_LennarPaket;
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Uvnitâ je mnoho paklíčů,";
	TEXT[3]				=	"";
	TEXT[4]				=	"velmi mnoho.";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;
};
FUNC VOID Use_LennarPaket()
{
	B_PlayerFindItem (ItKE_lockpick,Lennar_picklock_amount);
	Snd_Play ("Geldbeutel");
	
	LennarPaket_Open = TRUE;
};
	
instance ItMi_Zeitspalt_Addon(C_Item)
{
	name 				=	"Černá ruda";

	mainflag 			=	ITEM_KAT_POTIONS;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Zeitspalt_Addon.3DS";
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_Zeitspalt_Addon;
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	name;
	TEXT[3]				= 	"Účinek neznámý";				

	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
};
	func void Use_Zeitspalt_Addon()
	{
		if (Npc_IsPlayer(self))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",  self, self, 0, 0, 0, FALSE);

			// FIXME_Nico: DropUnconscious (DropDead funktioniert bereits)
			//Npc_ChangeAttribute(self, ATR_MANA, -self.attribute[ATR_MANA]);
			//Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS] + 2);
			// Bereits laufenden Effekt beenden, damit die Kamera nicht ausrastet...
			// (beim Wechsel immer noch starker Morph-Effekt, aber nicht mehr andauernd)
			Wld_StopEffect("SLOW_MOTION");
			Wld_PlayEffect("SLOW_MOTION", self, self, 0, 0, 0, FALSE);
		};
	};
