package com.rotate.objects 
{
	import com.rotate.LevelState;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import com.rotate.helpers.Connection;
	import com.rotate.helpers.Utility;
	/**
	 * ...
	 * @author kadir
	 */
	public class Level extends FlxGroup
	{	
		protected var _parent:LevelState;
		
		protected var _blocks:FlxGroup;
		
		public var _levelIsFinished:Boolean;
		
		public var _highlight:FlxSprite;
		
		public function Level(parent:LevelState, mapData:Array) 
		{
			_parent = parent;
			
			_blocks = new FlxGroup();
			generateLevel(mapData);
			add(_blocks);
			
			_highlight = new FlxSprite( -100, -100, Utility.ImgHighlight);
			_highlight.color = Utility.BUTTONCOLOR;
			_highlight.visible = true;
			add(_highlight);
			
			initializeUnconnecteds();
			
			_levelIsFinished = false;
		}
		
		protected function generateLevel(mapData:Array):void
		{			
			for (var i:int = 0; i < mapData.length; i++) {
				var row:FlxGroup = new FlxGroup();
				for (var j:int = 0; j < mapData[0].length; j++) {
					row.add(new Block(this, Utility.MAPOFFSETX + j * Utility.BLOCKSIZE, Utility.MAPOFFSETY + i* Utility.BLOCKSIZE, i, j, mapData[i][j], (FlxG.random() * 40) % 4 ));
				}
				 _blocks.add(row);
			}
		}
		
		public function randomizeBlocks():void {
			var r:int;
			for each(var group:FlxGroup in _blocks.members) {
				for each (var block:Block in group.members) {
					r = (FlxG.random() * 40) % 4;
					while(r>=0) {
						block.rotate();
						r--;
					}
				}
			}
			
			initializeUnconnecteds();
		}
		
		// updating unconnecteds of the clicked block then checking if level is finished
		public function blockIsClicked(row:int, col:int):void
		{
			var block:Block = _blocks.members[row].members[col];
			block._unconnecteds[0] = false;
			block._unconnecteds[1] = false;
			block._unconnecteds[2] = false;
			block._unconnecteds[3] = false;
			
			if (row - 1 >= 0) {
				_blocks.members[row - 1].members[col]._unconnecteds[Connection.SOUTH] = false;
				if (_blocks.members[row - 1].members[col]._connections[Connection.SOUTH] != block._connections[Connection.NORTH]) {
					_blocks.members[row - 1].members[col]._unconnecteds[Connection.SOUTH] = true && _blocks.members[row - 1].members[col]._connections[Connection.SOUTH];
					block._unconnecteds[Connection.NORTH] = true && block._connections[Connection.NORTH];
				}
			}
			else if (row - 1 < 0 && block._connections[Connection.NORTH] == true) {
				block._unconnecteds[Connection.NORTH] = true;
			}
			
			if (row + 1 < 5) {
				_blocks.members[row + 1].members[col]._unconnecteds[Connection.NORTH] = false;
				if (_blocks.members[row + 1].members[col]._connections[Connection.NORTH] != block._connections[Connection.SOUTH]) {
					_blocks.members[row + 1].members[col]._unconnecteds[Connection.NORTH] = true && _blocks.members[row + 1].members[col]._connections[Connection.NORTH];
					block._unconnecteds[Connection.SOUTH] = true && block._connections[Connection.SOUTH];
				}
			}
			else if (row + 1 >= 5 && block._connections[Connection.SOUTH] == true) {
				block._unconnecteds[Connection.SOUTH] = true;
			}
			
			if (col - 1 >= 0) {
				_blocks.members[row].members[col - 1]._unconnecteds[Connection.EAST] = false;
				if (_blocks.members[row].members[col - 1]._connections[Connection.EAST] != block._connections[Connection.WEST]) {
					_blocks.members[row].members[col - 1]._unconnecteds[Connection.EAST] = true && _blocks.members[row].members[col - 1]._connections[Connection.EAST];
					block._unconnecteds[Connection.WEST] = true && block._connections[Connection.WEST];
				}
			}
			else if (col - 1 < 0 && block._connections[Connection.WEST] == true) {
				block._unconnecteds[Connection.WEST] = true;
			}
			
			if (col + 1 < 5) {
				_blocks.members[row].members[col + 1]._unconnecteds[Connection.WEST] = false;
				if (_blocks.members[row].members[col + 1]._connections[Connection.WEST] != block._connections[Connection.EAST]) {
					_blocks.members[row].members[col + 1]._unconnecteds[Connection.WEST] = true && _blocks.members[row].members[col + 1]._connections[Connection.WEST];
					block._unconnecteds[Connection.EAST] = true && block._connections[Connection.EAST];
				}
			}
			else if (col + 1 >= 5  && block._connections[Connection.EAST] == true) {
				block._unconnecteds[Connection.EAST] = true;
			}
			
			_parent.blockClicked(block);
			
			checkLevelFinished();
		}
		
		public function initializeUnconnecteds():void
		{
			// reset all flags to false
			for each(var group:FlxGroup in _blocks.members) {
				for each (var block:Block in group.members) {
					block._unconnecteds[0] = false;
					block._unconnecteds[1] = false;
					block._unconnecteds[2] = false;
					block._unconnecteds[3] = false;
				}
			}
			
			// if there are connections towards NORTH and SOUTH on UPPERMOST and LOWERMOST rows, they are definitely unconnected.
			for (var i:int = 0; i < _blocks.members[0].length; i++) {
				_blocks.members[0].members[i]._unconnecteds[Connection.NORTH] = _blocks.members[0].members[i]._connections[Connection.NORTH];
				_blocks.members[_blocks.length-1].members[i]._unconnecteds[Connection.SOUTH] = _blocks.members[_blocks.length-1].members[i]._connections[Connection.SOUTH]
			}
			
			// if there are connections towards WEST and EAST on LEFTMOST and RIGHTMOST cols, they are definitely unconnected.
			for (i = 0; i < _blocks.length; i++) {
				_blocks.members[i].members[0]._unconnecteds[Connection.WEST] = _blocks.members[i].members[0]._connections[Connection.WEST]
				_blocks.members[i].members[_blocks.members[0].length-1]._unconnecteds[Connection.EAST] = _blocks.members[i].members[_blocks.members[0].length-1]._connections[Connection.EAST]
			}
			
			// in betweens, east & west and south & north. rightmost and lowermost ommitted
			for (i = 0; i < _blocks.length-1; i++) {
				for (var j:int = 0; j < _blocks.members[0].length-1; j++) {
					if (_blocks.members[i].members[j]._connections[Connection.EAST] != _blocks.members[i].members[j + 1]._connections[Connection.WEST]) {
						_blocks.members[i].members[j]._unconnecteds[Connection.EAST] = _blocks.members[i].members[j]._connections[Connection.EAST]
						_blocks.members[i].members[j + 1]._unconnecteds[Connection.WEST] = _blocks.members[i].members[j + 1]._connections[Connection.WEST];
					}
					if (_blocks.members[i].members[j]._connections[Connection.SOUTH] != _blocks.members[i + 1].members[j]._connections[Connection.NORTH]) {
						_blocks.members[i].members[j]._unconnecteds[Connection.SOUTH] = _blocks.members[i].members[j]._connections[Connection.SOUTH];
						_blocks.members[i + 1].members[j]._unconnecteds[Connection.NORTH] = _blocks.members[i + 1].members[j]._connections[Connection.NORTH];
					}
				}
			}
			
			// SOUTH of rightmost column of blocks
			for (i = 0; i < _blocks.length - 1; i++) {
				if (_blocks.members[i].members[_blocks.members[0].length - 1]._connections[Connection.SOUTH] != _blocks.members[i + 1].members[_blocks.members[0].length - 1]._connections[Connection.NORTH]) {
					_blocks.members[i].members[_blocks.members[0].length - 1]._unconnecteds[Connection.SOUTH] = _blocks.members[i].members[_blocks.members[0].length - 1]._connections[Connection.SOUTH];
					_blocks.members[i + 1].members[_blocks.members[0].length - 1]._unconnecteds[Connection.NORTH] = _blocks.members[i + 1].members[_blocks.members[0].length - 1]._connections[Connection.NORTH];
				}
			}
			
			// EAST of lowermost row of blocks
			for (i = 0; i < _blocks.members[0].length - 1; i++) {
				if (_blocks.members[_blocks.length - 1].members[i]._connections[Connection.EAST] != _blocks.members[_blocks.length - 1].members[i + 1]._connections[Connection.WEST]) {
					_blocks.members[_blocks.length - 1].members[i]._unconnecteds[Connection.EAST] = _blocks.members[_blocks.length - 1].members[i]._connections[Connection.EAST];
					_blocks.members[_blocks.length - 1].members[i + 1]._unconnecteds[Connection.WEST] = _blocks.members[_blocks.length - 1].members[i + 1]._connections[Connection.WEST];
				}
			}
		}
		
		public function checkLevelFinished():void
		{
			var unconnected:Boolean = false;
			for each(var group:FlxGroup in _blocks.members) {
				for each (var block:Block in group.members) {
					unconnected = unconnected || block._unconnecteds[0];
					unconnected = unconnected || block._unconnecteds[1];
					unconnected = unconnected || block._unconnecteds[2];
					unconnected = unconnected || block._unconnecteds[3];
				}
			}
			_levelIsFinished = !unconnected;
			if (_levelIsFinished) {
				_parent.levelIsFinished();
			}
		}
		
		override public function destroy():void 
		{
			super.destroy();
			_blocks = null;
		}
		
		override public function update():void 
		{
			_highlight.x = -100;
			_highlight.y = -100;
			super.update();
			if (FlxG.mouse.justPressed() && !_levelIsFinished) {
				_blocks.callAll("clicked");
			}
		}
	}
}