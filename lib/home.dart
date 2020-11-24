import 'package:flutter/material.dart';
import 'package:flutter_bloc/book.dart';
import 'package:flutter_bloc/book_bloc.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final BookBloc _bookBloc = BookBloc();


  @override 
  void dispose(){
  _bookBloc.dispose();
  super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Books'),
       ),
       body : Container(
         child : StreamBuilder<List<Book>>(
           stream : _bookBloc.booksListStream,
           builder : (BuildContext context, AsyncSnapshot<List<Book>> snapshot){
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (context, index){
                  return     Card(
                    child: ListTile(
                      leading: Text("${snapshot.data[index].id},  Rank : ${snapshot.data[index].rank}"),
                      title: Text("${snapshot.data[index].title}"),
                      subtitle: Text("${snapshot.data[index].author}"),
                      trailing: Column(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            child: Icon(Icons.thumb_up, color: Colors.green,),
                            onPressed: () async {
                             _bookBloc.rankUpBookSink.add(snapshot.data[index]);
                            },
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            child: Icon(Icons.thumb_down, color: Colors.red,),
                            onPressed: () => {
                             _bookBloc.rankDownBookSink.add(snapshot.data[index]);
                            },
                          ),
                        )
                      ],
                    ),
                    ),
                  );
               },
             );
           }
         ),
       )
    );
  }
}