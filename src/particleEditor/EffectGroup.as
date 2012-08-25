package particleEditor {
	import a3dparticle.ParticlesContainer;

	import away3d.bounds.AxisAlignedBoundingBox;
	import away3d.bounds.BoundingVolumeBase;
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.Object3D;

	import com.pro3games.particle.jumpStart.JumpStartNode;
	import com.pro3games.particle.jumpStart.JumpStartTraverser;

	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class EffectGroup extends ObjectContainer3D implements JumpStartNode
	{
		private var _time:Number = 0;
		private var _particleContainers:Vector.<ParticlesContainer>;
		private var _hasStart:Boolean;
		private var _rawData:*;
		private var _bounds:BoundingVolumeBase;
		private var _showBounds:Boolean;
		private var _boundsIsShown:Boolean = false;

		public function EffectGroup(rawData:*, particleContainers:Vector.<ParticlesContainer>)
		{
			this._rawData = rawData;
			_bounds = new AxisAlignedBoundingBox();
			_particleContainers = particleContainers;
			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				var particleContainer:ParticlesContainer = _particleContainers[i];
				particleContainer.time = time;
				addChild(particleContainer);
				checkBorder(particleContainer);
			}
		}

		override public function set mouseEnabled(value:Boolean):void
		{
			super.mouseEnabled = value;
			
			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				_particleContainers[i].mouseEnabled = value;
			}
		}

		public function bounds():BoundingVolumeBase
		{
			return _bounds;
		}

		public function get rawData():XML
		{
			return _rawData;
		}

		public function hasStart():Boolean
		{
			return _hasStart;
		}

		public function isEmpty():Boolean
		{
			return _particleContainers.length == 0;
		}

		private function checkBorder(particleContainer:ParticlesContainer):void
		{
			var x:Number = particleContainer.x;
			var y:Number = particleContainer.y;
			var z:Number = particleContainer.z;

			var scaleX:Number = particleContainer.scaleX;
			var scaleY:Number = particleContainer.scaleY;
			var scaleZ:Number = particleContainer.scaleZ;

			var bounds:BoundingVolumeBase = particleContainer.bounds;
			var min:Vector3D = bounds.min;
			var max:Vector3D = bounds.max;

			var _minX:Number = min.x * + x;
			var _minY:Number = min.y * scaleY + y;
			var _minZ:Number = min.z * scaleZ + z;

			var _maxX:Number = max.x * scaleX + x;
			var _maxY:Number = max.x * scaleY + y;
			var _maxZ:Number = max.x * scaleZ + z;

			min = _bounds.min;
			max = _bounds.max;
			if (min.x > _minX || min.y > _minY || z > _minZ || max.x < _maxX || max.y < _maxY || max.z < _maxZ)
				_bounds.fromExtremes(_minX, _minY, _minZ, _maxX, _maxY, _maxZ);
		}

		public function start():void
		{
			_hasStart = true;

			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				var particleContainer:ParticlesContainer = _particleContainers[i];
				particleContainer.start();
			}
		}

		public function stop():void
		{
			_hasStart = false;

			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				var particleContainer:ParticlesContainer = _particleContainers[i];
				particleContainer.stop();
			}
		}

		public function set time(value:Number):void
		{
			_time = value;

			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				var particleContainer:ParticlesContainer = _particleContainers[i];
				particleContainer.time = _time;
			}
		}

		public function get time():Number
		{
			if (isEmpty()) return _time;
			else return _particleContainers[0].time;
		}

		override public function clone():Object3D
		{
			var len:uint = _particleContainers.length;
			var _clonedContainers:Vector.<ParticlesContainer> = new Vector.<ParticlesContainer>(len, true);
			for (var i:int = 0; i < len; i++)
			{
				_clonedContainers[i] = _particleContainers[i].clone() as ParticlesContainer;
			}
			var clone:EffectGroup = new EffectGroup(_rawData, _clonedContainers);
			clone.time = time;
			clone.pivotPoint = pivotPoint;
			clone.transform = transform;
			clone.partition = partition;
			clone.name = name;
			return clone;
		}

		public function get showBounds():Boolean
		{
			return _showBounds;
		}

		public function set showBounds(value:Boolean):void
		{
			if (value == _showBounds)
				return;

			_showBounds = value;

			if (_showBounds)
				addBounds();
			else
				removeBounds();
		}

		private function addBounds():void
		{
			if (!_boundsIsShown)
			{
				_boundsIsShown = true;
				addChild(_bounds.boundingRenderable);
			}
		}

		private function removeBounds():void
		{
			if (_boundsIsShown)
			{
				_boundsIsShown = false;
				removeChild(_bounds.boundingRenderable);
				_bounds.disposeRenderable();
			}
		}

		public function acceptTraverser(jumpStartTraverser:JumpStartTraverser):void
		{
			var len:uint = _particleContainers.length;
			for (var i:uint = 0; i < len; ++i)
			{
				_particleContainers[i].acceptTraverser(jumpStartTraverser);
			}
		}
		
		public function get particleContainers():Vector.<ParticlesContainer>
		{
			return _particleContainers;
		}

	}

}