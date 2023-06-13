part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class StartCallState extends AppState {}

class SendContradictionState extends AppState {}

class NavigationState extends AppState {}

class ShowDateDialogueState extends AppState {}

class EnableEditProfileState extends AppState {}

class GetPharmacistLoadingState extends AppState {}

class GetPharmacistSuccessState extends AppState {}

class GetPharmacistErrorState extends AppState {}

class GetPhysiciansLoadingState extends AppState {}

class GetPhysiciansSuccessState extends AppState {}

class GetPhysiciansErrorState extends AppState {}

class SendNotificationSuccessState extends AppState {}

class SendNotificationErrorState extends AppState {}

class GetNotificationSuccessState extends AppState {}

class getDataState extends AppState{}
