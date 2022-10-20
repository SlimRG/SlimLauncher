#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <singleapplication.h>

#include "main.hpp"

using namespace SETTINGS;

int main(int argc, char *argv[])
{
    // Prepre app
    qmlRegisterType<NotchedRectangle>("NR", 1, 0, "NotchedRectangle");
    SingleApplication app(argc, argv);
    QQmlApplicationEngine engine;


    // Prepare QML
    const QUrl url("qrc:/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    engine.load(url);

    return app.exec();
}
