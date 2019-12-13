import 'dart:async';


import 'package:blocapp/counter_event.dart';

class CounterBloc{
  int _counter =0;

  final _counterStateController = StreamController<int>();
  StreamController<int> get _inCounter => _counterStateController.sink;
  // for state exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController =StreamController<CounterEvent>();
  //for events,exposing only a sink which is an input
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc(){
    // whenever there is a new event,we want to map it a new state
    _counterEventController.stream.listen(_mapEventToState);
      }
    
      void _mapEventToState(CounterEvent event) {
        if(event is IncrementEvent){
          _counter++;
          print(_counter);
        }
        else{
          _counter --;
          print(_counter);
        }
        _inCounter.add(_counter);
  }
  //it must do otherwise you are getting memory weeks
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}