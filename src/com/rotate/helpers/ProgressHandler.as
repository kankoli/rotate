package com.rotate.helpers 
{
	import org.flixel.FlxSave;
	
	import flash.display.LoaderInfo;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author kadir
	 */
	public class ProgressHandler 
	{
		private static var save:FlxSave;
		
		private static var kongregate:Boolean = true;
		
		public function ProgressHandler() 
		{
			
		}
		
		public static function init():void
		{
			if (kongregate)
				FlxKongregate.init(apiHasLoaded);
			save = new FlxSave();
			if(save.bind("Rotate"))
			{
				save.data.isMaster = false as Boolean;
				if (save.data.highScoreNormal == null)
				{
					save.data.highScoreNormal = 0 as int;
				}
				if (save.data.highScoreMaster == null)
				{
					save.data.highScoreMaster = 0 as int;
				}
				
				//save.data.highScoreNormal = 0;
				//save.data.highScoreMaster = 0;
			}
		}
		
		private static function apiHasLoaded():void
		{
			FlxKongregate.connect();
			FlxKongregate.submitStats("HighScoreNormal", 0);
			FlxKongregate.submitStats("HighScoreMaster", 0);
		}
		
		public static function getNormalPlayScore():int {
			return save.data.highScoreNormal;
		}
		
		public static function getMasterPlayScore():int {
			return save.data.highScoreMaster;
		}
		
		public static function gotNormalPlayScore(score:int):Boolean {
			if (score < 0)
				score = 0;
			if (kongregate) {
				FlxKongregate.submitStats("HighScoreNormal", score);
				FlxKongregate.submitStats("GameComplete", 1);
			}
			
			if (score > save.data.highScoreNormal) {
				save.data.highScoreNormal = score;
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public static function gotMasterPlayScore(score:int):Boolean {
			if (score < 0)
				score = 0;
				
			if (kongregate) {
				FlxKongregate.submitStats("HighScoreMaster", score);
				FlxKongregate.submitStats("MasterComplete", 1);			
			}
			
			if (score > save.data.highScoreMaster) {
				save.data.highScoreMaster = score;
				return true;
			}
			else
			{
				return false;
			}
		}
	}

}