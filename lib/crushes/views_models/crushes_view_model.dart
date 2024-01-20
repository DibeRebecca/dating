import 'package:flutter/material.dart';
import 'package:match_dating/crushes/repo/crushes_services.dart';
import 'package:match_dating/home/models/users.dart';

class CrushesViewModel extends ChangeNotifier{

  late List<Users> _my_crushes = [];

  List<Users> get my_crushes => _my_crushes;
  CrushesService crushesService = new CrushesService();

  Future<dynamic> getMyCrushes() async {
    final response = await this.crushesService.getMyCrushes();
    _my_crushes = response;
    notifyListeners();
  }
}