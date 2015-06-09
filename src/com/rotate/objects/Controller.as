package com.rotate.objects 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import com.rotate.helpers.Utility;
	/**
	 * ...
	 * @author kadir
	 */
	public class Controller extends FlxGroup
	{
		private var _oldPos:FlxPoint;
		private var _mouseHovering:Boolean;
		
		private var _frameRect:FlxRect;
		private var _mouseInsideLevel:Boolean;
		private var _focusedBlock:Block;
		public var _highlight:FlxSprite;
		private var _parent:Level;
		
		public function Controller(level:Level) 
		{
			_parent = level;
			_frameRect = new FlxRect(Utility.MAPOFFSETX, Utility.MAPOFFSETY, Utility.ROWNUMBER * Utility.BLOCKSIZE, Utility.COLNUMBER * Utility.BLOCKSIZE);
			_oldPos = new FlxPoint(0, 0);
			
			_highlight = new FlxSprite( -100, -100, Utility.ImgHighlight);
			_highlight.color = Utility.BUTTONCOLOR;
			_highlight.visible = true;
			add(_highlight);
			
		_focusedBlock = _parent.getRandomBlock();
		if (_focusedBlock != null)
			alignHighlight(_focusedBlock);
		}
		
		private function mouseHasMoved():Boolean
		{
			var newPos:FlxPoint = FlxG.mouse.getWorldPosition();
			if (_oldPos.x == newPos.x && _oldPos.y == newPos.y) {
				return false;
			}
			else {
				_oldPos = newPos;
				return true;
			}
		}
		
		private function alignHighlight(block:Block):void
		{
			_highlight.x = block.x - Utility.BLOCKHIGHLIGHTOFFSET;
			_highlight.y = block.y - Utility.BLOCKHIGHLIGHTOFFSET;
		}
		
		override public function update():void 
		{
			super.update();
			if (mouseHasMoved()) {
				_mouseInsideLevel = Utility.pointInFlxRect(FlxG.mouse.getWorldPosition(), _frameRect);
				if (_mouseInsideLevel)
				{
					var block:Block = _parent.getBlockFocusedByMouse();
					if (block != null) {
						_focusedBlock = block;
						alignHighlight(_focusedBlock);
					}
				}
			}
			
			if (FlxG.keys.justPressed("UP")) {
				_focusedBlock = _parent.moveFocusUp(_focusedBlock.getRow(), _focusedBlock.getCol());
				alignHighlight(_focusedBlock);
			}
			if (FlxG.keys.justPressed("DOWN")) {
				_focusedBlock = _parent.moveFocusDown(_focusedBlock.getRow(), _focusedBlock.getCol());
				alignHighlight(_focusedBlock);
			}
			if (FlxG.keys.justPressed("LEFT")) {
				_focusedBlock = _parent.moveFocusLeft(_focusedBlock.getRow(), _focusedBlock.getCol());
				alignHighlight(_focusedBlock);
			}
			if (FlxG.keys.justPressed("RIGHT")) {
				_focusedBlock = _parent.moveFocusRight(_focusedBlock.getRow(), _focusedBlock.getCol());
				alignHighlight(_focusedBlock);
			}
			
			if ((FlxG.mouse.justPressed() || FlxG.keys.justPressed("SPACE")) && !_parent._levelIsFinished) {
				_focusedBlock.clicked();
			}
		}
	}

}