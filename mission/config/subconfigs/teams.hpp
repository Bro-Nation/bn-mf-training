// limits and vanilla/custom trait values
class MikeForce
{
    name = "Mike Force [Infantry]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_MikeForce_HL.paa";
    shortname = "Mike Force";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SpikeTeam
{
    name = "Spike Team [Special Forces]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_SpikeTeam_HL.paa";
    shortname = "Spike Team";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};

    class rolelimits 
    {
        medic = 40;
        engineer = 0;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ACAV
{
    name = "Armored Cavalry [Ground Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_ACAV_HL.paa";
    shortname = "ACAV";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class GreenHornets
{
    name = "Green Hornets [Air Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_Hornets_HL.paa";
    shortname = "Green Hornets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 3rdMEU
{
    name = "31st MEU [31st Marine Expeditionary Unit]";
    icon = "custom\taskroster\31st_logo_meu_HL.paa";
    shortname = "31st MEU";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0.3, 0.6, 1};

    class rolelimits 
    {
        medic = 10;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MilitaryPolice
{
    name = "Military Police [716th Military Police Battalion]";
    icon = "custom\taskroster\militarypolice_HL.paa";
    shortname = "Military Police";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = true;
        UAVHacker = false;
        vn_artillery = true;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class BlackHorse
{
    name = "Black Horse [11th Armored Cavalry Regiment]";
    icon = "custom\taskroster\blackhorse_HL.paa";
    shortname = "Black Horse";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Frogmen
{
    name = "Frogmen [Underwater Demolition Team]";
    icon = "custom\taskroster\frogmen_HL.paa";
    shortname = "Frogmen";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Muskets
{
    name = "Muskets [176th Attack Helicopter Company]";
    icon = "custom\taskroster\muskets_HL.paa";
    shortname = "Muskets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SatansAngels
{
    name = "Satans Angels [433rd Tactical Fighter Squadron]";
    icon = "custom\taskroster\satansangels_HL.paa";
    shortname = "Satans Angels";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 633rdCSG
{
    name = "Crossbow [633rd Combat Support Group]";
    icon = "custom\taskroster\633rdcombatsupportgroup_HL.paa";
    shortname = "Crossbow";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 7thCAV
{
    name = "Garryowen [7th Cavalry Regiment]";
    icon = "custom\taskroster\7thcav_HL.paa";
    shortname = "7th Cav";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class TigerForce
{
    name = "Tiger Force [1-327 Infantry Regiment (Recon)]";
    icon = "custom\taskroster\tigerforce_HL.paa";
    shortname = "Tiger Force";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    
    class rolelimits 
    {
        medic = 15;
        engineer = 20;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = false;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SASR
{
    name = "NZSAS";
    icon = "custom\taskroster\nzsas_HL.paa";
    shortname = "NZSAS";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ARVN
{
    name = "Army of the Republic of Vietnam";
    icon = "custom\taskroster\ARVN_HL.paa";
    shortname = "ARVNR";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };

    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MACV
{
    name = "MACV [Command]";
    icon = "custom\taskroster\macv_HL.paa";
    shortname = "MACV";
    unit = "vn_b_men_army_01";
    color = "ColorYellow";
    colorRGBA[] = {0.85, 0.85, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = true;
        vn_artillery = false;
        harassable = false;
        scout = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class DacCong
{
    name = "Dac Cong [Commandos]";
    icon = "custom\taskroster\daccong_team.paa";
    shortname = "Dac Cong";
    unit = "vn_b_men_army_01";
    color = "ColorOPFOR";
    colorRGBA[] = {1, 0, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class PressCorp
{
    name = "Press Corp [DASPO]";
    icon = "custom\taskroster\presscorp_HL.paa";
    shortname = "Press Corp";
    unit = "C_journalist_F";
    color = "ColorCIV";
    colorRGBA[] = {0.4, 0, 0.5, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};