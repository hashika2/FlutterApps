class SetName{

  int age;
  String name;
  String address;

    SetName(int age){
     this.age=age;
     print(age);
   }
   bool run()=>true;
   String work()=>"clean";

   SetName.intialize(){
     age=10;
     name="kamal";
   }
   
}

main(List<String>argument){
  String n=setName();
  print(getname("hashika", "maduranga"));

  var getName=new SetName();
  var ob2=new SetName.intialize();
  ob2.age=13;
  getName.name="hashika";
  //getName.setName(12);
  print(getName.run());
  print(getName.work());

  
}


String setName(){
  print("this is my new method");
  var name="hashika";
  return name;
}

String getname(String fname,String lname){
  var fulname="$fname $lname";
  return fulname;
}
