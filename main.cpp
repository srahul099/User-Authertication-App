#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

#include "login.h"
#include "signup.h"
#include "changepassword.h"
#include "csvrw.h"
#include "validation.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType< Login > ("LoginModule", 1, 0, "Login");
    qmlRegisterType< SignUp > ("SignUpModule", 1, 0, "SignUp");
    qmlRegisterType< ChangePassword > ("ChangePasswordModule", 1, 0, "ChangePassword");
    qmlRegisterType< csvRW > ("CSVrwModule", 1, 0, "CsvRW");
    qmlRegisterType< Validation > ("ValidationModule", 1, 0, "Validation");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    Login login;
//    QQmlContext * rootContext = engine.rootContext();
//    rootContext->setContextProperty("loginClass", &login);

    return app.exec();
}
