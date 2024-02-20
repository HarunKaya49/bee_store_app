import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriCubit extends Cubit<List<String>> {
  FavoriCubit(String userID) : super([]) {
    favoriDoc = FirebaseFirestore.instance.collection('users').doc(userID);

    favoriDoc.snapshots().listen((event) {
      List cartArray = event.data()?['favorite'] ?? [];
      emit([...cartArray]);
    });
  }

  late DocumentReference<Map<String, dynamic>> favoriDoc;

  void favoriyeUrunEkleCikar(String urunID) {
    favoriDoc.update({
      'favorite': state.contains(urunID)
          ? FieldValue.arrayRemove([urunID])
          : FieldValue.arrayUnion([urunID])
    });
  }
}
