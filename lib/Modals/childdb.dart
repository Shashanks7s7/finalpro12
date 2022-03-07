const String tableChildDB="ChildDB";

class ChildDBField{
  static final List<String > values=[
    childDBID,name,dob
  ];
  static const String childDBID = '_childDBID';
  static const String name ='name';

  static const String dob='dob';
  
}

class ChildDB{
  final int? ChildDBID;
  final String name;
  final String dob;
 

  ChildDB({this.ChildDBID, 
  required this.name, 
  required this.dob
  
  });

ChildDB copy({int? id,String? name,String? dob,int? vaccineDBID})=>
ChildDB(
ChildDBID: id??this.ChildDBID,
name: name??this.name,
dob: dob??this.dob,



);
static ChildDB fromJson (Map<String,Object?>json)=>ChildDB(
  ChildDBID: json[ChildDBField.childDBID] as int?,
  name: json[ChildDBField.name] as String,
  dob: json[ChildDBField.dob] as String,

    
);



  Map<String,Object?> toJson()=>{
    ChildDBField.childDBID:ChildDBID ,
    ChildDBField.name: name,
    ChildDBField.dob: dob,
   
    

  };
  

}