import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wine_explorer/pages/home/home_page.dart';
import 'package:wine_explorer/services/route_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode

  WidgetsFlutterBinding.ensureInitialized();
  //CameraUtils.cameras = await availableCameras();
  runApp(const MaterialApp(home: VineExplorerAppScreen()));
}

class VineExplorerAppScreen extends StatelessWidget {
  const VineExplorerAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteService.generateRoute,
      title: 'Wine explorer',
      theme: ThemeData(
          primarySwatch: Colors.indigo, scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
