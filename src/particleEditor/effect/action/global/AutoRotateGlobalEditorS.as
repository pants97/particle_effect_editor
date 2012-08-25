package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.rotation.AutoRotateGlobal;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class AutoRotateGlobalEditorS extends GlobalActionBaseS
	{
		
		public function AutoRotateGlobalEditorS() 
		{
			super();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new AutoRotateGlobal();
		}
		
	}

}