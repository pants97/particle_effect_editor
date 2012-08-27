package particleEditor.effect.generater.subGenerate
{
	import a3dparticle.generater.GeneraterBase;
	import particleEditor.edit.EditorBaseS;

	public class GeneraterEditorBaseS extends EditorBaseS
	{
		protected var _sampleCountMultiplier:Number = 1.0;

		public function GeneraterEditorBaseS(sampleCountMultiplier:Number = 1.0)
		{
			_sampleCountMultiplier = sampleCountMultiplier;
		}
		
		public function createNeedStuff():GeneraterBase
		{
			return null;
		}
	}
}
