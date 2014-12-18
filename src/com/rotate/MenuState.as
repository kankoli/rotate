package com.rotate
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		public var playButton:Button;
		public var randButton:Button;
		
		override public function create():void
		{
			FlxG.bgColor = Utility.BACKGROUND;
			
			//Simple use of flixel save game object.
			//Tracks number of times the game has been played.

			var txt:FlxText = new FlxText(0, 20, FlxG.width, "ROTATE")
			txt.setFormat(null, 100, Utility.TITLECOLOR,"center")
			add(txt);
			
			playButton = new Button("Play", onPlay);
			playButton.x = (FlxG.width - playButton.width) / 2;
			playButton.y = 213;
			add(playButton);
			
			randButton = new Button("Rand.", onRand);
			randButton.x = (FlxG.width - randButton.width) / 2;
			randButton.y = playButton.y + 60;
			add(randButton);
			
			var highscoreButton:Button = new Button("Hi-Sc.", onHiscore);
			highscoreButton.x = (FlxG.width - highscoreButton.width) / 2;
			highscoreButton.y = playButton.y + 120;
			add(highscoreButton);
			
			var aboutButton:Button = new Button("About", onAbout);
			aboutButton.x = (FlxG.width - aboutButton.width) / 2;
			aboutButton.y = playButton.y + 180;
			add(aboutButton);
			
			var genButton:Button = new Button("Gen", onGen);
			genButton.x = 50;
			genButton.y = playButton.y + 180;
			genButton.x = -200;
			genButton.y = -200;
			add(genButton);
			
		/*	var forTheMaster:FlxSprite = new FlxSprite((FlxG.width + randButton.width) / 2 + 10, playButton.y + 25, Utility.ImgForTheMaster);
			add(forTheMaster);
			
			var flash:FlashEffect = new FlashEffect(forTheMaster);
			flash.startFlash(Utility.BLOCKCOLOR, 0xFFFFFFFF, 6);
			add(flash);
			*/
			var star1:FlxSprite = new FlxSprite((FlxG.width + randButton.width) / 2 - 210, playButton.y + 32, Utility.ImgStar);
			add(star1);
			
			var flash:FlashEffect = new FlashEffect(star1);
			flash.startFlash(Utility.BLOCKCOLOR, 0xFFFFFFFF, 8);
			add(flash);
			
			var star2:FlxSprite = new FlxSprite((FlxG.width + randButton.width) / 2 - 22, playButton.y + 32, Utility.ImgStar);
			add(star2);
			
			flash = new FlashEffect(star2);
			flash.startFlash(Utility.BLOCKCOLOR, 0xFFFFFFFF, 8);
			add(flash);
			
			FlxG.mouse.show(Utility.ImgCursor);
			
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
			
			var save:FlxSave = new FlxSave();
			if(save.bind("Rotate"))
			{
				randButton.visible = save.data.isMaster;
				star1.visible = save.data.isMaster;
				star2.visible = save.data.isMaster;
				save.close();
			}
		}
		
		protected function onPlay():void
		{
			FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new TutorialState());});
		}
		
		protected function onRand():void
		{
			FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new MasterReadyState());});
		}
		
		protected function onHiscore():void 
		{
			FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new HighscoreState());});
		}
		
		protected function onAbout():void 
		{
			FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new AboutState());});
		}
		
		protected function onGen():void 
		{
			FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new GeneratorState());});
		}
	}
}
