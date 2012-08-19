package particleEditor.inputer
{
	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class VectorDegreeInputS implements IDeserializable
	{
		private var adjusterValues:Vector3D;

		public function VectorDegreeInputS()
		{
			adjusterValues = new Vector3D();
		}

		public function deserialize(value:String):void
		{
			var array:Array = value.split(",");
			adjusterValues.x = Number(array[0]);
			adjusterValues.y = Number(array[1]);
			adjusterValues.z = Number(array[2]);
		}

		public function getValue():Vector3D
		{
			return adjusterValues;
		}

	}

}