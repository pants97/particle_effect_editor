package particleEditor.effect.generater.material
{
	import particleEditor.edit.MaterialProperty;
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class MaterialFactoryS implements IImportable
	{
		
		private var _materialsModel:Vector.<MaterialProperty>;
		
		public function MaterialFactoryS()
		{
			_materialsModel = new Vector.<MaterialProperty>();
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
				var _editor:MaterialEditorBaseS = MaterialEditorBaseS(new cls());
				_editor.setListModel(_materialsModel);
				_editor.importCode(i);
			}
		}
		
		public function materialProperties():Vector.<MaterialProperty>
		{
			return _materialsModel;
		}
	
	}

}