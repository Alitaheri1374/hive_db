import 'package:flutter/material.dart';
import 'package:test_hive/model/person.dart';
import 'package:test_hive/util/services.dart';

class ShowDataWidget extends StatefulWidget {
  const ShowDataWidget({super.key});

  @override
  State<ShowDataWidget> createState() => _ShowDataWidgetState();
}

class _ShowDataWidgetState extends State<ShowDataWidget> {
  @override
  Widget build(BuildContext context) {
    return
      PersonServices.isEmpty()?
          Container():
      Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height*.07,
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width*.35,
                      child: const Text('name')),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width*.35,
                      child: const Text('age')),
                  SizedBox(
                      width: 100,
                      child: TextButton(
                          onPressed: deleteAll,
                          child: Text('DeleteAll',style: TextStyle(color: Theme.of(context).colorScheme.error),))),
                ],
              ),
            ),
            Divider(color: Theme.of(context).primaryColor,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: PersonServices.count(),
              itemBuilder: (context, index) {
                Person person=PersonServices.getItem(index);
                return InkWell(
                  onTap: (){},
                  child: Container(
                    height: MediaQuery.sizeOf(context).height*.07,
                    // color: index.isOdd?Colors.grey.withOpacity(.6):null,
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width*.35,
                            child: Text(person.name)),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width*.35,
                            child: Text(person.age.toString())),
                        SizedBox(
                            width: 70,
                            child: IconButton(onPressed: (){deletePerson(index);}, icon: Icon(Icons.delete,color: Theme.of(context).colorScheme.error,)))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  deletePerson(int index) {
    setState(() {
      PersonServices.deleteItem(index);
    });
  }
  deleteAll(){
      PersonServices.clear();
    setState(() { });
  }
}
