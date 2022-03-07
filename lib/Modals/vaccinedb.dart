const String tableVaccineDB="VaccineDB";

class VaccineDBField{
  static final List<String > values=[
    vaccineDBID,vaccinename,isdone
  ];
  static const String vaccineDBID = '_vaccineDBID';
  static const String vaccinename ='vaccinename';
  static const String isdone='isdone';
  static const String istimegone='istimegone';
  static const String childID='childID';
}

class VaccineDB{
  final int? vaccineDBID;
  final String vaccinename;
  final bool isdone;
  final bool istimegone;
  final int childID;

  VaccineDB({this.vaccineDBID, 
  required this.vaccinename, 
  required this.isdone,
  required this.istimegone
  ,required this.childID
  });

VaccineDB copy({int? id,String? vaccinename,bool? isdone,bool? istimegone,int? childID})=>
VaccineDB(
vaccineDBID: id??this.vaccineDBID,
vaccinename: vaccinename??this.vaccinename,
isdone: isdone??this.isdone,
istimegone: istimegone??this.istimegone,
childID: childID??this.childID,


);
static VaccineDB fromJson (Map<String,Object?>json)=>VaccineDB(
  vaccineDBID: json[VaccineDBField.vaccineDBID] as int?,
  vaccinename: json[VaccineDBField.vaccinename] as String,
  isdone: json[VaccineDBField.isdone] ==1,
   istimegone: json[VaccineDBField.istimegone] ==1,
  childID: json[VaccineDBField.childID] as int
    
);



  Map<String,Object?> toJson()=>{
    VaccineDBField.vaccineDBID:vaccineDBID ,
    VaccineDBField.vaccinename: vaccinename,
    VaccineDBField.isdone: isdone?1:0,
      VaccineDBField.istimegone: istimegone?1:0,
    VaccineDBField.childID:childID

  };
  

}