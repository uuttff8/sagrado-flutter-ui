import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:sagrado_flutter_ui/src/screens/chose_place/chose_place_provider.dart';
import 'src/screens/chose_place/chose_place.dart';

void main() => runApp(Sagrado());

class Sagrado extends StatelessWidget {
  const Sagrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      home: ChangeNotifierProvider<PlaceNotifier>(
          builder: (_) => PlaceNotifier(), child: ChosePlaceScreen()),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
