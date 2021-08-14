import 'dart:math';

import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar =
      'https://cdn.pichau.com.br/wysiwyg/Descricao/Pichau/PMU24-IPS-01/monitor-pichau24.png';
  String birthDate = 'Data';

  void alterarDados() {
    name = 'Mr. Bean';
    imgAvatar =
        'https://1.bp.blogspot.com/-KLg5TEY1v6U/T6P9I6YPZwI/AAAAAAAABEc/iYpstw_ouMQ/s1600/Mr_bean.jpg';
    birthDate = '09/01/1955';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Tiago lima ${Random().nextDouble()}';
    notifyListeners();
  }
}
