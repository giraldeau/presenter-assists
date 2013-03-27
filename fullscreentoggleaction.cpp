#include "fullscreentoggleaction.h"
#include <QEvent>
#include <QKeyEvent>
#include <QApplication>

#include <iostream>

using namespace std;

FullScreenToggleAction::FullScreenToggleAction(QObject *_parent, QWidget *_widget) :
    QAction(_parent),
    widget(_widget),
    state(false)
{
    widget->installEventFilter(this);
}

FullScreenToggleAction::~FullScreenToggleAction()
{
}

bool FullScreenToggleAction::eventFilter(QObject *obj, QEvent *event)
{
    if(event->type() == QEvent::KeyPress) {
        QKeyEvent *key = static_cast<QKeyEvent *>(event);
        if (key->key() == Qt::Key_F) {
            if (state) {
                widget->showNormal();
            } else {
                widget->showFullScreen();
            }
            state = !state;
        } else if (key->key() == Qt::Key_Q) {
            QApplication::quit();
        }
    }
    return false;
}

/*
void FullScreenToggleAction::onToggled(bool checked)
{
    return;
}
*/
