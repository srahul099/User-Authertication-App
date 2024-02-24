#ifndef SIGNUP_H
#define SIGNUP_H

#include <QObject>

class SignUp : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString signUpProp READ signUpProp WRITE setSignUpProp NOTIFY signUpPropChanged)

public:
    explicit SignUp(QObject *parent = nullptr);

    QString signUpProp();

signals:
    void signUpPropChanged();

public slots:
    void setSignUpProp(QString);

private:
    QString m_signUpProp;
};

#endif // SIGNUP_H
