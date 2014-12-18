package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class ReadyState extends FlxState
	{
		private static var countDown:int = 5;
		private var timer:Number;
		private var timeText:FlxText;
		
		override public function create():void 
		{
			super.create();
			timer = countDown;
			
			timeText = new FlxText(0, 180, FlxG.width, "");
			timeText.setFormat(null, 120, Utility.BLOCKCOLOR, "center");
			add(timeText);
			
			var txt:FlxText = new FlxText(0, 50, FlxG.width, "Ready?");
			txt.setFormat(null, 60, Utility.BLOCKCOLOR, "center");
			add(txt);
		}
		
		override public function update():void 
		{
			super.update();
			if (timer > 0)
				timer -= FlxG.elapsed;
			
			timeText.text = (countDown - int(countDown * ((countDown - timer) / countDown))).toString();
			
			if (timer < 0)
			{
				switchToPlayState();
				timeText.text = "0";
			}
		}
		
		protected function switchToPlayState():void
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new PlayState(Utility.getAllMapData(), 0)); } );
		}
	}

}