package core.managers
{
	import starling.display.Sprite;

	public class ScreensManager
	{
		public static var api:ScreensManager = new ScreensManager();
		
		private var _stage:Sprite;
		
		public function ScreensManager()
		{
			if(api)
				return;
		}
		
		public function initialize(stage:Sprite):void
		{
			_stage = stage;
		}
		
		public function addNewScreen(screen:Sprite):void
		{
			emptyScreen();
			_stage.addChild(screen);
		}
		
		public function emptyScreen():void
		{
			while(_stage.numChildren)
				_stage.removeChildAt(0, true);
		}
		
	}
}