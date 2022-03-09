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

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  final loginController = TextEditingController();
  final passController = TextEditingController();

  void setData(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('username', loginController.text);
    await pref.setString('password', passController.text);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsColors.background,
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: loginController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Login'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => setData(context),
                child: const Text('Зарегистроватсья'),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text('Уже есть аккаут?'),
              )
            ],
          )),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final loginController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsColors.background,
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: loginController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Login'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();

                  final username = pref.getString('username');
                  final password = pref.getString('password');

                  if (username == loginController.text &&
                      password == passController.text) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(' Success')));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Fail')));
                  }
                },
                child: const Text('Войти'),
              ),
              const SizedBox(height: 24),
            ],
          )),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String username = '';
  String password = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString('username') ?? '';
      password = pref.getString('password') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Login $username')),
          const SizedBox(height: 20),
          Center(child: Text('Password $password')),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
