package ec;

import openfl.display.DisplayObject;
import haxe.ds.WeakMap;

typedef ClassName = String;

class ComponentManager {
	public var metaMap:Map<ClassName, WeakMap<DisplayObject, Any>>;

	public function new() {
		metaMap = new Map();
	}

	public function getECMapOf<T>(c:Class<T>):Map<DisplayObject, T> {
		var className = Type.getClassName(c);

		if (!metaMap.exists(className))
			metaMap.set(className, new WeakMap<DisplayObject, T>());

		return cast metaMap[className];
	}
}
