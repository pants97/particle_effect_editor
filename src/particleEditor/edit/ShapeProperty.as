package particleEditor.edit
{
	import away3d.core.base.SubGeometry;

	public class ShapeProperty extends Property
	{

		public function ShapeProperty()
		{
			super();
		}
		
		public function getNewValue():SubGeometry
		{
			return _handler();
		}
	}
}
