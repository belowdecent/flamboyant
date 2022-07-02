package ec;

import openfl.display.DisplayObjectContainer;
import openfl.display.DisplayObject;

/**
	Universe is a static class that holds the references to all the ECS parts as well as the Main file.
**/
@:publicFields
class Universe {
	static final componentManager:ComponentManager = new ComponentManager();

	static var root:Main;

	static function free(entity:DisplayObject):DisplayObject {
		function freeChildren(entity:DisplayObjectContainer) {
			for (i in 0...entity.numChildren) {
				for (componentMap in componentManager.metaMap.iterator())
					componentMap.remove(entity.getChildAt(i));

				try
					freeChildren(cast(entity.getChildAt(i), DisplayObjectContainer));
			}
		}

		try
			freeChildren(cast(entity, DisplayObjectContainer));

		for (componentMap in componentManager.metaMap.iterator())
			componentMap.remove(entity);

		return entity.parent.removeChild(entity);
	}

	static inline function getComponent<T>(entity:DisplayObject, componentClass:Class<T>):T {
		return componentManager.getECMapOf(componentClass)[entity];
	}

	static inline function addComponent<T>(entity:DisplayObject, component:T):Void {
		componentManager.getECMapOf(Type.getClass(component)).set(entity, component);
	}

	static inline function removeComponent<T>(entity:DisplayObject, componentClass:Class<T>):Bool {
		return componentManager.getECMapOf(componentClass).remove(entity);
	}

	static inline function hasComponent<T>(entity:DisplayObject, componentClass:Class<T>):Bool {
		return componentManager.getECMapOf(componentClass).exists(entity);
	}

	static inline function instances<T>(componentClass:Class<T>):Iterator<T> {
		return componentManager.getECMapOf(componentClass).iterator();
	}
}
