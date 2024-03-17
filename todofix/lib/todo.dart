import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<Todo> {
  List<String> todoList = [];

  Widget _listBody() {
    return Expanded(
        child: Container(
      color: const Color(0xff2993ff),
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text(
                    "지금인덱스는$index입니다.",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(todoList[index], style: TextStyle(fontSize: 20),)
                ],
              ),
            );
          }),
      // child: const Center(
      //   child: Text(
      //     "여기는 리스트 화면 입니다.",
      //     style: TextStyle(fontSize: 70),
      //   ),
      // ),
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          _listBody(),
          GestureDetector(onTap: (){
            print("버튼추가함");
            setState(() {
              todoList.add("투두추가했음");
            });
          },
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.brown,
                child: const Text(
                  "여기는 todo추가버튼",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
