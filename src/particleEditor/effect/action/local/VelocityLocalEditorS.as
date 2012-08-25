package particleEditor.effect.action.local
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.velocity.VelocityLocal;

	import particleEditor.edit.FunctionEditorWithPropertyBaseS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class VelocityLocalEditorS extends LocalActionBaseS
	{
		
		public function VelocityLocalEditorS(_varListModel:Array) 
		{
			super(_varListModel);
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new VelocityLocal();
		}
		
		override protected function createParamPane():FunctionEditorWithPropertyBaseS
		{
			return new VelocityParamS(varListModel);
		}
		
	}

}

import a3dparticle.particle.ParticleParam;

import particleEditor.edit.FunctionEditorWithPropertyBaseS;
import particleEditor.inputer.VectorComboBoxS;

import flash.geom.Vector3D;
import flash.utils.Dictionary;

class VelocityParamS extends FunctionEditorWithPropertyBaseS
{
	private var valueInput:VectorComboBoxS;
	public function VelocityParamS(varListModel:Array)
	{
		super();
		valueInput = new VectorComboBoxS(varListModel);
	}
	
	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		valueInput.deserialize(xml.@velocity);
	}

	override public function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void
	{
		var array:Array = valueInput.getValue();
		var x:Number = array[0]?localVars[array[0]]:0;
		var y:Number = array[1]?localVars[array[1]]:0;
		var z:Number = array[2]?localVars[array[2]]:0;
		param["VelocityLocal"] = new Vector3D(x, y, z);
	}
}