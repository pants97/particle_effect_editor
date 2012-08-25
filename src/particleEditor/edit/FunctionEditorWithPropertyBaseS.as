package particleEditor.edit 
{
	import a3dparticle.particle.ParticleParam;

	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class FunctionEditorWithPropertyBaseS extends EditorWithPropertyBaseS implements LocalVarInitializer
	{

		private var _listModel:Vector.<FunctionProperty>;		

		public function FunctionEditorWithPropertyBaseS() 
		{
			super();
		}

		override protected function createProperty():Property
		{
			return new FunctionProperty(this);
		}

		public function setListModel(listModel:Vector.<FunctionProperty>):void
		{
			_listModel = listModel;
			_listModel.push(_property);
		}

		public function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void
		{
			throw new Error("Abstract function 'initializeLocalVars' was not overridden by " + this + ".");
		}
	}

}