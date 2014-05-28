package core.managers
{
	import core.particles.Particle;
	
	import starling.display.Sprite;

	public class ParticlesManager
	{
		public static var api:ParticlesManager = new ParticlesManager();
		
		private var _container:Sprite;
		
		public function ParticlesManager()
		{
			if(api)
				return;
		}
		
		public function initialize(container:Sprite):void
		{
			_container = container;
		}
		
		public function addParticleAt(particle:Particle, x:Number, y:Number):void
		{
			particle.x = x;
			particle.y = y;
			_container.addChild(particle);
		}
		
		public function removeParticle(particle:Particle):void
		{
			if(particle && particle.parent)
				particle.parent.removeChild(particle);
		}
		
	}
}