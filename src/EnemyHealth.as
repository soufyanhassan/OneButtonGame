package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Soufyan Hassan
	 */
	public class EnemyHealth extends TextField
	{
		private var health:int = -20;
		public function EnemyHealth() 
		{
			health = 100;
			var healthTxt:TextFormat = new TextFormat();
			healthTxt.color = 0xFFFFFF;
			healthTxt.size = 20;
			healthTxt.font = "Verdana";
			healthTxt.align = "right";
			this.defaultTextFormat = healthTxt;
			this.text = "Enemy health : 100 %";
			this.width = 250;
		}
		
		public function updateHealth(_health:int):void
		{
			health -= _health;
			this.text = "Enemy health : " + health;
		}
		
	}

}