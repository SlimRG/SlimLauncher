#ifndef LOGGINGTOOLS_HPP
#define LOGGINGTOOLS_HPP

#include <QCoreApplication>
#include <QDebug>

#ifndef LT
    #define LT LoggingTools
#endif

class LoggingTools
{
    public:
        typedef int (*Procedure)();
        static void StartPrecedure(Procedure func, const QString& funcName);

    private:
        LoggingTools();

};

#endif // LOGGINGTOOLS_HPP
