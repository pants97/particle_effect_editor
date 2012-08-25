package particleEditor.effect.generater.shape
{
	import away3d.core.base.SubGeometry;
	import away3d.primitives.PlaneGeometry;

	import particleEditor.edit.ShapeEditorWithPropertyBaseS;
	
	/**
	 * ...
	 * @author liaocheng
	 */
	public class PlaneEditorS extends ShapeEditorWithPropertyBaseS
	{
		private var widthInput:Number;
		private var heightInput:Number;
		
		public function PlaneEditorS()
		{
			super();
			widthInput = 20;
			heightInput = 20;		
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			widthInput=Number(xml.@width);
			heightInput=Number(xml.@height);
		}
		
		override public function createNeedStuff():SubGeometry
		{
			var plane:PlaneGeometry = new PlaneGeometry(widthInput, heightInput, 1, 1, false);
			return plane.subGeometries[0];
		}
	
	}

}