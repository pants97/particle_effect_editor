package particleEditor.effect.generater
{
	import a3dparticle.generater.GeneraterBase;

	import particleEditor.edit.EditorDefinition;
	import particleEditor.edit.IImportable;
	import particleEditor.effect.generater.material.MaterialFactoryS;
	import particleEditor.effect.generater.shape.ShapeFactoryS;
	import particleEditor.effect.generater.subGenerate.GeneraterEditorBaseS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class GeneraterFactoryS implements IImportable
	{

		private var _shapeFactory:ShapeFactoryS;
		
		private var _materialFactory:MaterialFactoryS;
		
		private var _samplesFactory:SamplesFactoryS;
		
		private var _editorPane:GeneraterEditorBaseS;
		
		private var _sampleCountMultiplier:Number = 1.0;
		
		public function GeneraterFactoryS(sampleCountMultiplier:Number = 1.0) 
		{
			_sampleCountMultiplier = sampleCountMultiplier;
			_shapeFactory = new ShapeFactoryS();
			_materialFactory = new MaterialFactoryS();
			_samplesFactory = new SamplesFactoryS(_shapeFactory.shapeProperties(), _materialFactory.materialProperties());	
			
		}
		
		public function get tagName():String
		{
			return "generater";
		}
		
		public function importCode(xml:XML):void
		{
			_shapeFactory.importCode(xml[_shapeFactory.tagName][0]);
			_materialFactory.importCode(xml[_materialFactory.tagName][0]);
			_samplesFactory.importCode(xml[_samplesFactory.tagName][0]);
			
			var cls:Class = EditorDefinition.getClassByNameS(xml.output.editor.@clazz) as Class;
			_editorPane = GeneraterEditorBaseS(new cls(_samplesFactory.sampleProperties(), _sampleCountMultiplier));
			_editorPane.importCode(xml.output[_editorPane.tagName][0]);
		}
		
		public function createNeedStuff():GeneraterBase
		{
			return _editorPane.createNeedStuff();
		}
	}

}