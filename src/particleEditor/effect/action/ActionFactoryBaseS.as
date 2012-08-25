package particleEditor.effect.action
{
	import particleEditor.edit.ActionProperty;

	public class ActionFactoryBaseS
	{

		protected var _actionsModel:Vector.<ActionProperty>;

		public function ActionFactoryBaseS()
		{
			_actionsModel = new Vector.<ActionProperty>();
		}

		public function actionProperties():Vector.<ActionProperty>
		{
			return _actionsModel;
		}
	}
}
