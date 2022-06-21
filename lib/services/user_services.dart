part of 'services.dart';

class UserServices {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');
  Future<void> setUser(UserModel userModel) async {
    try {
      _userReference.doc(userModel.id).set({
        'email': userModel.email,
        'name': userModel.name,
        'nis': userModel.nis,
        'kelas': userModel.kelas,
        'role': userModel.role,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        nis: snapshot['nis'],
        kelas: snapshot['kelas'],
        role: snapshot['role'],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
