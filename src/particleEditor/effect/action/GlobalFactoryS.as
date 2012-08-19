package particleEditor.effect.action {
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.EditorWithPropertyBaseS;
	import particleEditor.edit.IImportable;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class GlobalFactoryS implements IImportable
	{
		
		private var _actionsModel:Array = new Array();
		
		public function GlobalFactoryS()
		{
		}
		
		public function createNeedStuff():*
		{
			return _actionsModel;
		}		
		
		
		public function get tagName():String
		{
			return "global";
		}
		
		public function importCode(xml:XML):void
		{
			for each(var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:EditorWithPropertyBaseS = new cls() as EditorWithPropertyBaseS;
				_editor.setListModel(_actionsModel);
				_editor.importCode(i);
			}
		}
	}

}