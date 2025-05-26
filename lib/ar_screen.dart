import 'dart:math' as math;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'main.dart';


void main() {
  runApp(const ARScreen());
}

class ARScreen extends StatelessWidget {
  const ARScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ARKitController arkitController;
  ARKitReferenceNode? node;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AR สำหรับออกกำลังกาย'),
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),); // กลับไปหน้า HomeScreen
            },
          ),
        ),
        body: Container(
          child: ARKitSceneView(
            showFeaturePoints: true,
            planeDetection: ARPlaneDetection.horizontal,
            enableTapRecognizer: true,
            onARKitViewCreated: onARKitViewCreated,
          ),
        )
    );
  }

  double currentYRotation = 0.0;

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    arkitController.addCoachingOverlay(CoachingOverlayGoal.horizontalPlane);
    arkitController.onAddNodeForAnchor = _handleAddAnchor;
    arkitController.onNodeTap = (nodes) {
      print('Nodes tapped: $nodes | Expected: ${node?.name}');

      if (nodes.isNotEmpty) {
        print('🎯 Hit!');
        setState(() {
          currentYRotation += 90;
          if (currentYRotation >= 360) currentYRotation = 0;
          node?.eulerAngles = vector.Vector3(
            currentYRotation * math.pi / 180,
            0,
            0,
          );
        });
      } else {
        print('🙅‍♂️ Nope!');
      }
    };
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitPlaneAnchor) {
      _addPlane(arkitController, anchor);
    }
  }

  void _addPlane(ARKitController controller, ARKitPlaneAnchor anchor) {
    if (node != null) {
      controller.remove(node!.name);
    }
    node = ARKitReferenceNode(
      name: 'Low_Poly_Characte_000',
      url: 'models.scnassets/mesh.dae',
      scale: vector.Vector3.all(0.3),
    );
    controller.add(node!, parentNodeName: anchor.nodeName);
  }
}
