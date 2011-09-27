#include "DrSlumpModule.h"

#include "DrSlump.h"

namespace Titanium {

KROLL_MODULE(DrSlumpModule, STRING(MODULE_NAME), STRING(MODULE_VERSION));

void DrSlumpModule::Initialize()
{
    // load our variables
    this->binding = new DrSlump(host,host->GetGlobalObject());

    // set our ti.DrSlump
    KValueRef value = Value::NewObject(this->binding);
    host->GetGlobalObject()->Set("DrSlump", value);
}

void DrSlumpModule::Stop()
{
}

} // namespace Titanium
