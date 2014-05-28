package core
{
	import core.managers.ParticlesManager;
	import core.managers.ScreensManager;
	
	import starling.display.Sprite;

	public class MainContainer extends Sprite
	{
		public static var WIDTH:int;
		public static var HEIGHT:int;
		
		private var _screensContainer:Sprite;
		private var _particlesContainer:Sprite;
		
		public function MainContainer()
		{
			_screensContainer = new Sprite();
			_screensContainer.rotation = Math.PI / 2;
			_screensContainer.x = TapBoxing.stageWidth;
			addChild(_screensContainer);
			WIDTH = TapBoxing.stageHeight;
			HEIGHT = TapBoxing.stageWidth;
			ScreensManager.api.initialize(_screensContainer);
			
			_particlesContainer = new Sprite();
			addChild(_particlesContainer);
			ParticlesManager.api.initialize(_particlesContainer);
			
			TapBoxing.sigStarlingStarted.dispatch();
		}
	}
}