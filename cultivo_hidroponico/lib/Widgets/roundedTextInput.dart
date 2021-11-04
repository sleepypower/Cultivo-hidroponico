import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextRoundedForm extends StatefulWidget {
  /// Creates textRounded form
  final text;
  MaxLengthEnforcement doMaxLen = MaxLengthEnforcement.none;
  FormFieldValidator<String>? validator;
  var textController;

  /// Constructor for the class
  ///
  /// If max len is set to 0, then there is no maximum length of input characters.
  TextRoundedForm({required this.text,
    required this.textController,
    required Key key,
    int maxLen = 30,
    required FormFieldValidator<String>? this.validator}) {
    if (maxLen == 0) {
      doMaxLen = MaxLengthEnforcement.none;
    } else {
      doMaxLen = MaxLengthEnforcement.enforced;
    }
  }

  @override
  _TextRoundedFormState createState() => _TextRoundedFormState();
}

class _TextRoundedFormState extends State<TextRoundedForm> {
  var maxLen;

  IconButton _clearIcon = IconButton(icon: Icon(null), onPressed: () {},);

  void placeClearIcon(String text) {
    print(text);
    if (text == "") {
      _clearIcon = null as IconButton;
    } else {
      _clearIcon =  IconButton(
        onPressed: widget.textController.clear,
        icon: Icon(Icons.clear,
            size: SizeConfig.blockSizeHorizontal! * 3));
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
              maxLengthEnforcement: widget.doMaxLen,
              autovalidateMode: AutovalidateMode.disabled,
              controller: widget.textController,
              decoration: InputDecoration(
                  counterText: '',
                  hintText: "${this.widget.text}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Color(0xFF808080)),
                  //floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.white70,
                  suffixIcon: widget.textController.text != ""
                      ? IconButton(
                    onPressed: widget.textController.clear,
                    icon: Icon(Icons.clear,
                        size: SizeConfig.blockSizeHorizontal! * 3),
                  )
                      : null),
              validator: widget.validator,
            )));
  }
}

