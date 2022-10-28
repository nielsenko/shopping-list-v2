import 'package:realm/realm.dart';
part 'item.g.dart';

@RealmModel()
@MapTo('Item')
class _Item {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String text;
  late bool done;
}
