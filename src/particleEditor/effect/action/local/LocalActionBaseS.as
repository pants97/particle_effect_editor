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
			super();
			varListModel = _varListModel;
			paramPane = createParamPane();
			(_property as LocalActionProperty).setInitParamHandler(paramPane.createNeedStuff);
		}

		override protected function createActionProperty():ActionProperty
		{
			return new LocalActionProperty();
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