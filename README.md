# DEPTH SYSTEM
A depth system for GameMaker Studio 2, which sorts objects based on their y position in the room. Unlike the famous "depth = -y", this system will not move instances out of their current layer, allowing easier organisation of instance and tile layers. 

## NOTE
The only essential elements in this system are **depthsorter** and **par_depthobject**. You may delete everything else.

## ABOUT
The system object **depthsorter** is the one that does the depth sorting. Every step of the game, it fills a depth grid (a grid data structure) with information, storing all the instance IDs and y positions of objects in the room. It does this by referencing any child of the parent **par_depthobject**. Then it sorts the grid based on y position, and loops through and draws all of the instances in order (by having them perform their draw event). Like sticking stickers onto a board, this ensures the instances are drawn in the "correct" order, consistent with our conception of "depth".

## PAR_DEPTHOBJECT
If you want an object to have its depth sorted, you will need to make it a child of the **par_depthobject**. Note that the **par_depthobject** also contains some default events that its children will inherit, so remember to put event_inherited() at the start of these events if applicable: 
#### CREATE EVENT: 
Turn off visibilty (this IS doable manually by unchecking the visible check). This removes the children from the rendering pipeline so that they no longer draw themselves (and are not processed). The depthsorter object will be drawing them. 
#### DRAW EVENT: 
I have put in a default draw event that draws a shadow, and then draws the instance. You may want to simply have the default be draw_self(). Or, you may want to overwrite this event in the children to draw more complex objects.

## DEPTHSORTER
You will need to put the **depthsorter** object in the Instances layer of your room. You may want to make this object persistent, and have it add itself to the correct layer (the layer where the instances are) at the start of every room. 

## TILES
This system does NOT sort tiles. However in the example room, I have put in some examples of how you can still take advantage of tile layers above and below the Instances layer to give the illusion of depth. 
