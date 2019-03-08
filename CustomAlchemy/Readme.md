This script requires a recent version of CoreScripts that you can find at https://github.com/TES3MP/CoreScripts
([commit](https://github.com/TES3MP/CoreScripts/commit/8b43e179c0d5eb0756dc315f43fa58246462eaa1) or later).

To install it:
* paste the contents of this folder into your `mp-stuff/` folder, found in your tes3mp installation
* add the following line to your `mp-stuff/scripts/customScripts.lua`: `require("urm_customAlchemy")`.

**customAlchemy** reimpliments vanilla alchemy mechanics to allow batch potion brewing, server side customization and improvement of server performance.

Most of the formulas are contained in `urm_customAlchemyFormulas.lua` for (relative) easy access.

You can find the configuration file in `mp-stuff/data/config/urm_customAlchemy.json`.
* `"menu"` is a list of all GUI ids used by customAlchemy. Edit this if some other scripts happen to use the same ones.
* `"burden"` refId prefix of burden spells applied to the players to offset whatever ingredients are stored in the alchemy apparatuses.
* `"container"`
  * `"baseId"` container used as a base. By default it is a dead rat. Dead creatures are preferable over containers, as they have no weight limit.
  * `"refId"` refId of the custom container used by this script. Edit for script compatibility.
  * `"name"` how the custom containers are called.
  * `"cell"` cell in which all the containers are stored. It will always be kept loaded, should be chosen from one of the [test cells](https://en.uesp.net/wiki/Morrowind:Test_Cells)
  * `"type"` should be the same type as `"baseId"`
  * `"location"` position at which containers are placed in `"cell"`
* `"potionEffectTreshold"` the amount of ingredients with the same effect necessary for the potion to have that effect. The default value is 2.
* `"maximumIngredientCount"` how many different ingredients can be added to a potion.
* `"apparatuses"` necessary data about all the alchemy apparatuses used. Can be used to make custom alchemy tools.
* `"ingredients"` necessary data about all the ingredients. By default only contains ingredients from the original game and the expansions, has to be edited to accomodate for mods. Can also be used to make custom ingredients. For information about numeric values consult the table below.
* `"effects"` necessary data for magical effects. For information about numeric values consult the table below.

==Potion effects==

    WaterBreathing = 0,
    SwiftSwim = 1,
    WaterWalking = 2,
    Shield = 3,
    FireShield = 4,
    LightningShield = 5,
    FrostShield = 6,
    Burden = 7,
    Feather = 8,
    Jump = 9,
    Levitate = 10,
    SlowFall = 11,
    Lock = 12,
    Open = 13,
    FireDamage = 14,
    ShockDamage = 15,
    FrostDamage = 16,
    DrainAttribute = 17,
    DrainHealth = 18,
    DrainMagicka = 19,
    DrainFatigue = 20,
    DrainSkill = 21,
    DamageAttribute = 22,
    DamageHealth = 23,
    DamageMagicka = 24,
    DamageFatigue = 25,
    DamageSkill = 26,
    Poison = 27,
    WeaknessToFire = 28,
    WeaknessToFrost = 29,
    WeaknessToShock = 30,
    WeaknessToMagicka = 31,
    WeaknessToCommonDisease = 32,
    WeaknessToBlightDisease = 33,
    WeaknessToCorprusDisease = 34,
    WeaknessToPoison = 35,
    WeaknessToNormalWeapons = 36,
    DisintegrateWeapon = 37,
    DisintegrateArmor = 38,
    Invisibility = 39,
    Chameleon = 40,
    Light = 41,
    Sanctuary = 42,
    NightEye = 43,
    Charm = 44,
    Paralyze = 45,
    Silence = 46,
    Blind = 47,
    Sound = 48,
    CalmHumanoid = 49,
    CalmCreature = 50,
    FrenzyHumanoid = 51,
    FrenzyCreature = 52,
    DemoralizeHumanoid = 53,
    DemoralizeCreature = 54,
    RallyHumanoid = 55,
    RallyCreature = 56,
    Dispel = 57,
    Soultrap = 58,
    Telekinesis = 59,
    Mark = 60,
    Recall = 61,
    DivineIntervention = 62,
    AlmsiviIntervention = 63,
    DetectAnimal = 64,
    DetectEnchantment = 65,
    DetectKey = 66,
    SpellAbsorption = 67,
    Reflect = 68,
    CureCommonDisease = 69,
    CureBlightDisease = 70,
    CureCorprusDisease = 71,
    CurePoison = 72,
    CureParalyzation = 73,
    RestoreAttribute = 74,
    RestoreHealth = 75,
    RestoreMagicka = 76,
    RestoreFatigue = 77,
    RestoreSkill = 78,
    FortifyAttribute = 79,
    FortifyHealth = 80,
    FortifyMagicka= 81,
    FortifyFatigue = 82,
    FortifySkill = 83,
    FortifyMaximumMagicka = 84,
    AbsorbAttribute = 85,
    AbsorbHealth = 86,
    AbsorbMagicka = 87,
    AbsorbFatigue = 88,
    AbsorbSkill = 89,
    ResistFire = 90,
    ResistFrost = 91,
    ResistShock = 92,
    ResistMagicka = 93,
    ResistCommonDisease = 94,
    ResistBlightDisease = 95,
    ResistCorprusDisease = 96,
    ResistPoison = 97,
    ResistNormalWeapons = 98,
    ResistParalysis = 99,
    RemoveCurse = 100,
    TurnUndead = 101,
    SummonScamp = 102,
    SummonClannfear = 103,
    SummonDaedroth = 104,
    SummonDremora = 105,
    SummonAncestralGhost = 106,
    SummonSkeletalMinion = 107,
    SummonBonewalker = 108,
    SummonGreaterBonewalker = 109,
    SummonBonelord = 110,
    SummonWingedTwilight = 111,
    SummonHunger = 112,
    SummonGoldenSaint = 113,
    SummonFlameAtronach = 114,
    SummonFrostAtronach = 115,
    SummonStormAtronach = 116,
    FortifyAttack = 117,
    CommandCreature = 118,
    CommandHumanoid = 119,
    BoundDagger = 120,
    BoundLongsword = 121,
    BoundMace = 122,
    BoundBattleAxe = 123,
    BoundSpear = 124,
    BoundLongbow = 125,
    ExtraSpell = 126,
    BoundCuirass = 127,
    BoundHelm = 128,
    BoundBoots = 129,
    BoundShield = 130,
    BoundGloves = 131,
    Corprus = 132,
    Vampirism = 133,
    SummonCenturionSphere = 134,
    SunDamage = 135,
    StuntedMagicka = 136,

    // Tribunal only
    SummonFabricant = 137,

    // Bloodmoon only
    SummonWolf = 138,
    SummonBear = 139,
    SummonBonewolf = 140,
    SummonCreature04 = 141,
    SummonCreature05 = 142


==Skills==

    0 = Block
    1 = Armorer
    2 = Medium Armor
    3 = Heavy Armor
    4 = Bluntweapon
    5 = Longblade
    6 = Axe
    7 = Spear
    8 = Athletics
    9 = Enchant
    10 = Destruction
    11 = Alteration
    12 = Illusion
    13 = Conjuration
    14 = Mysticism
    15 = Restoration
    16 = Alchemy
    17 = Unarmored
    18 = Security
    19 = Sneak
    20 = Acrobatics
    21 = Lightarmor
    22 = Shortblade
    23 = Marksman
    24 = Mercantile
    25 = Speechcraft
    26 = Handtohand


==Attributes==

    0 = Strength
    1 = Intelligence
    2 = Willpower
    3 = Agility
    4 = Speed
    5 = Endurance
    6 = Personality
    7 = Luck