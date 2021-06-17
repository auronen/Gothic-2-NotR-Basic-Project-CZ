// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Jediný vęzeŕ dokázal zmęnit osud stovky ostatních.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Zaplatil za to však vysokou cenu.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Porazil Spáče, zničil Bariéru...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //... ale zatímco ostatní vęzni uprchli, on zůstal pod hromadou suti.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Byl jsem to já, kdo jej vyslal proti Spáči.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //A jsem to opęt já, kdo jej pâivádí zpęt.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Je slabý a mnohé zapomnęl.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ale je naživu...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Je zpátky!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(u ohnę) Samozâejmę, že žije. Cos myslel?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Doufejme, že...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(zachvęní zemę) Cítils to taky?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Co?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Zemę...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(užasle) Xardasi! Co...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(naâíkavę) Teë ne...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanaticky) Jsem pâipraven... zvol mę! Jo...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(pro sebe) Kde je?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(cituje) A človęk zabil bestii a ta sestoupila do Beliarovy âíše...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardasi! Co se vlastnę pâesnę stalo v Irdorathském chrámu?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //S Innosovou pomocí jsi porazit ztęlęsnęní zla.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //A já si vzal jeho moc.
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Byl to můj jediný cíl od chvíle, co jsem opustil Kruh ohnę.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Abych ho dosáhl, pomáhal jsem ti v cestę za tvým cílem.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Co mi bylo zapovęzeno v chrámu Spáče, se teë konečnę naplnilo.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar si vybral mę.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Tak to teë nasloucháš bohu zla?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Ne. Nesloužím Beliarovi o nic víc, než ty nasloucháš Innosovi!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Ani bohové sami nevędí, jaký osud je nám pâedurčen.
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //A já teprve teë začínám chápat, jaké cesty se mi začínají otevírat.
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Ale jedna vęc je jistá. Ještę se uvidíme...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(volá) Vyplouváme!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(dívá se do dálky, nęco vidí) Hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(huhŕá) A do hajzlu!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(kašle, dáví) - (různé)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (různé)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(táhlý smrtelný výkâik, 4 sekundy)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Zavâete bránu!!! (různé)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Zastavte je!!! (různé)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (různé)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Jsme pâetíženi. Męli bychom nęjaké zlato shodit pâes palubu.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Dej od toho zlata pracky pryč!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Hele, vážnę by bylo lepší, kdyby...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Už o tom nechci slyšet.
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Slyšel jsem, že se válka se skâety vyvíjí špatnę.
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //A?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Nejspíš nebude všechno to zlato kde utratit.
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //To zlato zůstane na palubę!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //K čemu nám bude zlato, když v první bouâi půjdeme ke dnu?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ale já žádnou bouâi nevidím.
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Zatím...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Klídek! Všechno dobâe dopadne!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(pâekvapenę) ... Lidé?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(arogantnę) Lidé jsou slabí.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(arogantnę) Pâíliš rychle padnou za obęă hnęvu zla.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //Zkoušeji manipulovat se silami, kterým nelze porozumęt, neâku-li je kontrolovat.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ti co jsou čistí a nezkažení ve své víâe, již začali bojovat proti nepâíteli.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Po pádu bariéry a zahnání Spáče se jen zvýšil beliarův hnęv!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //V písmu je stojí 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //'Mocný artefakt bude nalezen a vrácen zpęt na tento svęt,
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //když pán temnot povolá svého služebníka.'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //To je zde pâesnę psáno.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Služebník Beliára se již vydal na cestu
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //a pâi svém hledání znesvętil starobilou svatyni bohů.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Strážci tęchto svatých míst se probudili. A jejich hnęv otâesá zemí!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Každý mocný mág na tomto ostrovę cítí toto nebezpečí
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //a nękteâí z nich se rozhodli této hrozbę čelit.
};
