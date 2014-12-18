package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class FinishedGameState extends FinishedMasterState
	{	
		public function FinishedGameState(score:int, hi:Boolean):void
		{
			super(score, hi);
		}
		
		override public function create():void 
		{
			super.create();
			gameFinishedText.text = "You finished all levels \nand scored";
			
			var save:FlxSave = new FlxSave();
			if(save.bind("Rotate"))
			{
				if (!save.data.isMaster) {
					button.label.text = "Cont.";
					button.onUp = function():void {
						FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new BecameMasterState()); } );
					};
				}
				save.data.isMaster = true;
				save.close();
			}
			
			if (!_hi)
				oldHighscore.text = "Highscore: " + ProgressHandler.getNormalPlayScore();
			
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
		}
	}
}