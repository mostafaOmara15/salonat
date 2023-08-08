import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    return await auth.signOut();
  }

  Future<void> setData(String collection, String document, Map<String, dynamic> data) async {
    return await fireStore.collection(collection).doc(document).set(data);
  }

  Future<Map<String, dynamic>?> getData(String collection, String document) async {
    DocumentSnapshot snapshot = await fireStore.collection(collection).doc(document).get();
    return snapshot.exists ? snapshot.data() as Map<String, dynamic> : null;
  }

  Future<List<QueryDocumentSnapshot>> getAllData(String collection) async {
    final querySnapshot = await fireStore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future<void> updateData(String collection, String? updateKey, Map<String, dynamic> data) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .where('nationalId', isEqualTo: updateKey)
        .get();
    querySnapshot.docs.forEach((doc) async {
      return await FirebaseFirestore.instance.collection('patients').doc(doc.id).update(data);
    });
  }

  Future<String?> uploadImage(File? imageFile) async {
    if (imageFile == null) {
      return null;
    }
    // create a reference to the Firebase Storage location where the image will be stored
    final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');

    // upload the image to Firebase Storage
    final uploadTask = storageRef.putFile(imageFile);
    final snapshot = await uploadTask.whenComplete(() {});

    // retrieve the download URL for the uploaded image
    final downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
