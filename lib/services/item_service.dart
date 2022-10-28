import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/main.dart';
import '../schemas/item.dart';

class ItemService {
  //final Configuration _config = Configuration.local([Item.schema]);
  //final Configuration _config =
  //    Configuration([Item.schema], readOnly: false, inMemory: false);
  late Realm _realm;
  //Realm? _realm;
  //final _realm;

  /// You must await this future to ensure ItemService is ready to use
  /// before calling any of its methods.
  late final Future<void> init;
  ItemService() {
    init = openRealm();
  }

  /* Future<User> loginRealm(App app, String email, String password) async {
    var emailCred = Credentials.emailPassword(email, password);
    User currentUser = await app.logIn(emailCred);
    print(currentUser.id);
    return currentUser;
  }*/

  /*Future<User> getUser(App app) async {
    
    User currentUser = app.currentUser;
    return currentUser;
  }*/

  Future<void> openRealm() async {
    var emailCred =
        Credentials.emailPassword('leozeferino@gmail.com', '12345678');
    try {
      User currentUser = app.currentUser ?? await app.logIn(emailCred);

      _realm = Realm(
        Configuration.flexibleSync(
          currentUser,
          [Item.schema],
          syncErrorHandler: (SyncError error) {
            print("Error message ${error.message.toString()}");
          },
        ),
      );
      print('User: ${currentUser.id}');

      _realm.subscriptions.update((mutableSubscriptions) {
        mutableSubscriptions.add(
            //realm.query<Dog>(r'name == $0 AND age > $1', ['Clifford', 5]));
            _realm.all<Item>());
      });
    } on RealmException catch (error) {
      print("Error message " + error.message);
      return;
    }

    //_realm = Realm(_config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  RealmResults<Item> getItems() {
    return _realm.all<Item>();
  }

  bool addItem(String text) {
    try {
      _realm.write(() {
        _realm.add(Item(ObjectId(), text, false));
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleItemStatus(Item item) {
    try {
      _realm.write(() {
        item.done = !item.done;
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteItem(Item item) {
    try {
      _realm.write(() {
        _realm.delete(item);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
