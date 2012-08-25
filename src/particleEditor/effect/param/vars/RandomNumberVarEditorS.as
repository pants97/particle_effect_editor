package particleEditor.effect.param.vars
{
	import a3dparticle.particle.ParticleParam;

	import flash.utils.Dictionary;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class RandomNumberVarEditorS extends VarEditorBaseS
	{

		private var minInput:Number;
		private var maxInput:Number;

		public function RandomNumberVarEditorS()
		{
			super();

			minInput = 0;
			maxInput = 0;
			addVarProperty("");
		}

		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			minInput = Number(xml.@min);
			maxInput = Number(xml.@max);
		}

		override public function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void
		{
			var min:Number = minInput;
			var max:Number = maxInput;
			localVars[getVarProperty("")] = Math.random() * (max - min) + min;
		}
	}

}