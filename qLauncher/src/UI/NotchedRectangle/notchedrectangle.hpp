#ifndef NOTCHEDRECTANGLE_HPP
#define NOTCHEDRECTANGLE_HPP

#include <QQuickPaintedItem>

class NotchedRectangle : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QColor borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)
    Q_PROPERTY(QPointF notchCenter READ notchCenter WRITE setNotchCenter NOTIFY notchCenterChanged)
    Q_PROPERTY(double notchRadius READ notchRadius WRITE setNotchRadius NOTIFY notchRadiusChanged)
    Q_PROPERTY(double cornerRadius READ cornerRadius WRITE setCornerRadius NOTIFY cornerRadiusChanged)
    Q_PROPERTY(double borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    Q_PROPERTY(bool onlyTopBorder READ onlyTopBorder WRITE setOnlyTopBorder NOTIFY onlyTopBorderChanged)

public:
    NotchedRectangle();

    void paint(QPainter* painter) override;

    QColor color() const;
    void setColor(QColor color);

    QColor borderColor() const;
    void setBorderColor(QColor color);

    QPointF notchCenter() const;
    void setNotchCenter(QPointF notchCenter);

    double notchRadius() const;
    void setNotchRadius(double notchRadius);

    double cornerRadius() const;
    void setCornerRadius(double cornerRadius);

    double borderWidth() const;
    void setBorderWidth(double width);

    bool onlyTopBorder() const;
    void setOnlyTopBorder(bool ohz);

signals:
    void colorChanged();
    void borderColorChanged();
    void notchCenterChanged();
    void notchRadiusChanged();
    void cornerRadiusChanged();
    void borderWidthChanged();
    void onlyTopBorderChanged();

private:
    QColor m_color;
    QColor m_borderColor;
    QPointF m_notchCenter;
    double m_notchRadius = 30;
    double m_cornerRadius = 4;
    double m_borderWidth = 2;
    bool m_onlyTopBorder = false;
};

#endif // NOTCHEDRECTANGLE_HPP
