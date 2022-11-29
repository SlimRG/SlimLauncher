#ifndef WINDOWROUNDEDSIDES_HPP
#define WINDOWROUNDEDSIDES_HPP

#include <QtQml/qqmlregistration.h>
#include <QQuickPaintedItem>

class WindowRoundedSides : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QColor borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)
    Q_PROPERTY(QString side READ side WRITE setSide NOTIFY sideChanged)
    Q_PROPERTY(double radius READ radius WRITE setRadius NOTIFY radiusChanged)
    Q_PROPERTY(double borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    QML_ELEMENT
public:
    WindowRoundedSides();

    void paint(QPainter* painter) override;

    QColor color() const;
    void setColor(QColor color);

    QColor borderColor() const;
    void setBorderColor(QColor color);

    QString side() const;
    void setSide(QString side);

    double radius() const;
    void setRadius(double radius);

    double borderWidth() const;
    void setBorderWidth(double width);

signals:
    void colorChanged();
    void borderColorChanged();
    void sideChanged();
    void radiusChanged();
    void borderWidthChanged();

private:
    QColor m_color;
    QColor m_borderColor;
    int m_side = -1;
    double m_radius = 8;
    double m_borderWidth = 2;
};

#endif // WINDOWROUNDEDSIDES_HPP
