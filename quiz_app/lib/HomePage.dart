import 'package:flutter/material.dart';
import 'package:quiz_app/todo-item.dart';
import 'package:quiz_app/todo-model.dart';
import 'package:quiz_app/util-helper.dart';

List<Map<String, dynamic>> todoList = [];
UtilHelper utils = new UtilHelper();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fieldtext = new TextEditingController();
  readTodos() async {
    List<dynamic> list = await utils.read(utils.key);
    if (list.isNotEmpty) {
      setState(() {
        todoList = list.map((e) => ToDo.fromJson(e).toMap()).toList();
      });
    }
  }

  addTodo(ToDo obj) async {
    todoList.add(obj.toMap());
    await utils.save(utils.key, todoList);
    setState(() {
      fieldtext.clear();
    });
  }

  updateToDo(int id, bool isDone) {
    var index = todoList.indexWhere((element) => element['id'] == id);
    todoList[index]["isDone"] = isDone;
    utils.save(utils.key, todoList);
    setState(() {});
  }

  deleteToDo(int id) {
    todoList.removeWhere((element) => element['id'] == id);
    utils.save(utils.key, todoList);
    setState(() {});
  }

  @override
  void initState() {
    readTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 25.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ToDo App",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: fieldtext,
                onSubmitted: (value) {
                  print(value);
                  if (value != "") {
                    var lastId = 0;
                    if (todoList.isNotEmpty) {
                      lastId = todoList.last['id'];
                    }
                    ToDo obj = new ToDo(lastId + 1, value, false);
                    addTodo(obj);
                  }
                },
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Add a new todo",
                  contentPadding: EdgeInsets.all(5.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> todo = todoList[index];
                  return ToDoItem(
                    id: todo['id'],
                    text: todo['text'],
                    isDone: todo['isDone'],
                    updateCallBack: updateToDo,
                    deleteCallBack: deleteToDo,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
