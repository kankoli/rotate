package com.rotate.objects 
{
	import com.rotate.AboutState;
	import flash.net.*;
	import org.flixel.*;
	import com.rotate.helpers.*;
	
	import flash.events.*;
	/**
	 * ...
	 * @author kadir
	 */
	public class Logo extends FlxSprite
	{
		private var _mouseHovering:Boolean;
		private var _parent:AboutState;
		private var _url:String;
		
		public function Logo(parent:AboutState, X:int, Y:int, Img:Class, URL:String)
		{
			super(X, Y, Img);
			_parent = parent;
			_url = URL;
			
			_rect = new FlxRect(X, Y, 128, 128);
		}
		
		public function clicked():void
		{
			if (_mouseHovering) {
				var request:URLRequest = new URLRequest(_url);
			try {
				navigateToURL(request, '_blank');
			} catch (e:Error) {
				trace("Error occurred!");
				}
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
	}

}