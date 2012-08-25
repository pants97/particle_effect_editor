package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.color.FlickerGlobal;

	import particleEditor.inputer.ColorTransformInputS;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class FlickerGlobalEditorS extends GlobalActionBaseS
	{
		private var minInput:ColorTransformInputS;
		private var maxInput:ColorTransformInputS;
		private var cycleInput:Number;
		private var phaseAngleInput:Number;
		
		public function FlickerGlobalEditorS()
		{
			super();
			
			minInput = new ColorTransformInputS();
			maxInput = new ColorTransformInputS();
			cycleInput = 10;
			phaseAngleInput = 0;
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new FlickerGlobal(minInput.getValue(),maxInput.getValue(),cycleInput,phaseAngleInput);
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			minInput.deserialize(xml.@min);
			maxInput.deserialize(xml.@max);
			cycleInput=Number(xml.@cycle);
			phaseAngleInput=Number(xml.@phase);
		}
	}

}