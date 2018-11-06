<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.2" tiledversion="1.2.0" name="test2_tileset" tilewidth="64" tileheight="64" tilecount="64" columns="8">
 <image source="../src/art/test2_tileset.png" width="512" height="512"/>
 <terraintypes>
  <terrain name="Black Walls" tile="6"/>
 </terraintypes>
 <tile id="0" terrain=",,,0"/>
 <tile id="1" terrain=",,0,0"/>
 <tile id="2" terrain=",,0,"/>
 <tile id="3" terrain="0,0,0,"/>
 <tile id="4" terrain="0,0,,"/>
 <tile id="5" terrain="0,0,,0"/>
 <tile id="6" terrain=",,,0"/>
 <tile id="7" terrain=",,0,"/>
 <tile id="8" terrain=",0,,0"/>
 <tile id="9" terrain="0,0,0,0"/>
 <tile id="10" terrain="0,,0,"/>
 <tile id="11" terrain="0,,0,"/>
 <tile id="13" terrain=",0,,0"/>
 <tile id="14" terrain=",0,,"/>
 <tile id="15" terrain="0,,,"/>
 <tile id="16" terrain=",0,,"/>
 <tile id="17" terrain="0,0,,"/>
 <tile id="18" terrain="0,,,"/>
 <tile id="19" terrain="0,,0,0"/>
 <tile id="20" terrain=",,0,0"/>
 <tile id="21" terrain=",0,0,0"/>
 <tile id="31">
  <properties>
   <property name="collision" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="35">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="48">
  <properties>
   <property name="foo" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="56">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <wangsets>
  <wangset name="New Wang Set" tile="-1">
   <wangedgecolor name="" color="#ff0000" tile="-1" probability="1"/>
   <wangedgecolor name="" color="#00ff00" tile="-1" probability="1"/>
  </wangset>
 </wangsets>
</tileset>
