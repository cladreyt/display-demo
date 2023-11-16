#include "model.h"

void model::setSpeed(const double&v) {
    if (v != _speed)
    {
        _speed = v;
        emit SpeedChanged();
        qDebug() << "speed is now " << _speed << "\n";
    }
}
void model::setAnalog1(const int &v)
{
    if (v != _analog1)
    {
        _analog1 = v;
        emit analog1Changed();
    }
}

void model::setAnalog2(const int &v)
{
    if (v != _analog2)
    {
        _analog2 = v;
        emit analog2Changed();
    }
}

void model::setAnalog3(const int &v)
{
    if (v != _analog3)
    {
        _analog3 = v;
        emit analog3Changed();
    }
}

void model::setAnalog4(const int &v)
{
    if (v != _analog4)
    {
        _analog4 = v;
        emit analog4Changed();
    }
}

void model::setAnalog5(const int &v)
{
    if (v != _analog5)
    {
        _analog5 = v;
        emit analog5Changed();
    }
}

void model::setAnalog6(const int &v)
{
    if (v != _analog6)
    {
        _analog6 = v;
        emit analog6Changed();
    }
}

void model::setRpm(const double &v)
{
    if (v != _rpm)
    {
        _rpm = v;
        emit rpmChanged();
    }
}

void model::setRotate(const int &v)
{
    if (v != _rotate)
    {
        _rotate = v;
        emit rotateChanged();
    }
}

void model::setEthIp(const QString &v)
{
    if (v != _ethIp)
    {
        _ethIp = v;
        emit ethIpChanged();
    }
}

void model::setBacklight(const int &v)
{
    if (v != _backlight)
    {
        _backlight = v;
        emit backlightChanged();
    }
}
void model::setCellVoltage(const double &v)
{
    if(v != _cellVoltage) {
        _cellVoltage = v;
        emit cellVoltageChanged();
    }
}
void model::setBatteryTemp(const int &v)
{
    if (v != _batteryTemp) {
        _batteryTemp = v;
        emit batteryTempChanged();
    }
}
void model::setHandshake (const bool &v)
{
    if (v != _handshake) {
        _handshake = v;
        emit handshakeChanged();
    }
}
void model::setPackVoltage (const double &v)
{
    if (v != _packVoltage) {
        _packVoltage = v;
        emit packVoltageChanged();
    }
}
void model::setDCLinkV (const double &v)
{
    if (v != _DCLinkV) {
        _DCLinkV = v;
        emit DCLinkVChanged();
    }
}
void model::setMCTemp (const int &v)
{
    if (v != _MCTemp) {
        _MCTemp = v;
        emit MCTempChanged();
    }
}
void model::setMotorTemp (const int &v)
{
    if (v != _MotorTemp) {
        _MotorTemp = v;
        emit MotorTempChanged();
    }
}
void model::setNumBatteryCells(const int &v) {
    if (v != _numBatteryCells) {
        _numBatteryCells = v;
        emit numBatteryCellsChanged();
    }
}


double model::speed() const
{
    return _speed;
}
double model::rpm() const
{
    return _rpm;
}

int model::rotate() const
{
    return _rotate;
}

QString model::ethIp() const
{
    return _ethIp;
}

int model::backlight() const
{
    return _backlight;
}

double model::cellVoltage()
{
    return _cellVoltage;
}
int model::batteryTemp()
{
    return _batteryTemp;
}
int model::analog1()
{
    return _analog1;
}
int model::analog2()
{
    return _analog2;
}
int model::analog3()
{
    return _analog3;
}
int model::analog4()
{
    return _analog4;
}
int model::analog5()
{
    return _analog5;
}
int model::analog6()
{
    return _analog6;
}
bool model::handshake()
{
    return _handshake;
}
double model::packVoltage()
{
    return _packVoltage;
}
double model::DCLinkV(){
    return _DCLinkV;
}
int model::MCTemp(){
    return _MCTemp;
}
int model::MotorTemp(){
    return _MotorTemp;
}
int model::numBatteryCells(){
    return _numBatteryCells;
}
