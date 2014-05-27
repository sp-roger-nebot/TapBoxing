package core.screens
{
	
	import core.MainContainer;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class Game extends Sprite
	{
		private var _winPulsationsDiff:int = 10;
		
		private var _redPusher:Quad;
		private var _bluePusher:Quad;
		
		private var _redZone:Quad;
		private var _blueZone:Quad;
		
		private var _redPulsations:int = 0;
		private var _bluePulsations:int = 0;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(ev:Event):void
		{
			_redZone = new Quad(MainContainer.WIDTH, MainContainer.HEIGHT, 0xcc0000);
			_blueZone = new Quad(MainContainer.WIDTH, MainContainer.HEIGHT, 0x0000cc);
			addChild(_redZone);
			addChild(_blueZone);
			//
			_redPusher = new Quad(MainContainer.WIDTH/2, MainContainer.HEIGHT, 0xcc0000);
			_bluePusher = new Quad(MainContainer.WIDTH/2, MainContainer.HEIGHT, 0x0000cc);
			_redPusher.alpha = 0;
			_bluePusher.alpha = 0;
			_redPusher.x = 0;
			_bluePusher.x = MainContainer.WIDTH / 2;
			_redPusher.y = _bluePusher.y = 0;
			_redPusher.addEventListener(TouchEvent.TOUCH, onRedTouch);
			_bluePusher.addEventListener(TouchEvent.TOUCH, onBlueTouch);
			addChild(_redPusher);
			addChild(_bluePusher);
			//
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function onBlueTouch(ev:TouchEvent):void
		{
			var touch:Touch = ev.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				_bluePulsations++;
			}
		}
		
		private function onRedTouch(ev:TouchEvent):void
		{
			var touch:Touch = ev.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				_redPulsations++;
			}	
		}
		
		private function update(ev:Event):void
		{
			var dif:int = _bluePulsations - _redPulsations;
			var factor:Number = (dif*.5)/_winPulsationsDiff;
			_redZone.scaleX = .5 - factor
			_blueZone.scaleX = .5 + factor;
			_redZone.x = 0;
			_blueZone.x = _redZone.x + _redZone.width;
			//Check Game finish
			if(checkForGameFinish())
			{
				onGameOver();
			}
		}
		
		private function checkForGameFinish():Boolean
		{
			var someoneWins:Boolean;
			var dif:int = _bluePulsations - _redPulsations;
			if(dif >= _winPulsationsDiff)
			{
				someoneWins = true;
				trace("Blue win!");
			}
			else if(dif <= -_winPulsationsDiff)
			{
				someoneWins = true;
				trace("Red win!");
			}
			return someoneWins;
		}
		
		private function onGameOver():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
	}
}