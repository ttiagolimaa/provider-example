import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/chage_notifier_page.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';
import 'package:provider_example/provider/provider_page.dart';
import 'package:provider_example/provider/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => UserModel(
              name: 'Mr. Bean',
              imgAvatar:
                  'https://1.bp.blogspot.com/-KLg5TEY1v6U/T6P9I6YPZwI/AAAAAAAABEc/iYpstw_ouMQ/s1600/Mr_bean.jpg',
              birthDate: '06/01/1955'),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (context) => ProviderPage(),
          '/change-notifier': (context) => ChageNotifierPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/provider');
                        },
                        child: Text('Provider')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/change-notifier');
                        },
                        child: Text('Change Notifier')),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
