class Todo {
  Todo({
    int? id,
    String? data,
    int? timestamp,
  }) {
    _id = id;
    _data = data;
    _timestamp = timestamp;
  }

  Todo.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['data'];
    _timestamp = json['timestamp'];
  }

  int? _id;
  String? _data;
  int? _timestamp;

  int? get id => _id;

  String? get data => _data;

  int? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['data'] = _data;
    map['timestamp'] = _timestamp;
    return map;
  }
}
