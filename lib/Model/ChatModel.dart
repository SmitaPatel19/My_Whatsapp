
class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentmsg;
  String? status;
  bool? select = false;
  int? id;

  ChatModel(
   { this.name,
     this.icon,
     this.isGroup,
     this.time,
     this.currentmsg,
     this.status,
     this.select,
     this.id,
   });
}