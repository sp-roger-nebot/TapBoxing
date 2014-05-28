package core.particles
{
	import core.managers.ParticlesManager;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class Particle extends Sprite
	{
		private var _tween:Tween;
		
		private var _tf:TextField;
		
		public function Particle(text:String)
		{
			_tf = new TextField(100, 30, text);
			_tf.fontSize = 30;
			_tf.touchable = false;
			_tf.x = -_tf.width / 2;
			_tf.y = -_tf.height / 2;
			addChild(_tf);
			//
			_tween = new Tween(this, .5, Transitions.LINEAR);
			_tween.fadeTo(0);
			_tween.onComplete = onComplete;
			Starling.juggler.add(_tween);
		}
		
		private function onComplete():void
		{
			ParticlesManager.api.removeParticle(this);
		}
		
	}
}