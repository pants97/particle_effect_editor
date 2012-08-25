package particleEditor.edit
{
	import particleEditor.edit.Property;

	public class FunctionProperty extends Property
	{

		public function FunctionProperty()
		{
			super();
		}
		
		public function getNewValue():Function
		{
			return _handler();
		}
	}
}
