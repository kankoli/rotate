package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class MasterReadyState extends ReadyState
	{
		override public function create():void 
		{
			super.create();
			
			var txt:FlxText = new FlxText(0, 330, FlxG.width, "Master run!\n" + Utility.MASTERLEVELCOUNT + " random levels.\n" + Utility.MASTERLEVELTIME.toString() + " seconds for each level.");
			txt.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			add(txt);
		}
		
		override protected function switchToPlayState():void 
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MasterPlayState()); } );
		}
	}

}