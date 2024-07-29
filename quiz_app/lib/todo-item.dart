import 'package:flutter/material.dart';
import 'package:quiz_app/HomePage.dart';

class ToDoItem extends StatelessWidget {
  final int id;
  final String text;
  bool isDone;
  final ToDoUpdateCallBack updateCallBack;
  final ToDoDeleteCallBack deleteCallBack;
  ToDoItem(
      {Key? key,
      required this.id,
      required this.text,
      this.isDone = false,
      required this.deleteCallBack,
      required this.updateCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: GestureDetector(
          onTap: () {
            isDone = !isDone;
            print("Completed:: $id");
            updateCallBack(id, isDone);
          },
          child: Icon(
            Icons.check_box_rounded,
            color: isDone ? Colors.blue : null,
          ),
        ),
        title: Text(
          text,
        ),
        trailing: GestureDetector(
            onTap: () async {
              print("Delete to do $id");
              deleteCallBack(id);
            },
            child: Icon(
              Icons.delete_outline_outlined,
            )),
      ),
    );
  }
}

typedef ToDoUpdateCallBack = void Function(int id, bool isDone);
typedef ToDoDeleteCallBack = void Function(int id);
