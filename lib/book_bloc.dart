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

  final _rankUpBookStreamController = StreamController<Book>(
    

  );

  final _rankDownBookStreamController = StreamController<Book>(

  );


  // stream getters ?

  Stream<List<Book>> get booksListStream => _booksListStreamController.stream;

  StreamSink<List<Book>> get booksListSink => _booksListStreamController.sink;

  StreamSink<Book> get rankUpBookSink => _rankUpBookStreamController.sink;

  StreamSink<Book> get rankDownBookSink => _rankDownBookStreamController.sink;


  // methods
   
   _rankUp(Book book) {



    int rank = book.rank;

    final index = _booksList.indexWhere((item) => item.id == book.id );

    _booksList[index].rank = _booksList[index].rank+1;

    booksListSink.add(_booksList.sort((a,b) => a.rank > b.rank));

   }

   _rankDown(Book book) {     


    final index = _booksList.indexWhere((item) => item.id == book.id );

    _booksList[index].rank = _booksList[index].rank-1;

    booksListSink.add(_booksList);

   }

  // constructor
  BookBloc(){

    _booksListStreamController.add(_booksList);

    _rankUpBookStreamController.stream.listen(_rankUp);

    _rankDownBookStreamController.stream.listen(_rankDown);

  }


  void dispose() {
      _booksListStreamController.close();
      _rankUpBookStreamController.close();
      _rankDownBookStreamController.close();
  }
  
}