import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:match_dating/chat/models/message.dart';
import 'package:match_dating/endpoints.dart';
import 'package:match_dating/mixins/global.dart';

class ChatServices extends GlobalMixin{


  Future<List<Message>> getChatMessages(String user_id) async{
    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.get(
        "${EndPoints.chatMessages}/$user_id",
      );

      List<Message> messages = Message.messageFromJson(jsonEncode(response.data["messages"]));
      print("success getting messages");

      return messages;
    }
    catch(e){
      print("error when getting messages");
      print(e);
      return [];
    }
  }

  Future<Message> sendNewMessage(dynamic send_message_data) async {
    print(send_message_data);
    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.post(
        EndPoints.sendMessage,
        data: send_message_data
      );

      Message message = Message(
          id: response.data["message"]["id"],
          text: response.data["message"]["text"],
          self: response.data["message"]["self"],
          sentTime: response.data["message"]["sent_time"],
          sentDate: response.data["message"]["sent_date"],
          readStatut: response.data["message"]["read_statut"],
          receiveStatut: response.data["message"]["receive_statut"],
          senderId: "my_id",
          receiverId: send_message_data["receiver_id"].toString());
      print("success getting messages");

      return message;
    }
    catch(e){
      print("error when getting messages");
      if(e is DioErrorType){
        print(e.name);
      }
      //print(e.toString());
      return Message(
          id: "null",
          text: send_message_data["message"].toString(),
          self: true,
          sentTime: "echec",
          sentDate: "echec",
          readStatut: false,
          receiveStatut: false,
          senderId: "my_id",
          receiverId: send_message_data["receiver_id"].toString());
    }
  }
}