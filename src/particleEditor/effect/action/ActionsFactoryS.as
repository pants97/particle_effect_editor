package particleEditor.effect.action
{
	import particleEditor.edit.LocalVarInitializer;
	import a3dparticle.animators.actions.ActionBase;

	import particleEditor.edit.ActionProperty;
	import particleEditor.edit.IImportable;
	import particleEditor.edit.LocalActionProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class ActionsFactoryS implements IImportable
	{
		private var _globalFactory:GlobalFactoryS;
		private var _localFactory:LocalFactoryS;
		private var _initHandlers:Vector.<LocalVarInitializer>;

		public function ActionsFactoryS(varListModel:Array)
		{
			_globalFactory = new GlobalFactoryS();
			_localFactory = new LocalFactoryS(varListModel);

		}

		public function createNeedStuff():Vector.<ActionBase>
		{
			var actions:Vector.<ActionBase> = new Vector.<ActionBase>();
			
			var len:uint;
			var i:int;
			var property:ActionProperty;

			var listModel:Vector.<ActionProperty>;

			listModel = _globalFactory.actionProperties();
			len = listModel.length;
			for (i = 0; i < len; i++)
			{
				property = listModel[i];
				actions.push(property.getNewValue());
			}

			listModel = _localFactory.actionProperties();
			len = listModel.length;
			for (i = 0; i < len; i++)
			{
				property = listModel[i];
				actions.push(property.getNewValue());
			}
			return actions;
		}

		public function getInitParamHandlers():Vector.<LocalVarInitializer>
		{
			if (!_initHandlers)
			{
				_initHandlers = new Vector.<LocalVarInitializer>();
				var listModel:Vector.<ActionProperty> = _localFactory.actionProperties();
				var len:uint = listModel.length;
				for (var i:uint = 0; i < len; i++)
				{
					var actionProperty:LocalActionProperty = listModel[i] as LocalActionProperty;
					_initHandlers.push(actionProperty.initializer);
				}
			}
			return _initHandlers;
		}

		public function get tagName():String
		{
			return "action";
		}

		public function importCode(xml:XML):void
		{
			_globalFactory.importCode(xml[_globalFactory.tagName][0]);
			_localFactory.importCode(xml[_localFactory.tagName][0]);
		}

	}

}