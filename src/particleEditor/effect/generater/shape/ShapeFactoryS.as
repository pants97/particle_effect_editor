package particleEditor.effect.generater.shape
{
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	import particleEditor.edit.ShapeEditorWithPropertyBaseS;
	import particleEditor.edit.ShapeProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class ShapeFactoryS implements IImportable
	{

		private var _shapesModel:Vector.<ShapeProperty>;


		public function ShapeFactoryS()
		{
			_shapesModel = new Vector.<ShapeProperty>();
		}

		public function get tagName():String
		{
			return "shape";
		}

		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:ShapeEditorWithPropertyBaseS = ShapeEditorWithPropertyBaseS(new cls());
				_editor.setListModel(_shapesModel);
				_editor.importCode(i);
			}
		}

		public function shapeProperties():Vector.<ShapeProperty>
		{
			return _shapesModel;
		}

	}

}