package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class PlayState extends MasterPlayState
	{
		private var _allMapData:Array;
		public function PlayState(allMaps:Array, mapIndex:int)
		{
			_allMapData = allMaps;
			_mapIndex = mapIndex;
			_mapData = _allMapData[_mapIndex]._mapData;
			_mapTime = _allMapData[_mapIndex]._mapTime;
			
			_timer = _mapTime;
		}
		
		override public function create():void 
		{
			super.create();
			_levelTitle.text = "LEVEL\n" + (_mapIndex+1).toString() + "/"+ _allMapData.length.toString();
			
		}
		
		override public function onNext():void 
		{
			_mapIndex++;
			if (_mapIndex >= _allMapData.length)
			{
				var b:Boolean = ProgressHandler.gotNormalPlayScore(_totalScore);
				FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new FinishedGameState(_totalScore, b)); } );
			}
			else {
				resetState();
				_mapData = _allMapData[_mapIndex]._mapData;
				_mapTime = _allMapData[_mapIndex]._mapTime;
				_timer = _mapTime;
				remove(_level);
				_level = new Level(this,_mapData);
				add(_level);
				_levelTitle.text = "LEVEL\n" + (_mapIndex + 1).toString() + "/"+_allMapData.length.toString();
			}
		}
	}

}