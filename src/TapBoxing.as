package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import core.MainContainer;
	import core.managers.ScreensManager;
	import core.screens.Menu;
	
	import org.osflash.signals.Signal;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", backgroundColor="#000000")]
	public class TapBoxing extends Sprite
	{
		public static const sigStarlingStarted:Signal = new Signal();
		private var _starling:Starling;
		
		public static var stageWidth:int;
		public static var stageHeight:int;
		
		public function TapBoxing()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var appXML:XML = NativeApplication.nativeApplication.applicationDescriptor;
			var ns:Namespace = appXML.namespace();
			
			var isFullScreen:Boolean = appXML.ns::initialWindow.ns::fullScreen == "true";
			var isLandscape:Boolean = appXML.ns::initialWindow.ns::aspectRatio == "landscape";
			
			if (isFullScreen)
			{
				stage.setOrientation(StageOrientation.DEFAULT);
				
				stageWidth = stage.fullScreenWidth;
				stageHeight = stage.fullScreenHeight;
				
				if (isLandscape)
					stage.setOrientation(StageOrientation.ROTATED_RIGHT);
			}
			else
			{
				stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				stage.setOrientation(StageOrientation.DEFAULT);
				stage.displayState = StageDisplayState.NORMAL;
				
				stageWidth = stage.stageWidth;
				stageHeight = stage.stageHeight;
				
				if (isLandscape)
					stage.setOrientation(StageOrientation.ROTATED_RIGHT);
			}
			
			sigStarlingStarted.addOnce(onStarlingStarted);
			
			Starling.multitouchEnabled = true;
			
			_starling = new Starling(MainContainer, stage, new Rectangle(0, 0, stageWidth, stageHeight));
			_starling.simulateMultitouch = true;
			_starling.start();
		}
		
		private function onStarlingStarted():void
		{
			var _menu:Menu = new Menu();
			ScreensManager.api.addNewScreen(_menu);
		}
		
	}
}