{{KeyDescription

|key=dirtbike:scale
|description=A classification scheme for the difficulty of trails for dirtbikes
|group=properties
|onNode=no
|onWay=yes
|onArea=no
|onRelation=no
|combination=
* {{tag|surface}}
|implies=
|status = draft
}}

A key meant to describe and categorize the conditions of a trail as it relates to a [[Dirt_Bike]].

==Applies to==
*{{Tag|highway|path}}
*{{Tag|highway|track}}

==How to map==

The main key to be used is {{Key|dirtbike:scale}} 1 to 6. This shall be used for classifying the level of conditions of a trail.

This is an attribute that should be placed on a WAY. It is acceptable to either label an entire track/path with a specific dirtbike:scale value or break the track into parts with individual dirtbike:scale values.

It is a 1-6 scale, similar to [[key:mtb:scale]]. Note that the scale is geared towards trail conditions, NOT bike capability.

=== Values ===
{| class="wikitable"
|-
! Tag
! Description
! Skills
! Example
|
| '''dirtbike:scale=1'''
| '''Novice'''
|
* Packed dirt or gravel.
* Very mild (if any) elevation changes.
* No obstacles.
* Wide track or path.
|
| '''dirtbike:scale=2'''
| Beginner
|
* Loose dirt or gravel, possibly well packed sand.
* Completely avoidable obstacles such as small rocks and minor ruts.
* Concrete lanes
* Small creek crossings with no obstacles
* e.g. Mae Khanin river track
* 
|
| '''dirtbike:scale=3'''
| Intermediate
|
* Rutted sections, with minor obstacles like small rocks and roots
* Narrow sections possibly exposed
* Steep sections
* Tight hairpins
* Medium river crossing with minor obstacles
* e.g. Khong Khak Noi to Om Long
|
| '''dirtbike:scale=4'''
| Advanced
|
* Heavily rutted trails, with medium-size obstacles such as rocks, shelves, roots and fallen trees.
* Very slippery, and loose surfaces.
* Very steep sections with very tight hairpins.
* Very narrow and exposed sections.
* Large river crossing with medium-size obstacles
* e.g. Banana Trail, Death Valley
|
| '''dirtbike:scale=5'''
| Pro
|
* Requires trial techniques
* Very large obstacles to climb
* Extremely tight hairpins requiring pivot turns
* Possibly extreme gradients
* Washed out narrow paths heavily exposed
*
|
| '''dirtbike:scale=6'''
| Impassable
|
* Not rideable for any Pro dirtbike/trial riders.
* Often spotting is impossible and falling may be lethal.
* e.g. steps over 2m, rock faces
|}