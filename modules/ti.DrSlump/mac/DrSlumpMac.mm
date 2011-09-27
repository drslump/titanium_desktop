// TODO: If the application is not running the event for the url is triggered before the 
//       application has a chance to register for the event. We need to keep the last 
//       url in a variable and offer a method to obtain it.
//       Perhaps, Cocoa will buffer the event until we register it, so we could also try
//       to expose a method with a callback for it instead of using the event manager.

#include <kroll/kroll.h>
#include <Foundation/Foundation.h>

#include "../DrSlump.h"


@interface DrSlumpHandlerUrl : NSObject
@end

@implementation DrSlumpHandlerUrl
- (void)handleURLEvent:(NSAppleEventDescriptor*)event withReplyEvent:(NSAppleEventDescriptor*)replyEvent
{
    NSString* url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];

    static Logger *logger = Logger::Get("DrSlump");
    logger->Info("Handler Url: %s", [url UTF8String]);

    AutoPtr<GlobalObject> globalObject(GlobalObject::GetInstance());

    // Get a reference to the module and set the url property
    KObjectRef drslump(globalObject->GetObject("DrSlump"));
    drslump->SetString("handlerUrl", [url UTF8String]);

    // Create an event to trigger it
    AutoPtr<Event> evt(globalObject->CreateEvent("DRSLUMP_HANDLER_URL"));

    KValueRef value = Value::NewString([url UTF8String]);
    evt->Set("url", value);

    globalObject->FireEvent(evt);
}
@end


namespace Titanium {

void DrSlump::Setup()
{
    logger->Info("Registering URL handler");

    // Create an instance of the objc handler
    DrSlumpHandlerUrl *handler = [[DrSlumpHandlerUrl alloc] init];
    // Register the handler to the url events
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:handler andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

} // namespace Titanium
