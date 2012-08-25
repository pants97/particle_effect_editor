package  particleEditor.edit
{
	/**
	 * ...
	 * @author liaocheng
	 */
	public class LocalActionProperty extends ActionProperty
	{

		private var _localVarInitializer:LocalVarInitializer;
		
		public function LocalActionProperty(localVarInitializer:LocalVarInitializer) 
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