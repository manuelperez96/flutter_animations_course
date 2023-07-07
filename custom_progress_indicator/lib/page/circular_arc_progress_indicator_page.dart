import 'package:custom_progress_indicator/widget/circular_arc_progress_indicator.dart';
import 'package:flutter/material.dart';

class CircularArcProgressIndicatorPage extends StatefulWidget {
  const CircularArcProgressIndicatorPage({super.key});

  @override
  State<CircularArcProgressIndicatorPage> createState() =>
      _CircularArcProgressIndicatorPageState();
}

class _CircularArcProgressIndicatorPageState
    extends State<CircularArcProgressIndicatorPage> {
  var _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _updateProgress,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: CircularArcProgressIndicator(
            progress: _progress,
            insideStrokeColor: Colors.lightBlue.shade100,
            outsideStrokeColor: Colors.red,
            animatedReverse: false,
          ),
        ),
      ),
    );
  }

  void _updateProgress() {
    setState(() {
      if (_progress == 1) {
        _progress = 0;
      } else {
        _progress += .2;
      }
    });
  }
}
