class LoginDataModal {
  int? id;
  int? categoryId;
  String? firstName;
  String? lastName;
  String? name;
  String? emailId;
  String? mobileNo;
  String? address;
  int? personalID;
  String? category;
  String? password;

  LoginDataModal(
      {this.id,
        this.categoryId,
        this.firstName,
        this.lastName,
        this.name,
        this.emailId,
        this.mobileNo,
        this.address,
        this.personalID,
        this.category,
        this.password});

  LoginDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    name = json['name'];
    emailId = json['emailId'];
    mobileNo = json['mobileNo'];
    address = json['address'];
    personalID = json['personalID'];
    category = json['category'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['name'] = this.name;
    data['emailId'] = this.emailId;
    data['mobileNo'] = this.mobileNo;
    data['address'] = this.address;
    data['personalID'] = this.personalID;
    data['category'] = this.category;
    data['password'] = this.password;
    return data;
  }
}
