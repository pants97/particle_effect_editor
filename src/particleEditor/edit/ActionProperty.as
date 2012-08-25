package  particleEditor.edit
{
	import a3dparticle.animators.actions.ActionBase;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ActionProperty extends Property
	{

		public function ActionProperty() 
		{
			super();
		}
		
		public function getNewValue():ActionBase
		{
			return _handler();
		}
	}

}