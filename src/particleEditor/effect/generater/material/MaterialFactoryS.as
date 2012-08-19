package particleEditor.effect.generater.material
{
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.EditorWithPropertyBaseS;
	import particleEditor.edit.IImportable;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class MaterialFactoryS implements IImportable
	{
		
		private var _materialsModel:Array = new Array();
		
		
		public function MaterialFactoryS()
		{
		}
		
		public function get tagName():String
		{
			return "material";
		}
		
		
		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:EditorWithPropertyBaseS = new cls() as EditorWithPropertyBaseS;
				_editor.setListModel(_materialsModel);
				_editor.importCode(i);
			}
		}
		
		public function createNeedStuff():*
		{
			return _materialsModel;
		}
		
	
	}

}