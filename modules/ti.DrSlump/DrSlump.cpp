
#include "DrSlump.h"

#include <sstream>
#include <functional>

#include <kroll/kroll.h>

using namespace std;

namespace Titanium {

DrSlump::DrSlump(Host *host, KObjectRef global) :
    StaticBoundObject("DrSlump"),
    global(global),
    logger(Logger::Get("DrSlump"))
{
    // Expose public API
    this->SetString("HANDLER_URL", "DRSLUMP_HANDLER_URL");
    this->SetNull("handlerUrl");


    this->Setup();
}

DrSlump::~DrSlump()
{
}


} // namespace Titanium
