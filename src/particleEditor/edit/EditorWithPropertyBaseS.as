package particleEditor.edit
{
	/**
	 * ...
	 * @author liaocheng
	 */
	public class EditorWithPropertyBaseS extends EditorBaseS
	{

		protected var _property:Property;
		protected var definition:EditorDefinition;

		public function EditorWithPropertyBaseS()
		{
			super();
			_property = createProperty();
		}

		protected function createProperty():Property
		{
			throw new Error("Abstract function 'createProperty' was not overridden by " + this + ".");
		}

	}

}