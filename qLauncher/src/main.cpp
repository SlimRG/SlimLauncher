#include "main.hpp"

using namespace SETTINGS;

int main(int argc, char *argv[])
{
    // Prepre app
    SingleApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Set system settings
    QCoreApplication::setOrganizationName(SETTINGS::ORGANIZATION_NAME);
    QCoreApplication::setOrganizationDomain(SETTINGS::ORGANIZATION_DOMAIN);
    QCoreApplication::setApplicationName(SETTINGS::APPLICATION_NAME);

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
