import 'dart:async';
import 'book.dart';

class BookBloc {

  List<Book> _booksList = [
    Book("001","Harry potter","John Doe",1),
    Book("002","possitive thinking","7amouda",2),
    Book("003","The art of not giving a F","ahmed el bodi",3)
  ];

  // sink : add data in stream
  // stream : the stream lel
  // source : the listner point ? i guess xD


  final _booksListStreamController = StreamController<List<Book>>(

  );

  final _rankUpBookStreamController = StreamController<List<Book>>(

  );

  final _rankDownBookStreamController = StreamController<List<Book>>(

  );


  // stream getters ?

  Stream<List<Book>> get booksListStream => _booksListStreamController.stream;

  StreamSink<List<Book>> get booksListSink => _booksListStreamController.sink;

  StreamSink<List<Book>> get rankUpBookSink => _rankUpBookStreamController.sink;

  StreamSink<List<Book>> get rankDownBookSink => _rankDownBookStreamController.sink;


  // methods
   
   _rankUp(Book book) {

    int rank = book.rank;
    int new_rank = rank++;

    final index = _booksList.indexWhere((item) => item.id == book.id );

    _booksList[index].rank = new_rank;

    booksListSink.add(_booksList);

   }

   _rankDown(Book book) {
     
    int rank = book.rank;
    int new_rank = rank--;

    final index = _booksList.indexWhere((item) => item.id == book.id );

    _booksList[index].rank = new_rank;

    booksListSink.add(_booksList);

   }

  // constructor
  BookBloc(){

    _booksListStreamController.add(_booksList);

 //   _rankUpBookStreamController.stream.listen(_rankUp);

 //   _rankDownBookStreamController.stream.listen(_rankDown);

  }


  void dispose() {
      _booksListStreamController.close();
      _rankUpBookStreamController.close();
      _rankDownBookStreamController.close();
  }
  
}