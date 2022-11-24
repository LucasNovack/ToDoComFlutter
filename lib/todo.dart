import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Lista de tarefas")),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _textEditingController,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - 200),
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                      title: Center(child: Text(tarefas[index])),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider();
                  }),
                  itemCount: tarefas.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            setState(() {
              tarefas.add(_textEditingController.text);
            });
            _textEditingController.clear();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
