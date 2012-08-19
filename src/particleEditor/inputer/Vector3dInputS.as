package particleEditor.inputer
{
	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class Vector3dInputS implements IDeserializable
	{

		private var inputCoordinates:Vector3D;

		public function Vector3dInputS(x:Number = 0, y:Number = 0, z:Number = 0)
		{
			inputCoordinates = new Vector3D(x, y, z);
		}

		public function getValue():Vector3D
		{
			return inputCoordinates;
		}

		public function deserialize(value:String):void
		{
			var array:Array = value.split(",");
			inputCoordinates.x = Number(array[0]);
			inputCoordinates.y = Number(array[1]);
			inputCoordinates.z = Number(array[2]);
		}

	}

}