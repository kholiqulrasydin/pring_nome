import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pringnome/services/stores/login_store.dart';
import 'package:pringnome/ui/wrapper.dart';

void main() => runApp(PringNome());


class PringNome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


