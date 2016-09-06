REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (40000, 0, 0, 0, 0, 0, 26771, 0, 26771, 0, 'Aliasa', 'Waffenmeister', '', 40000, 80, 80, 0, 35, 35, 16, 1, 0, 1000, 2000, 0, 1000, 20, 2000, 2000, 2, 0, 8, 0, 2, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, '');

DELETE FROM `npc_trainer` WHERE (`entry`=40000);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel) VALUES 
(40000, 196, 10000, 0, 0, 0),
(40000, 197, 10000, 0, 0, 0),
(40000, 198, 10000, 0, 0, 0),
(40000, 199, 10000, 0, 0, 0),
(40000, 200, 10000, 0, 0, 0),
(40000, 201, 10000, 0, 0, 0),
(40000, 202, 10000, 0, 0, 0),
(40000, 227, 10000, 0, 0, 0),
(40000, 264, 10000, 0, 0, 0),
(40000, 1180, 10000, 0, 0, 0),
(40000, 2567, 10000, 0, 0, 0),
(40000, 5011, 10000, 0, 0, 0),
(40000, 15590, 10000, 0, 0, 0);

DELETE FROM `gossip_menu` WHERE (`entry`=40000);
INSERT INTO `gossip_menu` VALUES (40000, 6289, 0, 0, 0, 0, 0, 0);

DELETE FROM `gossip_menu_option` WHERE (`menu_id`=40000);
INSERT INTO `gossip_menu_option` VALUES (40000, 0, 3, 'Neue Waffen lernen', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);



