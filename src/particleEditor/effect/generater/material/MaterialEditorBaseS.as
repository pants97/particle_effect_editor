package particleEditor.effect.generater.material
{
	import particleEditor.edit.MaterialProperty;
	import particleEditor.edit.Property;
	import a3dparticle.particle.ParticleMaterialBase;

	import particleEditor.edit.EditorWithPropertyBaseS;
	import particleEditor.inputer.ComboBoxInputS;

	import flash.display.BlendMode;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class MaterialEditorBaseS extends EditorWithPropertyBaseS
	{
		
		private var _listModel:Vector.<MaterialProperty>;
		
		protected var bothSidesCheck:Boolean;
		protected var requiresBlendingCheck:Boolean;
		protected var blendModeCombo:ComboBoxInputS;
		protected var multipleRendering:Boolean;
		protected var renderTimes:int;
		protected var timeInterval:Number;
		protected var fadeFactor:Number;
		
		public function MaterialEditorBaseS()
		{
			super();
			bothSidesCheck = false;
			requiresBlendingCheck = true;
			blendModeCombo = new ComboBoxInputS([BlendMode.NORMAL, BlendMode.MULTIPLY, BlendMode.ADD, BlendMode.ALPHA]);
		}

		override protected function createProperty():Property
		{
			var property:MaterialProperty = new MaterialProperty();
			property.setCreateHandler(this.createNeedStuff);
			return property;
		}
		
		public function createNeedStuff():ParticleMaterialBase
		{
			var material:ParticleMaterialBase = createMaterial();
			setMaterialProperty(material);
			return material;
		}
		
		protected function createMaterial():ParticleMaterialBase
		{
			throw(new Error("abstract method"));
			return null;
		}
		
		protected function setMaterialProperty(material:ParticleMaterialBase):void
		{
			material.bothSides = bothSidesCheck;
			material.requiresBlending = requiresBlendingCheck;
			if (material.requiresBlending) material.blendMode = blendModeCombo.getValue();
			if (multipleRendering)
			{
				material.renderTimes = renderTimes;
				material.timeInterval = timeInterval;
				material.alphaFade = fadeFactor;
			}
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			bothSidesCheck = Boolean(int(xml.@bothSides));
			requiresBlendingCheck = Boolean(int(xml.@requiresBlending));
			blendModeCombo.deserialize(xml.@blendMode);
			multipleRendering = Boolean(int(xml.@multipleRendering));
			if (multipleRendering)
			{
				renderTimes=int(xml.@renderTimes);
				timeInterval = Number(xml.@timeInterval);
				fadeFactor = Number(xml.@fadeFactor);
			}
		}

		public function setListModel(listModel:Vector.<MaterialProperty>):void
		{
			_listModel = listModel;
			_listModel.push(_property);
		}
		
	}

}