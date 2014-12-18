package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class FinishedMasterState extends FlxState
	{
		protected var _score:int;
		protected var _hi:Boolean;
		
		protected var gameFinishedText:FlxText;
		protected var button:Button;
		protected var oldHighscore:FlxText
		
		public function FinishedMasterState(score:int, hi:Boolean):void
		{
			super();
			_score = score;
			_hi = hi;
		}
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = Utility.BACKGROUND;
			gameFinishedText = new FlxText(0, 10, FlxG.width, "You finished the master run\nand scored");
			gameFinishedText.setFormat(null, 36, Utility.BLOCKCOLOR, "center");
			add(gameFinishedText);
			
			var txt:FlxText = new FlxText(0, 120, FlxG.width, _score.toString())
			txt.setFormat(null, 72, Utility.TITLECOLOR,"center")
			add(txt);
			
			if (_hi)
			{				
				var flash:FlashEffect = new FlashEffect(txt);
				flash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				add(flash);
				
				txt = new FlxText(0, 250, FlxG.width, "HI-SCORE")
				txt.setFormat(null, 72, Utility.TITLECOLOR,"center")
				add(txt);
				
				flash = new FlashEffect(txt);
				flash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				add(flash);	
			}
			else
			{
				oldHighscore = new FlxText(0, 250, FlxG.width, "Highscore: " + ProgressHandler.getMasterPlayScore().toString());
				oldHighscore.setFormat(null, 36, Utility.TITLECOLOR,"center")
				add(oldHighscore);
			}
			
			button = new Button("Menu", onClick);
			button.x = FlxG.width / 2 - button.width / 2;
			button.y = FlxG.height / 2 + 160;
			add(button);
			
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
		}
		
		protected function onClick():void
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState()); } );
		}
	}

}