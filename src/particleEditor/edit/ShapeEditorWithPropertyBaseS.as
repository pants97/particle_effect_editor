package particleEditor.edit 
{
	import away3d.core.base.SubGeometry;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ShapeEditorWithPropertyBaseS extends EditorWithPropertyBaseS
	{
		
		private var _listModel:Vector.<ShapeProperty>;

		public function ShapeEditorWithPropertyBaseS() 
		{
			super();
		}

		override protected function createProperty():Property
		{
			var property:ShapeProperty = new ShapeProperty();
			property.setCreateHandler(this.createNeedStuff);
			return property;
		}

		public function createNeedStuff():SubGeometry
		{
			throw new Error("Abstract function 'createNeedStuff' was not overridden by " + this + ".");
		}

		public function setListModel(listModel:Vector.<ShapeProperty>):void
		{
			_listModel = listModel;
			_listModel.push(_property);
		}
	}

}