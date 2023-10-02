import 'package:flutter/material.dart';
import 'package:yes_not_app/domain/entities/message.dart';
import 'package:yes_not_app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollControler = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola luffy', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToButtom();
  }

  // en está parte del codigo se toma el valor del mensage y se guarda en la variable
  //de new message para luego llamar a la lista de mensajes y agregarlo.
  Future<void> sentMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    //es lo mismo que el setState(){} pero avisa al provider y a todos los que lo escuchan
    notifyListeners();
    moveScrollToButtom();
  }

  void moveScrollToButtom() {
    chatScrollControler.animateTo(chatScrollControler.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
