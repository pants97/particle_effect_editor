package particleEditor.effect.action.global
{
	import particleEditor.edit.ActionEditorBaseS;
	import particleEditor.edit.ActionProperty;
	import particleEditor.edit.GlobalActionProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class GlobalActionBaseS extends ActionEditorBaseS
	{

		public function GlobalActionBaseS()
		{
			super();
		}

		override protected function createActionProperty():ActionProperty
		{
			return new GlobalActionProperty();
		}

	}

}