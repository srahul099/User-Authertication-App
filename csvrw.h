#ifndef CSVRW_H
#define CSVRW_H
#include <QObject>
#include <QString>

class csvRW : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString csvRwProp READ csvRwProp WRITE setCsvRwProp NOTIFY csvRwPropChanged)
public:
    explicit csvRW(QObject *parent = nullptr);
    QString csvRwProp();

    Q_INVOKABLE QString addNewUser(QString, QString);
    Q_INVOKABLE QString checkUsernamePassword(QString, QString);
    Q_INVOKABLE QString changePassword(QString, QString, QString);
    Q_INVOKABLE QString usernameUnique(QString);

    QString fileError = "Error! Unable to open file";
    QString usernameMissingError = "Error! Username does not exist";
    QString usernameExistsError = "Error! Username already exists";
    QString passwordWrongError = "Error! Password does not match";
    QString unexpectedError = "Error! We do not know what went wrong";
    QString passwordRightSuccess = "Success! Password is correct";
    QString usernameUniqueSuccess = "Success! Username is unique";
    QString userAddedSuccess = "Success! User added successfully";
    QString passwordChangedSuccess = "Success! Password changed successfully";
signals:
    void csvRwPropChanged();
public slots:
    void setCsvRwProp(QString);
private:
    QString m_csvRwProp;
};

#endif // CSVRW_H
