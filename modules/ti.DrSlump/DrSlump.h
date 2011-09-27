
#ifndef DrSlump_h
#define DrSlump_h

#include <vector>

#include <kroll/kroll.h>

namespace Titanium {

class DrSlump : public kroll::StaticBoundObject {
public:
    DrSlump(Host*, KObjectRef);

    std::string url;

protected:
    virtual ~DrSlump();

    KObjectRef global;
    Logger* logger;

    void Setup();

private:
};

} // namespace Titanium

#endif
