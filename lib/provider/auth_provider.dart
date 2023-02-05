import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sipinggang/databases/users_database.dart';
import 'package:sipinggang/model/user_data.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sipinggang/presentation/auth/verification_screen.dart';
import 'package:sipinggang/widgets/app_widget.dart';

enum AuthStatus {
  NOT_LOGGED_IN,
  LOGGED_IN,
}

// Provider untuk halaman auth
class AuthProvider with ChangeNotifier {
  final String? docId;

  // Pengisian docId contoh => AuthService(docId: 'value')
  AuthProvider({this.docId}) {
    checkingAuth();
  }

  // Pendekralasian/inisiasi object auth firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  // Pendekralasian/inisiasi object firebase firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Deklarasi variabel Varification Id untuk auth
  String? verificationId;

  // Deklarasi variabel country code untuk menyimpan code
  CountryCode _countryCode = CountryCode(dialCode: '+62');

  // getter untuk menampilkan countryCode
  CountryCode get countryCode => _countryCode;

  // Setter untuk mengubah countrycode
  set countryCode(CountryCode countryCode) {
    _countryCode = countryCode;
    notifyListeners();
  }

  // Dekralasi variable _formKey untuk validasi form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // getter variable _formKey
  GlobalKey<FormState> get formKey => _formKey;

  // setter variable _formKey
  set formKey(GlobalKey<FormState> value) {
    _formKey = value;
    notifyListeners();
  }

  // Deklarasi variabel _phoneNumberController, untuk Controller TextField
  TextEditingController _phoneNumberController = TextEditingController();

  // getter untuk menampilkan var _phoneNumberController
  TextEditingController get phoneNumberController => _phoneNumberController;

  // Setter untuk mengubah controller textfield _phoneNumberController
  set phoneNumberController(TextEditingController phoneNumberController) {
    _phoneNumberController = phoneNumberController;
    notifyListeners();
  }

  // Deklarasi variabel  _otpCodeController, untuk Controller TextField
  TextEditingController _otpCodeController = TextEditingController();

  // getter untuk menampilkan var _otpCodeController
  TextEditingController get otpCodeController => _otpCodeController;

  // Setter untuk mengubah controller textfield _otpCodeController
  set otpCodeController(TextEditingController otpCodeController) {
    _otpCodeController = otpCodeController;
    notifyListeners();
  }

  // Deklarasi variable class enum Auth Status
  late AuthStatus _authStatus;
  // getter untuk variable Auth Status
  AuthStatus get authStatus => _authStatus;

  // Setter untuk variable Auth Status
  set authStatus(AuthStatus newValue) {
    _authStatus = newValue;
    notifyListeners();
  }

  void checkingAuth() {
    if (auth.currentUser != null) {
      authStatus = AuthStatus.LOGGED_IN;
    } else {
      authStatus = AuthStatus.NOT_LOGGED_IN;
    }
  }

  // Fungsi stream get data user ke collection yang dijalankan oleh StremProvider
  Stream<UserData>? get user {
    // pengecekan user login auth
    if (auth.currentUser != null) {
      // Nilai dikembalikan untuk mengupdate data model user data
      return firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .snapshots()
          .map((userData) {
        return UserData.fromData(userData);
      });
    } else {
      // Nilai dikembalikan null jika user belum login auth
      return null;
    }
  }

  // Fungsi untuk verifikasi nomber hp agar mendapatkan OTP
  Future<void> verifyPhone(
    BuildContext context,
    String phoneToSend,
  ) async {
    // Pendekralasian variable smsOTPSent
    final PhoneCodeSent smsOTPSent = (String? verId, int? forceCodeResend) {
      this.verificationId = verId!;
    };
    try {
      // Fungsi bawaan auth_firebase untuk verifikasi nomor telpon
      await auth.verifyPhoneNumber(
          // Nomber yang ingin di verifikasi
          phoneNumber: phoneToSend,
          // CodeSent
          codeSent: smsOTPSent,
          // Waktu timeout fungsi
          timeout: Duration(seconds: 10),

          // Mengirim SMS dengan kode 6 digit ke nomor telepon yang ditentukan, atau memasukkan pengguna dan [verifikasiCompleted] dipanggil.
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
            if (this.verificationId != null) {
              notifyListeners();
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return VerificationScreen(
                      beUserPhone: phoneToSend,
                    );
                  },
                ),
              );
            } else {
              Navigator.of(context).pop();
              print(this.verificationId);
              notifyListeners();
            }
          },
          // Memulai proses verifikasi nomor telepon untuk nomor telepon yang diberikan.
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            if (this.verificationId != null) {
              notifyListeners();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return VerificationScreen(
                        beUserPhone: phoneToSend,
                      );
                    },
                  ),
                );
              });
            } else {
              Navigator.of(context).pop();
              notifyListeners();
            }
          },
          // Ketika verifikasi gagal
          verificationFailed: (FirebaseAuthException e) {
            Navigator.of(context).pop();
            if (e.code == 'invalid-phone-number') {
              debugPrint('Nomor yang dimasukan salah.');
              print(e);
              AppWidget.showSnackBar(
                context: context,
                content: Text('Nomor yang anda masukan salah.'),
                duration: Duration(seconds: 3),
              );
            } else if (e.code == 'too-many-requests') {
              debugPrint('Terlalu banyak request');
              AppWidget.showSnackBar(
                context: context,
                content: Text(
                  'Anda terlalu sering request OTP, tunggu beberapa saat lalu coba lagi.',
                ),
                duration: Duration(seconds: 3),
              );
            } else {
              debugPrint('Error Message : $e');
            }
          });
    } catch (e) {
      Navigator.of(context).pop();
      debugPrint('Error Message : $e');
    }
  }

  // Fungsi untuk verifikasi kode OTP
  Future<void> verifyOTP(BuildContext context, String phone, String otp) async {
    AppWidget.loadingPageIndicator(context: context);
    phoneNumberController.clear();
    otpCodeController.clear();
    AuthCredential credential;
    UserCredential authLogin;
    User? currentUser;
    try {
      // Dari verify id dan otp code di simpan dalam credential
      credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      // Lakukan login dengan credential lalu simpan ke dalam User Credential
      authLogin = await auth.signInWithCredential(
        credential,
      );

      // Simpan User Credential ke dalam model user auth untuk di gunakan
      currentUser = authLogin.user;

      if (currentUser != null) {
        UsersDatabase()
            .checkUserExist(phone: phone)
            .then((userPhoneChecked) async {
          // Cek user sudah ada atau belum
          if (userPhoneChecked) {
            // Jika user sudah ada update info login terakhir
            await UsersDatabase().updateUser(
              currentUser!.uid,
              {'lastLogin': Timestamp.now()},
            );
          } else {
            // buat user baru
            UserData newUserData = UserData(
              docUid: currentUser!.uid,
              username: '',
              phone: phone,
              email: '',
              fullName: '',
              gender: '',
              placeOfBirth: '',
              dateOfBirth: null,
              address: '',
              status: 'active',
              lastLogin: Timestamp.now(),
              createdAt: Timestamp.now(),
              updatedAt: Timestamp.now(),
            );
            await UsersDatabase().createUser(newUserData);
          }
        });
      }
    } catch (e) {
      debugPrint('Error Message : $e');
      if (e.toString().contains("firebase_auth/invalid-verification-code")) {
        AppWidget.showSnackBar(
          context: context,
          content: Text(
              'Kode OTP salah, silahkan coba kirim ulang kode dan coba lagi.'),
          duration: Duration(seconds: 3),
        );
      }
    }
    // Lakukan pengecekan untuk melanjutkan ke home jika user auth sudah terisi
    if (currentUser != null) {
      // Jika auth login telah terisi maka alihkan kembali ke halaman auth checker
      AppNavigation().onNavigateAuthChecker(context);
      // Navigator.of(context).pushReplacementNamed(AuthChecker.routeName);
    }
    // Jika user auth tidak terisi maka jangan lanjutkan ke home
    else {
      Navigator.of(context).pop();
      notifyListeners();
    }
  }

  // Fungsi untuk log out
  Future<String> logOut(BuildContext context) async {
    AppWidget.loadingPageIndicator(context: context);
    // Destroy isi model user auth (untuk menandakan bahwa user telah logout)
    await auth.signOut();
    // Navigasi ke halaman pengecekan
    AppNavigation().onNavigateAuthChecker(context);
    // Navigator.of(context).pushReplacementNamed(AuthChecker.routeName);
    notifyListeners();
    return 'logout';
  }

  // Untuk notis state kosong
  void notifyState() {
    notifyListeners();
  }
}
