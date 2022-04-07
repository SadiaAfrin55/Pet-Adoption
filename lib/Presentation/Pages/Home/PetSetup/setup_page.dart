
import 'package:flutter/material.dart';
class PetSetupPage extends StatefulWidget {
  const PetSetupPage({Key? key}) : super(key: key);

  @override
  _PetSetupPageState createState() => _PetSetupPageState();
}

class _PetSetupPageState extends State<PetSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('setup'),
        ),
      ),
    );
  }
}
