import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dart1Screen()),
              );
            },
            child: const Text(
              "Dart Task 1",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dart2Screen()),
              );
            },
            child: const Text(
              "Dart Task 2 and 3",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListWithDevidersScreen()),
              );
            },
            child: const Text(
              "Flutter Task 1",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GreenScreen()),
              );
            },
            child: const Text(
              "Flutter Task 2",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContainerAnimation()),
              );
            },
            child: const Text(
              "Flutter Task 3",
            ),
          ),
        ]),
      ),
      // backgroundColor: Colors.green,
    );
  }
}

class Dart1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [];
    for (int i = 0; i < 10; i++) {
      list.add(Random().nextInt(1000));
    }
    print(list.toString());
    list.forEach((element) {
      element % 2 == 0 ? print(element) : null;
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: const Center(child: Text("Results in console")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => BlueScreen()),
          );
        },
        tooltip: 'Go to main page',
        child: const Icon(Icons.home),
      ),
    );
  }
}

class Dart2Screen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  List<int> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
          child: TextField(
        onSubmitted: (tmp) {
          try {
            if (tmp == "exit") {
              Navigator.pop(
                context,
                // MaterialPageRoute(builder: (context) => BlueScreen()),
              );
            } else {
              var tmpInt = int.parse(tmp);
              list.add(tmpInt);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('List lenght is ${list.length}')));
            }
          } on Exception catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('not a number\nList lenght is ${list.length}')));
          } finally {
            controller.clear();
          }
        },
        controller: controller,
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => BlueScreen()),
          );
        },
        tooltip: 'Go to main page',
        child: const Icon(Icons.home),
      ),
    );
  }
}

class ListWithDevidersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: ListView.separated(
        itemBuilder: (_, index) {
          return Text('$index');
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: 10,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => BlueScreen()),
          );
        },
        tooltip: 'Go to main page',
        child: const Icon(Icons.home),
      ),
    );
  }
}

class GreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlueScreen()),
            );
          },
          child: const Text(
            "Первый экран",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.green,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => BlueScreen()),
          );
        },
        tooltip: 'Go to main page',
        child: const Icon(Icons.home),
      ),
    );
  }
}

class BlueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Второй экран",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class ContainerAnimation extends StatefulWidget {
  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  double size = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              size = size == 150 ? 300 : 150;
            });
          },
          child: AnimatedContainer(
              width: size,
              height: size,
              color: Colors.red,
              duration: const Duration(seconds: 1),
              child: const Text("Tap it")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => BlueScreen()),
          );
        },
        tooltip: 'Go to main page',
        child: const Icon(Icons.home),
      ),
    );
  }
}
