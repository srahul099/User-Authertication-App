/****************************************************************************
** Meta object code from reading C++ file 'csvrw.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "csvrw.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'csvrw.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_csvRW_t {
    QByteArrayData data[9];
    char stringdata0[110];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_csvRW_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_csvRW_t qt_meta_stringdata_csvRW = {
    {
QT_MOC_LITERAL(0, 0, 5), // "csvRW"
QT_MOC_LITERAL(1, 6, 16), // "csvRwPropChanged"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 12), // "setCsvRwProp"
QT_MOC_LITERAL(4, 37, 10), // "addNewUser"
QT_MOC_LITERAL(5, 48, 21), // "checkUsernamePassword"
QT_MOC_LITERAL(6, 70, 14), // "changePassword"
QT_MOC_LITERAL(7, 85, 14), // "usernameUnique"
QT_MOC_LITERAL(8, 100, 9) // "csvRwProp"

    },
    "csvRW\0csvRwPropChanged\0\0setCsvRwProp\0"
    "addNewUser\0checkUsernamePassword\0"
    "changePassword\0usernameUnique\0csvRwProp"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_csvRW[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       1,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    1,   45,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    2,   48,    2, 0x02 /* Public */,
       5,    2,   53,    2, 0x02 /* Public */,
       6,    3,   58,    2, 0x02 /* Public */,
       7,    1,   65,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    2,

 // methods: parameters
    QMetaType::QString, QMetaType::QString, QMetaType::QString,    2,    2,
    QMetaType::QString, QMetaType::QString, QMetaType::QString,    2,    2,
    QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    2,    2,    2,
    QMetaType::QString, QMetaType::QString,    2,

 // properties: name, type, flags
       8, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,

       0        // eod
};

void csvRW::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        csvRW *_t = static_cast<csvRW *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->csvRwPropChanged(); break;
        case 1: _t->setCsvRwProp((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: { QString _r = _t->addNewUser((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 3: { QString _r = _t->checkUsernamePassword((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 4: { QString _r = _t->changePassword((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 5: { QString _r = _t->usernameUnique((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (csvRW::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&csvRW::csvRwPropChanged)) {
                *result = 0;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        csvRW *_t = static_cast<csvRW *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->csvRwProp(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        csvRW *_t = static_cast<csvRW *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setCsvRwProp(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject csvRW::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_csvRW.data,
      qt_meta_data_csvRW,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *csvRW::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *csvRW::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_csvRW.stringdata0))
        return static_cast<void*>(const_cast< csvRW*>(this));
    return QObject::qt_metacast(_clname);
}

int csvRW::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void csvRW::csvRwPropChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
