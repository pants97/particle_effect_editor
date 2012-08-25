package particleEditor.effect.param
{
	import particleEditor.edit.FunctionProperty;
	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	import particleEditor.effect.param.vars.*;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class LocalVarFactoryS  implements IImportable
	{

		private var _varsModel:Array = new Array();

		private var _funModel:Vector.<FunctionProperty>;

		public function LocalVarFactoryS()
		{
			_funModel = new Vector.<FunctionProperty>();
		}

		public function getVarListModel():Array
		{
			return _varsModel;
		}

		public function createNeedStuff():Array
		{
			var funModel:Array = [];
			var len:uint = _funModel.length;
			for (var i:uint = 0; i < len; ++i)
			{
				funModel.push(_funModel[i].getNewValue());
			}
			return funModel;
		}

		public function get tagName():String
		{
			return "vars";
		}

		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var cls:Class = EditorDefinition.getClassByNameS(i.@clazz);
				var _editor:VarEditorBaseS = new cls() as VarEditorBaseS;
				_editor.setListModel(_funModel);
				_editor.setVarListModel(_varsModel);
				_editor.importCode(i);
			}
		}

	}

}