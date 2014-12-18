package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class MasterPlayState extends LevelState
	{
		private static var FULLSCALE:int = 18 + 12 + 12 + 5 * Utility.BLOCKSIZE;
		
		protected var _mapIndex:int;
		
		protected var _timer:Number;
		private var _gameOverText:FlxText;
		private var _gameWonText:FlxText;
		private var _gameWonFlash:FlashEffect;
		
		protected var _levelTitle:FlxText;
		
		protected var _mapTime:Number;
		private var _timerBars:FlxGroup;
		private var _timeText:FlxText;
		private var _timeFlash:FlashEffect;
		private var _last5Text:FlxText;
		private var _last5Flash:FlashEffect;
		
		private var _retryButton:Button;
		private var _nextLevelButton:Button;
		
		private var _totalScoreText:FlxText;
		protected var _totalScore:int;
		private var _levelScoreText:FlxText;
		private var _levelScore:int;
		private var _scoreTimer:Number;
		
		public function MasterPlayState()
		{
			_mapData = Utility.randMap();
			_mapTime = Utility.MASTERLEVELTIME;			
			_timer = _mapTime;
			_mapIndex = 0;
		}
		
		override public function create():void 
		{
			_last5Text = new FlxText(Utility.MAPOFFSETX - 12, 60, Utility.BLOCKSIZE * 5 + 24, "");
			_last5Text.setFormat(null, 64, Utility.BLOCKCOLOR, "center");
			_last5Text.scale.x = 5;
			_last5Text.scale.y = 5;
			_last5Text.alpha = 0.99;
			_last5Text.visible = false;
			add(_last5Text);
			
			_last5Flash = new FlashEffect(_last5Text);
			add(_last5Flash);
			
			_timeText = new FlxText(Utility.MAPOFFSETX - 12, 4, Utility.BLOCKSIZE * 5 + 24, "");
			_timeText.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			add(_timeText);
			
			_timeFlash = new FlashEffect(_timeText);
			add(_timeFlash);
			
			super.create();
			
			_levelTitle = new FlxText(0, 31, 210, "LEVEL\n" + (_mapIndex + 1).toString() + "/" + Utility.MASTERLEVELCOUNT.toString());
			_levelTitle.setFormat(null, 50, Utility.BLOCKCOLOR, "center");
			_hud.add(_levelTitle);
			
			_gameWonText = new FlxText(0, 161, 210, "Level finished!!!");
			_gameWonText.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			_gameWonText.visible = false;
			_hud.add(_gameWonText);
			
			_gameWonFlash = new FlashEffect(_gameWonText);
			_hud.add(_gameWonFlash);
			
			_nextLevelButton = new Button("Next", onNext);
			_nextLevelButton.x = Utility.BUTTONOFFSETX;
			_nextLevelButton.y = 245;
			_nextLevelButton.visible = false;
			_hud.add(_nextLevelButton);
			
			_totalScore = 0;
			_levelScore = _mapTime * 10;
			_scoreTimer = 0;
			
			_totalScoreText = new FlxText(0, 309, 210, "Score:\n" + _totalScore.toString());
			_totalScoreText.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			_hud.add(_totalScoreText);
			
			
			
			_timerBars = new FlxGroup(4);
			
			var timerBar:FlxSprite = new FlxSprite(Utility.MAPOFFSETX - 17, 241, Utility.ImgWhiteDot);
			timerBar.scale.x = 9;
			timerBar.scale.y = FULLSCALE;
			timerBar.color = Utility.BLOCKCOLOR;
			_timerBars.add(timerBar);
			
			timerBar = new FlxSprite(Utility.MAPOFFSETX - 17 + 24 + Utility.BLOCKSIZE * 5 + 9, 241, Utility.ImgWhiteDot);
			timerBar.scale.x = 9;
			timerBar.scale.y = FULLSCALE;
			timerBar.color = Utility.BLOCKCOLOR;
			_timerBars.add(timerBar);
			
			timerBar = new FlxSprite(Utility.MAPOFFSETX + (5*Utility.BLOCKSIZE)/2 - 1, Utility.MAPOFFSETY - 17, Utility.ImgWhiteDot);
			timerBar.scale.x = FULLSCALE;
			timerBar.scale.y = 9;
			timerBar.color = Utility.BLOCKCOLOR;
			_timerBars.add(timerBar);
			
			timerBar = new FlxSprite(Utility.MAPOFFSETX + (5*Utility.BLOCKSIZE)/2 - 1, Utility.MAPOFFSETY - 17 + 24 + Utility.BLOCKSIZE * 5 + 9, Utility.ImgWhiteDot);
			timerBar.scale.x = FULLSCALE;
			timerBar.scale.y = 9;
			timerBar.color = Utility.BLOCKCOLOR;
			_timerBars.add(timerBar);
			
			_hud.add(_timerBars);
			
			_gameOverText = new FlxText(Utility.MAPOFFSETX - 12, Utility.MAPOFFSETY + 5 * Utility.BLOCKSIZE / 2 - 60, Utility.BLOCKSIZE * 5 + 24, "Out of time...\nLost 100 points...!");
			_gameOverText.setFormat(null, 36, Utility.BLOCKCOLOR, "center");
			_gameOverText.visible = false;
			_hud.add(_gameOverText);
			
			_retryButton = new Button("Retry", onRetry);
			_retryButton.x = Utility.MAPOFFSETX + 5 * Utility.BLOCKSIZE / 2 - _retryButton.width / 2;
			_retryButton.y = Utility.MAPOFFSETY + 5 * Utility.BLOCKSIZE / 2 + 80;
			_retryButton.visible = false;
			_hud.add(_retryButton);
			
			_levelScoreText = new FlxText(Utility.MAPOFFSETX - 12, 440, Utility.BLOCKSIZE * 5 + 24, _levelScore.toString());
			_levelScoreText.setFormat(null, 30, Utility.BLOCKCOLOR, "center");
			_hud.add(_levelScoreText);
		}
		
		public function onRetry():void 
		{
			resetState();
			_level.randomizeBlocks();
			_level._levelIsFinished = false;
			_totalScore -= 100;
			_totalScoreText.text = "Score:\n" + _totalScore.toString();
		}
		
		public function onNext():void
		{
			_mapIndex++;
			if (_mapIndex == Utility.MASTERLEVELCOUNT) {
				var b:Boolean = ProgressHandler.gotMasterPlayScore(_totalScore);
				FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new FinishedMasterState(_totalScore, b)); } );
				return;
			}
			else 
			{
				resetState();
				_mapData = Utility.randMap();
				remove(_level);
				_level = new Level(this,_mapData);
				add(_level);
				_levelTitle.text = "LEVEL" + (_mapIndex + 1).toString() + "/" + Utility.MASTERLEVELCOUNT.toString();
			}
		}
		
		public function resetState():void 
		{
			_timer = _mapTime;
			
			_timerBars.members[0].scale.y = FULLSCALE;
			_timerBars.members[1].scale.y = FULLSCALE;
			_timerBars.members[2].scale.x = FULLSCALE;
			_timerBars.members[3].scale.x = FULLSCALE;
			_timeText.color = Utility.BLOCKCOLOR;
			_timeFlash.stopFlash();
			
			_levelFrame.color = Utility.LEVELFRAMECOLOR;
			_retryButton.visible = false;
			_nextLevelButton.visible = false;
			_gameOverText.visible = false;
			
			_efxSprite.resetEfx();
			_gameWonFlash.stopFlash();
			_gameWonText.visible = false;
			
			_scoreTimer = 0;
			_levelScore = _mapTime * 10;
			_levelScoreText.text = _levelScore.toString();
			
			_last5Text.visible = false;
		}
		
		override public function update():void 
		{
			super.update();
			if (_timer != 0) {	
				_timer -= FlxG.elapsed;
				
				_timerBars.members[0].scale.y = FULLSCALE * _timer / _mapTime;
				_timerBars.members[1].scale.y = FULLSCALE * _timer / _mapTime;
				_timerBars.members[2].scale.x = FULLSCALE * _timer / _mapTime;
				_timerBars.members[3].scale.x = FULLSCALE * _timer / _mapTime;
				
				var time:int = _mapTime - int(_mapTime * ((_mapTime - _timer) / _mapTime));
				_timeText.text = time.toString();
				_last5Text.text = time.toString();
					
				if (time <= 5) {
					_last5Flash.startFlash(Utility.LAST5SECCOLOR, 0xFFFFFFFF, 7);
					_last5Text.visible = true;
				}
				else if (time <= 10)
					_timeFlash.startFlash(Utility.BLOCKCOLOR, 0xFFFFFFFF, 7);
					
				if (_timer < 0) {
					_efxSprite.fade(Utility.FADEDURATION);
					_timer = 0;
					_gameOverText.visible = true;
					_retryButton.visible = true;
					_level._levelIsFinished = true;
				}
				
				_scoreTimer += FlxG.elapsed;
				if (_scoreTimer >= 1) 
				{
					_levelScore -= 10;							
					if (_levelScore < 0)
						_levelScore = 0;
					_levelScoreText.text = _levelScore.toString();
					_scoreTimer = 0;
				}
			}
		}
		
		override public function blockClicked(block:Block):void
		{
			if (block._type == Block.CONN0 || block._type == Block.CONN4)
				return;
			_levelScore--;
			if (_levelScore < 0)
				_levelScore = 0;
			_levelScoreText.text = _levelScore.toString();
		}
		
		override public function levelIsFinished():void 
		{
			super.levelIsFinished();
			_timer = 0;
			_gameWonText.visible = true;
			_gameWonFlash.startFlash(Utility.BLOCKCOLOR, Utility.BUTTONCOLOR, 20);
			_levelFrame.color = Utility.BLOCKCOLOR;
			_nextLevelButton.visible = true;
			_timeFlash.stopFlash();
			_timeText.color = Utility.BLOCKCOLOR;
			
			_totalScore += _levelScore;
			_totalScoreText.text = "Score:\n" + _totalScore.toString();
			_scoreTimer = 0;
			
			_last5Text.visible = false;
		}
	}
}