package 
{
	import org.flixel.*;
	import com.rotate.MenuState;
	import com.rotate.MasterReadyState;
	import com.rotate.helpers.ProgressHandler;
	
	import flash.events.Event;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	/**
	$(CBI)* ...
	$(CBI)* @author kankoli
	$(CBI)*/
	public class Rotate extends FlxGame
	{
		public function Rotate():void 
		{
			super(640,480,MenuState);
			forceDebugger = true;
		}
		
		override protected function create(FlashEvent:Event):void 
		{
			super.create(FlashEvent);
			
			ProgressHandler.init();
		}
	}
}