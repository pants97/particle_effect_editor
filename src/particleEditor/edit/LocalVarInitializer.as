package particleEditor.edit
{
	import a3dparticle.particle.ParticleParam;

	import flash.utils.Dictionary;

	public interface LocalVarInitializer
	{

		function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void;

	}
}
