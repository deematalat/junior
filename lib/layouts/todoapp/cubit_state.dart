part of 'cubit_cubit.dart';

@immutable
abstract class AppState {}

class Initial extends AppState {}
class BottomNAFState extends  AppState{}
class AppCreatedb extends AppState{}
class AppOpendb extends AppState{}
class AppInseartdb extends AppState{}
class AppDeletedb extends AppState{}
class AppUpdatedb extends AppState{}
class Getdb extends AppState{}
class BottomSheetState extends  AppState{}