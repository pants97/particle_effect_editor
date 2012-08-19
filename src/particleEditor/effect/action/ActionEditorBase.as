package particleEditor.effect.action {
	import particleEditor.edit.VarNameEditorBase;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class ActionEditorBase extends VarNameEditorBase
	{
		public function ActionEditorBase() 
		{
			super();
			nameInput.getInput().setEditable(false);
			setShowEnable(true);
		}
		
	}

}