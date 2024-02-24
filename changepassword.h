#ifndef CHANGEPASSWORD_H
#define CHANGEPASSWORD_H

#include <QObject>

class ChangePassword : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString chngPassProp READ chngPassProp WRITE setChngPassProp NOTIFY chngPassPropChanged)

public:
    explicit ChangePassword(QObject *parent = nullptr);

    QString chngPassProp();

signals:
    void chngPassPropChanged();

public slots:
    void setChngPassProp(QString);

private:
    QString m_chngPassProp;
};

#endif // CHANGEPASSWORD_H
