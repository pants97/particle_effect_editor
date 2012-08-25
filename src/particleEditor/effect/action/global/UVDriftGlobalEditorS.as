package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.uv.UVDriftGlobal;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class UVDriftGlobalEditorS extends GlobalActionBaseS
	{
		private var cycle:Number;
		private var scale:Number;
		
		public function UVDriftGlobalEditorS()
		{
			super();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new UVDriftGlobal(cycle, scale);
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			cycle=Number(xml.@cycle);
			scale=Number(xml.@scale);
		}
	}

}