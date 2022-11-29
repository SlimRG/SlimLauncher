#ifndef PLATFORMTOOLSQML_HPP
#define PLATFORMTOOLSQML_HPP

#include <QtQml>
#include <QObject>
#include <QSettings>
#include <QBasicTimer>
#include <QColor>
#include <QVariant>
#include <QGuiApplication>
#include <QPalette>
#include <QScreen>

#include "settings.hpp"

#ifdef Q_OS_WIN
    #include <windows.h>
#endif

class PlatformToolsQML: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int themeMode READ themeMode WRITE setThemeMode NOTIFY themeModeChanged)
    Q_PROPERTY(QPoint getFrameSize READ getFrameSize CONSTANT)
    Q_PROPERTY(QPoint getFrameMinSize READ getFrameMinSize CONSTANT)
    Q_PROPERTY(int captionHeight READ captionHeight NOTIFY captionHeightChanged)
    Q_PROPERTY(QColor colorActiveWindow READ colorActiveWindow WRITE setColorActiveWindow NOTIFY colorActiveWindowChanged)
    Q_PROPERTY(QColor colorBorderWindow READ colorBorderWindow WRITE setColorBorderWindow NOTIFY colorBorderWindowChanged)
    Q_PROPERTY(QColor colorColorization READ colorColorization WRITE setColorColorization NOTIFY colorColorizationChanged)
    Q_PROPERTY(QColor colorHoverCol READ colorHoverCol WRITE setColorHoverCol NOTIFY colorHoverColChanged)
    Q_PROPERTY(int cornerRadiusTopLevel READ cornerRadiusTopLevel NOTIFY cornerRadiusTopLevelChanged)
    Q_PROPERTY(int borderWidthWindow READ borderWidthWindow NOTIFY borderWidthWindowChanged)
    Q_PROPERTY(double scaleFactor READ scaleFactor NOTIFY scaleFactorChanged)
    QML_ELEMENT
    QML_SINGLETON

public:
    PlatformToolsQML();
    ~PlatformToolsQML();

    int themeMode() const;
    void setThemeMode(int themeMode);

    QPoint getFrameSize() const;
    QPoint getFrameMinSize() const;

    int captionHeight() const;

    QColor colorActiveWindow() const;
    void setColorActiveWindow(QColor color);

    QColor colorBorderWindow() const;
    void setColorBorderWindow(QColor color);

    QColor colorColorization() const;
    void setColorColorization(QColor color);

    QColor colorHoverCol() const;
    void setColorHoverCol(QColor color);

    int cornerRadiusTopLevel() const;
    int borderWidthWindow() const;
    double scaleFactor() const;

signals:
    void themeModeChanged();
    void captionHeightChanged();
    void colorActiveWindowChanged();
    void colorBorderWindowChanged();
    void colorColorizationChanged();
    void colorHoverColChanged();
    void cornerRadiusTopLevelChanged();
    void borderWidthWindowChanged();
    void scaleFactorChanged();

protected:
    void timerEvent(QTimerEvent* event) override;

private:    
    int m_themeMode = -1;
    bool m_autoThemeCheck = true;
    int m_captionHeight = -1;
    int m_borderWidthWindow = -1;
    double m_scaleFactor = 1;

    QColor m_colorActiveWindow;
    QColor m_colorBorderWindow;
    QColor m_colorColorization;
    QColor m_colorHoverCol;
    QSettings m_settings;

#ifdef Q_OS_WIN
    QBasicTimer m_timer;
    QSettings* m_sys_settings;
    QSettings* m_dwm_settings;
#endif

};

#endif // PLATFORMTOOLSQML_HPP
