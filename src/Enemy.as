package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class Enemy extends Sprite
	{
		[Embed(source="../lib/spaceship2.png")]
		
		public var enemy:Class;
		private var enemyJet:Bitmap;
		private var direction:int;
		
		public function Enemy() 
		{
			enemyJet = new enemy;
			
			//put a position for enemy
			enemyJet.x = 350;
			enemyJet.y = 0;
			
			//set enemy on screen
			addChild(enemyJet);
			direction = 1;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{	
			//enemyJet = new enemy;
			if (enemyJet.x > stage.stageWidth - enemyJet.width)
			{
				direction = -1;
			}
			if (enemyJet.x < 0)
			{
				direction = 1;
			}
			
			enemyJet.x += direction * 15;
		}
	}
}