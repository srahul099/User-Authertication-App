#include "validation.h"
#include <QDebug>
#include <QRegularExpression>

Validation::Validation(QObject *parent) : QObject(parent), m_validProp("False")
{

}

QString Validation:: validProp() {
    return m_validProp;
}

void Validation::setValidProp(QString newVar) {
    if (m_validProp != newVar)
        m_validProp = newVar;
    emit validPropChanged();
    qDebug() << m_validProp;
}

QString Validation::checkPassword(QString pass1,QString pass2) {
    if(pass1==pass2){
        return welcome;
    } else {
        return passwordMismatched;
    }
}

QString Validation::validatePassword(QString password) {
    QRegularExpression regex("(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*?[#?!@$%^&*-].*?[#?!@$%^&*-])(?=\\S+$).{8,}");
    QRegularExpressionMatch match = regex.match(password);

    if(match.hasMatch()) {
        return passwordValidSuccess;
    } else {
        return passwordNotValid;
    }
}
