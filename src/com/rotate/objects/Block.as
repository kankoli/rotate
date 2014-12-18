package com.rotate.objects 
{
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	import com.rotate.helpers.Utility;
	/**
	 * ...
	 * @author kadir
	 */
		
	public class Block extends FlxSprite
	{
		public static const CONN0:int = 0; 
		public static const CONN1:int = 1; 
		public static const CONN2CRV:int = 2; 
		public static const CONN2STR:int = 3; 
		public static const CONN3:int = 4; 
		public static const CONN4:int = 5; 
		
		private var _parent:Level;
		private var _row:int;
		private var _col:int;
		
		public var _connections:Array;
		public var _unconnecteds:Array;
		private var _unconnectedImgs:Array;
		public var _type:int;
		private var _rotation:int;
		
		private var _mouseHovering:Boolean;
		
		public function Block(parent:Level, X:int, Y:int, row:int, col:int, Type:int, Rotation:int) 
		{
			super(X, Y);
			_parent = parent;
			_row = row;
			_col = col;
			
			_unconnectedImgs = [];
			var link:FlxSprite = new FlxSprite(X, Y, Utility.ImgUnconnEast);
			link.color = Utility.UNCONNCOLOR;
			_unconnectedImgs.push(link);
			
			link = new FlxSprite(X, Y, Utility.ImgUnconnNorth);
			link.color = Utility.UNCONNCOLOR;
			_unconnectedImgs.push(link);
			
			link = new FlxSprite(X, Y, Utility.ImgUnconnWest);
			link.color = Utility.UNCONNCOLOR;
			_unconnectedImgs.push(link);
			
			link = new FlxSprite(X, Y, Utility.ImgUnconnSouth);
			link.color = Utility.UNCONNCOLOR;
			_unconnectedImgs.push(link);
			
			this._rect = new FlxRect(X, Y, Utility.BLOCKSIZE, Utility.BLOCKSIZE);
			
			this._mouseHovering = false;
			
			this._type = Type;
			this._rotation = 0;
			this.angle = 0;
			
			_unconnecteds = new Array(false, false, false, false);
			if (_type == CONN0) {
				_connections = new Array(false, false, false, false);
			}
			else if (_type == CONN1) {
				_connections = new Array(true, false, false, false);
				loadGraphic(Utility.ImgRoad1, true, false, Utility.BLOCKSIZE, Utility.BLOCKSIZE);
			}
			else if (_type == CONN2CRV) {
				_connections = new Array(true, true, false, false);
				loadGraphic(Utility.ImgRoad2C,false,false,Utility.BLOCKSIZE,Utility.BLOCKSIZE);
			}
			else if (_type == CONN2STR) {
				_connections = new Array(true, false, true, false);
				loadGraphic(Utility.ImgRoad2S, false, false,Utility.BLOCKSIZE,Utility.BLOCKSIZE);
			}
			else if (_type == CONN3) {
				_connections = new Array(true, true, true, false);
				loadGraphic(Utility.ImgRoad3, false, false,Utility.BLOCKSIZE,Utility.BLOCKSIZE);
			}
			else if (_type == CONN4) {
				_connections = new Array(true, true, true, true);
				loadGraphic(Utility.ImgRoad4, false, false,Utility.BLOCKSIZE,Utility.BLOCKSIZE);
			}
			
			addAnimation("0", [0], 5);
			addAnimation("1", [1], 5);
			addAnimation("2", [2], 5);
			addAnimation("3", [3], 5);
			
			for (var i:int = 0; i < Rotation; i++) {
				rotate();
			}
			
			color = Utility.BLOCKCOLOR;
		}
		
		public function rotate():void {
			var temp:Boolean = _connections[3];
			_connections[3] = _connections[2];
			_connections[2] = _connections[1];
			_connections[1] = _connections[0];
			_connections[0] = temp;
			
			_rotation += 1;
			_rotation %= 4;
			play(_rotation.toString());
		}
		
		public function clicked():void
		{
			if (_mouseHovering) {
				rotate();
				_parent.blockIsClicked(_row, _col);
			}
		}
		
		override public function update():void 
		{
			super.update();
			_mouseHovering = Utility.pointInFlxRect(FlxG.mouse.getWorldPosition(), this._rect);
			if (_mouseHovering) {
				_parent._highlight.x = this.x - Utility.BLOCKHIGHLIGHTOFFSET;
				_parent._highlight.y = this.y - Utility.BLOCKHIGHLIGHTOFFSET;
			}
		}
		
		override public function draw():void 
		{
			if (_type == CONN0)
				return;
			
			super.draw();
			
			for (var i:int = 0; i < 4; i++) {
				if (_unconnecteds[i])
					_unconnectedImgs[i].draw();
			}
		}
	}
}