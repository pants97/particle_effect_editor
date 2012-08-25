package  particleEditor.edit {
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author liaocheng
	 */
	public class Property 
	{
		public var name:String;
		
		protected var _handler:Function;
		
		private var _editorPane:DisplayObjectContainer;
		
		public function Property() 
		{
		}
		
		public function setCreateHandler(value:Function):void
		{
			_handler = value;
		}
		
		public function toString():String
		{
			return name;
		}
		
		public function setEditorPane(value:DisplayObjectContainer):void
		{
			_editorPane = value;
		}
		
		public function getEditorPane():DisplayObjectContainer
		{
			return _editorPane;
		}
	}

}