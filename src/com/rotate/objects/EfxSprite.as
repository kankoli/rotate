package com.rotate.objects 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxRect;
	
	import com.rotate.helpers.Utility;
	/**
	 * ...
	 * @author kadir
	 */
	public class EfxSprite extends FlxSprite
	{
		private var _duration:Number;
		private var _onFadeFinish:Function;
		private var _onFlashFinish:Function;
		
		private var _timer:Number;
		private var _multiplier:int; // -1 for fade, 1 for flash
		
		public function EfxSprite(X:int, Y:int, width:int, height:int) 
		{
			super(X, Y, Utility.ImgEfxSprite);
			this.width = width;
			this.height = height;
			this.color = Utility.BACKGROUND;
			this.alpha = 0.0;
			_timer = 0;
		}
		
		public function resetEfx():void 
		{
			this.alpha = 0.0;
			_timer = 0;
			_onFadeFinish = null;
			_onFlashFinish = null;
		}
		
		public function fade(duration:Number = 1, onFinish:Function = null):void
		{
			_duration = duration;
			_onFadeFinish = onFinish;
			alpha = 0.0;
			
			_timer = _duration;
			_multiplier = -1;
		}
		
		public function flash(duration:Number = 1, onFinish:Function = null):void
		{
			_duration = duration;
			_onFlashFinish = onFinish;
			alpha = 1.0;
			
			_timer = 0.0000001;
			_multiplier = 1;
		}
		
		override public function update():void 
		{
			if (_timer != 0) {
				_timer = _timer + _multiplier * FlxG.elapsed;
				alpha = (_duration - _timer) / _duration;
				if (_timer < 0) {
					_timer = 0;
					alpha = 1.0;
					if (_onFadeFinish != null)
						_onFadeFinish();
				}
				if (_timer > _duration) {
					_timer = 0;
					alpha = 0.0;
					if (_onFlashFinish != null)
						_onFlashFinish();
				}
			}
		}
		
	}

}