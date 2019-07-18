import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart' show PlatformScaffold;

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Container(width: double.infinity, height: double.infinity, color: Colors.red),
    );
  }
}