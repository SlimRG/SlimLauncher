QT += quick
QT += svg

SOURCES += \
        LoggingTools/loggingtools.cpp \
        UI/NotchedRectangle/notchedrectangle.cpp \
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
    LoggingTools/loggingtools.hpp \
    UI/NotchedRectangle/notchedrectangle.hpp \
    UI/WindowRoundedSides/windowroundedsides.hpp \
    main.hpp \
    settings.hpp

# Single application mode
include(libs/singleapplication/singleapplication.pri)
DEFINES += QAPPLICATION_CLASS=QGuiApplication
