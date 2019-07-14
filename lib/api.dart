import 'package:net_objex_test/register_screen.dart';

class api {
  // all users of current system.
  static List<Users> users = new List<Users>();

// Add a user to current list.s
  bool add(Users user) {
    try {
      // validate user class props.
      if (user.name.length < 3) {
        return false;
      }

      // insert user
      users.add(user);
      return true;
    } catch (err) {
      return false;
    }
  }

// to get all users of current system.
  List<Users> getUsers() {
    return users;
  }

  bool validateUser(Users user) {
    try {
      if (users.length > 0) {
        Users _user = users
            .where((u) => u.email == user.email && u.password == user.password)
            .first;
        if (_user != null)
          return true;
        else
          return false;
      }
      return false;
    } catch (err) {
      return false;
    }
  }
}
