#ifndef FULLSCREENTOGGLEACTION_H
#define FULLSCREENTOGGLEACTION_H

#include <QAction>

class FullScreenToggleAction : public QAction
{
    Q_OBJECT
public:
    explicit FullScreenToggleAction(QObject *_parent = 0,
                                    QWidget *_widget = 0);
    virtual ~FullScreenToggleAction();
    bool eventFilter(QObject *obj, QEvent *event);

signals:
    
private slots:
    //void onToggled(bool checked);

private:
    QWidget *widget;
    bool state;
};

#endif // FULLSCREENTOGGLEACTION_H
