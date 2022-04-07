
import 'package:flutter/material.dart';

class MaterialTextField extends StatelessWidget {
  final String lable;
  final Icon prefIcon;
  final bool readOnly;
  MaterialTextField({required this.lable,required this.controller,required this.readOnly,required this.prefIcon});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: lable,
          labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.black.withOpacity(0.3)),
          prefixIcon: prefIcon,
          filled: true,
          fillColor: Color(0xFFFFDD99).withOpacity(0.4),
          contentPadding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        ),
      ),
    );
  }
}
