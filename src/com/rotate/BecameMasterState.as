package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class BecameMasterState extends FlxState
	{		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = Utility.BACKGROUND;
			var gameFinishedText:FlxText = new FlxText(0, 45, FlxG.width, "You became...\n\n\n\n\n\n\n\nSee your present ->      -");
			gameFinishedText.setFormat(null, 36, Utility.BLOCKCOLOR, "center");
			add(gameFinishedText);
			
			var txt:FlxText = new FlxText(0, 120, FlxG.width, "MASTER\nOF")
			txt.setFormat(null, 72, Utility.TITLECOLOR,"center")
			add(txt);
			
			var flash:FlashEffect = new FlashEffect(txt);
			flash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
			add(flash);
			
			txt = new FlxText(0, 300, FlxG.width, "ROTATE")
			txt.setFormat(null, 72, Utility.TITLECOLOR,"center")
			add(txt);
			
			flash = new FlashEffect(txt);
			flash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
			add(flash);
			
			var button:Button = new Button("Menu", onMenu);
			button.x = 490;
			button.y = 405;
			add(button);
			
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
		}
		
		private function onMenu():void
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState()); } );
		}
	}

}