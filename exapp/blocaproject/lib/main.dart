import 'package:bloc/bloc.dart';
import 'package:blocaproject/counter_observer.dart';
import 'package:flutter/widgets.dart';
import 'App.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
