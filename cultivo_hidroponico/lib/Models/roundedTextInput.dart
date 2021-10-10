import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextRoundedForm extends StatelessWidget {
/// Creates textRounded form
  final text;
  MaxLengthEnforcement doMaxLen = MaxLengthEnforcement.none;
  FormFieldValidator<String>? validator;
  var textController;
  var maxLen;

  /// Constructor for the class
  ///
  /// If max len is set to 0, then there is no maximum length of input characters.
  TextRoundedForm({@required this.text,
    @required this.textController, required Key key, int maxLen = 30, FormFieldValidator<String>? this.validator}) {
    if (maxLen == 0) {
      doMaxLen = MaxLengthEnforcement.none;
    } else {
      doMaxLen = MaxLengthEnforcement.enforced;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: SizedBox(
          width: SizeConfig.blockSizeVertical! * 27,
          child: TextFormField(
              maxLength: maxLen,
              maxLengthEnforcement: doMaxLen,
              autovalidateMode: AutovalidateMode.always,

              key: key,
              controller: textController,
              decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Color(0xFF808080)),
                  hintText: "${this.text}",
                  suffixIcon: IconButton(
                    onPressed: textController.clear,
                    icon: Icon(Icons.clear,
                        size: SizeConfig.blockSizeHorizontal! * 3),
                  ),
                  fillColor: Colors.white70),
              validator: validator)),
    );
  }
}