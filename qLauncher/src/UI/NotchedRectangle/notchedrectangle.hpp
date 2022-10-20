#ifndef NOTCHEDRECTANGLE_H
#define NOTCHEDRECTANGLE_H

#include <QQuickPaintedItem>

class NotchedRectangle : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QPointF notchCenter READ notchCenter WRITE setNotchCenter NOTIFY notchCenterChanged)
    Q_PROPERTY(double notchRadius READ notchRadius WRITE setNotchRadius NOTIFY notchRadiusChanged)
    Q_PROPERTY(double cornerRadius READ cornerRadius WRITE setCornerRadius NOTIFY cornerRadiusChanged)

public:
    NotchedRectangle();

    void paint(QPainter* painter) override;

    QColor color() const;
    void setColor(QColor color);

    QPointF notchCenter() const;
    void setNotchCenter(QPointF notchCenter);

    double notchRadius() const;
    void setNotchRadius(double notchRadius);

    double cornerRadius() const;
    void setCornerRadius(double cornerRadius);

signals:
    void colorChanged();
    void notchCenterChanged();
    void notchRadiusChanged();
    void cornerRadiusChanged();

private:
    QColor m_color;
    QPointF m_notchCenter;
    double m_notchRadius = 30;
    double m_cornerRadius = 4;
};

#endif // NOTCHEDRECTANGLE_H
