package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class Player extends Sprite
	{
		[Embed(source = "../lib/SpaceJet.png")]
		
		public var player:Class;
		private var jetPlayer:Bitmap;
		private var timer:Timer;
		private var direction:int = -1;
		//private var sound:URLRequest = new URLRequest("file:///C:/Users/Eigenaar/Documents/Media%20College/dip/OneButton/lib/Laser-SoundBible.com-602495617.mp3");
		
		public function Player() 
		{
			jetPlayer = new player;
			
			jetPlayer.x = -jetPlayer.width / 2;
			
			//scaling the player
			//jetPlayer.x = scaleX = 0.4;
			//jetPlayer.y = scaleY = 0.4;
			
			//set the player in position
			x = 400;
			y = 450;
			
			//set player on the screen
			addChild(jetPlayer);
			
			//set timer that player shoots automatically
			timer = new Timer(2000, 0);
			timer.addEventListener(TimerEvent.TIMER, onShoot);
			timer.start();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		//when SPACE is pressed
		private function OnKeyDown(e:KeyboardEvent):void 
		{
		
			if (e.keyCode == Keyboard.SPACE)
			{
				direction =  1;
				
				if (this.x > stage.stageWidth)
				{
					this.x = 0 - this.width;
				}
			}
		}
		
		//when SPACE is not pressed
		private function OnKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				direction = -1;
				
				if (this.x < 0)
				{
					this.x = stage.stageWidth - this.width;
				}
			}
		}
		
		//let the player move left and right with the direction
		private function loop(e:Event):void 
		{
			this.x += 10 * direction;
		}
		
		//player can shoot automatically
		private function onShoot(e:TimerEvent):void 
		{
			//var playSound = new Sound(sound);
			dispatchEvent(new Event("SHOOT"));
			//playSound();
		}
	}
}