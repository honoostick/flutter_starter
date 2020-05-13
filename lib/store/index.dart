import 'package:provider/provider.dart';
import 'example.dart';
import 'user.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<ExampleModel>(
    create: (_) => ExampleModel(0),
  ),
  ChangeNotifierProvider<UserModel>(
    create: (_) => UserModel(),
  )
];
