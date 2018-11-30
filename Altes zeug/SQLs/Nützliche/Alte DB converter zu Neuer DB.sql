ALTER TABLE `creature_template` DROP `faction_H`;
ALTER TABLE `creature_template` CHANGE `faction_A` `faction` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `gameobject` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';

ALTER TABLE `broadcast_text` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `creature_equip_template` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `creature_template` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `gameobject_template` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `item_set_names` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `item_template` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `npc_text` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `page_text` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `quest_template` CHANGE COLUMN `WDBVerified` `VerifiedBuild` SMALLINT(5) DEFAULT '0';

ALTER TABLE `areatrigger_teleport` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `creature` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `lfg_entrances` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_broadcast_text` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_creature` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_gameobject` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_item` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_item_set_names` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `locales_quest` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `npc_vendor` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `quest_poi_points` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `quest_poi` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';

UPDATE `locales_broadcast_text` SET `VerifiedBuild`=18019;
UPDATE `locales_creature` SET `VerifiedBuild`=18019;
UPDATE `locales_gameobject` SET `VerifiedBuild`=18019;
UPDATE `locales_item` SET `VerifiedBuild`=15050;
UPDATE `locales_item_set_names` SET `VerifiedBuild`=15050;
UPDATE `locales_quest` SET `VerifiedBuild`=18019;

UPDATE `creature_template` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `gameobject_template` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `item_set_names` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `item_template` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `npc_text` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `page_text` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;
UPDATE `item_template` SET `VerifiedBuild`=0 WHERE `VerifiedBuild`=1;

ALTER TABLE `points_of_interest` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';
ALTER TABLE `spell_target_position` ADD `VerifiedBuild` SMALLINT(5) DEFAULT '0';

UPDATE `gameobject` SET `phasemask`=256 WHERE `guid`=76992;
ALTER TABLE `playercreateinfo_skills` ENGINE MyISAM;
ALTER TABLE `waypoint_data` CHANGE `move_flag` `move_type` INT(11) NOT NULL DEFAULT 0;
ALTER TABLE `creature_template`
  DROP COLUMN `mindmg`, 
  DROP COLUMN `maxdmg`, 
  DROP COLUMN `attackpower`, 
  DROP COLUMN `minrangedmg`, 
  DROP COLUMN `maxrangedmg`, 
  DROP COLUMN `rangedattackpower`, 
  CHANGE `baseattacktime` `BaseAttackTime` INT(10) UNSIGNED DEFAULT 0  NOT NULL,
  CHANGE `rangeattacktime` `RangeAttackTime` INT(10) UNSIGNED DEFAULT 0  NOT NULL,
  ADD COLUMN `BaseVariance` FLOAT DEFAULT 1  NOT NULL AFTER `RangeAttackTime`,
  ADD COLUMN `RangeVariance` FLOAT DEFAULT 1  NOT NULL AFTER `BaseVariance`,
  CHANGE `Health_mod` `HealthModifier` FLOAT DEFAULT 1  NOT NULL,
  CHANGE `Mana_mod` `ManaModifier` FLOAT DEFAULT 1  NOT NULL,
  CHANGE `Armor_mod` `ArmorModifier` FLOAT DEFAULT 1  NOT NULL,
  CHANGE `dmg_multiplier` `DamageModifier` FLOAT DEFAULT 1  NOT NULL  AFTER `ArmorModifier`,
  ADD COLUMN `ExperienceModifier` FLOAT DEFAULT 1  NOT NULL AFTER `DamageModifier`;
ALTER TABLE `creature_text`
  CHANGE `BroadcastTextID` `BroadcastTextId` MEDIUMINT(6) DEFAULT 0 NOT NULL  AFTER `sound`,
  ADD COLUMN `TextRange` TINYINT(3) UNSIGNED DEFAULT 0 NOT NULL AFTER `BroadcastTextId`;

ALTER TABLE `spell_dbc`  ADD `EffectItemType1` INT(10) UNSIGNED NOT NULL DEFAULT '0'  AFTER `EffectMultipleValue3`;
ALTER TABLE `spell_dbc`  ADD `EffectItemType2` INT(10) UNSIGNED NOT NULL DEFAULT '0'  AFTER `EffectItemType1`;
ALTER TABLE `spell_dbc`  ADD `EffectItemType3` INT(10) UNSIGNED NOT NULL DEFAULT '0'  AFTER `EffectItemType2`;

-- Alter creature_loot_template
ALTER TABLE `creature_loot_template` DROP PRIMARY KEY;
ALTER TABLE `creature_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `creature_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `creature_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `creature_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `creature_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `creature_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `creature_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `creature_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `creature_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `creature_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `creature_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `creature_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `creature_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `creature_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter disenchant_loot_template
ALTER TABLE `disenchant_loot_template` DROP PRIMARY KEY;
ALTER TABLE `disenchant_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `disenchant_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `disenchant_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `disenchant_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `disenchant_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `disenchant_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `disenchant_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `disenchant_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `disenchant_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `disenchant_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `disenchant_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `disenchant_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter fishing_loot_template
ALTER TABLE `fishing_loot_template` DROP PRIMARY KEY;
ALTER TABLE `fishing_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `fishing_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `fishing_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `fishing_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `fishing_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `fishing_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `fishing_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `fishing_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `fishing_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `fishing_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `fishing_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `fishing_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `fishing_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `fishing_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter gameobject_loot_template
ALTER TABLE `gameobject_loot_template` DROP PRIMARY KEY;
ALTER TABLE `gameobject_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `gameobject_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `gameobject_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `gameobject_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `gameobject_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `gameobject_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `gameobject_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `gameobject_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `gameobject_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `gameobject_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `gameobject_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter item_loot_template
ALTER TABLE `item_loot_template` DROP PRIMARY KEY;
ALTER TABLE `item_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `item_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `item_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `item_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `item_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `item_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `item_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `item_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `item_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `item_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `item_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `item_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `item_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `item_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter mail_loot_template
ALTER TABLE `mail_loot_template` DROP PRIMARY KEY;
ALTER TABLE `mail_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `mail_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `mail_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `mail_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `mail_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `mail_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `mail_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `mail_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `mail_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `mail_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `mail_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `mail_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `mail_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `mail_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `mail_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter milling_loot_template
ALTER TABLE `milling_loot_template` DROP PRIMARY KEY;
ALTER TABLE `milling_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `milling_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `milling_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `milling_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `milling_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `milling_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `milling_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `milling_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `milling_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `milling_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `milling_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `milling_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `milling_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `milling_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `milling_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter pickpocketing_loot_template
ALTER TABLE `pickpocketing_loot_template` DROP PRIMARY KEY;
ALTER TABLE `pickpocketing_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `pickpocketing_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `pickpocketing_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `pickpocketing_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `pickpocketing_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `pickpocketing_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `pickpocketing_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `pickpocketing_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `pickpocketing_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `pickpocketing_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `pickpocketing_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `pickpocketing_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter prospecting_loot_template
ALTER TABLE `prospecting_loot_template` DROP PRIMARY KEY;
ALTER TABLE `prospecting_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `prospecting_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `prospecting_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `prospecting_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `prospecting_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `prospecting_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `prospecting_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `prospecting_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `prospecting_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `prospecting_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `prospecting_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `prospecting_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter reference_loot_template
ALTER TABLE `reference_loot_template` DROP PRIMARY KEY;
ALTER TABLE `reference_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `reference_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `reference_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `reference_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `reference_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `reference_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `reference_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `reference_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `reference_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `reference_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `reference_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `reference_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `reference_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `reference_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter skinning_loot_template
ALTER TABLE `skinning_loot_template` DROP PRIMARY KEY;
ALTER TABLE `skinning_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `skinning_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `skinning_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `skinning_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `skinning_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `skinning_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `skinning_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `skinning_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `skinning_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `skinning_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `skinning_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `skinning_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `skinning_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `skinning_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);

-- Alter spell_loot_template
ALTER TABLE `spell_loot_template` DROP PRIMARY KEY;
ALTER TABLE `spell_loot_template` CHANGE `entry` `Entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `spell_loot_template` CHANGE `item` `Item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `spell_loot_template` ADD COLUMN `Reference` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `Item`;
UPDATE `spell_loot_template` SET `Reference` = `mincountOrRef` * -1 WHERE `mincountOrRef` < 0;
UPDATE `spell_loot_template` SET  `mincountOrRef` = 1 WHERE `Reference` > 0;
ALTER TABLE `spell_loot_template` ADD COLUMN `QuestRequired` BOOL NOT NULL DEFAULT 0 AFTER `ChanceOrQuestChance`;
UPDATE `spell_loot_template` SET `QuestRequired` = 1 WHERE `ChanceOrQuestChance` < 0;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance` = `ChanceOrQuestChance` * -1 WHERE `ChanceOrQuestChance` < 0;
ALTER TABLE `spell_loot_template` CHANGE `ChanceOrQuestChance` `Chance` FLOAT NOT NULL DEFAULT 100;
ALTER TABLE `spell_loot_template` CHANGE `lootmode` `LootMode` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `spell_loot_template` CHANGE `groupid` `GroupId` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `spell_loot_template` CHANGE `mincountOrRef` `MinCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `spell_loot_template` CHANGE `maxcount` `MaxCount` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `spell_loot_template` ADD COLUMN `Comment` VARCHAR(255) AFTER `MaxCount`;
ALTER TABLE `spell_loot_template` ADD PRIMARY KEY (`Entry`,`Item`);
ALTER TABLE `creature` ADD `zoneId` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone Identifier' AFTER `map`;
ALTER TABLE `creature` ADD `areaId` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area Identifier' AFTER `zoneId`;

ALTER TABLE `gameobject` ADD `zoneId` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone Identifier' AFTER `map`;
ALTER TABLE `gameobject` ADD `areaId` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area Identifier' AFTER `zoneId`;
--
ALTER TABLE `quest_template` CHANGE `RewardHonorMultiplier` `RewardHonorMultiplier` FLOAT NOT NULL DEFAULT '0';
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry` IN (35144,35511,35512,35513);
ALTER TABLE `gameobject_addon` MODIFY `guid` int(10) unsigned NOT NULL DEFAULT '0';
-- areatrigger_teleport
ALTER TABLE `areatrigger_teleport`
CHANGE `id` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `name` `Name` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

-- battleground_template
ALTER TABLE `battleground_template`
CHANGE `id` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

-- creature_equip_template
ALTER TABLE `creature_equip_template`
CHANGE `entry` `CreatureID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `id` `ID` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
CHANGE `itemEntry1` `ItemID1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `itemEntry2` `ItemID2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `itemEntry3` `ItemID3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

-- creature_formations
ALTER TABLE `creature_formations`
CHANGE `leaderGUID` `leaderGUID` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `memberGUID` `memberGUID` INT(10) UNSIGNED NOT NULL DEFAULT '0';

-- creature_model_info
ALTER TABLE `creature_model_info`
CHANGE `modelid` `DisplayID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `bounding_radius` `BoundingRadius` FLOAT NOT NULL DEFAULT '0',
CHANGE `combat_reach` `CombatReach` FLOAT NOT NULL DEFAULT '0',
CHANGE `gender` `Gender` TINYINT(3) UNSIGNED NOT NULL DEFAULT '2',
CHANGE `modelid_other_gender` `DisplayID_Other_Gender` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

-- gameobject_template
ALTER TABLE `gameobject_template`
CHANGE `data0`  `Data0`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data1`  `Data1`  INT(11) NOT NULL DEFAULT '0',
CHANGE `data2`  `Data2`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data3`  `Data3`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data4`  `Data4`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data5`  `Data5`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data6`  `Data6`  INT(11) NOT NULL DEFAULT '0',
CHANGE `data7`  `Data7`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data8`  `Data8`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data9`  `Data9`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data10` `Data10` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data11` `Data11` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data12` `Data12` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data13` `Data13` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data14` `Data14` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data15` `Data15` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data16` `Data16` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data17` `Data17` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data18` `Data18` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data19` `Data19` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data20` `Data20` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data21` `Data21` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data22` `Data22` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data23` `Data23` INT(10) UNSIGNED NOT NULL DEFAULT '0';

-- lfg_entrances -> lfg_dungeon_template
RENAME TABLE `lfg_entrances` TO `lfg_dungeon_template`;

-- npc_text
ALTER TABLE `npc_text`
CHANGE `prob0` `Probability0` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob1` `Probability1` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob2` `Probability2` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob3` `Probability3` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob4` `Probability4` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob5` `Probability5` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob6` `Probability6` FLOAT NOT NULL DEFAULT '0',
CHANGE `prob7` `Probability7` FLOAT NOT NULL DEFAULT '0';

-- npc_trainer
ALTER TABLE `npc_trainer`
CHANGE `entry` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `spell` `SpellID` MEDIUMINT(8) NOT NULL DEFAULT '0',
CHANGE `spellcost` `MoneyCost` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `reqskill` `ReqSkillLine` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `reqskillvalue` `ReqSkillRank` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `reqlevel` `ReqLevel` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';

-- page_text
ALTER TABLE `page_text`
CHANGE `entry` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `text` `Text` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
CHANGE `next_page` `NextPageID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `VerifiedBuild` `VerifiedBuild` SMALLINT(5) NULL DEFAULT '0';

-- player_xp_for_level
ALTER TABLE `player_xp_for_level`
CHANGE `lvl` `Level` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `xp_for_next_level` `Experience` INT(10) UNSIGNED NOT NULL;

-- points_of_interest
ALTER TABLE `points_of_interest`
CHANGE `entry` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `x` `PositionX` FLOAT NOT NULL DEFAULT '0',
CHANGE `y` `PositionY` FLOAT NOT NULL DEFAULT '0',
CHANGE `icon` `Icon` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `flags` `Flags` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `data` `Data` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `icon_name` `Name` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

-- quest_poi
ALTER TABLE `quest_poi`
CHANGE `questId` `QuestID` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `objIndex` `ObjectiveIndex` INT(11) NOT NULL DEFAULT '0',
CHANGE `mapid` `MapID` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `FloorId` `Floor` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `unk3` `Priority` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `unk4` `Flags` INT(10) UNSIGNED NOT NULL DEFAULT '0';

-- quest_poi_points
ALTER TABLE `quest_poi_points`
CHANGE `questId` `QuestID` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `id` `Idx1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `idx` `Idx2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `x` `X` INT(11) NOT NULL DEFAULT '0',
CHANGE `y` `Y` INT(11) NOT NULL DEFAULT '0';

-- quest_template
ALTER TABLE `quest_template`
CHANGE `Id` `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `Level` `QuestLevel` smallint(3) NOT NULL DEFAULT '1',
CHANGE `ZoneOrSort` `QuestSortID` smallint(6) NOT NULL DEFAULT '0',
CHANGE `Type` `QuestType` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `SuggestedPlayers` `SuggestedGroupNum` tinyint(3) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardTitleId` `RewardTitle` tinyint(3) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemId1` `RewardItem1` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemId2` `RewardItem2` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemId3` `RewardItem3` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemId4` `RewardItem4` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemCount1` `RewardAmount1` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemCount2` `RewardAmount2` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemCount3` `RewardAmount3` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardItemCount4` `RewardAmount4` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId1` `RewardChoiceItemID1` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId2` `RewardChoiceItemID2` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId3` `RewardChoiceItemID3` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId4` `RewardChoiceItemID4` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId5` `RewardChoiceItemID5` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemId6` `RewardChoiceItemID6` mediumint(8) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount1` `RewardChoiceItemQuantity1` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount2` `RewardChoiceItemQuantity2` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount3` `RewardChoiceItemQuantity3` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount4` `RewardChoiceItemQuantity4` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount5` `RewardChoiceItemQuantity5` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardChoiceItemCount6` `RewardChoiceItemQuantity6` smallint(5) unsigned NOT NULL DEFAULT '0',
CHANGE `RewardFactionId1` `RewardFactionID1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
CHANGE `RewardFactionId2` `RewardFactionID2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
CHANGE `RewardFactionId3` `RewardFactionID3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
CHANGE `RewardFactionId4` `RewardFactionID4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
CHANGE `RewardFactionId5` `RewardFactionID5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
CHANGE `RewardFactionValueId1` `RewardFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueId2` `RewardFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueId3` `RewardFactionValue3` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueId4` `RewardFactionValue4` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueId5` `RewardFactionValue5` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueIdOverride1` `RewardFactionOverride1` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueIdOverride2` `RewardFactionOverride2` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueIdOverride3` `RewardFactionOverride3` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueIdOverride4` `RewardFactionOverride4` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `RewardFactionValueIdOverride5` `RewardFactionOverride5` mediumint(8) NOT NULL DEFAULT '0',
CHANGE `Title` `LogTitle` text,
CHANGE `Objectives` `LogDescription` text,
CHANGE `Details` `QuestDescription` text,
CHANGE `CompletedText` `QuestCompletionLog` text;

-- spell_target_position
ALTER TABLE `spell_target_position`
CHANGE `id` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
CHANGE `effIndex` `EffectIndex` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `target_map` `MapID` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `target_position_x` `PositionX` FLOAT NOT NULL DEFAULT '0',
CHANGE `target_position_y` `PositionY` FLOAT NOT NULL DEFAULT '0',
CHANGE `target_position_z` `PositionZ` FLOAT NOT NULL DEFAULT '0',
CHANGE `target_orientation` `Orientation` FLOAT NOT NULL DEFAULT '0';
DROP TABLE IF EXISTS `creature_questitem`;
CREATE TABLE `creature_questitem` (
  `CreatureEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `Idx` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `gameobject_questitem`;
CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `Idx` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 0, gameobject_template.questItem1 FROM gameobject_template WHERE gameobject_template.questItem1 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 1, gameobject_template.questItem2 FROM gameobject_template WHERE gameobject_template.questItem2 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 2, gameobject_template.questItem3 FROM gameobject_template WHERE gameobject_template.questItem3 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 3, gameobject_template.questItem4 FROM gameobject_template WHERE gameobject_template.questItem4 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 4, gameobject_template.questItem5 FROM gameobject_template WHERE gameobject_template.questItem5 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 5, gameobject_template.questItem6 FROM gameobject_template WHERE gameobject_template.questItem6 != 0);

INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 0, creature_template.questItem1 FROM creature_template WHERE creature_template.questItem1 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 1, creature_template.questItem2 FROM creature_template WHERE creature_template.questItem2 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 2, creature_template.questItem3 FROM creature_template WHERE creature_template.questItem3 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 3, creature_template.questItem4 FROM creature_template WHERE creature_template.questItem4 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 4, creature_template.questItem5 FROM creature_template WHERE creature_template.questItem5 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 5, creature_template.questItem6 FROM creature_template WHERE creature_template.questItem6 != 0);

ALTER TABLE `creature_template` DROP `questItem1`, DROP `questItem2`, DROP `questItem3`, DROP `questItem4`, DROP `questItem5`, DROP `questItem6`;
ALTER TABLE `gameobject_template` DROP `questItem1`, DROP `questItem2`, DROP `questItem3`, DROP `questItem4`, DROP `questItem5`, DROP `questItem6`;
-- creating `quest_template_addon` table
DROP TABLE IF EXISTS        `quest_template_addon`;
CREATE TABLE IF NOT EXISTS  `quest_template_addon` (                  -- old names:
  `ID`                    mediumint(8) unsigned NOT NULL DEFAULT '0', -- ID
  `MaxLevel`              tinyint(3) unsigned NOT NULL DEFAULT '0',   -- MaxLevel
  `AllowableClasses`      int(10) unsigned NOT NULL DEFAULT '0',      -- RequiredClasses
  `SourceSpellID`         mediumint(8) unsigned NOT NULL DEFAULT '0', -- SourceSpellId
  `PrevQuestID`           mediumint(8) NOT NULL DEFAULT '0',          -- PrevQuestId
  `NextQuestID`           mediumint(8) NOT NULL DEFAULT '0',          -- NextQuestId
  `ExclusiveGroup`        mediumint(8) NOT NULL DEFAULT '0',          -- ExclusiveGroup
  `RewardMailTemplateID`  mediumint(8) unsigned NOT NULL DEFAULT '0', -- RewardMailTemplateId
  `RewardMailDelay`       int(10) unsigned NOT NULL DEFAULT '0',      -- RewardMailDelay
  `RequiredSkillID`       smallint(5) unsigned NOT NULL DEFAULT '0',  -- RequiredSkillId
  `RequiredSkillPoints`   smallint(5) unsigned NOT NULL DEFAULT '0',  -- RequiredSkillPoints
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',  -- RequiredMinRepFaction
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',  -- RequiredMaxRepFaction
  `RequiredMinRepValue`   mediumint(8) NOT NULL DEFAULT '0',          -- RequiredMinRepValue
  `RequiredMaxRepValue`   mediumint(8) NOT NULL DEFAULT '0',          -- RequiredMaxRepValue
  `ProvidedItemCount`     tinyint(3) unsigned NOT NULL DEFAULT '0',   -- SourceItemCount
  `SpecialFlags`          tinyint(3) unsigned NOT NULL DEFAULT '0',   -- SpecialFlags
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- moving data from `quest_template` to `quest_template_addon`
INSERT INTO `quest_template_addon`
(`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`)
(SELECT `ID`, `MaxLevel`, `RequiredClasses`, `SourceSpellId`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `RewardMailTemplateId`, `RewardMailDelay`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `SourceItemCount`, `SpecialFlags` FROM `quest_template`);


-- drop `quest_template` fields
ALTER TABLE `quest_template`
DROP `MaxLevel`,
DROP `RequiredClasses`,
DROP `SourceSpellId`,
DROP `PrevQuestId`,
DROP `NextQuestId`,
DROP `ExclusiveGroup`,
DROP `RewardMailTemplateId`,
DROP `RewardMailDelay`,
DROP `RequiredSkillId`,
DROP `RequiredSkillPoints`,
DROP `RequiredMinRepFaction`,
DROP `RequiredMaxRepFaction`,
DROP `RequiredMinRepValue`,
DROP `RequiredMaxRepValue`,
DROP `SourceItemCount`,
DROP `SpecialFlags`;
DROP TABLE IF EXISTS `gameobject_template_locale`;
CREATE TABLE IF NOT EXISTS `gameobject_template_locale` (
  `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` VARCHAR(4) NOT NULL,
  `name` TEXT,
  `castBarCaption` TEXT,
  `VerifiedBuild` SMALLINT(5) DEFAULT '0'
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

ALTER TABLE `gameobject_template_locale`
  ADD PRIMARY KEY (`entry`,`locale`);

-- koKR
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "koKR", `name_loc1`, `castbarcaption_loc1`, `VerifiedBuild`  FROM `locales_gameobject`);

-- frFR
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "frFR", `name_loc2`, `castbarcaption_loc2`, `VerifiedBuild`  FROM `locales_gameobject`);

-- deDE
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "deDE", `name_loc3`, `castbarcaption_loc3`, `VerifiedBuild`  FROM `locales_gameobject`);

-- zhCN
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "zhCN", `name_loc4`, `castbarcaption_loc4`, `VerifiedBuild`  FROM `locales_gameobject`);

-- zhTW
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "zhTW", `name_loc5`, `castbarcaption_loc5`, `VerifiedBuild`  FROM `locales_gameobject`);

-- esES
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
  (SELECT `entry`, "esES", `name_loc6`, `castbarcaption_loc6`, `VerifiedBuild`  FROM `locales_gameobject`);

-- esMX
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
 (SELECT `entry`, "esMX", `name_loc7`, `castbarcaption_loc7`, `VerifiedBuild`  FROM `locales_gameobject`);

-- ruRU
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
 (SELECT `entry`, "ruRU", `name_loc8`, `castbarcaption_loc8`, `VerifiedBuild`  FROM `locales_gameobject`);

DROP TABLE IF EXISTS `locales_gameobject`;
-- quest_details
DROP TABLE IF EXISTS `quest_details`;
CREATE TABLE `quest_details` (
    `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
    `Emote1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote3` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote4` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay3` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay4` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`)
SELECT `ID`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `VerifiedBuild` FROM `quest_template`
WHERE `DetailsEmote1`!=0 OR `DetailsEmote2`!=0 OR `DetailsEmote3`!=0 OR `DetailsEmote4`!=0 OR `DetailsEmoteDelay1`!=0 OR `DetailsEmoteDelay2`!=0 OR `DetailsEmoteDelay3`!=0 OR `DetailsEmoteDelay4`!=0;


-- quest_request_items
DROP TABLE IF EXISTS `quest_request_items`;
CREATE TABLE `quest_request_items` (
    `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteOnComplete` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteOnIncomplete` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `CompletionText` TEXT,
    `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`)
SELECT `ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `RequestItemsText`, `VerifiedBuild` FROM `quest_template`
WHERE `EmoteOnComplete`!=0 OR `EmoteOnIncomplete`!=0 OR `RequestItemsText`!='';


-- quest_offer_reward
DROP TABLE IF EXISTS `quest_offer_reward`;
CREATE TABLE `quest_offer_reward` (
    `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
    `Emote1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote3` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `Emote4` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay3` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `EmoteDelay4` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `RewardText` TEXT,
    `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`)
SELECT `ID`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `OfferRewardText`, `VerifiedBuild` FROM `quest_template`
WHERE `OfferRewardEmote1`!=0 OR `OfferRewardEmote2`!=0 OR `OfferRewardEmote3`!=0 OR `OfferRewardEmote4`!=0 OR `OfferRewardEmoteDelay1`!=0 OR `OfferRewardEmoteDelay2`!=0 OR `OfferRewardEmoteDelay3`!=0 OR `OfferRewardEmoteDelay4`!=0 OR `OfferRewardText`!='';

-- delete old fields
ALTER TABLE `quest_template`
  DROP `DetailsEmote1`,
  DROP `DetailsEmote2`,
  DROP `DetailsEmote3`,
  DROP `DetailsEmote4`,
  DROP `DetailsEmoteDelay1`,
  DROP `DetailsEmoteDelay2`,
  DROP `DetailsEmoteDelay3`,
  DROP `DetailsEmoteDelay4`,
  DROP `EmoteOnIncomplete`,
  DROP `EmoteOnComplete`,
  DROP `RequestItemsText`,
  DROP `OfferRewardEmote1`,
  DROP `OfferRewardEmote2`,
  DROP `OfferRewardEmote3`,
  DROP `OfferRewardEmote4`,
  DROP `OfferRewardEmoteDelay1`,
  DROP `OfferRewardEmoteDelay2`,
  DROP `OfferRewardEmoteDelay3`,
  DROP `OfferRewardEmoteDelay4`,
  DROP `OfferRewardText`;
-- RewardItem(s) and RewardAmount(s) [4x2 fields]
ALTER TABLE `quest_template`
  CHANGE COLUMN `RewardAmount1` `RewardAmount1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardItem1`,
  CHANGE COLUMN `RewardAmount2` `RewardAmount2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardItem2`,
  CHANGE COLUMN `RewardAmount3` `RewardAmount3` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardItem3`,
  CHANGE COLUMN `RewardAmount4` `RewardAmount4` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardItem4`;

-- RewardChoiceItemID(s) and RewardChoiceItemQuantity(s) [6x2 fields]
ALTER TABLE `quest_template`
  CHANGE COLUMN `RewardChoiceItemQuantity1` `RewardChoiceItemQuantity1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID1`,
  CHANGE COLUMN `RewardChoiceItemQuantity2` `RewardChoiceItemQuantity2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID2`,
  CHANGE COLUMN `RewardChoiceItemQuantity3` `RewardChoiceItemQuantity3` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID3`,
  CHANGE COLUMN `RewardChoiceItemQuantity4` `RewardChoiceItemQuantity4` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID4`,
  CHANGE COLUMN `RewardChoiceItemQuantity5` `RewardChoiceItemQuantity5` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID5`,
  CHANGE COLUMN `RewardChoiceItemQuantity6` `RewardChoiceItemQuantity6` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemID6`;

-- RewardFactionID(s), RewardFactionValue(s) and RewardFactionOverride(s) [5x3 fields]
ALTER TABLE `quest_template`
  CHANGE COLUMN `RewardFactionValue1`     `RewardFactionValue1`     MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionID1`,
  CHANGE COLUMN `RewardFactionOverride1`  `RewardFactionOverride1`  MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionValue1`,
  CHANGE COLUMN `RewardFactionValue2`     `RewardFactionValue2`     MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionID2`,
  CHANGE COLUMN `RewardFactionOverride2`  `RewardFactionOverride2`  MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionValue2`,
  CHANGE COLUMN `RewardFactionValue3`     `RewardFactionValue3`     MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionID3`,
  CHANGE COLUMN `RewardFactionOverride3`  `RewardFactionOverride3`  MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionValue3`,
  CHANGE COLUMN `RewardFactionValue4`     `RewardFactionValue4`     MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionID4`,
  CHANGE COLUMN `RewardFactionOverride4`  `RewardFactionOverride4`  MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionValue4`,
  CHANGE COLUMN `RewardFactionValue5`     `RewardFactionValue5`     MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionID5`,
  CHANGE COLUMN `RewardFactionOverride5`  `RewardFactionOverride5`  MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewardFactionValue5`;
ALTER TABLE `quest_template`
  CHANGE COLUMN `Method`    `QuestType`   TINYINT(3)  UNSIGNED NOT NULL DEFAULT '2' AFTER `ID`,
  CHANGE COLUMN `QuestType` `QuestInfoID` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `QuestSortID`;
ALTER TABLE `quest_template`
  CHANGE COLUMN `LimitTime`             `TimeAllowed`         INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `PointOption`,
  CHANGE COLUMN `RequiredRaces`         `RequiredRaces`       SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `TimeAllowed`,
  CHANGE COLUMN `NextQuestIdChain`      `RewardNextQuest`     MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `RequiredFactionValue2`,
  CHANGE COLUMN `RewardXPId`            `RewardXPDifficulty`  TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardNextQuest`,
  CHANGE COLUMN `RewardOrRequiredMoney` `RewardMoney`         INT(11) NOT NULL DEFAULT '0' AFTER `RewardXPDifficulty`,
  CHANGE COLUMN `RewardMoneyMaxLevel`   `RewardBonusMoney`    INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardMoney`,
  CHANGE COLUMN `RewardSpell`           `RewardDisplaySpell`  MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardBonusMoney`,
  CHANGE COLUMN `RewardSpellCast`       `RewardSpell`         INT(11) NOT NULL DEFAULT '0' AFTER `RewardDisplaySpell`,
  CHANGE COLUMN `RewardHonorMultiplier` `RewardKillHonor`     FLOAT NOT NULL DEFAULT '0' AFTER `RewardHonor`,
  CHANGE COLUMN `SourceItemId`          `StartItem`           MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardKillHonor`,
  CHANGE COLUMN `RewardTitle`           `RewardTitle`         TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemQuantity6`,
  CHANGE COLUMN `RewardTalents`         `RewardTalents`       TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardTitle`,
  CHANGE COLUMN `RewardArenaPoints`     `RewardArenaPoints`   SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardTalents`;
-- split needed to avoid import errors
ALTER TABLE `quest_template`
  CHANGE COLUMN `PointMapId`            `POIContinent`        SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardChoiceItemQuantity6`,
  CHANGE COLUMN `PointX`                `POIx`                FLOAT NOT NULL DEFAULT '0' AFTER `POIContinent`,
  CHANGE COLUMN `PointY`                `POIy`                FLOAT NOT NULL DEFAULT '0' AFTER `POIx`,
  CHANGE COLUMN `PointOption`           `POIPriority`         MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `POIy`,
  CHANGE COLUMN `EndText`               `AreaDescription`     TEXT NULL AFTER `QuestDescription`;
ALTER TABLE `quest_template`
  CHANGE COLUMN `RequiredRaces`            `AllowableRaces`    SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `TimeAllowed`,
  CHANGE COLUMN `RequiredSourceItemId1`    `ItemDrop1`         MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewardAmount4`,
  CHANGE COLUMN `RequiredSourceItemCount1` `ItemDropQuantity1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDrop1`,
  CHANGE COLUMN `RequiredSourceItemId2`    `ItemDrop2`         MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDropQuantity1`,
  CHANGE COLUMN `RequiredSourceItemCount2` `ItemDropQuantity2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDrop2`,
  CHANGE COLUMN `RequiredSourceItemId3`    `ItemDrop3`         MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDropQuantity2`,
  CHANGE COLUMN `RequiredSourceItemCount3` `ItemDropQuantity3` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDrop3`,
  CHANGE COLUMN `RequiredSourceItemId4`    `ItemDrop4`         MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDropQuantity3`,
  CHANGE COLUMN `RequiredSourceItemCount4` `ItemDropQuantity4` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `ItemDrop4`;

-- `creature_questitem`.`VerifiedBuild`

ALTER TABLE `creature_questitem`
  ADD COLUMN `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0';

-- `gameobject_questitem`.`VerifiedBuild`

ALTER TABLE `gameobject_questitem`
  ADD COLUMN `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0';

DROP TABLE IF EXISTS `skill_perfect_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_perfect_item_template` (
	`spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
	`requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
	`perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
	`perfectItemType` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead',
	PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Crafting Perfection System';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `skill_perfect_item_template` WRITE;
/*!40000 ALTER TABLE `skill_perfect_item_template` DISABLE KEYS */;
INSERT INTO `skill_perfect_item_template` (`spellId`, `requiredSpecialization`, `perfectCreateChance`, `perfectItemType`)
VALUES
/* Bloodstone */
(53831,55534,20,41432), -- Bold
(53835,55534,20,41433), -- Bright
(53832,55534,20,41434), -- Delicate
(53844,55534,20,41435), -- Flashing
(53845,55534,20,41436), -- Fractured
(54017,55534,20,41437), -- Precise
(53834,55534,20,41438), -- Runed
(53843,55534,20,41439), -- Subtle
/* Sun Crystal */
(53852,55534,20,41444), -- Brilliant
(53857,55534,20,41445), -- Mystic
(53856,55534,20,41446), -- Quick
(53854,55534,20,41447), -- Rigid
(53853,55534,20,41448), -- Smooth
(53855,55534,20,41449), -- Thick
/* Chalcedony */
(53941,55534,20,41440), -- Lustrous
(53934,55534,20,41441), -- Solid
(53940,55534,20,41442), -- Sparkling
(53943,55534,20,41443), -- Stormy
/* Dark Jade */
(53926,55534,20,41463), -- Dazzling
(53918,55534,20,41464), -- Enduring
(53930,55534,20,41465), -- Energized
(53920,55534,20,41466), -- Forceful
(53925,55534,20,41467), -- Intricate
(53916,55534,20,41468), -- Jagged
(53928,55534,20,41469), -- Lambent
(53922,55534,20,41470), -- Misty
(53929,55534,20,41471), -- Opaque
(53931,55534,20,41472), -- Radiant
(53921,55534,20,41473), -- Seer's
(53933,55534,20,41474), -- Shattered
(53923,55534,20,41475), -- Shining
(53919,55534,20,41476), -- Steady
(53927,55534,20,41477), -- Sundered
(53932,55534,20,41478), -- Tense
(53894,55534,20,41479), -- Timeless
(53924,55534,20,41480), -- Turbid
(53917,55534,20,41481), -- Vivid
/* Huge Citrine */
(53886,55534,20,41429), -- Wicked
(53892,55534,20,41482), -- Accurate
(53874,55534,20,41483), -- Champion's
(53877,55534,20,41484), -- Deadly
(53880,55534,20,41485), -- Deft
(53884,55534,20,41486), -- Durable
(53888,55534,20,41487), -- Empowered
(53873,55534,20,41488), -- Etched
(53876,55534,20,41489), -- Fierce
(53891,55534,20,41490), -- Glimmering
(53878,55534,20,41491), -- Glinting
(53872,55534,20,41492), -- Inscribed
(53879,55534,20,41493), -- Lucent
(53881,55534,20,41494), -- Luminous
(53882,55534,20,41495), -- Potent
(53887,55534,20,41496), -- Pristine
(53885,55534,20,41497), -- Reckless
(53893,55534,20,41498), -- Resolute
(53875,55534,20,41499), -- Resplendent
(53890,55534,20,41500), -- Stalwart
(53889,55534,20,41501), -- Stark
(53883,55534,20,41502), -- Veiled
/* Shadow Crystal */
(53866,55534,20,41450), -- Balanced
(53869,55534,20,41451), -- Defender's
(53862,55534,20,41452), -- Glowing
(53871,55534,20,41453), -- Guardian's
(53867,55534,20,41454), -- Infused
(53865,55534,20,41455), -- Mysterious
(53870,55534,20,41456), -- Puissant
(53863,55534,20,41457), -- Purified
(53868,55534,20,41458), -- Regal
(53864,55534,20,41459), -- Royal
(53860,55534,20,41460), -- Shifting
(53859,55534,20,41461), -- Sovereign
(53861,55534,20,41462); -- Tenuous
/*!40000 ALTER TABLE `skill_perfect_item_template` ENABLE KEYS */;
UNLOCK TABLES;
ALTER TABLE `spell_proc`
  CHANGE `spellId` `SpellId` int(11) NOT NULL DEFAULT 0 FIRST,
  CHANGE `schoolMask` `SchoolMask` tinyint(3) unsigned NOT NULL DEFAULT 0 AFTER `SpellId`,
  CHANGE `spellFamilyName` `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT 0 AFTER `SchoolMask`,
  CHANGE `spellFamilyMask0` `SpellFamilyMask0` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellFamilyName`,
  CHANGE `spellFamilyMask1` `SpellFamilyMask1` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellFamilyMask0`,
  CHANGE `spellFamilyMask2` `SpellFamilyMask2` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellFamilyMask1`,
  CHANGE `typeMask` `ProcFlags` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellFamilyMask2`,
  CHANGE `spellTypeMask` `SpellTypeMask` int(10) unsigned NOT NULL DEFAULT 0 AFTER `ProcFlags`,
  CHANGE `spellPhaseMask` `SpellPhaseMask` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellTypeMask`,
  CHANGE `hitMask` `HitMask` int(10) unsigned NOT NULL DEFAULT 0 AFTER `SpellPhaseMask`,
  CHANGE `attributesMask` `AttributesMask` int(10) unsigned NOT NULL DEFAULT 0 AFTER `HitMask`,
  CHANGE `ratePerMinute` `ProcsPerMinute` float NOT NULL DEFAULT 0 AFTER `AttributesMask`,
  CHANGE `chance` `Chance` float NOT NULL DEFAULT 0 AFTER `ProcsPerMinute`,
  CHANGE `cooldown` `Cooldown` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Chance`,
  CHANGE `charges` `Charges` tinyint(3) unsigned NOT NULL DEFAULT 0 AFTER `Cooldown`;
RENAME TABLE `game_graveyard_zone` TO `graveyard_zone`;
ALTER TABLE `graveyard_zone` CHANGE `id` `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `graveyard_zone` CHANGE `ghost_zone` `GhostZone` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `graveyard_zone` CHANGE `faction` `Faction` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `graveyard_zone` ADD COLUMN `Comment` TEXT AFTER `Faction`;
