//UserStaff
class UserStaff {
  String staffname;
  UserStaff({
    this.staffname,
  });
  UserStaff.fromMap(Map<String, dynamic> map) {
    this.staffname = map['staffname'];
  }
  toJson() {
    return {
      'staffname': this.staffname,
    };
  }
}
