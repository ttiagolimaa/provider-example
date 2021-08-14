import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';

class ChageNotifierPage extends StatefulWidget {
  ChageNotifierPage({Key? key}) : super(key: key);

  @override
  _ChageNotifierPageState createState() => _ChageNotifierPageState();
}

class _ChageNotifierPageState extends State<ChageNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 2));
      print('antes_______________________');
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build ______________________');

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (context, imgAvatar, child) {
                  print('Imagem----------');
                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(imgAvatar),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (context, value, child) {
                      print('nome---------');
                      return Text(value);
                    },
                  ),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (context, birthDate, child) {
                      print('Data---------');
                      return Text('(${birthDate})');
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: context.read<ProviderController>().alterarNome,
                  child: Text('alterar nome'))
            ],
          ),
        ),
      ),
    );
  }
}
