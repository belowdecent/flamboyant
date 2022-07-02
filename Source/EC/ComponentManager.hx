package ec;

import openfl.display.DisplayObject;

typedef ClassName = String;

class ComponentManager {
	public var metaMap:Map<ClassName, Map<DisplayObject, Any>>;

	public function new() {
		metaMap = new Map();
	}

	public function getECMapOf<T>(c:Class<T>):Map<DisplayObject, T> {
		var className = Type.getClassName(c);

		if (!metaMap.exists(className))
			metaMap.set(className, new Map<DisplayObject, T>());

		return cast metaMap[className];
	}
}
