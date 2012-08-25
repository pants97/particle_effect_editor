package particleEditor.edit
{
	import a3dparticle.animators.actions.ActionBase;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class ActionEditorBaseS extends EditorWithPropertyBaseS
	{

		private var _listModel:Vector.<ActionProperty>;

		final override protected function createProperty():Property
		{
			var property:ActionProperty = createActionProperty();
			property.setCreateHandler(this.createNeedStuff);
			return property;
		}

		protected function createActionProperty():ActionProperty
		{
			throw new Error("Abstract function 'createActionProperty' was not overridden by " + this + ".");
		}

		public function createNeedStuff():ActionBase
		{
			throw new Error("Abstract function 'createNeedStuff' was not overridden by " + this + ".");
		}

		public function setListModel(listModel:Vector.<ActionProperty>):void
		{
			_listModel = listModel;
			_listModel.push(_property);
		}
	}

}