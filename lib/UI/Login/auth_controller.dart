import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //AuthController._instance
  static AuthController instance = Get.find();
  //Model that will contain our User Email, Password, Name etc
  Rx<User> _user;
  //To access different Firebase propertise
  FirebaseAuth auth = FirebaseAuth.instance;

  //   void onReady() {
//     super.onReady();
//     _user = Rx<User>(auth.currentUser);
//     //Our user will be notified
//     _user.bindStream(auth.userChanges());
//     ever(_user, _initalScreen);
//   }

//   _initalScreen(User user) async {
//     if (user == null) {
//       print("Splash");
//       Get.to(() => WelcomePage());
//     } else {
//       Get.to(() => HomePage());
//     }
//   }

// //Sign-Up
//   void register(String email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       print("Registration Successful");
//     } catch (e) {
//       Get.snackbar("About user", "User Message",
//           backgroundColor: Colors.redAccent,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "Account Creation Failed",
//             style: TextStyle(color: Colors.white),
//           ),
//           messageText: Text(
//             e.toString(),
//             style: TextStyle(color: Colors.white),
//           ));
//     }
//   }

//   //Login
//   void login(String email, password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       print("Login Successful");
//     } catch (e) {
//       Get.snackbar("About Login", "Login Message",
//           backgroundColor: Colors.redAccent,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "Check Email-Id & Password",
//             style: TextStyle(color: Colors.white),
//           ),
//           messageText: Text(
//             e.toString(),
//             style: TextStyle(color: Colors.white),
//           ));
//     }
//   }

//   void logout() async {
//     await auth.signOut();
//   }
 Future<String> login(String email, String password) async {
    UserCredential result = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return user?.uid;
  }
  Future<void> signOut() async {
    return auth.signOut();
  }
}
