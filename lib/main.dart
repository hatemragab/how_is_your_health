import 'package:material_ui/material_ui.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/screens/startPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // setStatusBarFontStyle

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'how is your heath',
        builder: (context, child) {
          // Official temporary bridge for legacy progress/avatar/swiper widgets.
          // ignore: deprecated_member_use
          return MaterialUiCompatibilityBridge(
            child: child ?? const SizedBox.shrink(),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StartPage(),
      ),
    );
  }
}
