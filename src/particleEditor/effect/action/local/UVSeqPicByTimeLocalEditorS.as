package particleEditor.effect.action.local
{
	import a3dparticle.animators.actions.ActionBase;
	import a3dparticle.animators.actions.uv.UVSeqPicByTimeLocal;

	import particleEditor.edit.FunctionEditorWithPropertyBaseS;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class UVSeqPicByTimeLocalEditorS extends LocalActionBaseS
	{
		private var columns:int;
		private var rows:int;
		private var usingNum:int;
		private var hasStartTime:Boolean;
		private var loop:Boolean;
		
		public function UVSeqPicByTimeLocalEditorS(_varListModel:Array) 
		{
			super(_varListModel);
			
		}
		
		override public function createNeedStuff():ActionBase
		{
			return new UVSeqPicByTimeLocal(columns, rows, usingNum, hasStartTime, loop);
		}
		
		override protected function createParamPane():FunctionEditorWithPropertyBaseS
		{
			return new UVSeqPicByTimeParamS(varListModel);
		}
		
		override public function importCode(xml:XML):void
		{
			super.importCode(xml);
			columns=int(xml.@columns);
			rows=int(xml.@rows);
			usingNum=int(xml.@usingNum);
			hasStartTime = Boolean(int(xml.@hasStartTime));
			loop = Boolean(int(xml.@loop));
		}
		
	}

}

import a3dparticle.particle.ParticleParam;

import particleEditor.edit.FunctionEditorWithPropertyBaseS;
import particleEditor.inputer.ComboBoxInputS;

import flash.geom.Vector3D;
import flash.utils.Dictionary;

class UVSeqPicByTimeParamS extends FunctionEditorWithPropertyBaseS
{
	private var cycle:ComboBoxInputS;
	private var startTime:ComboBoxInputS;
	
	public function UVSeqPicByTimeParamS(varListModel:Array)
	{
		super();
		cycle = new ComboBoxInputS(varListModel);
		startTime = new ComboBoxInputS(varListModel);
	}
	
	override public function importCode(xml:XML):void
	{
		super.importCode(xml);
		cycle.deserialize(xml.@cycle);
		startTime.deserialize(xml.@startTime);
	}

	override public function initializeLocalVars(param:ParticleParam, localVars:Dictionary):void
	{
		var cycleValue:Number = cycle.getValue()?localVars[cycle.getValue()]:10;
		var startTimeValue:Number = startTime.getValue()?localVars[startTime.getValue()]:0;
		param["UVSeqPicByTimeLocal"] = new Vector3D(cycleValue, startTimeValue);
	}
}