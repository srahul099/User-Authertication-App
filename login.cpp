#include "login.h"
#include <QDebug>

Login::Login(QObject *parent) : QObject(parent), m_someVar("False")
{

}

void Login::lognFn()
{
    qDebug() << "lognFn";
}

void Login::loginSlot(QString username, QString password) {
    qDebug() << "Slot Print";
    qDebug() << username;
    qDebug() << password;
}

QString Login::someVar() {
    return m_someVar;
}

void Login::setSomeVar(QString newVar) {
    if (m_someVar != newVar) {
        m_someVar = newVar;
        emit someVarChanged();
    }
    //qDebug() << m_someVar;
}
