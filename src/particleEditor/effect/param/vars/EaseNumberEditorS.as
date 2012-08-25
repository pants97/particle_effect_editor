package particleEditor.effect.param.vars
{
	import a3dparticle.particle.ParticleParam;

	import particleEditor.easing.EaseDefinition;
	import particleEditor.inputer.ComboBoxInputS;

	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class EaseNumberEditorS extends VarEditorBaseS
	{
		
		private var startInput:Number;
		private var endInput:Number;
		
		private var easeInput:ComboBoxInputS;
		
		public function EaseNumberEditorS() 
		{
			super();
			
			startInput = 0;
			endInput = 0;
			easeInput = new ComboBoxInputS(EaseDefinition.ALL_EASE);		
			addVarProperty("");
		}

		private function get ease():EaseDefinition
		{
			return easeInput.getValue() as EaseDefinition;
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			startInput=Number(xml.@start);
			endInput=Number(xml.@end);
			easeInput.deserialize(xml.@ease);
		}

		override public function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void
		{
			localVars[getVarProperty("")] = ease.easeFunction(param.index,startInput,endInput-startInput,param.total);
		}
		
	}

}