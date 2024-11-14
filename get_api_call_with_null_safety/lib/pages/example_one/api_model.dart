class ApiModel {
  int? userID;
  int? id;
  String? title;
  String? body;

  ApiModel({this.userID, this.id, this.title, this.body});

  ApiModel.fromJson(Map<String, dynamic> json) {
    userID = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userID;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
