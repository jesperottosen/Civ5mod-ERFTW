# Civilization 5 mod - Explore Ruins for the Win
![Explorer and treasure chest](https://github.com/jesperottosen/Civ5mod-ERFTW/blob/main/Art/erftw.jpg?raw=true)

## Installation
Via steam on (https://steamcommunity.com/workshop/filedetails/?id=3159199696)
Download the civ5mod file from this repository.

## Mod Design
The goody hut part of this mod is straightforward based on XML from existing mods by **Bloublou** and **Loner Yound**. For further options from the goody huts play as Pocatello or add the **Ancient Ruins Choice** mod. 

After some failed experiments with a build-action and fake improvement, which would trigger the LUA GoodyHuts API that approach was abandoned.  
The current LUA Starts from GameEvents.UnitSetXY then quickly exits if the situation is not valid for the plot, unit, and technology. 
A random outcome is selected and matched to settings for game difficulty. Each outcome has its own function, where a global string helps to track success.
If the upgrade is successful, the plot is cleared and a notification is added.

## Mod Description
Explore Ruins for the Win (**ERFTW**) is about exploring the map and capturing the boosted goody huts and ancient ruins. 
The good huts appear double as much too, so should Ancient ruins.

- Any unit can pick up early goody huts. 
- Explorers are the only ones to explore Ancient Ruins.
- There is an element of randomness to it, so it may take a few tries/turns to explore an Ancient ruin. 
- Explorers eventually upgrades to great war infantry.
- Be aware that AI players can use these too!
- Archaeologists and references to landmarks and dig sites have been removed.

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
