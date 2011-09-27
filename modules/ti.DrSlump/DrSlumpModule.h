#ifndef DrSlumpModule_h
#define DrSlumpModule_h

#include <kroll/kroll.h>

namespace Titanium {

class EXPORT DrSlumpModule : public kroll::Module {
    KROLL_MODULE_CLASS(DrSlumpModule)

private:
    kroll::KObjectRef binding;
};

} // namespace Titanium

#endif
