package com.rotate 
{
	import com.rotate.objects.*;
	import com.rotate.helpers.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class AboutState extends FlxState
	{
		public var _highlight:FlxSprite;
		public var _logos:FlxGroup;
		
		override public function create():void 
		{
			super.create();
			var txt:FlxText = new FlxText(0, 20, FlxG.width, "ABOUT");
			txt.setFormat(null, 70, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			txt = new FlxText(0, 130, FlxG.width, "ROTATE was developed by TurpGames");
			txt.setFormat(null, 24, Utility.BLOCKCOLOR, "center");
			add(txt);
			
			var _menuButton:Button = new Button("Menu", function():void{FlxG.fade(Utility.FADECOLOR, Utility.FADEDURATION, function():void { FlxG.switchState(new MenuState()); } );});
			_menuButton.x = (FlxG.width - _menuButton.width) / 2;
			_menuButton.y = 393;
			add(_menuButton);
			FlxG.flash(Utility.FADECOLOR, Utility.FADEDURATION);
			
			
			
			_logos = new FlxGroup();
			var x:int = (FlxG.width - 3 * 128 - 40) / 2;
			var y:int = 200;
			var logo:Logo = new Logo(this, x, y, Utility.ImgTurp, "http://www.turpgames.com/");
			_logos.add(logo);
			
			logo = new Logo(this, x + 128 + 20, y, Utility.ImgFacebook, "http://www.facebook.com/turpgames");
			_logos.add(logo);
			
			logo = new Logo(this, x + 256 + 40, y, Utility.ImgTwitter, "http://twitter.com/turpgames");
			_logos.add(logo);
			
			_highlight = new FlxSprite( -300, -300, Utility.ImgLogoFrame);
			_highlight.color = Utility.BUTTONCOLOR;
			_highlight.visible = true;
			add(_highlight);
			
			add(_logos);
		}
		
		override public function update():void 
		{
			_highlight.x = -300;
			_highlight.y = -300;
			super.update();
			if (FlxG.mouse.justPressed()) {
				_logos.callAll("clicked");
			}
		}
	}
}