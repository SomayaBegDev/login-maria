//UserService
class UserService {
  String name;
  double fee;
  UserService({this.name, this.fee});
  UserService.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.fee = map['fee'];
  }
  toJson() {
    return {
      'name': this.name,
      'fee': this.fee,
    };
  }
}
