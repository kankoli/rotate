package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class TutorialState extends FlxState
	{
		private var cursor:FlxSprite;
		
		private var highlight:FlxSprite;
		private var block1:FlxSprite;
		private var block2:FlxSprite;
		private var link1East:FlxSprite;
		private var link1North:FlxSprite;
		private var link2East:FlxSprite;
		
		private var okSign:FlxSprite;
		private var okSignFlash:FlashEffect;
		
		private var arrow:FlxSprite;
		private var arrowFlash:FlashEffect;
		
		private var click:FlxSprite;
		private var clickFlash:FlashEffect;
		
		private var flashArr:Array;
		private var timer:Number;
		private var switchTime:Number;
		private var state:int;
		
		override public function create():void 
		{
			super.create();
			
			var contButton:Button = new Button("Cont.", function():void{FlxG.fade(Utility.FADECOLOR,Utility.FADEDURATION,function():void{FlxG.switchState(new ReadyState());});});
			contButton.x = FlxG.width / 2 - contButton.width / 2;
			contButton.y = FlxG.height / 2 + 160;
			add(contButton);
			
			var txt:FlxText = new FlxText(0, 40, FlxG.width, "Click to rotate parts.\nConnect all parts\nso no jagged edges remain.");
			txt.setFormat(null, 32, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 300, FlxG.width, "Solve all levels to unlock the master mode...");
			txt.setFormat(null, 32, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			var block1X:int = FlxG.width / 2;
			var block1Y:int = FlxG.height / 2 - 30;
			var block2X:int = block1X-72;
			var block2Y:int = block1Y;
			
			block1 = new FlxSprite(block1X, block1Y);
			block1.loadGraphic(Utility.ImgRoad1, true, false, Utility.BLOCKSIZE, Utility.BLOCKSIZE);
			block1.color = Utility.BLOCKCOLOR;
			block1.addAnimation("0", [0], 5);
			block1.addAnimation("1", [1], 5);
			block1.addAnimation("2", [2], 5);
			block1.addAnimation("3", [3], 5);
			
			link1East = new FlxSprite(block1X, block1Y, Utility.ImgUnconnEast);
			link1East.color = Utility.UNCONNCOLOR;
			
			link1North = new FlxSprite(block1X, block1Y, Utility.ImgUnconnNorth);
			link1North.color = Utility.UNCONNCOLOR;
			
			highlight = new FlxSprite(block1X - 6, block1Y - 6, Utility.ImgHighlight);
			highlight.color = Utility.BUTTONCOLOR;
			
			cursor = new FlxSprite(block1X + Utility.BLOCKSIZE / 2, block1Y + 60, Utility.ImgCursor);
			
			block2 = new FlxSprite(block2X, block2Y);
			block2.color = Utility.BLOCKCOLOR;
			block2.loadGraphic(Utility.ImgRoad1, true, false, Utility.BLOCKSIZE, Utility.BLOCKSIZE);
			block2.addAnimation("0", [0], 5);
			block2.addAnimation("1", [1], 5);
			block2.addAnimation("2", [2], 5);
			block2.addAnimation("3", [3], 5);
			block2.play("0");
			
			link2East = new FlxSprite(block2X, block2Y, Utility.ImgUnconnEast);
			link2East.color = Utility.UNCONNCOLOR;
			
			click = new FlxSprite(block1X - 5, block1Y - 70, Utility.ImgTutClick);
			clickFlash = new FlashEffect(click);
			
			arrow = new FlxSprite(block1X - 10, block1Y - 50, Utility.ImgTutArrow);
			arrowFlash = new FlashEffect(arrow);
			
			okSign = new FlxSprite(block1X - 10, block1Y + 60, Utility.ImgOkSign);
			okSignFlash = new FlashEffect(okSign);
			
			add(block1);
			add(link1East);
			add(link1North);
			add(block2);
			add(link2East);
			
			add(highlight);
			add(cursor);
			
			add(click);
			add(clickFlash)
			add(arrow);
			add(arrowFlash)
			add(okSign);
			add(okSignFlash)
			
			switchTime = 1;
			timer = switchTime;
			state = 0;
			switchState();
		}
		
		private function switchState():void 
		{
			if (state == 0) {
				block1.play("0");
				link1East.visible = true;
				link1North.visible = false;
				link2East.visible = true;
				
				okSignFlash.stopFlash();
				okSign.visible = false;
				arrowFlash.stopFlash();
				clickFlash.stopFlash();
				arrow.visible = false;
				click.visible = false;
				state++;
				
				highlight.visible = true;
				cursor.visible = true;
			}
			else if (state == 1) {
				clickFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				arrowFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				click.visible = true;
				arrow.visible = true;
				state++;
			}
			else if (state == 2) {
				arrowFlash.stopFlash();
				clickFlash.stopFlash();
				arrow.visible = false;
				click.visible = false;
				state++;
				
				block1.play("1");
				link1East.visible = false;
				link1North.visible = true;
				link2East.visible = true;
			}
			else if (state == 3) {
				clickFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				arrowFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				click.visible = true;
				arrow.visible = true;
				state++;
			}
			else if (state == 4) {
				arrowFlash.stopFlash();
				clickFlash.stopFlash();
				arrow.visible = false;
				click.visible = false;
				state = 0;
				
				block1.play("2");
				link1East.visible = false;
				link1North.visible = false;
				link2East.visible = false;
				
				okSign.visible = true;
				okSignFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
				
				highlight.visible = false;
				cursor.visible = false;
			}
		}
		
		override public function update():void 
		{
			super.update();
			timer -= FlxG.elapsed;
			if (timer < 0) {
				switchState();
				timer = switchTime;
			}
		}
	}

}