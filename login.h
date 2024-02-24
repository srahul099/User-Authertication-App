#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

class Login : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString someVar READ someVar WRITE setSomeVar NOTIFY someVarChanged)  //Q_PROPERTY method qml to cpp and cpp to qml works

public:
    explicit Login(QObject *parent = nullptr);

    Q_INVOKABLE void lognFn(); // Q_INVOKABLE qml to cpp works

    QString someVar();

signals:
    void someVarChanged();

public slots:
    void setSomeVar(QString);
    void loginSlot(QString username, QString password); // slots and signals qml to cpp works

private:
    QString m_someVar;
};

#endif // LOGIN_H
