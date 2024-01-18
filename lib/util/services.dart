import 'package:test_hive/model/person.dart';
import 'package:test_hive/util/boxes_services.dart';

import 'package:hive_flutter/hive_flutter.dart';

class PersonServices{
  ///int
  static init()async{
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
    boxPersons=await Hive.openBox<Person>('personBox');
  }
  ///add or edit
  static void put({String? key,required String name,required int age}){
    // boxPersons.put(key, value);
    boxPersons.put(
        key??'key_$name',
        Person(name: name, age: age)
    );
  }
  ///get item
  static Person getItem(int index){
    return boxPersons.getAt(index);
  }
  ///delete item
  static void deleteItem(int index){
    boxPersons.deleteAt(index);
  }
  ///remove all data
  static void clear(){
    boxPersons.clear();
  }

  ///get count
  static int count(){
    return boxPersons.length;
  }
  ///check is Empty
  static bool isEmpty(){
    return boxPersons.isEmpty;
  }
}