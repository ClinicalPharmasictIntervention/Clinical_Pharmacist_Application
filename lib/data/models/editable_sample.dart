class EditableSample{
  EditableSample(this.drugName);
  String? drugName;
}


class EditableDose extends EditableSample{
  EditableDose(this.name,this.physicianDoseNumber, this.clincPharmacistDoseNumber) : super(name);
  String? name;
  String physicianDoseNumber;
  String clincPharmacistDoseNumber;

}



class EditableDrug extends EditableSample{
  EditableDrug(this.physicianDrugName, this.clincPharmacistDrugName) : super(physicianDrugName);
  String physicianDrugName;
  String clincPharmacistDrugName;

}