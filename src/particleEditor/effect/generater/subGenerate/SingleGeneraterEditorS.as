package particleEditor.effect.generater.subGenerate
{
	import a3dparticle.generater.GeneraterBase;
	import a3dparticle.generater.SingleGenerater;
	import a3dparticle.particle.ParticleSample;

	import particleEditor.edit.SampleProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class SingleGeneraterEditorS extends GeneraterEditorBaseS
	{

		private var countInput:int;
		private var _sampleModel:Vector.<SampleProperty>;
		private var _sampleIndex:int;

		public function SingleGeneraterEditorS(sampleModel:Vector.<SampleProperty>, sampleCountMultiplier:Number = 1.0)
		{
			super(sampleCountMultiplier);
			_sampleModel = sampleModel;
		}

		override public function createNeedStuff():GeneraterBase
		{
			if (_sampleIndex >= 0)
			{
				var sample:ParticleSample = _sampleModel[_sampleIndex].getNewValue();
				return new SingleGenerater(sample, int(countInput * _sampleCountMultiplier + 1));
			}
			else
			{
				throw new Error("can not get generater");
				return null;
			}
		}

		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			_sampleIndex = int(xml.@sample);
			countInput = int(xml.@count);
		}

	}

}