package;

import ec.Universe;
import openfl.display.FPS;
import openfl.display.PixelSnapping;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

class Main extends Sprite {
	public function new() {
		super();
		Universe.root = this;
	}
}
