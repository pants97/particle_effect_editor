package particleEditor.effect.action.local {
	import a3dparticle.animators.actions.scale.RandomScaleLocal;

	import particleEditor.edit.EditorWithPropertyBaseS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class RandomScaleLocalEditorS extends LocalActionBaseS
	{
		
		public function RandomScaleLocalEditorS(_varListModel:Array) 
		{
			super(_varListModel);
		}
		
		override public function createNeedStuff():*
		{
			return new RandomScaleLocal();
		}
		
		override protected function createParamPane():EditorWithPropertyBaseS
		{
			return new ScaleParamS(varListModel);
		}
		
	}

}

import a3dparticle.particle.ParticleParam;

import particleEditor.edit.EditorWithPropertyBaseS;
import particleEditor.inputer.VectorComboBoxS;

import flash.geom.Vector3D;
import flash.utils.Dictionary;

class ScaleParamS extends EditorWithPropertyBaseS
{
	private var valueInput:VectorComboBoxS;
	
	public function ScaleParamS(varListModel:Array)
	{
		super();
		valueInput = new VectorComboBoxS(varListModel);
	}
	
	override public function createNeedStuff():*
	{
		return function(param:ParticleParam, localVars:Dictionary):void
		{
			var array:Array = valueInput.getValue();
			var x:Number = array[0]?localVars[array[0]]:0;
			var y:Number = array[1]?localVars[array[1]]:0;
			var z:Number = array[2]?localVars[array[2]]:0;
			param["RandomScaleLocal"] = new Vector3D(x, y, z);
		};
	}
	
	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		valueInput.deserialize(xml.@scale);
	}
}