package ec;

import openfl.events.Event;

class SystemManager {
	var systemMap:Map<Event, List<System>>;

	function run(event:Event) {
		for (system in systemMap[event])
			system.run();
	}
}
