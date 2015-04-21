package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class Background extends Sprite
	{
		[Embed(source="../lib/star-cluster.jpg")]
		
		public var backgroundImage:Class;
		private var bgImage:Bitmap;
		private var bgImage2:Bitmap;
		
		public function Background()
		{
			super();
			bgImage = new backgroundImage();
			bgImage2 = new backgroundImage();
			addChild(bgImage);
			addChild(bgImage2);
			//scrolling the background
			bgImage2.y = -bgImage2.height;
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			//scrolling speed background image
			bgImage.y += 2;
			//scrolling speed background image 2
			bgImage2.y += 2;
			//spawning an another background
			if (bgImage.y > stage.stageHeight)
			{
				bgImage.y = -bgImage.height;
			}
			
			if (bgImage2.y > stage.stageHeight)
			{
				bgImage2.y = -bgImage2.height;
			}
		}
	}
}