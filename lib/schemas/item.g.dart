// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Item extends _Item with RealmEntity, RealmObject {
  Item(
    ObjectId id,
    String text,
    bool done,
  ) {
    RealmObject.set(this, '_id', id);
    RealmObject.set(this, 'text', text);
    RealmObject.set(this, 'done', done);
  }

  Item._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObject.set(this, '_id', value);

  @override
  String get text => RealmObject.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObject.set(this, 'text', value);

  @override
  bool get done => RealmObject.get<bool>(this, 'done') as bool;
  @override
  set done(bool value) => RealmObject.set(this, 'done', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObject.getChanges<Item>(this);

  @override
  Item freeze() => RealmObject.freezeObject<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Item._);
    return const SchemaObject(Item, 'Item', [
      SchemaProperty('_id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('done', RealmPropertyType.bool),
    ]);
  }
}
