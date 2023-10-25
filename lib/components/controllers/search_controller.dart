import 'package:flutter/material.dart';

class SearchingController extends ChangeNotifier{
  TextEditingController _randomSearch=TextEditingController();
  TextEditingController _search=TextEditingController();
  TextEditingController _breedController=TextEditingController();

  TextEditingController get breedController => _breedController;
  TextEditingController _subBreedController=TextEditingController();

  TextEditingController get search => _search;
  TextEditingController get randomSearch => _randomSearch;

  TextEditingController get subBreedController => _subBreedController;
}