package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.scale.ScaleByLifeGlobal;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ScaleByLifeGlobalEditorS extends GlobalActionBaseS
	{
		private var startInput:Number;
		private var endInput:Number;
		
		public function ScaleByLifeGlobalEditorS()
		{
			super();
			startInput = 1;
			endInput = 2;
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new ScaleByLifeGlobal(startInput, endInput);
		}
		
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			startInput=Number(xml.@start);
			endInput=Number(xml.@end);
		}
	
	}

}