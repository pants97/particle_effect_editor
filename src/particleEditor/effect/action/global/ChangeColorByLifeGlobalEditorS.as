package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.color.ChangeColorByLifeGlobal;

	import particleEditor.inputer.ColorTransformInputS;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ChangeColorByLifeGlobalEditorS extends GlobalActionBaseS
	{
		private var startInput:ColorTransformInputS;
		private var endInput:ColorTransformInputS;
		
		public function ChangeColorByLifeGlobalEditorS()
		{
			super();		
			startInput = new ColorTransformInputS();
			endInput = new ColorTransformInputS();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new ChangeColorByLifeGlobal(startInput.getValue(),endInput.getValue());
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			startInput.deserialize(xml.@start);
			endInput.deserialize(xml.@end);
		}
	}

}