import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Object jet;
  late Animation _animation;
  late Scene _scene;

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    // _scene.camera.position.z = 1;
    scene.camera.position.z = 10;
    scene.camera.target.y = 2;
    scene.world.add(jet);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // jet = Object(fileName: "assets/helicoptor/Cobblestones5.obj");
    jet = Object(fileName: 'assets/helicoptor/Heli_bell.obj');

    _animationController = AnimationController(
        duration: Duration(milliseconds: 30000), vsync: this)
      ..addListener(() {
        if (jet != null) {
          // jet.transform.translate(100);
          jet.rotation.y = _animationController.value * 360;
          jet.updateTransform();
          _scene.update();
        }
      })
      ..repeat();
    // _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(100, 100))
    //     .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Cube(onSceneCreated: _onSceneCreated),
          ),
        ));
  }
}
