package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class Main extends Sprite 
	{
		private var bg:Background;
		private var bg2:Background;
		private var char:Player;
		private var jetEnemy:Enemy;
		private var bullets:Vector.<Bullet>;
		private var enemyhealth:EnemyHealth;
		
		public function Main():void 
		{
			//background
			bg = new Background();
			addChild(bg);
			
			//background 2
			bg2 = new Background();
			addChild(bg2);
			
			//player
			char = new Player();
			addChild(char);
			char.addEventListener("SHOOT", makeBullet);
			
			//enemy
			jetEnemy = new Enemy();
			addChild(jetEnemy);
			
			//bullet
			bullets = new Vector.<Bullet>();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			collision();
		}
		
		private function collision():void 
		{
			
				for (var i:int = 0; i < bullets.length; i++) 
				{
					
					if(jetEnemy.hitTestPoint(bullets[i].x, bullets[i].y, true))
					{
						removeChild(bullets[i]);
						removeChild(jetEnemy);
						
						bullets.splice(i, 1);
						break;
					}
				}
			
			
		}
		
		private function makeBullet(e:Event):void 
		{
			var b:Bullet = new Bullet(char.x, char.y);
			bullets.push(b);			
			addChild(b);
		}
	}
}