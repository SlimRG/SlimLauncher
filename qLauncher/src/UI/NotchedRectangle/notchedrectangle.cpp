#include "notchedrectangle.hpp"

#include <QPainter>
#include <QPainterPath>
#include <QDebug>
#include <cmath>

NotchedRectangle::NotchedRectangle()
{
    setAntialiasing(true);
}

void NotchedRectangle::paint(QPainter* painter)
{
    QPainterPath path;
    const double w = width();
    const double h = height();
    const double cx = m_notchCenter.x();
    const double cy = m_notchCenter.y();
    const double nr = m_notchRadius;
    const double nd = m_notchRadius * 2;
    const double cr = m_cornerRadius;
    const double cd = cr * 2;
    const double xDelta = std::sqrt(nr * nr + 2 * nr * cr - cy * cy + 2 * cy * cr);
    const qreal angle = std::atan2(cr - cy, xDelta) * 180.0 / M_PI;

    path.arcTo(cx - xDelta - cr, 0, cd, cd, 90, -90 + angle);
    path.arcTo(cx - nr, cy - nr, nd, nd, -180 + angle, 180 - angle * 2);
    path.arcTo(cx + xDelta - cr, 0, cd,  cd, 180 - angle, -90 + angle);

    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(path.currentPosition().x(), h);
    path.lineTo(0, h);

    QPen pen(QBrush(m_borderColor), m_borderWidth);

    painter->fillPath(path, m_color);

    if (m_onlyTopBorder)
    {
        path.clear();
        path.arcTo(cx - xDelta - cr, 0, cd, cd, 90, -90 + angle);
        path.arcTo(cx - nr, cy - nr, nd, nd, -180 + angle, 180 - angle * 2);
        path.arcTo(cx + xDelta - cr, 0, cd,  cd, 180 - angle, -90 + angle);

        path.lineTo(w, 0);
        path.moveTo(w, h);
    }

    painter->strokePath(path, pen);

}

QColor NotchedRectangle::color() const
{
    return m_color;
}

void NotchedRectangle::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

QColor NotchedRectangle::borderColor() const
{
    return m_borderColor;
}

void NotchedRectangle::setBorderColor(QColor color)
{
    if (m_borderColor == color)
        return;

    m_borderColor = color;
    emit borderColorChanged();
}

double NotchedRectangle::notchRadius() const
{
    return m_notchRadius;
}

void NotchedRectangle::setNotchRadius(double notchRadius)
{
    if (qFuzzyCompare(m_notchRadius, notchRadius))
        return;

    m_notchRadius = notchRadius;
    emit notchRadiusChanged();
    update();
}

QPointF NotchedRectangle::notchCenter() const
{
    return m_notchCenter;
}

void NotchedRectangle::setNotchCenter(QPointF notchCenter)
{
    if (m_notchCenter == notchCenter)
        return;

    m_notchCenter = notchCenter;
    emit notchCenterChanged();
    update();
}

double NotchedRectangle::cornerRadius() const
{
    return m_cornerRadius;
}

void NotchedRectangle::setCornerRadius(double cornerRadius)
{
    if (qFuzzyCompare(m_cornerRadius, cornerRadius))
        return;

    m_cornerRadius = cornerRadius;
    emit cornerRadiusChanged();
    update();
}

double NotchedRectangle::borderWidth() const
{
    return m_borderWidth;
}

void NotchedRectangle::setBorderWidth(double width)
{
    if (qFuzzyCompare(m_borderWidth, width))
        return;

    m_borderWidth = width;
    emit borderWidthChanged();
    update();
}

bool NotchedRectangle::onlyTopBorder() const
{
    return m_onlyTopBorder;
}

void NotchedRectangle::setOnlyTopBorder(bool ohz)
{
    if (m_onlyTopBorder == ohz)
        return;

    m_onlyTopBorder = ohz;
    emit onlyTopBorderChanged();
    update();
}
