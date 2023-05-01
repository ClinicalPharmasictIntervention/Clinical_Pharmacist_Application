part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class StartCallState extends AppState{}
class SendContradictionState extends AppState{}
class NavigationState extends AppState{}
class ShowDateDialogueState extends AppState{}
class EnableEditProfileState extends AppState{}
