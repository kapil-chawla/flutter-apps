class ToDo {
  int _id;
  String _text;
  bool _isDone;
  ToDo(this._id, this._text, this._isDone);

  ToDo.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _text = json['text'],
        _isDone = json['isDone'];

  Map<String, dynamic> toMap() {
    return ({
      "id": _id,
      "text": _text,
      "isDone": _isDone,
    });
  }
}
