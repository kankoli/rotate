package com.rotate.helpers 
{
	import org.flixel.FlxRect;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	
	import com.rotate.objects.Block;
	/**
	 * ...
	 * @author kadir
	 */
	public class Utility 
	{	
		public static var BLOCKSIZE:int = 72;
		public static var BLOCKHIGHLIGHTOFFSET:int = 6;
		
		public static var MAPOFFSETY:int = (480 - 5 * BLOCKSIZE) / 2;
		public static var MAPOFFSETX:int = 640 - 5 * BLOCKSIZE - ((480 - 5 * BLOCKSIZE) / 2);
		
		public static var MASTERLEVELTIME:Number = 50;
		public static var MASTERLEVELCOUNT:int = 40;
		
		[Embed(source = "../data/facebook_button.png")] public static var ImgFacebook:Class;
		[Embed(source = "../data/twitter_button.png")] public static var ImgTwitter:Class;
		[Embed(source = "../data/turp_button.png")] public static var ImgTurp:Class;
		[Embed(source = "../data/logoframe.png")] public static var ImgLogoFrame:Class;
		
		[Embed(source = "../data/levelframe.png")] public static var ImgLevelFrame:Class;
		[Embed(source = "../data/efxsprite.png")] public static var ImgEfxSprite:Class;
		[Embed(source = "../data/whitedot.png")] public static var ImgWhiteDot:Class;
		
		[Embed(source = "../data/H.png")] public static var ImgHighlight:Class;
		[Embed(source = "../data/1.png")] public static var ImgRoad1:Class;
		[Embed(source = "../data/2C.png")] public static var ImgRoad2C:Class;
		[Embed(source = "../data/2S.png")] public static var ImgRoad2S:Class;
		[Embed(source = "../data/3.png")] public static var ImgRoad3:Class;
		[Embed(source = "../data/4.png")] public static var ImgRoad4:Class;
		
		[Embed(source = "../data/cursor.png")] public static var ImgCursor:Class;
		
		[Embed(source = "../data/button.png")] public static var ImgButton:Class;
		
		[Embed(source = "../data/mapframe2.png")] public static var ImgMapFrame:Class;
		
		[Embed(source = "../data/unconneast.png")] public static var ImgUnconnEast:Class;
		[Embed(source = "../data/unconnnorth.png")] public static var ImgUnconnNorth:Class;
		[Embed(source = "../data/unconnwest.png")] public static var ImgUnconnWest:Class;
		[Embed(source = "../data/unconnsouth.png")] public static var ImgUnconnSouth:Class;
		
		[Embed(source = "../data/tutarrow.png")] public static var ImgTutArrow:Class;
		[Embed(source = "../data/tutclick.png")] public static var ImgTutClick:Class;
		[Embed(source = "../data/tutoksign.png")] public static var ImgOkSign:Class;
		
		[Embed(source = "../data/forthemaster2.png")] public static var ImgForTheMaster:Class;
		[Embed(source = "../data/star.png")] public static var ImgStar:Class;
		
		public static var FADEDURATION:Number = 0.3;
		
		public static var BUTTONWIDTH:int = 130;
		public static var BUTTONHEIGHT:int = 49;
		public static var BUTTONOFFSETX:int = 35;
		
		public static var TITLECOLOR:uint = WASABI1;
		public static var BACKGROUND:uint = WASABI5;
		public static var FADECOLOR:uint = WASABI5;
		public static var BUTTONCOLOR:uint = WASABI3;
		public static var BUTTONLABELCOLOR:uint = WASABI1;
		public static var BLOCKCOLOR:uint = WASABI1;
		public static var HIGHLIGHTCOLOR:uint = WASABI3;
		public static var UNCONNCOLOR:uint = WASABI5;
		public static var LEVELFRAMECOLOR:uint = 0xFFFFFFFF;
		public static var LAST5SECCOLOR:uint = WASABI2;
		/*public static var TITLECOLOR:uint = MACHINE1;
		public static var BACKGROUND:uint = MACHINE5;
		public static var FADECOLOR:uint = MACHINE1;
		public static var BUTTONCOLOR:uint = MACHINE3;
		public static var BUTTONLABELCOLOR:uint = MACHINE1;
		public static var BLOCKCOLOR:uint = MACHINE1;
		public static var HIGHLIGHTCOLOR:uint = MACHINE2;*/
		
		// http://www.colourlovers.com/palette/940086/mystery_machine
		private static var MACHINE1:uint = 0xFF554236;
		private static var MACHINE2:uint = 0xFFF77825;
		private static var MACHINE3:uint = 0xFFD3CE3D;
		private static var MACHINE4:uint = 0xFFF1EFA5;
		private static var MACHINE5:uint = 0xFF60B99A;
		
		// http://www.colourlovers.com/palette/482416/Wasabi_Suicide
		private static var WASABI1:uint = 0xFFFF4242;
		private static var WASABI2:uint = 0xFFF4FAD2;
		private static var WASABI3:uint = 0xFFD4EE5E;
		private static var WASABI4:uint = 0xFFE1EDB9;
		private static var WASABI5:uint = 0xFFF0F2EB;
		
		public function Utility() 
		{
			
		}
		
		/*mapData = new MapData([
			[0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0]], index, 30);
			allMapData.push(mapData);
			index++;
		*/	
		public static function getAllMapData():Array 
		{
			var allMapData:Array = [];
			
			var index:int = 0;
			var mapData:MapData;
			
			// test finish
			
			// glass
			mapData = new MapData([
			[0, 1, 0, 1, 0],
			[0, 3, 0, 3, 0],
			[0, 2, 4, 2, 0],
			[0, 0, 3, 0, 0],
			[0, 1, 4, 1, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// trident
			mapData = new MapData([
			[0, 1, 1, 1, 0],
			[0, 2, 5, 2, 0],
			[0, 0, 3, 0, 0],
			[0, 0, 3, 0, 0],
			[0, 0, 1, 0, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// T
			mapData = new MapData([
			[2, 3, 3, 3, 2], 
			[3, 0, 0, 0, 3], 
			[2, 2, 0, 2, 2], 
			[0, 3, 0, 3, 0], 
			[0, 2, 3, 2, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// crosshair
			mapData = new MapData([
			[2, 1, 0, 1, 2],
			[1, 0, 1, 0, 1],
			[0, 1, 5, 1, 0],
			[1, 0, 1, 0, 1],
			[2, 1, 0, 1, 2]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// umut sarikaya
			mapData = new MapData([
			[1, 3, 3, 3, 1],
			[2, 2, 0, 2, 2],
			[2, 2, 0, 2, 2],
			[2, 3, 3, 3, 1],
			[2, 3, 3, 3, 1]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// celtic
			mapData = new MapData([
			[0, 1, 4, 4, 2], 
			[1, 0, 2, 5, 4], 
			[4, 2, 0, 2, 4], 
			[4, 5, 2, 0, 1], 
			[2, 4, 4, 1, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// ibo
			mapData = new MapData([
			[1, 3, 3, 3, 1],
			[1, 2, 2, 2, 2],
			[3, 4, 4, 3, 3],
			[1, 2, 2, 2, 2],
			[1, 3, 3, 3, 1]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// ship
			mapData = new MapData([
			[0, 2, 3, 4, 1],
			[0, 3, 0, 3, 0],
			[0, 2, 3, 5, 1],
			[1, 0, 0, 3, 1],
			[2, 3, 3, 4, 2]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// rabbit
			mapData = new MapData([
			[0, 0, 0, 1, 1],
			[2, 3, 3, 4, 4],
			[4, 2, 0, 2, 2],
			[2, 4, 1, 2, 1],
			[1, 3, 3, 3, 1]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// mouse
			mapData = new MapData([
			[2, 2, 0, 2, 2],
			[2, 5, 4, 5, 2],
			[1, 5, 4, 5, 1],
			[0, 2, 4, 2, 0],
			[0, 0, 1, 0, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// deer
			mapData = new MapData([
			[0, 0, 1, 2, 0], 
			[0, 0, 1, 5, 2], 
			[2, 3, 3, 5, 2], 
			[4, 3, 3, 4, 0], 
			[1, 0, 0, 1, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// classroom
			mapData = new MapData([
			[0, 0, 0, 0, 1],
			[1, 0, 1, 0, 3],
			[4, 1, 4, 1, 3],
			[4, 2, 4, 2, 1],
			[1, 1, 1, 1, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// dog and ball
			mapData = new MapData([
			[0, 0, 1, 1, 0], 
			[0, 0, 4, 4, 2], 
			[2, 1, 4, 3, 2], 
			[4, 3, 4, 2, 2], 
			[1, 0, 1, 2, 2]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// random
			mapData = new MapData([
			[2, 2, 2, 2, 0],
			[3, 3, 2, 2, 1],
			[3, 4, 3, 3, 4],
			[3, 3, 2, 2, 1],
			[1, 1, 1, 1, 0]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// random
			mapData = new MapData([
			[0, 1, 4, 1, 1],
			[1, 3, 2, 1, 3],
			[2, 4, 2, 1, 3],
			[4, 2, 3, 2, 4],
			[2, 3, 2, 2, 2]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// random
			mapData = new MapData([
			[0, 0, 1, 2, 1],
			[0, 2, 5, 4, 1],
			[2, 4, 2, 4, 2],
			[2, 3, 4, 5, 2],
			[0, 0, 1, 1, 1]], index, 30);
			allMapData.push(mapData);
			index++;
			
			// random
			mapData = new MapData([
			[0, 2, 2, 1, 1],
			[0, 2, 4, 3, 2],
			[1, 1, 1, 1, 2],
			[1, 1, 1, 0, 0],
			[1, 1, 1, 3, 1]], index, 30);
			allMapData.push(mapData);
			index++;
			
			return allMapData;
		}
		
		/* considering the connections of a 5x5 board excluding the outermost connections
		 * (i.e. only the connections that are shared). 5 rows of 4 for east-west connections,
		 * 4 rows of 5 for north-south connections. assigning them together, then translating 
		 * that matrix to block matrix.
		 */
		public static function randMap():Array {
			var connectionsMap:Array = [];
			for (var i:int = 0; i < 5; i++) {
				connectionsMap.push([]);
				for (var j:int = 0; j < 5; j++) {
					connectionsMap[i].push(new Array(false, false, false, false));
				}
			}
			
			var fours:Array = [];
			for (i = 0; i < 5; i++) {
				fours.push([]);
				for (j = 0; j < 4; j++) {
					if (randBool()) {
						connectionsMap[i][j][Connection.EAST] = true;
						connectionsMap[i][j + 1][Connection.WEST] = true;
					}
				}
			}
			
			var fives:Array = [];
			for (i = 0; i < 4; i++) {
				fives.push([]);
				for (j = 0; j < 5; j++) {
					if (randBool()) {
						connectionsMap[i][j][Connection.SOUTH] = true;
						connectionsMap[i+1][j][Connection.NORTH] = true;	
					}
				}
			}
			
			var map:Array = [];
			var trues:int;
			for (i = 0; i < 5; i++) {
				map.push([]);
				for (j = 0; j < 5; j++) {
					trues = 0;
					for (var k:int = 0; k < 4; k++) {
						if (connectionsMap[i][j][k])
							trues++;
					}
					if (trues == 0)
						map[i][j] = Block.CONN0;
					else if (trues == 1)
						map[i][j] = Block.CONN1;
					else if (trues == 2) {
						if (connectionsMap[i][j][0] && connectionsMap[i][j][1] ||
						connectionsMap[i][j][1] && connectionsMap[i][j][2] ||
						connectionsMap[i][j][2] && connectionsMap[i][j][3] ||
						connectionsMap[i][j][3] && connectionsMap[i][j][0] ) // curved
						{
						map[i][j] = Block.CONN2CRV;
						}
						else { // straight
							map[i][j] = Block.CONN2STR;
						}
					}
					else if (trues == 3)
						map[i][j] = Block.CONN3;
					else if (trues == 4)
						map[i][j] = Block.CONN4;
				}
			}
			return map;
		}
		
		private static function randBool():Boolean {
			var r:Number = FlxG.random();
			r *= 40;
			r %= 2;
			if (int(r) == 0)
				return false;
			return true;
		}
		
		public static function pointInFlxRect(point:FlxPoint, rect:FlxRect):Boolean
		{
			if (point.x > rect.x && point.x <= rect.right && point.y > rect.y && point.y <= rect.bottom)
			{
				return true;
			}
			
			return false;
		}
	}

}