class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignUpFormModel(
      {this.name,
      this.email,
      this.password,
      this.pin,
      this.profilePicture='',
      this.ktp=''});

//mengubah sign up form ke dalam bentuk json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  /*
  method untuk mengkopi data lama kemudian menambahkan data baru
  digunakan karena form name,email dan password diisi pada halaman terpisah
  dengan pin, foto profil dan ktp
  */

  SignUpFormModel copyWith(
          {String? pin, String? profilePicture, String? ktp}) =>
      SignUpFormModel(
          name: name,
          email: email,
          password: password,
          // fungsi simbol ?? adalah apabila pin bernilai null maka akan digunakan this.pin dan sebaliknya
          pin: pin ?? this.pin,
          profilePicture: profilePicture ?? this.profilePicture,
          ktp: ktp ?? this.ktp);
}
