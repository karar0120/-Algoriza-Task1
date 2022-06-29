import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void NavigatorPushAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void NavigatorPush(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget MakeTextFormField ({
  required TextEditingController controller,
  required String labelText,
  required FormFieldValidator validator,
  ValueChanged? OnFieldSubmitted,
  ValueChanged? OnChanged,
  required IconData iconData,
  required TextInputType textInputType,
  bool ObscureText = false,
  IconData? Iconsuffix,
  VoidCallback? suffixPressed,
  VoidCallback? onTap,
}) =>
    TextFormField(
      cursorColor: Colors.indigo,
      controller: controller,
      decoration: InputDecoration(
        labelText:labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          iconData,
        ),
        suffixIcon: Iconsuffix != null
            ? IconButton(
          icon: Icon(Iconsuffix),
          onPressed: suffixPressed,
        )
            : null,
      ),
      keyboardType: textInputType,
      onFieldSubmitted: OnFieldSubmitted,
      onChanged: OnChanged,
      validator: validator,
      obscureText: ObscureText,
      onTap: onTap,
    );

Widget MakeDafultButton({
  double width = double.infinity,
  Color color = Colors.indigo,
  required VoidCallback onPressed ,
  bool isuppuer = true,
  double circularRadius = 0.0,
  required String text,
  Color textColor=Colors.white,
}) =>
    Container(
        height: 50,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circularRadius),
            color: color,
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              isuppuer ? text.toUpperCase() : text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ));

Widget MakeTextButton(
{
  required VoidCallback onPreseed,
  required String text,

})=>TextButton(
    onPressed:onPreseed,
    child:Text(text.toUpperCase(),style: TextStyle(),));


void Toasts({required String Msg,})=>Fluttertoast.showToast(
    msg:Msg,
    toastLength:Toast.LENGTH_LONG ,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.indigo,
    textColor: Colors.white,
    fontSize: 16.0
);