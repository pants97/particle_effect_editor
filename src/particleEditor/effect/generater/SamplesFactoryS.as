package particleEditor.effect.generater
{
	import particleEditor.edit.IImportable;
	import particleEditor.edit.MaterialProperty;
	import particleEditor.edit.SampleProperty;
	import particleEditor.edit.ShapeProperty;

	/**
	 * ...
	 * @author liaocheng
	 */
	public class SamplesFactoryS implements IImportable
	{

		private var _shapeModel:Vector.<ShapeProperty>;
		private var _materialModel:Vector.<MaterialProperty>;

		private var _sampleModel:Vector.<SampleProperty>;

		public function SamplesFactoryS(shapeModel:Vector.<ShapeProperty>, materialModel:Vector.<MaterialProperty>)
		{
			_shapeModel = shapeModel;
			_materialModel = materialModel;

			_sampleModel = new Vector.<SampleProperty>();
		}

		public function get tagName():String
		{
			return "sample";
		}

		public function importCode(xml:XML):void
		{
			for each (var i:XML in xml.editor)
			{
				var _editor:SampleEdiorS = new SampleEdiorS(_shapeModel, _materialModel);
				_editor.setListModel(_sampleModel);
				_editor.importCode(i);
			}
		}

		public function sampleProperties():Vector.<SampleProperty>
		{
			return _sampleModel;
		}
		
	}

}



import a3dparticle.particle.ParticleSample;

import particleEditor.edit.EditorWithPropertyBaseS;
import particleEditor.edit.MaterialProperty;
import particleEditor.edit.Property;
import particleEditor.edit.SampleProperty;
import particleEditor.edit.ShapeProperty;

class SampleEdiorS extends EditorWithPropertyBaseS
{

	private var _shapeModel:Vector.<ShapeProperty>;
	private var _shapeIndex:int;

	private var _materialModel:Vector.<MaterialProperty>;
	private var _materialIndex:int;

	private var _listModel:Vector.<SampleProperty>;

	public function SampleEdiorS(shapeModel:Vector.<ShapeProperty>, materialModel:Vector.<MaterialProperty>)
	{
		super();
		_shapeModel = shapeModel;
		_materialModel = materialModel;
	}

	override protected function createProperty():Property
	{
		var property:SampleProperty = new SampleProperty();
		property.setCreateHandler(this.createNeedStuff);
		return property;
	}

	public function createNeedStuff():ParticleSample
	{
		var shapeProperty:ShapeProperty;
		if (_shapeIndex >= 0)
			shapeProperty = _shapeModel[_shapeIndex];

		var materialProperty:MaterialProperty;
		if (_materialIndex >= 0)
			materialProperty = _materialModel[_materialIndex];

		if (shapeProperty && materialProperty)
		{
			return new ParticleSample(shapeProperty.getNewValue(), materialProperty.getNewValue());
		}
		else
		{
			throw new Error("can not get sample:");
			return null;
		}
	}

	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		_shapeIndex = int(xml.@shape);
		_materialIndex = int(xml.@material);
	}

	public function setListModel(listModel:Vector.<SampleProperty>):void
	{
		_listModel = listModel;
		_listModel.push(_property);
	}
}