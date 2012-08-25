package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.scale.ScaleByTimeGlobal;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ScaleByTimeGlobalEditorS extends GlobalActionBaseS
	{
		private var minInput:Number;
		private var maxInput:Number;
		private var cycleinput:Number;
		
		public function ScaleByTimeGlobalEditorS()
		{
			super();
			
			minInput = 1;
			maxInput = 1;
			cycleinput = 1;
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new ScaleByTimeGlobal(minInput, maxInput, cycleinput);
		}
		
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			minInput=Number(xml.@min);
			maxInput=Number(xml.@max);
			cycleinput=Number(xml.@cycle);
		}
	}

}