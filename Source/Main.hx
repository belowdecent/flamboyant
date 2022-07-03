package;

import openfl.events.EventDispatcher;
import openfl.events.MouseEvent;
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

		var bitmap1 = new Sprite();
		bitmap1.graphics.beginBitmapFill(bitmapData);
		bitmap1.graphics.drawRect(0, 0, 160, 160);
		bitmap1.graphics.endFill();
		var bitmap2 = new Sprite();
		bitmap2.graphics.beginBitmapFill(bitmapData);
		bitmap2.graphics.drawRect(0, 0, 100, 100);
		bitmap2.graphics.endFill();
		var bitmap3 = new Sprite();
		bitmap3.graphics.beginBitmapFill(bitmapData);
		bitmap3.graphics.drawRect(0, 0, 100, 100);
		bitmap3.graphics.endFill();
		bitmap3.x = 500;
		bitmap3.y = 200;

		Event.ENTER_FRAME.bindSystem(new MovingSystem());
		MouseEvent.CLICK.bindSystem(new StoppingSystem());

		bitmap1.addComponent(new Moving(0.5, 0.8, bitmap1));
		bitmap2.addComponent(new Moving(0.7, 0.5, bitmap2));

		addChild(bitmap1);
		addChild(bitmap2);
		addChild(bitmap3);

		this.listen(Event.ENTER_FRAME);
		this.listen(MouseEvent.CLICK);
	}
}

class StoppingSystem extends ec.System {
	public function new() {}

	override function run(event:Event) {
		freeze(cast(event.target, DisplayObject).getComponent(Moving));
	}

	function freeze(target:Moving) {
		if (target != null)
			target.frozen = !target.frozen;
	}
}

class MovingSystem extends ec.System {
	public function new() {}

	override function run(event:Event) {
		for (component in Universe.instances(Moving)) {
			if (!component.frozen) {
				component.entity.x += component.x;
				component.entity.y += component.y;
			}
		}
	}
}

class Moving {
	public var x:Float;
	public var y:Float;
	public var frozen:Bool;

	public var entity:DisplayObject;

	public function new(x:Float, y:Float, entity:DisplayObject) {
		this.x = x;
		this.y = y;
		this.frozen = false;
		this.entity = entity;
	}
}
