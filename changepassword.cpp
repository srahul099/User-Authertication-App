#include "changepassword.h"
#include <QDebug>

ChangePassword::ChangePassword(QObject *parent) : QObject(parent), m_chngPassProp("False")
{

}

QString ChangePassword::chngPassProp() {
    return m_chngPassProp;
}

void ChangePassword::setChngPassProp(QString newVar) {
    if (m_chngPassProp != newVar)
        m_chngPassProp = newVar;
    emit chngPassPropChanged();
    qDebug() << m_chngPassProp;
}
