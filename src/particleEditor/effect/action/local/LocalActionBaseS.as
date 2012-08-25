package particleEditor.effect.action.local
{
	import particleEditor.edit.ActionEditorBaseS;
	import particleEditor.edit.ActionProperty;
	import particleEditor.edit.FunctionEditorWithPropertyBaseS;
	import particleEditor.edit.LocalActionProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class LocalActionBaseS extends ActionEditorBaseS
	{

		protected var paramPane:FunctionEditorWithPropertyBaseS;
		protected var varListModel:Array;

		public function LocalActionBaseS(_varListModel:Array)
		{
			varListModel = _varListModel;
			paramPane = createParamPane();
			
			super();
		}

		override protected function createActionProperty():ActionProperty
		{
			return new LocalActionProperty(paramPane);
		}

		protected function createParamPane():FunctionEditorWithPropertyBaseS
		{
			throw(new Error("abstract  method!"));
			return null;
		}

		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			paramPane.importCode(xml[paramPane.tagName][0]);
		}

	}

}