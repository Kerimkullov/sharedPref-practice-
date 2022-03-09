import 'package:first_app/constants/news_colors.dart';
import 'package:first_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  bool isEmail = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        print(tabController.index);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: NewsColors.background,
        appBar: AppBar(
          bottom: TabBar(controller: tabController, tabs: const [
            Tab(
              text: 'First',
              icon: Icon(Icons.airplane_ticket),
            ),
            Tab(
              text: 'Second',
              icon: Icon(Icons.contact_mail),
            ),
            Tab(
              text: 'Third',
              icon: Icon(Icons.person),
            ),
          ]),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: TabBarView(controller: tabController,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Text('First'),
                    const Text('Second'),
                    Switch(
                        value: isEmail,
                        onChanged: (value) {
                          setState(() {
                            isEmail = value;
                            print(isEmail);
                          });
                        })
                  ]),
            )),
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   final loginController = TextEditingController();
//   final passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: NewsColors.background,
//       appBar: AppBar(
//         title: const Text('Вход'),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: loginController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Login'),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: passController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Password'),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () async {
//                   final pref = await SharedPreferences.getInstance();

//                   final username = pref.getString('username');
//                   final password = pref.getString('password');

//                   if (username == loginController.text &&
//                       password == passController.text) {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: Text(' Success')));

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MainScreen(),
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: Text('Fail')));
//                   }
//                 },
//                 child: const Text('Войти'),
//               ),
//               const SizedBox(height: 24),
//             ],
//           )),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   String username = '';
//   String password = '';

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   void getData() async {
//     final pref = await SharedPreferences.getInstance();

//     setState(() {
//       username = pref.getString('username') ?? '';
//       password = pref.getString('password') ?? '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text('Login $username')),
//           const SizedBox(height: 20),
//           Center(child: Text('Password $password')),
//           const SizedBox(height: 20),
//           TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LoginScreen(),
//                   ),
//                 );
//               },
//               child: Text('Login'))
//         ],
//       ),
//     );
//   }
// }
