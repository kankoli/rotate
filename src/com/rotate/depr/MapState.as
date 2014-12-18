package com.rotate 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class MapState extends FlxState
	{
		private var allMapData:Array;
		private var _maps:FlxGroup;
		private var _backToMenu:Button;
		private var _levelFrame:FlxSprite;
		
		public var _highlight:FlxSprite;
		
		override public function create():void
		{
			_maps = new FlxGroup();
			populateMaps();
			add(_maps);
			
			_backToMenu = new Button("Back", onBackToMenu);
			_backToMenu.x = Utility.BUTTONOFFSETX;
			_backToMenu.y = 405;
			add(_backToMenu);
			
			_levelFrame = new FlxSprite(Utility.MAPOFFSETX - 21, Utility.MAPOFFSETY - 21, Utility.ImgLevelFrame);
			_levelFrame.color = Utility.LEVELFRAMECOLOR;
			add(_levelFrame);
			
			_highlight = new FlxSprite( -100, -100, Utility.ImgHighlight);
			_highlight.color = Utility.BUTTONLABELCOLOR;
			add(_highlight);
			
			FlxG.flash(Utility.FADECOLOR,Utility.FADEDURATION);
		}
		
		public function onBackToMenu():void
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState());} );
		}
		
		protected function populateMaps():void
		{
			allMapData = Utility.getAllMapData();
			
			var offsetx:int = Utility.MAPOFFSETX;
			var offsety:int = Utility.MAPOFFSETY;
			for (var i:int = 0; i < allMapData.length/5; i++) {
				for (var j:int = 0; j < 5 && j < allMapData.length - 5*i; j++) {
					_maps.add(new Map(this, allMapData[i*5+j], offsetx + j * (Utility.BLOCKSIZE) -3, offsety + i * (Utility.BLOCKSIZE)-3, false, false));
				}
			}
		}
		
		public function mapSelected(mapData:MapData):void {
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new PlayState(allMapData, mapData._mapIndex));} );
		}
		
		override public function update():void 
		{
			_highlight.x = -100;
			_highlight.y = -100;
			super.update();
			if (FlxG.mouse.justPressed()) {
				for each (var map:Map in _maps.members)
				{
					map.clicked();
				}
			}
		}
	}

}