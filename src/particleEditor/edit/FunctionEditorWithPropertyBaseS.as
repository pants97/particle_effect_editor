package particleEditor.edit 
{
	/**
	 * ...
	 * @author liaocheng
	 */
	public class FunctionEditorWithPropertyBaseS extends EditorWithPropertyBaseS
	{

		private var _listModel:Vector.<FunctionProperty>;		

		public function FunctionEditorWithPropertyBaseS() 
		{
			super();
		}

		override protected function createProperty():Property
		{
			var property:Property = new FunctionProperty();
			property.setCreateHandler(this.createNeedStuff);
			return property;
		}

		public function createNeedStuff():Function
		{
			throw new Error("Abstract function 'createNeedStuff' was not overridden by " + this + ".");
		}

		public function setListModel(listModel:Vector.<FunctionProperty>):void
		{
			_listModel = listModel;
			_listModel.push(_property);
		}
	}

}