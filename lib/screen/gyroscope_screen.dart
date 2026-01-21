import "dart:async";
import "package:flutter/material.dart";
import "package:sensors_plus/sensors_plus.dart";

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  StreamSubscription<GyroscopeEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Gyroscope"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Gyroscope",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Text(
              "X: ${_x.toStringAsFixed(2)}, Y: ${_y.toStringAsFixed(2)}, Z: ${_z.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
