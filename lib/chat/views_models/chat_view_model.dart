import 'package:flutter/material.dart';
import 'package:match_dating/chat/models/message.dart';
import 'package:match_dating/chat/repo/chat_services.dart';
import 'package:match_dating/home/models/users.dart';

class ChatViewModel extends ChangeNotifier{
  late Users _selected_user;
  ChatServices chatServices = new ChatServices();
  late List<Message> _chat_messages = [];
  bool _loading = false;
  bool _isEmojiBoardVisible = false;

  bool get loading => _loading;
  bool get isEmojiBoardVisible => _isEmojiBoardVisible;
  Users get selected_users => _selected_user;
  List<Message> get chat_messages => _chat_messages;

  void setEmojiBoardVisibility(bool value){
    _isEmojiBoardVisible = value;
    notifyListeners();
  }

  void setCurrentUser(Users user){
    _selected_user = user;
    notifyListeners();
  }

  void resetChatMessagesToEmpty(){
    _chat_messages = [];
    notifyListeners();
  }

  void setLoadingChat(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<dynamic> getChatMessage() async {
    _chat_messages = [];
    //setLoadingChat(true);
    final response = await this.chatServices.getChatMessages(_selected_user.id);
    _chat_messages = response;
    notifyListeners();
    //setLoadingChat(false);
  }

  Future<dynamic> sendNewMessage(String message) async {
    var send_message_data = {
      "message": message,
      "receiver_id": this._selected_user.id
    };

    final response = await this.chatServices.sendNewMessage(send_message_data);
    if(response is Message){
      _chat_messages.add(response);
      notifyListeners();
    }
    else{

    }
  }
}