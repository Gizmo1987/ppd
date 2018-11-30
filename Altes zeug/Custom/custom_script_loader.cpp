/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// This is where scripts' loading functions should be declared:
void AddSC_julieta_la_esperanza();
void AddSC_romeo();
void AddSC_wow_studio_teleporter();
void AddSC_Transmogrification();
void AddSC_wow_back_teleporter();
void AddSC_wow_event_teleporter();
void AddSC_wow_jump_teleporter();
void AddSC_npcs_mini_boss();
void AddSC_wow_pet_teleporter();
void AddSC_wow_pvp_teleporter();
void AddSC_GOMove_commandscript();
void AddSC_Nebelfeuer_la_esperanza();
void AddSC_GuildHouse();



// The name of this function should match:
// void Add${NameOfDirectory}Scripts()
void AddCustomScripts()
{
AddSC_julieta_la_esperanza();
AddSC_wow_pet_teleporter();
AddSC_npcs_mini_boss();
AddSC_wow_back_teleporter();
AddSC_wow_pvp_teleporter();
AddSC_wow_event_teleporter();
AddSC_wow_jump_teleporter();
AddSC_romeo();
AddSC_wow_studio_teleporter();
AddSC_Transmogrification();
AddSC_GOMove_commandscript();
AddSC_Nebelfeuer_la_esperanza();
AddSC_GuildHouse();
}
