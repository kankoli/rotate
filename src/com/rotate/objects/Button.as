package com.rotate.objects
{
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	
	import com.rotate.helpers.Utility;
	/**
	 * ...
	 * @author kadir
	 */
	public class Button extends FlxButton
	{
		public function Button(labelText:String, onClick:Function) 
		{
			super(0, 0, "", function():void {
				status = FlxButton.NORMAL;
				onClick(); } );
			loadGraphic(Utility.ImgButton, true, false,  Utility.BUTTONWIDTH, Utility.BUTTONHEIGHT);
			color = Utility.BUTTONCOLOR;
			label = new FlxText(0,0,Utility.BUTTONWIDTH,labelText);
			label.setFormat(null, 30, Utility.BUTTONLABELCOLOR, "center");
		}
		
		private function buttonOnClick():void {
		}
	}

}