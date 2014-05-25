package core.screens
{
	
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
			_redZone = new Quad(TapBoxing.stageWidth, TapBoxing.stageHeight, 0xcc0000);
			_blueZone = new Quad(TapBoxing.stageWidth, TapBoxing.stageHeight, 0x0000cc);
			_redZone.x = _blueZone.x = 0;
			_redZone.y = 0;
			_blueZone.y = TapBoxing.stageHeight/2;
			addChild(_redZone);
			addChild(_blueZone);
			//
			_redPusher = new Quad(TapBoxing.stageWidth, TapBoxing.stageHeight/2, 0xcc0000);
			_bluePusher = new Quad(TapBoxing.stageWidth, TapBoxing.stageHeight/2, 0x0000cc);
			_redPusher.alpha = 0;
			_bluePusher.alpha = 0;
			_redPusher.x = _bluePusher.x = 0;
			_redPusher.y = 0;
			_bluePusher.y = TapBoxing.stageHeight/2;
			_redPusher.addEventListener(TouchEvent.TOUCH, onRedTouch);
			_bluePusher.addEventListener(TouchEvent.TOUCH, onBlueTouch);
			addChild(_redPusher);
			addChild(_bluePusher);
			
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
			var factor:Number = (dif*.5/_winPulsationsDiff);
			_redZone.scaleY = .5 - factor
			_blueZone.scaleY = .5 + factor;
			//_redZone.scaleY = _redPulsations/tot;
			//_blueZone.scaleY = _bluePulsations/tot;
			_redZone.y = 0;
			_blueZone.y = _redZone.y + _redZone.height;
		}
		
	}
}