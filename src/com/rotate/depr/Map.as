package com.rotate.depr 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author kadir
	 */
	public class Map extends FlxGroup
	{
		private var _parent:MapState;
		private var _mapData:MapData;
		
		private var _mouseHovering:Boolean;
		
		private var _available:Boolean;
		private var _solved:Boolean;
		
		private var _frame:FlxSprite;
		private var _text:FlxText;
		
		public function Map(parent:MapState, mapData:MapData, X:int, Y:int, available:Boolean, solved:Boolean)
		{
			_parent = parent;
			_mapData = mapData;
			
			_mouseHovering = false;
			
			_available = available;
			_solved = solved;
			_frame = new FlxSprite(X, Y, Utility.ImgMapFrame);
			add(_frame);
			
			_text = new FlxText(X+2, Y+14, _frame.width, (mapData._mapIndex+1).toString());
			_text.setFormat(null, 38, Utility.BUTTONLABELCOLOR, "center");
			add(_text);
			
		}
		
		public function clicked():void
		{
			if (_mouseHovering)
			{
				_parent.mapSelected(_mapData);
			}
		}
		
		override public function update():void 
		{
			super.update();
			_mouseHovering = _frame.overlapsPoint(FlxG.mouse.getWorldPosition());
			if (_mouseHovering) {
				_parent._highlight.x = _frame.x - Utility.BLOCKHIGHLIGHTOFFSET + 3;
				_parent._highlight.y = _frame.y - Utility.BLOCKHIGHLIGHTOFFSET + 3;
			}
		}
	}

}