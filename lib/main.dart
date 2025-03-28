import 'src/utils/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///This is the Initial Start of the App the binds controller with UI inorder
    ///to start the app
    return GetMaterialApp(
      title: "Super Market Billing Application",
      initialBinding: MainBindings(),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
