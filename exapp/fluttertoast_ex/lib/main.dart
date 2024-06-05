import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _lastPressedAt;

  void _onWillPop() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 2)) {
      // 현재 시간이 마지막 버튼 누른 시간보다 2초 뒤..
      _lastPressedAt = DateTime.now();

      //1번
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text(''"'뒤로'"' 버튼을 한번 더 누르시면 종료됩니다.'),
      //     duration: Duration(seconds: 2),
      //   ),

      // 2번
      Fluttertoast.showToast(
        msg: "뒤로 버튼을 한번 더 누르시면 종료됩니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
        webBgColor: "#000000",  // 웹 배경 색상 설정
        webPosition: "center",
      );
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        _onWillPop();
        print("뒤로가기 버튼눌림");
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PopScope Example"),
        ),
        body: const Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
