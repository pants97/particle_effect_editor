package particleEditor.effect.action.global
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.uv.UVSeqPicByLifeGlobal;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class UVSeqPicByLifeGlobalEditorS extends GlobalActionBaseS
	{
		private var columns:int;
		private var rows:int;
		private var usingNum:int;
		
		public function UVSeqPicByLifeGlobalEditorS()
		{
			super();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new UVSeqPicByLifeGlobal(columns, rows,usingNum);
		}
		
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			columns=int(xml.@columns);
			rows=int(xml.@rows);
			usingNum=int(xml.@usingNum);
		}
	}

}