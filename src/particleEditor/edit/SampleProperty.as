package particleEditor.edit
{
	import a3dparticle.particle.ParticleSample;

	public class SampleProperty extends Property
	{

		public function SampleProperty()
		{
			super();
		}

		public function getNewValue():ParticleSample
		{
			return _handler();
		}
	}
}
