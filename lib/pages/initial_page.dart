import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final _lista = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Tarefas"),
        ),
        body: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_lista[index]),
              trailing: GestureDetector(
                child: const Icon(Icons.clear),
                onTap: () {
                  dev.log("clicou $index");
                  setState(() {
                    _lista.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        bottomSheet: Container(
          height: 50,
          color: Theme.of(context).primaryColor,
          child: ListTile(
            title: TextField(
              cursorColor: Colors.red,
              style: const TextStyle(color: Colors.white),
              controller: controller,
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _lista.add(controller.text);
                  });
                },
                icon: const Icon(Icons.add),
                color: Colors.white),
          ),
        ));
  }
}
