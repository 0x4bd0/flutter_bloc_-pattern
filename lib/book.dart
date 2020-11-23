class Book {

String _id;
String _title;
String _author;

Book(this._id,this._title,this._author);

set id(String id){
  this._id = id;
}
set title(String _title){
  this._title = _title;
}
set author(String _author){
  this._author = _author;
}

String get id => this._id;
String get author => this._author;
String get title => this._title;

}