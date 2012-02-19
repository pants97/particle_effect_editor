package particleEditor.effect.action.local
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.position.OffestPositionLocal;
	import org.aswing.VectorListModel;
	import particleEditor.edit.EditorWithPropertyBase;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class OffestActionEditor extends LocalActionBase
	{
		
		public function OffestActionEditor(_varListModel:VectorListModel) 
		{
			super(_varListModel);
			nameInput.getInput().setText("OffestPositionLocal");
		}
		
		override public function createNeedStuff():*
		{
			return new OffestPositionLocal();
		}
		
		override protected function createParamPane():EditorWithPropertyBase
		{
			return new OffestParam(varListModel);
		}
		
	}

}

import a3dparticle.particle.ParticleParam;
import flash.geom.Vector3D;
import flash.utils.Dictionary;
import particleEditor.inputer.VectorComboBox;
import org.aswing.VectorListModel;
import particleEditor.edit.EditorWithPropertyBase;

class OffestParam extends EditorWithPropertyBase
{
	private var valueInput:VectorComboBox;
	
	public function OffestParam(varListModel:VectorListModel)
	{
		super();
		valueInput = new VectorComboBox("value:", varListModel, "x:", "y:", "z:");
		contentPane.append(valueInput);
	}
	
	override public function createNeedStuff():*
	{
		return function(param:ParticleParam, localVars:Dictionary):void
		{
			var array:Array = valueInput.getValue();
			var x:Number = array[0]?localVars[array[0]]:0;
			var y:Number = array[1]?localVars[array[1]]:0;
			var z:Number = array[2]?localVars[array[2]]:0;
			param["OffestPositionLocal"] = new Vector3D(x, y, z);
		}
	}
	
	override public function getExportCode():XML
	{
		var xml:XML = super.getExportCode();
		xml.@offest = valueInput.serialize();
		return xml;
	}
	
	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		valueInput.deserialize(xml.@offest);
	}
}