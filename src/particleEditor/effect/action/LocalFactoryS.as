package particleEditor.effect.action
{
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	import particleEditor.effect.action.local.*;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class LocalFactoryS extends ActionFactoryBaseS implements IImportable
	{

		private var _varListModel:Array;

		public function LocalFactoryS(varListModel:Array)
		{
			super();
			_varListModel = varListModel;
		}

		public function get tagName():String
		{
			return "local";
		}

		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:LocalActionBaseS = LocalActionBaseS(new cls(_varListModel));
				_editor.setListModel(_actionsModel);
				_editor.importCode(i);
			}
		}

	}

}