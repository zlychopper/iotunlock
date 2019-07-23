class UserEntity {
  String account;
  String name;
  String phone;
  String password;
  String icon;
  int id;

  UserEntity.fromJson(Map<String, dynamic> json)
      : account = json['account'],
        name = json['name'],
        phone = json['phone'],
        id = json['id'],
        icon = json['icon'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'account': account,
        'name': name,
        'phone': phone,
        'password': password,
        'icon': icon,
        'id': id,
      };

  @override
  bool operator ==(other) {
    if (other.runtimeType != runtimeType) return false;
    final UserEntity typedOther = other;
    return account == typedOther.account;
  }

  @override
  int get hashCode {
    return account.hashCode;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"account\":\"$account\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"id\":$id");
    sb.write(",\"name\":\"$name\"");
    sb.write(",\"password\":\"$password\"");
    sb.write('}');
    return sb.toString();
  }
}

class GroupEntity {
  String name;
  List<int> users;

  GroupEntity.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        users = List<int>.from(json['users']);
  Map<String, dynamic> toJson() => {
        'name': name,
        'users': users,
      };
}

class UserDetailEntity {
  UserEntity user;
  List<UserEntity> contacts;
  List<GroupEntity> groups;

  UserDetailEntity(this.user, {this.contacts, this.groups});
  factory UserDetailEntity.fromJson(Map<String, dynamic> json) {
    UserEntity u = UserEntity.fromJson(json['user']);
    List list = json["contacts"] as List;
    List<UserEntity> contacts =
        list.map((item) => UserEntity.fromJson(item)).toList();
    var groupList = json['groups'] as List;
    List<GroupEntity> groups =
        groupList.map((item) => GroupEntity.fromJson(item)).toList();
    return UserDetailEntity(u, contacts: contacts, groups: groups);
  }

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'contacts': contacts,
        'groups': groups,
      };
}

class DeviceEntity {
  String name;
  String icon;
  bool open;

  DeviceEntity.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        icon = json["icon"],
        open = json["open"];
  Map<String, dynamic> toJson() => {
        'name': name,
        'icon': icon,
        'open': open,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"name\":\"$name\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"open\":$open");
    sb.write('}');
    return sb.toString();
  }
}
