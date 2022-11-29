#ifndef SETTINGS_HPP
#define SETTINGS_HPP

#include <QPair>
#include <QPoint>
#include <QString>

namespace SETTINGS
{
    // Author settings
    const QString APPLICATION_NAME = "qLauncher";    // Program name
    const QString ORGANIZATION_DOMAIN = "localhost"; // Author's site
    const QString ORGANIZATION_NAME = "SlimRG";      // Author's name

    const bool DEBUG_MODE = 1; // Debug mode

    // QML Design
    const  QPoint frameSize(640, 720); // Default frame size (width|720)
    const  QPoint frameMinSize(640, 720); // Minimum frame size (width|720)
}
#endif // SETTINGS_HPP
