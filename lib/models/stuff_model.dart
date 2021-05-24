class StuffModel {
  int id;
  String description;
  String contactName;
  String date;
  String photoPath;
  String phone;

  StuffModel({
    this.id,
    this.description,
    this.contactName,
    this.date,
    this.photoPath,
    this.phone,
  });


  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'description': description,
      'contactName': contactName,
      'date': date,
      'photoPath': photoPath,
      'phone': phone,
    };

    if (id != null) data['id'] = id;
    return data;
  }

  factory StuffModel.fromMap(Map<String, dynamic> json) {
    return StuffModel(
      id: json['id'],
      description: json['description'],
      contactName: json['contactName'],
      date: json['date'],
      photoPath: json['photoPath'],
      phone: json['phone'],
    );
  }
}
