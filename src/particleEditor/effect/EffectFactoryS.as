package particleEditor.effect
{
	import a3dparticle.ParticlesContainer;
	import a3dparticle.generater.GeneraterBase;
	import a3dparticle.particle.ParticleParam;

	import particleEditor.edit.IImportable;
	import particleEditor.effect.action.ActionsFactoryS;
	import particleEditor.effect.generater.GeneraterFactoryS;
	import particleEditor.effect.param.InitParamFactoryS;

	import flash.utils.Dictionary;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class EffectFactoryS implements IImportable
	{
		private var _generaterFactory:GeneraterFactoryS;

		private var _systemFactory:SystemFactoryS;

		private var _actionsFactory:ActionsFactoryS;
		private var _initParamFactory:InitParamFactoryS;

		public function EffectFactoryS()
		{

			_generaterFactory = new GeneraterFactoryS();
			_initParamFactory = new InitParamFactoryS();

			_actionsFactory = new ActionsFactoryS(_initParamFactory.getVarListModel());

			_systemFactory = new SystemFactoryS();
		}

		public function get tagName():String
		{
			return "effect";
		}

		public function createNeedStuff():*
		{
			var particlesContainer:ParticlesContainer = _systemFactory.createNeedStuff() as ParticlesContainer;
			var allActions:Array = _actionsFactory.createNeedStuff() as Array;
			var len:uint = allActions.length;
			for (var i:uint = 0; i < len; ++i)
			{
				particlesContainer.addAction(allActions[i]);
			}

			particlesContainer.initParticleFun = initParticleFun();
			particlesContainer.generate(_generaterFactory.createNeedStuff() as GeneraterBase);
			return particlesContainer;
		}

		public function importCode(xml:XML):void
		{
			_systemFactory.importCode(xml[_systemFactory.tagName][0]);
			_generaterFactory.importCode(xml[_generaterFactory.tagName][0]);
			_initParamFactory.importCode(xml[_initParamFactory.tagName][0]);
			_actionsFactory.importCode(xml[_actionsFactory.tagName][0]);
		}


		private function initParticleFun():Function
		{

			return function(param:ParticleParam):void
			{
				var initHandlers:Array;
				var len:uint;
				var i:uint;

				var localVars:Dictionary = new Dictionary;

				initHandlers = _initParamFactory.createNeedStuff() as Array;
				len = initHandlers.length;
				for (i = 0; i < len; ++i)
				{
					initHandlers[i](param, localVars);
				}

				// for an exception action -- TimeAction
				_initParamFactory.getTimeHanlder()(param, localVars);

				// for normal actions
				initHandlers = _actionsFactory.getInitParamHandlers();
				len = initHandlers.length;
				for (i = 0; i < len; ++i)
				{
					initHandlers[i](param, localVars);
				}
			};
		}

	}

}