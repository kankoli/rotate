package com.rotate
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	import flash.desktop.Clipboard; 
	import flash.desktop.ClipboardFormats;

	public class GeneratorState extends LevelState
	{
		//[Embed(source = "data/H.png")] public static var FILE:File;
		
		protected var _randButton:Button;
		protected var _saveButton:Button;
		protected var _shuffleButton:Button;
		protected var _randMap:Array;
		
		public function GeneratorState() 
		{			
			_randButton = new Button("Rand", onRand);
			_randButton.x = Utility.BUTTONOFFSETX;
			_randButton.y = 20;
			add(_randButton);
			_shuffleButton = new Button("Shuffl", onShuffle);
			_shuffleButton.x = Utility.BUTTONOFFSETX;;
			_shuffleButton.y = 80;
			add(_shuffleButton);
			_saveButton = new Button("Save", onSave);
			_saveButton.x = Utility.BUTTONOFFSETX;;
			_saveButton.y = 140;
			add(_saveButton);
		}
		
		private function onShuffle():void
		{
			if (_level == null)
				return;
			_levelFrame.color = Utility.LEVELFRAMECOLOR;
			_level.randomizeBlocks();
			_level._levelIsFinished = false;
		}
		
		private function onRand():void {
			_randMap = Utility.randMap();
			mapTrace(_randMap);
			
			remove(_level);
			_level = new Level(this,_randMap);
			add(_level);
		}
		
		
		private function onSave():void {
			if (_randMap != null) {
				var s:String = mapTrace(_randMap);
				trace(s);
				Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, s, false);
			}
		}
		
		private function mapTrace(map:Array):String {
			var s:String = "";
			s += "[";
			for (var i:int = 0; i < map.length; i++) {
				var line:String = "[";
				for (var j:int = 0; j < map[0].length; j++) {
					line += map[i][j];
					if (j < map[0].length - 1)
						line += ", ";
				}
				line += "]";
				if (i < map.length - 1)
					line += ",\n";
				if (i == map.length - 1)
					line += "];";
				s+= line;
			}
			
			return s;
		}
		
		override public function levelIsFinished():void 
		{
			
		}
	}
}
