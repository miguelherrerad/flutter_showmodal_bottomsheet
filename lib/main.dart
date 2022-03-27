import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Sheet'),
        ),
        body: const ShowSheet(),
      ),
    );
  }
}

class ShowSheet extends StatelessWidget {
  const ShowSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.android_outlined,
            size: 40.0,
            color: Colors.green,
          ),
          title: const Text('Más información'),
          subtitle: const Text('Tap para ver más...'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            _mySheet(context);
          },
        )
      ],
    );
  }

  _mySheet(BuildContext context) {
    List myList = List.generate(50, (i) => i);

    showModalBottomSheet(
        backgroundColor: Colors.blue,
        isDismissible: false, // Para bloquear el tap fuera
        isScrollControlled: true, // Colocar el tamaño
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 500.0,
            child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(myList[i].toString()),
              ),
            ),
          );
        });
  }
}
