package particleEditor.edit
{
	import particleEditor.edit.Property;

	public class FunctionProperty extends Property
	{

		private var _localVarInitializer:LocalVarInitializer;

		public function FunctionProperty(localVarInitializer:LocalVarInitializer)
		{
			super();
			_localVarInitializer = localVarInitializer;
		}
		
		public function get initializer():LocalVarInitializer
		{
			return _localVarInitializer;
		}
	}
}
