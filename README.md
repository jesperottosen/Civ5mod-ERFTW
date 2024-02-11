# Civ5mod-ERFTW

## Installation

## Mod Design
The goody hut part of this mod is straight forward based on XML from existing mods by **Bloublou** and **Loner Yound**. 
Initially it included **Ancient Ruins Choice** too, but as the Artifact bonus currently is not selected, but random - I opted for the goody huts to be random too.

After some failed experiments with a BUILD_ARTIFACT and IMPROVEMENT_EXPLORATION for EXPLORERS that would trigger the LUA GoodyHuts API the current LUA Starts from GameEvents.UnitSetXY. 
For better perfromance it exits if the situaion is not valid wrt Unit type and ressource type.

## Mod Description
Explore Ruins for the win (**ERFTW**) is about exploring the map and capturing the boosted goody huts and ancient ruins. 
The good huts are appearing double as much too, so should Ancient ruins.

- Any unit can pick up early goody huts. 
- Explorers are the only one to explore Ancient Ruins.
- There is an elemt of randomness to it, so it may take a few tries/turns to explore an Ancient ruin. 
- Explorers eventually upgrade to great war infantry.
- Be aware that AI players can use these too!
- Archaologist have been removed as well as all references to landmarks and dig sites.

Options are:
- Settler 
- Scout (goody huts only)
- Tech boost (Artifact only)
- 250 gold
- 200 Culture (Goody huts only)
- Expanded map reveal (Goody huts only)
- Experience boost (Artifacts only)
- Unit upgrades
These options are scaled based on game difficulty.

It includes:
- Units - Starting Scout (v 1) by Bloublou
- More Goody Hut (v 9) by Loner Yound
- Units - Scout to Explorer (v 10) by Bloublou 
It can be played with "Promotions - Ancient Ruins Choice" by Bloublou 
