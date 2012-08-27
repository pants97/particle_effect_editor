package particleEditor.effect
{
	import particleEditor.edit.LocalVarInitializer;
	import a3dparticle.ParticlesContainer;
	import a3dparticle.animators.actions.ActionBase;
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

		public function EffectFactoryS(sampleCountMultiplier:Number = 1.0)
		{

			_generaterFactory = new GeneraterFactoryS(sampleCountMultiplier);
			_initParamFactory = new InitParamFactoryS();

			_actionsFactory = new ActionsFactoryS(_initParamFactory.getVarListModel());

			_systemFactory = new SystemFactoryS();
		}

		public function get tagName():String
		{
			return "effect";
		}

		public function createNeedStuff():ParticlesContainer
		{
			var particlesContainer:ParticlesContainer = _systemFactory.createNeedStuff();
			var allActions:Vector.<ActionBase> = _actionsFactory.createNeedStuff();
			var len:uint = allActions.length;
			for (var i:uint = 0; i < len; ++i)
			{
				particlesContainer.addAction(allActions[i]);
			}

			particlesContainer.initParticleFun = initParticleFun;
			particlesContainer.generate(_generaterFactory.createNeedStuff());
			return particlesContainer;
		}

		public function importCode(xml:XML):void
		{
			_systemFactory.importCode(xml[_systemFactory.tagName][0]);
			_generaterFactory.importCode(xml[_generaterFactory.tagName][0]);
			_initParamFactory.importCode(xml[_initParamFactory.tagName][0]);
			_actionsFactory.importCode(xml[_actionsFactory.tagName][0]);
		}

		private function initParticleFun(param:ParticleParam):void
		{
			var initHandlers:Vector.<LocalVarInitializer>;
			var len:uint;
			var i:uint;

			var localVars:Dictionary = new Dictionary;

			initHandlers = _initParamFactory.createNeedStuff();
			len = initHandlers.length;
			for (i = 0; i < len; ++i)
			{
				initHandlers[i].initializeLocalVars(param, localVars);
			}

			// for an exception action -- TimeAction
			_initParamFactory.getTimeHanlder().initializeLocalVars(param, localVars);

			// for normal actions
			initHandlers = _actionsFactory.getInitParamHandlers();
			len = initHandlers.length;
			for (i = 0; i < len; ++i)
			{
				initHandlers[i].initializeLocalVars(param, localVars);
			}
		}

	}

}