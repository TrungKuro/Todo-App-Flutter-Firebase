import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class TodoDialog extends StatelessWidget {
  const TodoDialog({
    super.key,
    required this.todoTitleController,
  });
  /* ----------------------------------------------------------------------- */
  final TextEditingController todoTitleController;
  /* ----------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          const Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, //!
              icon: const Icon(
                Icons.cancel,
                color: Colors.black,
              )),
        ],
      ),
      children: [
        TextFormField(
          controller: todoTitleController, //!
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            hintText: 'eg. My Meeting',
            hintStyle: TextStyle(color: Colors.white),
          ),
          autofocus: true,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              if (todoTitleController.text.isEmpty) {}
            }, //!
            child: const Text('Add'),
          ),
        ),
      ],
    );
  }
}
