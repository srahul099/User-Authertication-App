TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    signup.cpp \
    login.cpp \
    validation.cpp \
    csvrw.cpp \
    changepassword.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    signup.h \
    login.h \
    validation.h \
    csvrw.h \
    changepassword.h

