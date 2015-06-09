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
			
			var txt:FlxText = new FlxText(0, 330, FlxG.width, 
			"You will have " + Utility.MASTERLEVELTIME+ " seconds for first level and 1 less second for each level you pass. ");
			txt.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 11, FlxG.width, "Master run!");
			txt.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 135, FlxG.width, Utility.MASTERLEVELCOUNT + " random levels.");
			txt.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			add(txt);
		}
		
		override protected function switchToPlayState():void 
		{
			FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MasterPlayState()); } );
		}
	}

}