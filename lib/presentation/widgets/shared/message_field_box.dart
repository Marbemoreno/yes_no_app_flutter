import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {


    final textController = TextEditingController(); //  para controlar el texto del campo de texto y luego poder borrarlo

    final focusNode = FocusNode(); //  para controlar el foco del campo de texto 

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,

      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.text;
          textController.clear();
          onValue(textValue); // emitir el valor del campo de texto
        },
        icon: const Icon(Icons.send_outlined),
      ),
      hintText: 'Escribe tu mensaje aquí',
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
        //  si el usuario hace click fuera del campo de texto, se quita el focus 
      },
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        
        textController.clear();
        focusNode.requestFocus();
        onValue(value); // emitir el valor del campo de texto
      },
    );
  }
}
