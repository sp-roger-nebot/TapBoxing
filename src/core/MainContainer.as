package core
{
	import starling.display.Sprite;
	import core.managers.ScreensManager;

	public class MainContainer extends Sprite
	{
		public function MainContainer()
		{
			ScreensManager.api.initialize(this);
			TapBoxing.sigStarlingStarted.dispatch();
		}
	}
}