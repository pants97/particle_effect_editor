package particleEditor.effect.generater.subGenerate
{
	import a3dparticle.generater.GeneraterBase;
	import a3dparticle.generater.MutiWeightGenerater;
	import a3dparticle.particle.ParticleSample;

	import particleEditor.edit.SampleProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class WeightGeneraterEditorS extends GeneraterEditorBaseS
	{

		private var _sampleModel:Vector.<SampleProperty>;

		private var weightSampleContainer:Vector.<WeightSampePaneS>;
		private var countInput:int;

		public function WeightGeneraterEditorS(sampleModel:Vector.<SampleProperty>)
		{
			super();
			_sampleModel = sampleModel;
			weightSampleContainer = new Vector.<WeightSampePaneS>();
		}


		override public function createNeedStuff():GeneraterBase
		{
			var samples:Vector.<ParticleSample> = new Vector.<ParticleSample>();
			var weights:Vector.<int> = new Vector.<int>();
			var pane:WeightSampePaneS;
			for (var i:int = 0; i < weightSampleContainer.length; i++)
			{
				pane = weightSampleContainer[i];
				samples.push(pane.sampleProperty.getNewValue());
				weights.push(pane.weightInput);
			}
			return new MutiWeightGenerater(samples, weights, countInput);
		}

		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			for each (var segment:XML in xml.weight_sample)
			{
				var sampleProperty:SampleProperty;
				var sampleIndex:int = int(segment.@sample);
				if (sampleIndex >= 0)
					sampleProperty = _sampleModel[sampleIndex];

				var pane:WeightSampePaneS = new WeightSampePaneS(sampleProperty);
				pane.weightInput = int(segment.@weight);

				weightSampleContainer.push(pane);
			}
			countInput = int(xml.@count);
		}
	}
}
import particleEditor.edit.SampleProperty;

class WeightSampePaneS
{

	public var weightInput:int;
	public var sampleProperty:SampleProperty;

	public function WeightSampePaneS(sampleProperty:SampleProperty)
	{
		this.sampleProperty = sampleProperty;
	}
}