package particleEditor.inputer
{
	/**
	 * ...
	 * @author liaocheng
	 */
	public class VectorComboBoxS implements IDeserializable
	{
		protected var xComboInput:ComboBoxInputS;
		protected var yComboInput:ComboBoxInputS;
		protected var zComboInput:ComboBoxInputS;
		
		private var comboInputValues:Array;
		
		public function VectorComboBoxS(listData:*= null)
		{
			xComboInput = new ComboBoxInputS(listData);
			yComboInput = new ComboBoxInputS(listData);
			zComboInput = new ComboBoxInputS(listData);
			
			comboInputValues = [];
		}
		
		public function getValue():Array
		{
			comboInputValues.length = 0;
			comboInputValues.push(xComboInput.getValue());
			comboInputValues.push(yComboInput.getValue());
			comboInputValues.push(zComboInput.getValue());
			return comboInputValues;
		}
		
		public function deserialize(value:String):void
		{
			var array:Array = value.split(",");
			xComboInput.deserialize(array[0]);
			yComboInput.deserialize(array[1]);
			zComboInput.deserialize(array[2]);
		}
		
	}

}