#ifndef MODEL_H
#define MODEL_H

#include <QObject>
#include <QDebug>

class model : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double rpm READ rpm WRITE setRpm NOTIFY rpmChanged)
    Q_PROPERTY(int rotate READ rotate WRITE setRotate NOTIFY rotateChanged)
    Q_PROPERTY(QString ethIp READ ethIp WRITE setEthIp NOTIFY ethIpChanged)
    Q_PROPERTY(int backlight READ backlight WRITE setBacklight NOTIFY backlightChanged)
    Q_PROPERTY(double cellVoltage READ cellVoltage WRITE setCellVoltage NOTIFY cellVoltageChanged)
    Q_PROPERTY(int batteryTemp READ batteryTemp WRITE setBatteryTemp NOTIFY batteryTempChanged)
    Q_PROPERTY(int analog1 READ analog1 WRITE setAnalog1 NOTIFY analog1Changed)
    Q_PROPERTY(int analog2 READ analog2 WRITE setAnalog2 NOTIFY analog2Changed)
    Q_PROPERTY(int analog3 READ analog3 WRITE setAnalog3 NOTIFY analog3Changed)
    Q_PROPERTY(int analog4 READ analog4 WRITE setAnalog4 NOTIFY analog4Changed)
    Q_PROPERTY(int analog5 READ analog5 WRITE setAnalog5 NOTIFY analog5Changed)
    Q_PROPERTY(int analog6 READ analog6 WRITE setAnalog6 NOTIFY analog6Changed)
    Q_PROPERTY(bool handshake READ handshake WRITE setHandshake NOTIFY handshakeChanged)
    Q_PROPERTY(double packVoltage READ packVoltage WRITE setPackVoltage NOTIFY packVoltageChanged)
    Q_PROPERTY(double DCLinkV READ DCLinkV WRITE setDCLinkV NOTIFY DCLinkVChanged)
    Q_PROPERTY(int MCTemp READ MCTemp WRITE setMCTemp NOTIFY MCTempChanged)
    Q_PROPERTY(int MotorTemp READ MotorTemp WRITE setMotorTemp NOTIFY MotorTempChanged)
    Q_PROPERTY(double speed READ speed WRITE setSpeed NOTIFY SpeedChanged)


public slots:
    //model(QObject *parent = NULL); DOESNT LIKE THIS LINE FOR SOME REASON?? ERROR: symbol(s) not found for architecture x86_64

    void setSpeed(const double&v);
    void setAnalog1(const int &v);
    void setAnalog2(const int &v);
    void setAnalog3(const int &v);
    void setAnalog4(const int &v);
    void setAnalog5(const int &v);
    void setAnalog6(const int &v);
    void setRpm(const double &v);
    void setRotate(const int &v);
    void setEthIp(const QString &v);
    void setBacklight(const int &v);
    void setCellVoltage(const double &v);
    void setBatteryTemp(const int &v);
    void setHandshake (const bool &v);
    void setPackVoltage (const double &v);
    void setDCLinkV (const double &v);
    void setMCTemp (const int &v);
    void setMotorTemp (const int &v);
    void setNumBatteryCells(const int &v);

signals:
    void rpmChanged();
    void rotateChanged();
    void ethIpChanged();
    void backlightChanged();
    void cellVoltageChanged();
    void batteryTempChanged();
    void analog1Changed();
    void analog2Changed();
    void analog3Changed();
    void analog4Changed();
    void analog5Changed();
    void analog6Changed();
    void handshakeChanged();
    void packVoltageChanged();
    void DCLinkVChanged();
    void MCTempChanged();
    void MotorTempChanged();
    void SpeedChanged();
    void numBatteryCellsChanged();

public:
    double speed() const;
    double rpm() const;
    int rotate() const;
    QString ethIp() const;
    int backlight() const;

    double cellVoltage();
    int batteryTemp();
    int analog1();
    int analog2();
    int analog3();
    int analog4();
    int analog5();
    int analog6();
    bool handshake();
    double packVoltage();
    double DCLinkV();
    int MCTemp();
    int MotorTemp();
    int numBatteryCells();

private:
    double _rpm = 0;
    int _rotate = 0;
    QString _ethIp;
    int _backlight;
    double _cellVoltage = 0;
    int _batteryTemp = 0;
    int _analog1 = 0;
    int _analog2 = 0;
    int _analog3 = 0;
    int _analog4 = 0;
    int _analog5 = 0;
    int _analog6 = 0;
    bool _handshake = false;
    double _packVoltage = 0;
    double _DCLinkV = 0;
    int _MCTemp = 0;
    int _MotorTemp = 0;
    double _speed = 0;
    int _numBatteryCells = 0;
};

#endif // MODEL_H
