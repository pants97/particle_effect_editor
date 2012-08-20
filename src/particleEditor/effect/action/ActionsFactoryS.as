package particleEditor.effect.action
{
	import particleEditor.edit.IImportable;
	import particleEditor.edit.LocalActionProperty;
	import particleEditor.edit.Property;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class ActionsFactoryS implements IImportable
	{
		private var _globalFactory:GlobalFactoryS;
		private var _localFactory:LocalFactoryS;

		public function ActionsFactoryS(varListModel:Array)
		{
			_globalFactory = new GlobalFactoryS();
			_localFactory = new LocalFactoryS(varListModel);

		}

		public function createNeedStuff():*
		{
			var actions:Array = [];
			var len:uint;
			var i:int;
			var property:Property;

			var listModel:Array;

			listModel = _globalFactory.createNeedStuff() as Array;
			len = listModel.length;
			for (i = 0; i < len; i++)
			{
				property = listModel[i] as Property;
				actions.push(property.getNewValue());
			}

			listModel = _localFactory.createNeedStuff() as Array;
			len = listModel.length;
			for (i = 0; i < len; i++)
			{
				property = listModel[i] as Property;
				actions.push(property.getNewValue());
			}
			return actions;
		}

		public function getInitParamHandlers():Array
		{
			var initHandlers:Array = [];
			var listModel:Array = _localFactory.createNeedStuff() as Array;
			var len:uint = listModel.length;
			for (var i:uint = 0; i < len; i++)
			{
				var actionProperty:LocalActionProperty = listModel[i] as LocalActionProperty;
				initHandlers.push(actionProperty.getNewInitHanlder());
			}
			return initHandlers;
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