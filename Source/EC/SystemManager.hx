package ec;

import openfl.events.Event;

class SystemManager {
	public var systemMap:Map<String, List<System>>;

	public function new() {
		systemMap = new Map();
	}

	public function run(event:Event) {
		for (system in systemMap[event.type])
			system.run(event);
	}

	public function runWithParams<T>(event:Event) {
		// TODO: Ability to pass arbitrary paramemeters to Systems
	}

	public function addSystem(system:System, eventType:String) {
		if (!systemMap.exists(eventType))
			systemMap.set(eventType, new List());

		systemMap[eventType].add(system);
	}
}
