#include <QApplication>
#include "qmlapplicationviewer.h"
#include "fullscreentoggleaction.h"
#include "QTimer"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/presenterassists/main.qml"));
    viewer.showExpanded();

    QTimer timer;
    timer.start();
    //connect(timer, SIGNAL(timeout()), viewer, SLOT())


    FullScreenToggleAction action(NULL, &viewer);

    return app->exec();
}
