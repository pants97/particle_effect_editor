package particleEditor.effect.generater.shape
{
	import away3d.core.base.SubGeometry;

	import particleEditor.edit.ShapeEditorWithPropertyBaseS;
	import particleEditor.inputer.FileModelInputS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class FileModelEditorS extends ShapeEditorWithPropertyBaseS
	{
		
		private var modelInput:FileModelInputS;
		private var scaleInput:Number;
		public function FileModelEditorS() 
		{
			super();
			modelInput = new FileModelInputS();
			scaleInput = 1;
		}
			
		override public function createNeedStuff():SubGeometry
		{
			var geometry:SubGeometry = modelInput.getValue();
			geometry.scale(scaleInput);
			return geometry;
		}
		
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			modelInput.deserialize(xml.model.text());
			scaleInput=Number(xml.@scale);
		}
		
	}

}