#include "csvrw.h"
#include <QDebug>
#include <QFile>
#include <QString>

csvRW::csvRW(QObject *parent): QObject(parent), m_csvRwProp("False") {

}

QString csvRW::csvRwProp() {
    return m_csvRwProp;
}

void csvRW::setCsvRwProp(QString newVar) {
    if (m_csvRwProp != newVar)
        m_csvRwProp = newVar;
    emit csvRwPropChanged();
    qDebug() << m_csvRwProp;
}

QString csvRW::addNewUser(QString username, QString password) {
    QFile file("user-details.csv");

    if (!file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append)) {
        return fileError;
    }

    QString dataLine = username + ',' + password + '\n';
    QTextStream out(&file);
    out << dataLine;
    file.close();

    return userAddedSuccess;
}

QString csvRW::checkUsernamePassword(QString username, QString password) {
    //for checking if username exists or not
    int flag = 0;

    //opening file in read mode
    QFile file("user-details.csv");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return fileError;
    }

    //reading file until EOF character
    while (!file.atEnd()) {
        //reading line by line
        QString line = file.readLine();
        //splitting line by comma and storing in list
        QStringList list = line.split(",");

        //checking if username is same
        if(username == list[0]) {
            flag = 1;

            //removes \n from password's end for matching
            list[1].remove(QRegExp("([\n]+)$"));

            //checking if password matches
            if(password == list[1]) {
                return passwordRightSuccess;
            } else {
                return passwordWrongError;
            }
        }
    }
    file.close();

    if(flag == 0) {
        return usernameMissingError;
    }

    return unexpectedError;
}

QString csvRW::changePassword(QString username, QString currentPassword, QString newPassword) {
    //for checking if username exists or not
    int flag = 0;
    QStringList dataList;

    QFile readFile("user-details.csv");
    if (!readFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return fileError;
    }

    while (!readFile.atEnd()) {
        QString line = readFile.readLine();
        QStringList list = line.split(",");

        if(username == list[0]) {
            flag = 1;
            //remove \n from password
            list[1].remove(QRegExp("([\n]+)$"));
            if(currentPassword == list[1]) {
                //changing password
                list[1] = newPassword + '\n';
            } else {
                return passwordWrongError;
            }
        }
        //saving all the data to a list
        dataList.append(list[0] + "," + list[1]);
    }

    readFile.close();

    if(flag == 0) {
        return usernameMissingError;
    }

    QFile writeFile("user-details.csv");
    if (!writeFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        return fileError;
    }

    QTextStream out(&writeFile);

    for(int i=0; i<dataList.length(); i++) {
        //write to csv line by line
        out << dataList[i];
    }

    writeFile.close();

    return passwordChangedSuccess;
}

QString csvRW::usernameUnique(QString username) {
    QFile file("user-details.csv");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return fileError;
    }

    while (!file.atEnd()) {
        QString line = file.readLine();
        QStringList list = line.split(",");

        if(username == list[0]) {
            return usernameExistsError;
        }
    }

    return usernameUniqueSuccess;
}
