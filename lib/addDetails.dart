import 'package:flutter/material.dart';


class MyaddDetailsPage extends StatefulWidget {
  const MyaddDetailsPage({Key? key}) : super(key: key);

  @override
  State<MyaddDetailsPage> createState() => _MyaddDetailsState();
}

class _MyaddDetailsState extends State<MyaddDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String strr1 = "";
  String strr2 = "";
  int agee = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Details"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
                controller: _breedController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Breed',
                ),
                keyboardType: TextInputType.name),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                strr1 = _nameController.text;
                strr2 = _breedController.text;
                agee = int.tryParse(_ageController.text)!;

                List data1 = [strr1,strr2,agee];
               
                Navigator.pop(context,strr1);
              },
              child: const Text('Add Pett'),
            ),
          ],
        ),
      ),
    );
  }
}