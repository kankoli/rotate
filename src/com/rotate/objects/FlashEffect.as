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
		
		public var _objects:Array;
		
		public function FlashEffect(obj:FlxSprite = null) 
		{
			_objects = [];
			_flashTimer = 0;
			addObject(obj);
		}
		
		public function addObject(obj:FlxSprite):void {
			if (obj == null)
				return;
			_objects.push(obj);
		}
		
		public function startFlash(color1:uint, color2:uint, flashPerSecond:int):void
		{
			if (_flashTimer != 0)
				return;
			for each (var obj:FlxSprite in _objects) {
				obj.color = color1;
			}
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
			if (_objects.length == 0)
				return;
			if (_flashTimer != 0) {
				_flashTimer -= FlxG.elapsed;
				if (_flashTimer < 0)
				{
					_flashTimer = _flashDuration;
					
					for each (var obj:FlxSprite in _objects) {
						if (_objects[0].color == _color1 - 0xFF000000)
						{
							obj.color = _color2;
						}
						else
						{
							obj.color = _color1;
						}
					}
				}
			}
		}
	}

}