import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsuarios = db.collection('users');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    users.add(documento.data());
  });

  return users;
}

Future<void> dowloadURLExample() async {
  final storageRef = FirebaseStorage.instance.ref();
  final imageUrl = await storageRef.child("Imagenes/A.jpg").getDownloadURL();
}
