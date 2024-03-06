import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '나는 todo list다!'),
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
  //int _counter = 0;
  List<String> todoList = new List.empty(growable: true);
  String input = "";

  void _addlist() {
    setState(() {
      todoList.add(input);
      input = '';
    });
  }

  void _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('적어라!'),
              content: TextField(onChanged: (String value) {
                input = value;
              }),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      //현재 화면 닫고 이전화면이동
                      Navigator.of(context).pop();
                    },
                    child: const Text('취소')),

                TextButton(
                    onPressed: () {
                      _addlist();
                      Navigator.of(context).pop();
                    },
                    child: const Text('추가'))
              ]);
        });
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                )),
          ); //각 아이템은 카드로 되어있음
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: '내용추가',
        child: const Icon(Icons.add, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
