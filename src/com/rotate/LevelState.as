package com.rotate
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;

	public class LevelState extends FlxState
	{
		protected var _mapData:Array;
		
		//major game object storage
		protected var _level:Level;
		protected var _hud:FlxGroup;
		protected var _levelFrame:FlxSprite;
		protected var _efxSprite:EfxSprite;
		protected var _menuButton:Button;
		
		public function LevelState(mapData:Array = null) {
			super();
			_mapData = mapData;
		}
		
		override public function create():void
		{
			if (_mapData != null) {
				_level = new Level(this, _mapData);
				add(_level);
			}
			
			_hud = new FlxGroup();
			
			_menuButton = new Button("Menu", function():void{FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState()); } );});
			_menuButton.x = Utility.BUTTONOFFSETX;;
			_menuButton.y = 393;
			_hud.add(_menuButton);
			
			_levelFrame = new FlxSprite(Utility.MAPOFFSETX - 21, Utility.MAPOFFSETY - 21, Utility.ImgLevelFrame);
			_levelFrame.color = Utility.LEVELFRAMECOLOR;
			_hud.add(_levelFrame);
			
			_efxSprite = new EfxSprite(Utility.MAPOFFSETX - 12, Utility.MAPOFFSETY - 12, Utility.BLOCKSIZE * 5 + 24, Utility.BLOCKSIZE * 5 + 24);
			_hud.add(_efxSprite);
			
			add(_hud);
			
			FlxG.flash(Utility.FADECOLOR,Utility.FADEDURATION);
		}
		
		public function levelIsFinished():void
		{
			_level._highlight.visible = false;
		}
		
		public function blockClicked(block:Block):void
		{
			
		}
	}
}
