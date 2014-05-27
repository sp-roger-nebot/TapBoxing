package core.screens
{
	import core.MainContainer;
	import core.managers.ScreensManager;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Menu extends Sprite
	{
		private var _btnPlay:Button;
		private var _btnInstructions:Button;
		
		private var _menuHolder:Sprite;
		
		public function Menu()
		{
			_menuHolder = new Sprite();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(ev:Event):void
		{
			addChild(_menuHolder);
			
			new MetalWorksMobileTheme();
			
			const PADDING:int = 5;
			
			_btnPlay = new Button();
			_btnPlay.label = "Play!";
			_menuHolder.addChild( _btnPlay );
			
			_btnInstructions = new Button();
			_btnInstructions.label = "Instructions";
			_menuHolder.addChild( _btnInstructions );
			
			_btnPlay.validate();
			_btnPlay.width = MainContainer.WIDTH / 3;
			_btnPlay.addEventListener( Event.TRIGGERED, onBtnPlay );
			
			_btnInstructions.validate();
			_btnInstructions.width = MainContainer.WIDTH / 3;
			_btnInstructions.y = _btnPlay.y + _btnPlay.height + PADDING;
			_btnInstructions.addEventListener( Event.TRIGGERED, onBtnInstructions );
			
			_menuHolder.x = (MainContainer.WIDTH - _menuHolder.width) / 2;
			_menuHolder.y = (MainContainer.HEIGHT - _menuHolder.height) / 2;
		}
		
		protected function onBtnPlay( event:Event ):void
		{
			var game:Game = new Game();
			ScreensManager.api.addNewScreen(game);
		}
		
		protected function onBtnInstructions( event:Event ):void
		{
			const label:Label = new Label();
			label.text = "First you need a friend.\nOnce you get it, the game is simple. Hold the device with your friend and tap your side faster than him.\nEnjoy!";
			label.textRendererProperties.wordWrap = true;
			label.textRendererProperties.multiline = true;
			label.width = MainContainer.WIDTH * .9;
			Callout.show( label, event.currentTarget as DisplayObject );
		}
		
	}
}