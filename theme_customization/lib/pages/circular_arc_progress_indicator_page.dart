import 'package:flutter/material.dart';
import 'package:theme_customization/widgets/circular_arc_progress_indicator.dart';

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
    final colors = Theme.of(context).colorScheme;

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
            insideStrokeColor: colors.secondary.withOpacity(.5),
            outsideStrokeColor: colors.secondary,
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
