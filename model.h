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

    void setSpeed(const double&v) {
        if (v != _speed)
        {
            _speed = v;
            emit SpeedChanged();
            qDebug() << "speed is now " << _speed << "\n";
        }
    }
    void setAnalog1(const int &v)
    {
        if (v != _analog1)
        {
            _analog1 = v;
            emit analog1Changed();
        }
    }

    void setAnalog2(const int &v)
    {
        if (v != _analog2)
        {
            _analog2 = v;
            emit analog2Changed();
        }
    }

    void setAnalog3(const int &v)
    {
        if (v != _analog3)
        {
            _analog3 = v;
            emit analog3Changed();
        }
    }

    void setAnalog4(const int &v)
    {
        if (v != _analog4)
        {
            _analog4 = v;
            emit analog4Changed();
        }
    }

    void setAnalog5(const int &v)
    {
        if (v != _analog5)
        {
            _analog5 = v;
            emit analog5Changed();
        }
    }

    void setAnalog6(const int &v)
    {
        if (v != _analog6)
        {
            _analog6 = v;
            emit analog6Changed();
        }
    }

    void setRpm(const double &v)
    {
        if (v != _rpm)
        {
            _rpm = v;
            emit rpmChanged();
        }
    }

    void setRotate(const int &v)
    {
        if (v != _rotate)
        {
            _rotate = v;
            emit rotateChanged();
        }
    }

    void setEthIp(const QString &v)
    {
        if (v != _ethIp)
        {
            _ethIp = v;
            emit ethIpChanged();
        }
    }

    void setBacklight(const int &v)
    {
        if (v != _backlight)
        {
            _backlight = v;
            emit backlightChanged();
        }
    }
    void setCellVoltage(const double &v)
    {
        if(v != _cellVoltage) {
            _cellVoltage = v;
            emit cellVoltageChanged();
        }
    }
    void setBatteryTemp(const int &v)
    {
        if (v != _batteryTemp) {
            _batteryTemp = v;
            emit batteryTempChanged();
        }
    }
    void setHandshake (const bool &v)
    {
        if (v != _handshake) {
            _handshake = v;
            emit handshakeChanged();
        }
    }
    void setPackVoltage (const double &v)
    {
        if (v != _packVoltage) {
            _packVoltage = v;
            emit packVoltageChanged();
        }
    }
    void setDCLinkV (const double &v)
    {
        if (v != _DCLinkV) {
            _DCLinkV = v;
            emit DCLinkVChanged();
        }
    }
    void setMCTemp (const int &v)
    {
        if (v != _MCTemp) {
            _MCTemp = v;
            emit MCTempChanged();
        }
    }
    void setMotorTemp (const int &v)
    {
        if (v != _MotorTemp) {
            _MotorTemp = v;
            emit MotorTempChanged();
        }
    }
    void setNumBatteryCells(const int &v) {
        if (v != _numBatteryCells) {
            _numBatteryCells = v;
            emit numBatteryCellsChanged();
        }
    }

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
    double speed() const
    {
        return _speed;
    }
    double rpm() const
    {
        return _rpm;
    }

    int rotate() const
    {
        return _rotate;
    }

    QString ethIp() const
    {
        return _ethIp;
    }

    int backlight() const
    {
        return _backlight;
    }

    double cellVoltage()
    {
        return _cellVoltage;
    }
    int batteryTemp()
    {
        return _batteryTemp;
    }
    int analog1()
    {
        return _analog1;
    }
    int analog2()
    {
        return _analog2;
    }
    int analog3()
    {
        return _analog3;
    }
    int analog4()
    {
        return _analog4;
    }
    int analog5()
    {
        return _analog5;
    }
    int analog6()
    {
        return _analog6;
    }
    bool handshake()
    {
        return _handshake;
    }
    double packVoltage()
    {
        return _packVoltage;
    }
    double DCLinkV(){
        return _DCLinkV;
    }
    int MCTemp(){
        return _MCTemp;
    }
    int MotorTemp(){
        return _MotorTemp;
    }
    int numBatteryCells(){
        return _numBatteryCells;
    }
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
