package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.rotation.BillboardGlobal;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class BillboardEditorS extends GlobalActionBaseS
	{
		
		public function BillboardEditorS() 
		{
			super();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new BillboardGlobal();
		}
		
	}

}