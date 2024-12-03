package;

import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();

		var textField = new TextField();
		textField.setTextFormat(new TextFormat(null, 20));
		textField.text = "Where Game? :(";
		textField.x = 400;
		textField.y = 300;
		addChild(textField);
	}
}
