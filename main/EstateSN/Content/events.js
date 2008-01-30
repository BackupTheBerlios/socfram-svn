var __eventListeners = [];
window.onunload = function() { unregisterAllEvents() }

function registerEvent(instance, eventName, listener) {
   var listenerFn = listener;
   if (instance.addEventListener) {
       instance.addEventListener(eventName, listenerFn, false);
   } else if (instance.attachEvent) {
       listenerFn = function() {
           listener(window.event);
       }
       instance.attachEvent("on" + eventName, listenerFn);
   } else {
       throw new Error("Event registration not supported");
   }
   var event = {
       instance: instance,
       name: eventName,
       listener: listenerFn
   };
   __eventListeners.push(event);
   return event;
}

function unregisterEvent(event) {
   var instance = event.instance;
   if (instance.removeEventListener) {
       instance.removeEventListener(event.name, event.listener, false);
   } else if (instance.detachEvent) {
       instance.detachEvent("on" + event.name, event.listener);
   }
   for (var i = 0; i < __eventListeners.length; i++) {
       if (__eventListeners[i] == event) {
           __eventListeners.splice(i, 1);
           break;
       }
   }
}

function unregisterAllEvents() {
   while (__eventListeners.length > 0) {
       unregisterEvent(__eventListeners[0]);
   }
}
