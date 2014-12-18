package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class HighscoreState extends FlxState
	{
		override public function create():void 
		{
			super.create();
			
			var txt:FlxText = new FlxText(0, 100, FlxG.width, "HI-SCORES");
			txt.setFormat(null, 70, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 230, FlxG.width, "Normal Mode: " + ProgressHandler.getNormalPlayScore());
			txt.setFormat(null, 36, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 290, FlxG.width, "Master Mode: " + ProgressHandler.getMasterPlayScore());
			txt.setFormat(null, 36, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			var _menuButton:Button = new Button("Menu", function():void{FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState()); } );});
			_menuButton.x = (FlxG.width - _menuButton.width) / 2;
			_menuButton.y = 393;
			add(_menuButton);
			
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
		}
	}

}