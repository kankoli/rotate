package com.rotate.objects 
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author kadir
	 */
	public class FlashEffect extends FlxBasic
	{
		private var _flashDuration:Number;
		private var _flashTimer:Number;
		private var _color1:uint;
		private var _color2:uint;
		
		public var _obj:FlxSprite;
		
		public function FlashEffect(obj:FlxSprite) 
		{
			_obj = obj;
			_flashTimer = 0;
		}
		
		public function startFlash(color1:uint, color2:uint, flashPerSecond:int):void
		{
			if (_flashTimer != 0)
				return;
			_obj.color = color1;
			_color1 = color1;
			_color2 = color2;
			_flashDuration = 1 / flashPerSecond;
			_flashTimer = _flashDuration;
		}
		
		public function stopFlash():void 
		{
			_flashTimer = 0;
		}
		
		override public function update():void 
		{
			if (_flashTimer != 0) {
				_flashTimer -= FlxG.elapsed;
				if (_flashTimer < 0)
				{
					_flashTimer = _flashDuration;
					if (_obj.color == _color1 - 0xFF000000)
						_obj.color = _color2;
					else
						_obj.color = _color1;
				}
			}
		}
	}

}