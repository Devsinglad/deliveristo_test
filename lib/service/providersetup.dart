import 'package:deliveristo_test/components/imports/imports.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => SearchingController()),
  ChangeNotifierProvider(create: (_) => FetchDogData()),

];