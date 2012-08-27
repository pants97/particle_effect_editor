package particleEditor
{
	import a3dparticle.ParticlesContainer;

	import particleEditor.edit.IImportable;
	import particleEditor.effect.EffectFactoryS;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class EffectGroupFactoryS implements IImportable
	{

		private var _particleGeneraters:Vector.<EffectFactoryS>;
		private var _rawData:*;
		private var _sampleCountMultiplier:Number = 1.0;

		public function EffectGroupFactoryS(sampleCountMultiplier:Number = 1.0)
		{
			_particleGeneraters = new Vector.<EffectFactoryS>;
			_sampleCountMultiplier = sampleCountMultiplier;
		}

		public function get tagName():String
		{
			return "root";
		}

		public function importCode(code:XML):void
		{
			EffectFormat.verifyFormat(code);
			_particleGeneraters = new Vector.<EffectFactoryS>;
			for each (var effect:XML in code.effect)
			{
				var system:EffectFactoryS = new EffectFactoryS(_sampleCountMultiplier);
				system.importCode(effect);
				_particleGeneraters.push(system);
			}
			_rawData = code.toString();
		}

		public function createNeedStuff():EffectGroup
		{
			if (!_rawData)
				throw(new Error("please import a valid data first"));

			var len:uint = _particleGeneraters.length;
			var _particleContainers:Vector.<ParticlesContainer> = new Vector.<ParticlesContainer>(len, true);

			for (var i:uint = 0; i < len; ++i)
			{
				var particleGenerator:EffectFactoryS = _particleGeneraters[i];
				_particleContainers[i] = particleGenerator.createNeedStuff();
			}
			return new EffectGroup(_rawData, _particleContainers);
		}

		public static function createEffectGroup(_rawData:*):EffectGroup
		{
			var effectGroupFactory:EffectGroupFactoryS = new EffectGroupFactoryS();
			effectGroupFactory.importCode(XML(_rawData));
			return effectGroupFactory.createNeedStuff() as EffectGroup;
		}

	}

}