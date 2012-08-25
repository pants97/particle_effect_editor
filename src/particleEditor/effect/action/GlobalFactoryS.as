package particleEditor.effect.action
{
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	import particleEditor.effect.action.global.GlobalActionBaseS;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class GlobalFactoryS extends ActionFactoryBaseS implements IImportable
	{

		public function GlobalFactoryS()
		{
			super();
		}

		public function get tagName():String
		{
			return "global";
		}

		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:GlobalActionBaseS = GlobalActionBaseS(new cls());
				_editor.setListModel(_actionsModel);
				_editor.importCode(i);
			}
		}
	}

}