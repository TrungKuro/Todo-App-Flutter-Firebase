import 'package:flutter/material.dart';
import 'package:todo_app_firebase/todo_dialog.dart';

/* ------------------------------------------------------------------------- */

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

/* ------------------------------------------------------------------------- */

class _TodoListState extends State<TodoList> {
  TextEditingController todoTitleController = TextEditingController();
  /* ----------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoDialog(todoTitleController: todoTitleController),
          );
        }, //!
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My To Do',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.white),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Dismissible(
                        key: Key(index.toString()),
                        background: Container(
                          alignment: Alignment.center,
                          color: Colors.red[300],
                          child: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ListTile(
                            onTap: () {}, //!
                            leading: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.rectangle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            title: const Text(
                              'Todo Items',
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
