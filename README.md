# bktest

A new Flutter project made with Flutter clean architecture and Firebase.

## Getting Started

 Please follow instructions that are presented in [Flutter Docs](https://docs.flutter.dev/get-started/install) to install flutter and prepare your machine to work with flutter SDK.

### How to run the website

To run the test Project after installing Flutter properly from the previous steps please type the following in a Terminal/CMD window opened in the project folder.

```flutter build web --web-renderer html```

### How to run the testing Project

To run the test Project after installing Flutter properly from the previous steps please type the following in a Terminal/CMD window opened in the project folder.

  ```flutter test path/to/test/file```

### How to run the app via Docker

 First open a terminal window in the project folder then type the following:

   ```docker build . -t flutter_docker```

 After building the docker image and installing flutter with the previous command you will need to run the docker container with:

   ```docker run -i -p 8080:5000 -td flutter_docker .```

 After that the app will be runing in the backgound and you could access it from: [Test App](http://localhost:8080/)
