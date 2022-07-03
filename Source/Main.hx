package;

import openfl.events.Event;
import openfl.display.DisplayObject;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

using ec.Universe;

class Main extends Sprite {
	public function new() {
		super();

		var bitmapData = Assets.getBitmapData("assets/cat.jpg");

		var bitmap1 = new Bitmap(bitmapData);
		var bitmap2 = new Bitmap(bitmapData);

		bitmap1.addComponent(new Moving(5, 5, bitmap1));
		bitmap2.addComponent(new Moving(7, -5, bitmap2));

		addChild(bitmap1);
		addChild(bitmap2);

		addEventListener(Event.ENTER_FRAME, movingSystem);
	}

	function movingSystem(e:Event) {
		for (component in Universe.instances(Moving)) {
			component.entity.x += component.x;
			component.entity.y += component.y;
		}
	}
}

class Moving {
	public var x:Float;
	public var y:Float;
	public var entity:DisplayObject;

	public function new(x:Float, y:Float, entity:DisplayObject) {
		this.x = x;
		this.y = y;
		this.entity = entity;
	}
}
