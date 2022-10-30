#include "windowroundedsides.hpp"

#include <QPainter>
#include <QPainterPath>
#include <QDebug>
#include <cmath>

WindowRoundedSides::WindowRoundedSides()
{
    setAntialiasing(true);
}

void WindowRoundedSides::paint(QPainter *painter)
{
    QPainterPath path;
    const double w = width();
    const double h = height();

    QPen pen(QBrush(m_borderColor), m_borderWidth);

    if (m_side < 0 || 2 < m_side)
    {
        path.lineTo(w, 0);
        path.lineTo(w, h);
        path.lineTo(0, h);
        path.lineTo(0, 0);
        painter->fillPath(path, m_color);
        painter->strokePath(path, pen);
    }
    else
    if (m_side == 0)
    {
        path.moveTo(0, h);
        path.lineTo(0, m_radius);
        path.arcTo(0, 0, m_radius*2, m_radius*2, -180, -90);
        path.lineTo(w, 0);
        path.lineTo(w, h);
        path.lineTo(0, h);
        painter->fillPath(path, m_color);

        path.clear();
        path.moveTo(0, h);
        path.lineTo(0, m_radius);
        path.arcTo(0, 0, m_radius*2, m_radius*2, -180, -90);
        path.lineTo(w, 0);
        painter->strokePath(path, pen);
    }
    else
    if (m_side == 1)
    {
        path.moveTo(w, h);
        path.lineTo(w, m_radius);
        path.arcTo(w-2*m_radius, 0, m_radius*2, m_radius*2, 0, 90);
        path.lineTo(0, 0);
        path.lineTo(0, h);
        path.lineTo(w,h);
        painter->fillPath(path, m_color);

        path.clear();
        path.moveTo(w, h);
        path.lineTo(w, m_radius);
        path.arcTo(w-2*m_radius, 0, m_radius*2, m_radius*2, 0, 90);
        path.lineTo(0, 0);
        painter->strokePath(path, pen);
    }
    if (m_side == 2)
    {
        path.moveTo(0, h-m_radius);
        path.lineTo(0, 0);
        path.lineTo(w, 0);
        path.lineTo(w, h-m_radius);
        path.arcTo(w-2*m_radius, h-2*m_radius, m_radius*2, m_radius*2, 0, -90);
        path.lineTo(m_radius,h);
        path.arcTo(0, h-2*m_radius, m_radius*2, m_radius*2, -90, -90);
        painter->fillPath(path, m_color);

        path.clear();
        path.moveTo(w, 0);
        path.lineTo(w, h-m_radius);
        path.arcTo(w-2*m_radius, h-2*m_radius, m_radius*2, m_radius*2, 0, -90);
        path.lineTo(m_radius,h);
        path.arcTo(0, h-2*m_radius, m_radius*2, m_radius*2, -90, -90);
        path.lineTo(0,0);
        painter->strokePath(path, pen);
    }

}

QColor WindowRoundedSides::color() const
{
    return m_color;
}

void WindowRoundedSides::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

QColor WindowRoundedSides::borderColor() const
{
    return m_borderColor;
}

void WindowRoundedSides::setBorderColor(QColor color)
{
    if (m_borderColor == color)
        return;

    m_borderColor = color;
    emit borderColorChanged();
}

QString WindowRoundedSides::side() const
{
    switch (m_side){
    case (-1): return "undefined";
    case (0): return "top,left";
    case (1): return "top,right";
    case (2): return "bottom,left";
    case (3): return "bottom,right";
    default: return "unknown";
    }
}

void WindowRoundedSides::setSide(QString side)
{
    side = side.toLower();

    int sideInt = -1;

    if (side.contains("top"))
    {
        if (side.contains("left"))
            sideInt = 0;
        else
        if (side.contains("right"))
            sideInt = 1;
    }
    else
    if (side.contains("bottom"))
    {
            sideInt = 2;
    }

    if (sideInt == (-1))
    {
        qDebug() << "[ERROR]" << "Error in QML, in 'side' attribute";
        return;
    }

    if (m_side == sideInt)
        return;

    m_side = sideInt;
    emit sideChanged();
}

double WindowRoundedSides::radius() const
{
    return m_radius;
}

void WindowRoundedSides::setRadius(double radius)
{
    if (qFuzzyCompare(m_radius, radius))
        return;

    m_radius = radius;
    emit radiusChanged();
    update();
}

double WindowRoundedSides::borderWidth() const
{
    return m_borderWidth;
}

void WindowRoundedSides::setBorderWidth(double width)
{
    if (qFuzzyCompare(m_borderWidth, width))
        return;

    m_borderWidth = width;
    emit borderWidthChanged();
    update();
}
