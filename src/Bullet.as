package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class Bullet extends MovieClip
	{
		public var bullet:BulletArt;
		
		public function Bullet(xpos:Number, ypos:Number)
		{
			super();
			bullet = new BulletArt();
			
			x = xpos;
			y = ypos;
			//scaling the bullet
			//bullet.x = scaleX = 0.6;
			//bullet.y = scaleY = 0.6;
			this.addEventListener(Event.ENTER_FRAME, loop);
			addChild(bullet);
		}
		
		private function loop(e:Event):void 
		{
			this.y -= 25;
		}
	}
}