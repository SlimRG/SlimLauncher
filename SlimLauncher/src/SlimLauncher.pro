QT += quick
QT += svg

SOURCES += \
        Tools/platformtools.cpp \
        UI/NotchedRectangle/notchedrectangle.cpp \
        UI/PlatformToolsQML/platformtoolsqml.cpp \
        UI/WindowRoundedSides/windowroundedsides.cpp \
        main.cpp

RESOURCES += qml.qrc \
    assets.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Tools/platformtools.hpp \
    UI/NotchedRectangle/notchedrectangle.hpp \
    UI/PlatformToolsQML/platformtoolsqml.hpp \
    UI/WindowRoundedSides/windowroundedsides.hpp \
    main.hpp \
    settings.hpp

# Single application mode
include(libs/singleapplication/singleapplication.pri)
DEFINES += QAPPLICATION_CLASS=QGuiApplication

CONFIG += qmltypes
QML_IMPORT_NAME = Custom
QML_IMPORT_MAJOR_VERSION = 1
INCLUDEPATH += UI/NotchedRectangle
INCLUDEPATH += UI/WindowRoundedSides
INCLUDEPATH += UI/PlatformToolsQML
