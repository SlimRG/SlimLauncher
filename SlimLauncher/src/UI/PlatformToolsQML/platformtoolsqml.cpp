#include "platformtoolsqml.hpp"

PlatformToolsQML::PlatformToolsQML()
{
    #ifdef Q_OS_WIN
        m_sys_settings = new QSettings("HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize", QSettings::NativeFormat);
        m_dwm_settings = new QSettings("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\DWM", QSettings::NativeFormat);
        m_timer.start(500, Qt::VeryCoarseTimer, this);
    #endif
}


PlatformToolsQML::~PlatformToolsQML()
{
   #ifdef Q_OS_WIN
        delete m_sys_settings;
        delete m_dwm_settings;
        m_timer.stop();
   #endif
}

int PlatformToolsQML::themeMode() const
{
    return m_themeMode;
}

void PlatformToolsQML::setThemeMode(int themeMode)
{
    m_autoThemeCheck = false;

    if (m_themeMode == themeMode)
        return;

    m_themeMode = themeMode;
    emit themeModeChanged();
}

QPoint PlatformToolsQML::getFrameSize() const
{
    return SETTINGS::frameSize;
}

QPoint PlatformToolsQML::getFrameMinSize() const
{
    return SETTINGS::frameMinSize;
}

int PlatformToolsQML::captionHeight() const
{
    return m_captionHeight;
}

QColor PlatformToolsQML::colorActiveWindow() const
{
    return m_colorActiveWindow;
}

void PlatformToolsQML::setColorActiveWindow(QColor color)
{
    QColor oldColor = colorActiveWindow();
    m_settings.setValue("COLOR_ACTIVEWINDOW", color);
    if (oldColor != color)
        emit colorActiveWindowChanged();
}

QColor PlatformToolsQML::colorBorderWindow() const
{
    return m_colorBorderWindow;
}

void PlatformToolsQML::setColorBorderWindow(QColor color)
{
    QColor oldColor = colorBorderWindow();
    m_settings.setValue("COLOR_ACTIVEBORDER", color);
    if (oldColor != color)
        emit colorBorderWindowChanged();
}

QColor PlatformToolsQML::colorColorization() const
{
    return m_colorColorization;
}

void PlatformToolsQML::setColorColorization(QColor color)
{
    QColor oldColor = colorColorization();
    m_settings.setValue("COLOR_COLORIZATION", color);
    if (oldColor != color)
        emit colorColorizationChanged();
}

QColor PlatformToolsQML::colorHoverCol() const
{
    return m_colorHoverCol;
}

void PlatformToolsQML::setColorHoverCol(QColor color)
{
    QColor oldColor = colorHoverCol();
    m_settings.setValue("COLOR_COLORHOVER", color);
    if (oldColor != color)
        emit colorHoverColChanged();
}

int PlatformToolsQML::cornerRadiusTopLevel() const
{
    const QString os = QSysInfo::productType();
    const QString version = QSysInfo::productVersion();

    if ((os.toLower() == "windows") && (version == "11"))
        return 8;

    return 0;
}

int PlatformToolsQML::borderWidthWindow() const
{
    return m_borderWidthWindow;
}

double PlatformToolsQML::scaleFactor() const
{
    return m_scaleFactor;
}

void PlatformToolsQML::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event);
    #ifdef Q_OS_WIN
        // themeMode
        int themeMode = m_sys_settings->value("AppsUseLightTheme", true).toInt();
        if (themeMode != m_themeMode)
        {
            m_themeMode = themeMode;
            emit themeModeChanged();
        }

        // captionHeight
        if (true)
        {
            int captionHeight = GetSystemMetrics(SM_CYCAPTION) / m_scaleFactor;
            if (captionHeight != m_captionHeight)
            {
                m_captionHeight = captionHeight;
                emit captionHeightChanged();
            }
        }

        // colorActiveWindow
        if (true)
        {
            QColor color;
            QVariant variant = m_settings.value("COLOR_ACTIVEWINDOW");
            if (variant.toInt())
                color = variant.value<QColor>();
            else
            {
                if (m_dwm_settings->value("ColorPrevalence").toBool())
                {
                    unsigned long colorizationColor = m_dwm_settings->value("AccentColor").toUInt();
                    color = QColor(GetRValue(colorizationColor), GetGValue(colorizationColor), GetBValue(colorizationColor));
                }
                else
                    color = qApp->palette().color(QPalette::Active, QPalette::Window);
            }
            if (m_colorActiveWindow != color)
            {
                m_colorActiveWindow = color;
                emit colorActiveWindowChanged();
            }
        }

        // colorBorderWindow
        if (true)
        {
            QColor color;
            QVariant variant = m_settings.value("COLOR_ACTIVEBORDER");
            if (variant.toInt())
                color = variant.value<QColor>();
            else
            {
                if (m_dwm_settings->value("ColorPrevalence").toBool())
                {
                    unsigned long colorizationColor = m_dwm_settings->value("AccentColor").toUInt();
                    color = QColor(GetRValue(colorizationColor), GetGValue(colorizationColor), GetBValue(colorizationColor));
                }
                else
                    color = qApp->palette().color(QPalette::Active, QPalette::Window);
            }
            if (m_colorBorderWindow != color)
            {
                m_colorBorderWindow = color;
                emit colorBorderWindowChanged();
            }
        }

        // colorColorization
        if (true)
        {
            QColor color;
            QVariant variant = m_settings.value("COLOR_COLORIZATION");
            if (variant.toInt())
                color = variant.value<QColor>();
            else
            {
//                if (m_dwm_settings->value("ColorizationColor").toBool())
//                {
//                    unsigned long colorizationColor = m_dwm_settings->value("ColorizationColor").toUInt();
//                    color = QColor(GetRValue(colorizationColor), GetGValue(colorizationColor), GetBValue(colorizationColor));
//                }
//                else
                    color = QColor(65, 165, 238);
            }
            if (m_colorColorization != color)
            {
                m_colorColorization = color;
                emit colorColorizationChanged();
            }
        }

        // colorHoverCol
        if (true)
        {
            QColor color;
            QVariant variant = m_settings.value("COLOR_COLORHOVER");
            if (variant.toInt())
                color = variant.value<QColor>();
            else
            {
//                if (m_dwm_settings->value("ColorizationColor").toBool())
//                {
//                    unsigned long colorizationColor = m_dwm_settings->value("ColorizationColor").toUInt();
//                    color = QColor(GetRValue(colorizationColor), GetGValue(colorizationColor), GetBValue(colorizationColor));
//                }
//                else
                    color = QColor(0, 119, 255);
            }
            if (m_colorHoverCol != color)
            {
                m_colorHoverCol = color;
                emit colorHoverColChanged();
            }
        }

        // borderWidthWindow
        if (true)
        {
            int borderWidthWindow = GetSystemMetrics(SM_CXBORDER);
            if (borderWidthWindow != m_borderWidthWindow)
            {
                m_borderWidthWindow = borderWidthWindow;
                emit borderWidthWindowChanged();
            }
        }

        // scaleFactor
        if (true)
        {
            double scaleFactor = QGuiApplication::primaryScreen()->devicePixelRatio();
            if (scaleFactor != m_scaleFactor)
            {
                m_scaleFactor = scaleFactor;
                emit scaleFactorChanged();
            }

        }

    #endif
}


