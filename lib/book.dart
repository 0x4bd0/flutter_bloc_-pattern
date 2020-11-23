class Book {

String _id;
String _title;
String _author;
int _rank;

Book(this._id,this._title,this._author,this._rank);

set id(String id){
  this._id = id;
}
set title(String title){
  this._title = title;
}
set author(String author){
  this._author = author;
}
set rank(int rank){
  this._rank = rank;
}

String get id => this._id;
String get author => this._author;
String get title => this._title;
int get rank => this._rank;

}