package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.uv.UVLinearEaseGlobal;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class UVLinearEaseGlobalEditorS extends GlobalActionBaseS
	{
		private var cycle:Number;
		private var scale:Number;
		
		public function UVLinearEaseGlobalEditorS()
		{
			super();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new UVLinearEaseGlobal(cycle, scale);
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			cycle=Number(xml.@cycle);
			scale=Number(xml.@scale);
		}
	}

}