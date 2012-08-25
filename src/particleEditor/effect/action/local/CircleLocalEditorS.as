package particleEditor.effect.action.local
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.circle.CircleLocal;

	import particleEditor.edit.FunctionEditorWithPropertyBaseS;
	import particleEditor.inputer.VectorDegreeInputS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class CircleLocalEditorS extends LocalActionBaseS
	{		
		private var eulersInput:VectorDegreeInputS;
		public function CircleLocalEditorS(_varListModel:Array) 
		{
			super(_varListModel);
			eulersInput = new VectorDegreeInputS();
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new CircleLocal(null,eulersInput.getValue());
		}
		
		override protected function createParamPane():FunctionEditorWithPropertyBaseS
		{
			return new CircleParamS(varListModel);
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			eulersInput.deserialize(xml.@eulers);
		}
		
	}

}

import a3dparticle.particle.ParticleParam;

import particleEditor.edit.FunctionEditorWithPropertyBaseS;
import particleEditor.inputer.ComboBoxInputS;

import flash.geom.Vector3D;
import flash.utils.Dictionary;

class CircleParamS extends FunctionEditorWithPropertyBaseS
{
	private var radiusComboBox:ComboBoxInputS;
	private var cycleComboBox:ComboBoxInputS;
	public function CircleParamS(varListModel:Array)
	{
		super();
		radiusComboBox = new ComboBoxInputS(varListModel);
		cycleComboBox = new ComboBoxInputS(varListModel);
	}
	
	override public function createNeedStuff():Function
	{
		return function(param:ParticleParam, localVars:Dictionary):void
		{
			var radius:Number = radiusComboBox.getValue()?localVars[radiusComboBox.getValue()]:10;
			var cycle:Number = cycleComboBox.getValue()?localVars[cycleComboBox.getValue()]:10;
			param["CircleLocal"] = new Vector3D(radius, cycle);
		};
	}
	
	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		radiusComboBox.deserialize(xml.@radius);
		cycleComboBox.deserialize(xml.@cycle);
	}
}