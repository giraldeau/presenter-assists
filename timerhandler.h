#ifndef TIMERHANDLER_H
#define TIMERHANDLER_H

#include <QObject>

class timerhandler : public QObject
{
    Q_OBJECT
public:
    explicit timerhandler(QObject *parent = 0);
    
signals:
    
public slots:
    void handle();
};

#endif // TIMERHANDLER_H
