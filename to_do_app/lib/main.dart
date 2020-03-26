import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TodoList(),
  ));
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List <String> todoItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAA0B1F27),
      appBar:AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: const Color(0xAA0B1F27),
        centerTitle: true,
        elevation: 0.0,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[600],
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('New Todo:'),
                  content: TextField(
                    autofocus: true,
                    onSubmitted: (item) {
                      setState(() {
                        todoItem.add(item);
                      });
                      Navigator.pop(context);
                    },

                  ),

                );
              }
          );
        },
      ),

      body: ListView.builder(
        itemCount: todoItem.length,
        itemBuilder: (context, index){
          return Card(
            color: const Color(0xAA0B1F27),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 6.0, 0.0, 6.0),
                  child: Text(
                    todoItem[index],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),

                  ),
                ),
                Spacer(flex:3),

                IconButton(
                  icon: Icon(Icons.check),
                  color: Colors.green[600],
                  onPressed: () {
                    setState(() {
                      todoItem.remove(todoItem[index]);
                    });
                  },
                ),


                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red[600],
                  onPressed: () {
                    setState(() {
                      todoItem.remove(todoItem[index]);
                    });
                  },
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
