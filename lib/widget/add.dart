import 'package:flutter/material.dart';
import 'package:test_hive/util/services.dart';
class AddWidget extends StatefulWidget {
  final Function() afterAdd;
  const AddWidget({super.key,
    required this.afterAdd,
  });

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final TextEditingController nameTxtController=TextEditingController();
  final TextEditingController ageTxtController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width*.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameTxtController,
                  decoration: const InputDecoration(
                    label: Text('name')
                  ),
                ),
                TextField(
                  controller: ageTxtController,
                  decoration: const InputDecoration(
                    label: Text('age')
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(onPressed: addFunction, child: Text('add'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  addFunction(){
    PersonServices.put(
         name: nameTxtController.text, age: int.tryParse(ageTxtController.text)??0
    );
    widget.afterAdd();
  }
}
