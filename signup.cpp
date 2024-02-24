#include "signup.h"
#include <QDebug>

SignUp::SignUp(QObject *parent) : QObject(parent), m_signUpProp("False")
{

}

QString SignUp::signUpProp() {
    return m_signUpProp;
}

void SignUp::setSignUpProp(QString newVar) {
    if(m_signUpProp != newVar)
        m_signUpProp = newVar;
    emit signUpPropChanged();
    qDebug() << m_signUpProp;
}
