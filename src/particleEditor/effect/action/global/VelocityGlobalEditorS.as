package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.velocity.VelocityGlobal;

	import particleEditor.inputer.Vector3dInputS;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class VelocityGlobalEditorS extends GlobalActionBaseS
	{
		private var valueInput:Vector3dInputS;
		
		public function VelocityGlobalEditorS()
		{
			super();
			
			valueInput = new Vector3dInputS(0, 200, 0);
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new VelocityGlobal(valueInput.getValue());
		}
				
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			valueInput.deserialize(xml.@velocity);
		}
	}

}