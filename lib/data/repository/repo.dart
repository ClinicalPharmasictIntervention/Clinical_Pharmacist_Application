import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/data/web_services/dio_helper.dart';

class RepositoryServices {
  RepositoryServices(this.dioHelper);
  final DioHelper dioHelper;
  Future<List<dynamic>> getPhysicians() async {
    final physicians = await dioHelper.getPhysicians(path: "v1/physician/");
    print("object repooooooooooooooooooooooooooooooooooooooooo");
    print(physicians["data"]);

    final List list = physicians["data"]
        .map((physician) => DoctorModel.fromJson(physician))
        .toList();

    return list;
  }
}

/*

  DoctorModel doc=   DoctorModel.fromJson(response.data["data"][0]);
   List<DoctorModel> docList=[];

   for(int i=0; i<response.data["data"].length; i++){
     doc=   DoctorModel.fromJson(response.data["data"][i]);
    docList.add(doc);
print(docList[i].department);

   }

   */