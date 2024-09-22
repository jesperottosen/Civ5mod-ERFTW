# Civilization 5 mod - Explore Ruins for the Win
![Explorer and treasure chest](https://github.com/jesperottosen/Civ5mod-ERFTW/blob/main/Project/Art/erftw.jpg?raw=true)

## Installation
Via steam on (https://steamcommunity.com/workshop/filedetails/?id=3159199696).

Download the civ5mod file from this repository.

## Mod Design
The goody hut part of this mod is straightforward based on XML from existing mods by **Bloublou** and **Loner Yound**. 
For further options from the goody huts play as Pocatello or add the **Ancient Ruins Choice** mod. 

After some failed experiments with a build-action and fake improvement, which would trigger the LUA GoodyHuts API that approach was abandoned. 
The current LUA Starts from GameEvents.UnitSetXY then quickly exits if the situation is not valid for the plot, unit, and technology. 
Each outcome has a function, and returns a text for the notification. If the upgrade is successful, the plot is cleared and a notification is added.
Recent updates include code optimizations.

## Mod Description
Explore Ruins for the Win (**ERFTW**) is about exploring the map and capturing the boosted Goody Huts and Antiquity Sites. 
The good huts appear double as much too, and so should the Ancient ruins.

- Any unit can pick up early goody huts. 
- Explorers are the only ones to explore Antiquity Sites.
- Explorers eventually upgrades to Great War Infantry.
- Be aware that AI players can use these too!
- Archaeologists and references to landmarks and dig sites have been removed.

Options are:
- Settler 
- Scout (Goody only)
- Tech boost (Antiquity only)
- 500 gold
- 200 Culture (Goody only)
- Expanded map reveal (Goody only)
- Experience boost (Antiquity only)
- Unit upgrades

It includes:
- Units - Starting Scout (v 1) by Bloublou
- More Goody Hut (v 9) by Loner Yound
- Units - Scout to Explorer (v 10) by Bloublou
  
