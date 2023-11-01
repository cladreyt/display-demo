#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "model.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    model *mdl = new model();

    mdl->setSpeed(90);
    mdl->setBatteryTemp(20);

    QQmlApplicationEngine *engine = new QQmlApplicationEngine();
    engine->rootContext()->setContextProperty("mdl", mdl);
    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
