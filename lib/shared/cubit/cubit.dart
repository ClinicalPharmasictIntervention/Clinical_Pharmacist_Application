import 'package:clinical_pharmacist_intervention/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
/*
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static get(context) => BlocProvider.of<AppCubit>(context);

  void launchDialer({required String number}) async {
    final Uri url = Uri.parse('tel:$number');

    emit(DialerLoadingState());
    if (await canLaunchUrl(url)) {
      emit(DialerSuccessState());
      await launchUrl(url);
    } else {
      emit(DialerErrorState());
      throw 'Error occurred trying to call that number.';
    }
  }
}
*/
