UPDATE `quest_template` set
    `LogTitle`= REPLACE(`LogTitle`,"ß", "�"),
    `LogTitle`= REPLACE(`LogTitle`, "ä", "�"),
    `LogTitle`= REPLACE(`LogTitle`, "ü", "�"),
    `LogTitle`= REPLACE(`LogTitle`, "ö", "�"),
    `LogTitle`= REPLACE(`LogTitle`, 'Ä', '�'),
    `LogTitle`= REPLACE(`LogTitle`, "Ü", "�"),
    `LogTitle`= REPLACE(`LogTitle`, "Ö", "�"),
    `LogTitle`= REPLACE(`LogTitle`, '€', '�');
	
	UPDATE `game_tele` set
    `name`= REPLACE(`name`,"ß", "�"),
    `name`= REPLACE(`name`, "ä", "�"),
    `name`= REPLACE(`name`, "ü", "�"),
    `name`= REPLACE(`name`, "ö", "�"),
    `name`= REPLACE(`name`, 'Ä', '�'),
    `name`= REPLACE(`name`, "Ü", "�"),
    `name`= REPLACE(`name`, "Ö", "�"),
    `name`= REPLACE(`name`, '€', '�');
	
	UPDATE `quest_template` set
    `Objectives`= REPLACE(`Objectives`,"ß", "�"),
    `Objectives`= REPLACE(`Objectives`, "ä", "�"),
    `Objectives`= REPLACE(`Objectives`, "ü", "�"),
    `Objectives`= REPLACE(`Objectives`, "ö", "�"),
    `Objectives`= REPLACE(`Objectives`, 'Ä', '�'),
    `Objectives`= REPLACE(`Objectives`, "Ü", "�"),
    `Objectives`= REPLACE(`Objectives`, "Ö", "�"),
    `Objectives`= REPLACE(`Objectives`, '€', '�');
	
	UPDATE `quest_template` set
    `Details`= REPLACE(`Details`,"ß", "�"),
    `Details`= REPLACE(`Details`, "ä", "�"),
    `Details`= REPLACE(`Details`, "ü", "�"),
    `Details`= REPLACE(`Details`, "ö", "�"),
    `Details`= REPLACE(`Details`, 'Ä', '�'),
    `Details`= REPLACE(`Details`, "Ü", "�"),
    `Details`= REPLACE(`Details`, "Ö", "�"),
    `Details`= REPLACE(`Details`, '€', '�');
	
	UPDATE `quest_template` set
    `EndText`= REPLACE(`EndText`,"ß", "�"),
    `EndText`= REPLACE(`EndText`, "ä", "�"),
    `EndText`= REPLACE(`EndText`, "ü", "�"),
    `EndText`= REPLACE(`EndText`, "ö", "�"),
    `EndText`= REPLACE(`EndText`, 'Ä', '�'),
    `EndText`= REPLACE(`EndText`, "Ü", "�"),
    `EndText`= REPLACE(`EndText`, "Ö", "�"),
    `EndText`= REPLACE(`EndText`, '€', '�');
	
	UPDATE `quest_template` set
    `OfferRewardText`= REPLACE(`OfferRewardText`,"ß", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, "ä", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, "ü", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, "ö", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, 'Ä', '�'),
    `OfferRewardText`= REPLACE(`OfferRewardText`, "Ü", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, "Ö", "�"),
    `OfferRewardText`= REPLACE(`OfferRewardText`, '€', '�');
	
	UPDATE `quest_template` set
    `RequestItemsText`= REPLACE(`RequestItemsText`,"ß", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, "ä", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, "ü", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, "ö", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, 'Ä', '�'),
    `RequestItemsText`= REPLACE(`RequestItemsText`, "Ü", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, "Ö", "�"),
    `RequestItemsText`= REPLACE(`RequestItemsText`, '€', '�');
	
		UPDATE `quest_template` set
    `CompletedText`= REPLACE(`CompletedText`,"ß", "�"),
    `CompletedText`= REPLACE(`CompletedText`, "ä", "�"),
    `CompletedText`= REPLACE(`CompletedText`, "ü", "�"),
    `CompletedText`= REPLACE(`CompletedText`, "ö", "�"),
    `CompletedText`= REPLACE(`CompletedText`, 'Ä', '�'),
    `CompletedText`= REPLACE(`CompletedText`, "Ü", "�"),
    `CompletedText`= REPLACE(`CompletedText`, "Ö", "�"),
    `CompletedText`= REPLACE(`CompletedText`, '€', '�');


UPDATE `creature_template` set
    `name`= REPLACE(`name`,"ß", "�"),
    `name`= REPLACE(`name`, "ä", "�"),
    `name`= REPLACE(`name`, "ü", "�"),
    `name`= REPLACE(`name`, "ö", "�"),
    `name`= REPLACE(`name`, 'Ä', '�'),
    `name`= REPLACE(`name`, "Ü", "�"),
    `name`= REPLACE(`name`, "Ö", "�"),
    `name`= REPLACE(`name`, '€', '�');

	UPDATE `creature_template` set
    `subname`= REPLACE(`subname`,"ß", "�"),
    `subname`= REPLACE(`subname`, "ä", "�"),
    `subname`= REPLACE(`subname`, "ü", "�"),
    `subname`= REPLACE(`subname`, "ö", "�"),
    `subname`= REPLACE(`subname`, 'Ä', '�'),
    `subname`= REPLACE(`subname`, "Ü", "�"),
    `subname`= REPLACE(`subname`, "Ö", "�"),
    `subname`= REPLACE(`subname`, '€', '�');



UPDATE `locales_creature` set
    `name_loc3`= REPLACE(`name_loc3`,"ß", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ä", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, 'Ä', '�'),
    `name_loc3`= REPLACE(`name_loc3`, "Ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "Ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, '€', '�');

UPDATE `locales_creature` set
    `subname_loc3`= REPLACE(`subname_loc3`,"ß", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, "ä", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, "ü", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, "ö", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, 'Ä', '�'),
    `subname_loc3`= REPLACE(`subname_loc3`, "Ü", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, "Ö", "�"),
    `subname_loc3`= REPLACE(`subname_loc3`, '€', '�');




UPDATE `locales_achievement_reward` set
    `subject_loc3`= REPLACE(`subject_loc3`,"ß", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, "ä", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, "ü", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, "ö", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, 'Ä', '�'),
    `subject_loc3`= REPLACE(`subject_loc3`, "Ü", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, "Ö", "�"),
    `subject_loc3`= REPLACE(`subject_loc3`, '€', '�');

UPDATE `locales_achievement_reward` set
    `text_loc3`= REPLACE(`text_loc3`,"ß", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ä", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ü", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ö", "�"),
    `text_loc3`= REPLACE(`text_loc3`, 'Ä', '�'),
    `text_loc3`= REPLACE(`text_loc3`, "Ü", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "Ö", "�"),
    `text_loc3`= REPLACE(`text_loc3`, '€', '�');





UPDATE `locales_creature_text` set
    `text_loc3`= REPLACE(`text_loc3`,"ß", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ä", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ü", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "ö", "�"),
    `text_loc3`= REPLACE(`text_loc3`, 'Ä', '�'),
    `text_loc3`= REPLACE(`text_loc3`, "Ü", "�"),
    `text_loc3`= REPLACE(`text_loc3`, "Ö", "�"),
    `text_loc3`= REPLACE(`text_loc3`, '€', '�');




UPDATE `locales_gameobject` set
    `name_loc3`= REPLACE(`name_loc3`,"ß", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ä", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, 'Ä', '�'),
    `name_loc3`= REPLACE(`name_loc3`, "Ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "Ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, '€', '�');






UPDATE `locales_gossip_menu_option` set
    `option_text_loc3`= REPLACE(`option_text_loc3`,"ß", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, "ä", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, "ü", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, "ö", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, 'Ä', '�'),
    `option_text_loc3`= REPLACE(`option_text_loc3`, "Ü", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, "Ö", "�"),
    `option_text_loc3`= REPLACE(`option_text_loc3`, '€', '�');

UPDATE `locales_gossip_menu_option` set
    `box_text_loc3`= REPLACE(`box_text_loc3`,"ß", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, "ä", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, "ü", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, "ö", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, 'Ä', '�'),
    `box_text_loc3`= REPLACE(`box_text_loc3`, "Ü", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, "Ö", "�"),
    `box_text_loc3`= REPLACE(`box_text_loc3`, '€', '�');





UPDATE `locales_item` set
    `name_loc3`= REPLACE(`name_loc3`,"ß", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ä", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, 'Ä', '�'),
    `name_loc3`= REPLACE(`name_loc3`, "Ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "Ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, '€', '�');





UPDATE `locales_npc_text` set
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`,"ß", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, "ä", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, "ü", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, "ö", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, 'Ä', '�'),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, "Ü", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, "Ö", "�"),
    `Text0_0_loc3`= REPLACE(`Text0_0_loc3`, '€', '�');

UPDATE `locales_npc_text` set
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`,"ß", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, "ä", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, "ü", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, "ö", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, 'Ä', '�'),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, "Ü", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, "Ö", "�"),
    `Text0_1_loc3`= REPLACE(`Text0_1_loc3`, '€', '�');





UPDATE `locales_page_text` set
    `Text_loc3`= REPLACE(`Text_loc3`,"ß", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, "ä", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, "ü", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, "ö", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, 'Ä', '�'),
    `Text_loc3`= REPLACE(`Text_loc3`, "Ü", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, "Ö", "�"),
    `Text_loc3`= REPLACE(`Text_loc3`, '€', '�');






UPDATE `locales_points_of_interest` set
    `icon_name_loc3`= REPLACE(`icon_name_loc3`,"ß", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, "ä", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, "ü", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, "ö", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, 'Ä', '�'),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, "Ü", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, "Ö", "�"),
    `icon_name_loc3`= REPLACE(`icon_name_loc3`, '€', '�');






UPDATE `locales_creature` set
    `name_loc3`= REPLACE(`name_loc3`,"ß", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ä", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, 'Ä', '�'),
    `name_loc3`= REPLACE(`name_loc3`, "Ü", "�"),
    `name_loc3`= REPLACE(`name_loc3`, "Ö", "�"),
    `name_loc3`= REPLACE(`name_loc3`, '€', '�');






UPDATE `locales_quest` set
    `Title_loc3`= REPLACE(`Title_loc3`,"ß", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, "ä", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, "ü", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, "ö", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, 'Ä', '�'),
    `Title_loc3`= REPLACE(`Title_loc3`, "Ü", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, "Ö", "�"),
    `Title_loc3`= REPLACE(`Title_loc3`, '€', '�');

UPDATE `locales_quest` set
    `Details_loc3`= REPLACE(`Details_loc3`,"ß", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, "ä", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, "ü", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, "ö", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, 'Ä', '�'),
    `Details_loc3`= REPLACE(`Details_loc3`, "Ü", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, "Ö", "�"),
    `Details_loc3`= REPLACE(`Details_loc3`, '€', '�');


UPDATE `locales_quest` set
    `Objectives_loc3`= REPLACE(`Objectives_loc3`,"ß", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, "ä", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, "ü", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, "ö", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, 'Ä', '�'),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, "Ü", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, "Ö", "�"),
    `Objectives_loc3`= REPLACE(`Objectives_loc3`, '€', '�');


UPDATE `locales_quest` set
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`,"ß", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, "ä", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, "ü", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, "ö", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, 'Ä', '�'),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, "Ü", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, "Ö", "�"),
    `OfferRewardText_loc3`= REPLACE(`OfferRewardText_loc3`, '€', '�');

UPDATE `locales_quest` set
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`,"ß", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, "ä", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, "ü", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, "ö", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, 'Ä', '�'),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, "Ü", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, "Ö", "�"),
    `RequestItemsText_loc3`= REPLACE(`RequestItemsText_loc3`, '€', '�');


UPDATE `locales_quest` set
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`,"ß", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, "ä", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, "ü", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, "ö", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, 'Ä', '�'),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, "Ü", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, "Ö", "�"),
    `CompletedText_loc3`= REPLACE(`CompletedText_loc3`, '€', '�');

UPDATE `locales_quest` set
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`,"ß", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, "ä", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, "ü", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, "ö", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, 'Ä', '�'),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, "Ü", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, "Ö", "�"),
    `ObjectiveText1_loc3`= REPLACE(`ObjectiveText1_loc3`, '€', '�');