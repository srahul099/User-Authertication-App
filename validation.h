#ifndef VALIDATION_H
#define VALIDATION_H

#include <QObject>
#include <QString>

class Validation : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString validProp READ validProp WRITE setValidProp NOTIFY validPropChanged)
public:
    explicit Validation(QObject *parent = nullptr);

    QString validProp();

    Q_INVOKABLE QString validatePassword(QString);
    Q_INVOKABLE QString checkPassword(QString, QString);

    QString passwordValidSuccess = "Password is valid" ;
    QString passwordNotValid = "Password is invalid" ;
    QString welcome = "Welcome";
    QString passwordMismatched = "Passwords Mismatched";

signals:
    void validPropChanged();

public slots:
    void setValidProp(QString);

private:
    QString m_validProp;
};

#endif // VALIDATION_H
