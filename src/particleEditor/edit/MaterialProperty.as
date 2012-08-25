package particleEditor.edit
{
	import a3dparticle.particle.ParticleMaterialBase;

	public class MaterialProperty extends Property
	{

		public function MaterialProperty()
		{
			super();
		}
		
		public function getNewValue():ParticleMaterialBase
		{
			return _handler();
		}
	}
}
