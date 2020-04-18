void main(List<String> arguments) {
  print('Hello world!');

}


/* */
/*
 */
/**************************************************************************************/

/* COLLECTIONS */
/*
-List (array) - ordered collection
*fixed-length list
var numberList = List(5); // list of 5 elements
List<int> numberList = List(5); // initialized with null by default
numberList[idx] = val
*growable list
List<int> numberList = List();
numberList.add(10);
numberList.remove(10);
numberList.removeAt(2);
numberList.clear();

for(int element in numberList){}
numberList.forEach((element)=> print(element));

-Set - unordewred collection, with unique elements

Set<int> numbersSet = Set.from([1,2,3,4,6]);
Set<int> numbersSet = Set();
numberSet.add(10);
numberSet.remove(10);
numberSet.contains(32);
numberSet.isEmpty;
numberSet.length;
numberSet.clear();

-Map - key value collection
Map<String, int> fruits = Map();
fruits["apple"]=5;
fruits["banana"]=32;




*/
/**************************************************************************************/

/* FUNCTIONAL PROGRAMMING */
/* 
*Lambdas:
- anonymous functions

lambda_add = (int x, int y) => x+y;

*Higher-order functions:
- can accept function as parameter, or return function

void func(int x,Function myFunc){myFunc(x);}

Function func(){
  Function func2 = (int number) => number*4;
  return func2;
}

*Closures
- special funtion where u can modify values present in parent scope (even when called outside original scope)
 */


/**************************************************************************************/

/* OOP */

/* INHERITANCE


class ParentClass{
  String name;
  void func(){ print("Main class") }
}

class ChildClassFirst extends ParentClass{
  String other;
  void func(){ print("First Child class") }
  void func2(){}
}

class ChildClassSecond extends ParentClass{
  String another;
  void func(){
    super.func() 
    print("Second Child class") }
  void func3(){}
}

-inheritance types:
* single inheritance: Class B inheritance from Class A
* multi-level inheritance: Class C inheritance from Class B and Class B inheritance from Class A
* hierarchial inheritance: Class C and Class B inheritance from Class A

- Every class inheritance from Object class, which provides default implementation of:
* toString(), returns string representation of the object
* hashCode, Getter, returns the hash code of the object
* operator ==, compare two objects

-Constructors
*no parameters
class ParentClass{
  String name;
  ParentClass(){}
  void func(){ print("Main class") }
}
class ChildClass{
  String name;
  ChildClass() : super(){}
  void func(){ print("Child class") }
}

*parameters
class ParentClass{
  String name;
  ParentClass(String text){print(text);}
  void func(){ print("Main class") }
}
class ChildClass{
  String name;
  ChildClass(String text,String another_text) : super(another_text){print(text);}
  ChildClass.namedConstructor(String text,String another_text) : super(another_text){print(text);}
  void func(){ print("Child class") }
}

-Abstract classes
abstract class AbstrClass{
  void abstractFunc();
  void nonAbstractFunc(){}
}
class ClassName extends AbstrClass{
  void abstractFunc(){
    //code
  }
}

-Interface - there are no interfaces in dart
class FirstClass{
  void func1(){print("f1 from FirstClass");}
  void func2(){print("f2 from FirstClass");}
}

class AnotherClass{
  void func3(){print("f3 from AnotherClass");}
}

class SecondClass implements FirstClass,AnotherClass{
  void func1(){print("f1 from SecondClass");}
  void func2(){print("f2 from SecondClass");}
  void func3(){print("f3 from SecondClass");}
}

vat sc = SecondClass();
sc.func1(); // calls methods from SecondClass (overrides FirstClass)
sc.func2(); // calls methods from SecondClass (overrides FirstClass)
sc.func3(); // calls methods from SecondClass (overrides AnotherClass)

-STATIC
 Data shared between class instances, cannot be accesed by class object

 var obj = ClassName();

*WRONG:
obj.field;
*GOOD
ClassName.field;

 class ClassName{
   static int field = 10; // can be changed
   static const  int field = 10; // cannot be changed
 }
 
 *same with methods 
 -Doesn't allocate memory for items shared between class objects - for example Name of class will be allocated only once,
 -Static methods can only access static methods and static variables
*/
/***************************************/

/* Getters, Setters, private inst variables

class ClassName{

  /* Private instance variable */
  int _intVar;
  /* Custom Setter */
  void set setVar(int inp) => _intVar = inp;
  /* Custom Getter */
  int get getVar => _intVar;
  }

  var obj = ClassName();
  obj.setVar = 10;
  print(obj.getVar);
*/
/***************************************/

/* CLASSES 

class ClassName{
  /* Instance variables */
  int state1;
  int state2;

  /* constructors */
  *default
  ClassName(){
    //Default constructor
  }

  *parameterized
  ClassName(int state1, int state2){
    this.state1=state1;
    this.state2=state2;    
  }
  or
  ClassName(int _state1, int _state2){
    state1=_state1;
    state2=_state2;    
  }
  or
  ClassName(this.state1,this.state2);

  *named
  ClassName.myNamedConstructor(){}

  *constant

  /* methods */
  void fun1(){} 
  void fun2(){}
}

-create object:

var obj = new ClassName(); / var obj = ClassName(); / var obj = ClassName.myNamedConstructor()
obj.state1 / obj.fun1()
 */
/**************************************************************************************/

/* EXCEPTION HANDLING */
/*
-exception types: https://www.tutorialspoint.com/dart_programming/dart_programming_exceptions.htm
//KNOWN EXCEPTION
try{
  int res = 12~/0;
}
on IntegerDivisionByZeroException{
  print("Error")
}

//UNKNOWN EXCEPTION
try{
  int res = 12~/0;
}
catch (e){
  print("Exception is $e")
}

//STACK TRACE - to get knowledge about events occured before expection was thrown
try{
  int res = 12~/0;
}
catch (e,s){
  print("Exception is $e")
  print("Stack trace $s")
}

//Finally clause - always executed
try{
  int res = 12~/0;
}
catch (e){
  print("Exception is $e, $e.errorMessage()")
}
finally{
  print("Always executed.")
}

//Custom exception
class CustomException implements Exception{
  String errorMessage(){
    print("Custom error message");
  }

}

if(condition){
  throw new CustomException();
}

*/
/**************************************************************************************/

/* OPERATORS */
/*
-https://www.tutorialspoint.com/dart_programming/dart_programming_operators.htm
new ones:
~/ : Divide and return integer (same as pythonic //)
is / is! : true if object has/hasn't specific type
*/
/**************************************************************************************/

/* FUNCTIONS */
/*
-return type is optional but recomended,
-functions are objects (can be assinged and passed as parameter),
-if there is no return statement, function returns null (like None in python),

int f_add(int x,int y){
  return x+y;
}
int f_multiply(int x,int y){
  return x*y;
}
void print_res(Function func,int x,int y){
  print(func(x,y));
}

-function expressions:
  void print_sum(int x,int y) => print("The sum of input equals ${x+y}");
  int return_sum(int x,int y) => x+y;

-Parameters (required, and optional [positional, default, named])
*required
void func(int x, int y, int z){}
call: func(10,12,13)

*optional (default = null)
void func(int x, [int y, int z]){}
call: func(10), func(10,12,13)

*named - forces us to use name of param
void func(int x, {int y, int z}){}
call: func(10,y:5,z:12), func(10,z:12,y:5)

*default 
void func(int x, int y, {int z=13}){}
call: func(10,12), func(10,12,z:16)

*/
/**************************************************************************************/

/* LOOP CONTROL STATEMENTS */
/*

same structure as c++ loops:
-for (initializer;condition;step){}
-while(condition){}
-do{}
while(condition)

-for loop with a collection of data 
var collection = ["first","second","third"];
for (var str in collection){}

- Like in other languages BREAK stops the loop, CONTINUE "skips the code" for current iteration

- Labels- we can label loops, and then break/continue a loop we want:
outerLoop: for(var i = 0;i<3;i++){
  innerLoop: for(var j=0;j<3;j++){
    if(i==1 && j==1)
    {
      continue outerLoop; // if i==1 and j==1 skip inner loop and increase outerloop
    }
    if(i==2 && j==2)
    {
      break outerLoop; // if i==2 and j==2 stop outerLoop
    }
  }
}
*/
/**************************************************************************************/

/* CONDITIONAL EXPRESSIONS */
/*
// IFs
-cond ? exp1 : exp2 

- exp1 ?? exp2 
if exp1 is non-null, returns it, else evaluates and returns exp2
can be used to set default values
String str = input ?? "Default value";

//SWITCH
-accepts only String or int
-works like c++ switch
*/
/**************************************************************************************/

/* BUILT-IN DATA TYPES */
/*
* All data types are null objects by default
-Numbers:
  int,double,
-Strings,
-Booleans,
-Lists (arrays),
-Maps,
-Runes (expressing Unicode characters in String),
-Symbols

they can be defined directly or by 'var' keyword
  int int_type = 10;
  var int_type2 = 10;
  double double_type = 5.5;
  var double_type2=5.5;
  String string_type = "String";
  var string_type2 = "String";
  bool bool_type = true;
  var bool_type2=true;

We can assign hex and exp values to int/double
var hexVal = 0xEADEBAEE;
var exp =1.42e5;

Strings can be assigned same as in python with '' or ""

String interpolation - there is no need to use + or other format methods:
String str1 = 'text1';
String str2 = 'text2 with $str1';
String str3 = 'text3 with int ${str1.length}' 
int val1 = 5;
int val2 = 8;
String str4 = 'Sum of val1 ($val1) and val2 ($val2) is ${val1+val2}';

final / const are used to define values that will never change.abstract
-final variable can only be set once and it is initialized when accessed
-const variable is impicitly final, but it is a compile-time constant 
-instance variable can be final but cannont be constant (can be static constant tho)
there's no difference if we give a type or not:
final/const String str = "Text";
final/const str = "Text";
*/
/**************************************************************************************/

/* COMMENTS */
// single line comment
/* 
multi 
line 
comment 
*/
/**************************************************************************************/
