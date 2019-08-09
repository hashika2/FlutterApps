main(List<String>argument){

  //basic things of dart language

  //declare variables
  var number=23;
  int age=12;
  String name1="hashika";
  num integer=12;
  print(integer);
   double number1=12.23;
   print(number);

   //boolean
   bool isTrue=true;
   bool isFalse=false;

   print(isFalse);

//   final school="school";  final and const variable
//   school="k";

  //operation
  int num1=10;
  int num2=20;
  print(num1%num2);

  //operations
  print(num1>num2);

  print("$number $integer old");
  print("$number is ${name1.toUpperCase()}");

//if else condition

  var bookName="wata addarre";

  if(bookName=="wata addarre")
    print(bookName);
  else
    print("incorrect");

  //define for lop

  for(int i=0;i<10;i++){
    print("number $i ");
  }
}