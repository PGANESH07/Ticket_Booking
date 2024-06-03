# A Ticket Booking App
To start contributing to this repository, follow the outlined steps:
This is a flutter based project so installing flutter platform is mandatory.
after you're done with installing flutter.
1. clone the repository
2. make any changes to flutter app in any platform i.e ( android, ios, web)
3. flutter run
4. flutter build web --release for web
5. CI/CD are yet to be decided
6. mobile scanner requires latest sdk 21
7. kotlin-gradle plugin is updated to 1.9.10
8.when you try to save a widget as a image always remember to change background color of the widget to white.
9. there is conflict between dart html package and android build.
using dio
delete the tools.stamp file and aadd --disable-web-security in chrome to avoid cors isssue on web platform.
Built build\app\outputs\flutter-apk\app-debug.apk.
images in web has been fixed with windows renderer as html line
flutter canvas kit problem is solved with new flutter build web --web-renderer canvaskit
progrss indicator in qr image is being wasted to design changes.
future .delayed can be used to show immediate action like tutorial of app

build commands :

web : flutter build web --web-renderer canvaskit