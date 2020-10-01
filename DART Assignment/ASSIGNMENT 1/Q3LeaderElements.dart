/*
Q3.Find the Leader Element in an Array
Write a program to print all the 
LEADERS in the array. An element is 
leader if it is greater than all the 
elements to its right side. And the 
rightmost element is always a leader. 

For example int 
array{300,40,60,90,100,12,16,17,4,3,5,2}
leaders are 300,100,17, 5 and 2.
*/


import 'dart:io';
Set<int> getElements(){
  Set<int> Array=new Set();
  int item;
  String ans;
  do{
    print("Enter the element: ");
    item=int.parse(stdin.readLineSync());
    Array.add(item);
    print("Do you want to enter more?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }while(true);
  return Array;
}

List<int> getLeaders(Set<int> Array){
  int lead,prev;
  List<int> Leader=new List();
  lead=prev=Array.elementAt(Array.length-1);
  Leader.add(lead);
  for(int i=Array.length-1;i>0;i--){
    if(Array.elementAt(i)<Array.elementAt(i-1)){
      lead=Array.elementAt(i-1);
    }
    if(lead>prev){
      Leader.add(lead);
      prev=lead;
    }
  }
  return (Leader.reversed.toList());
}

void main(){
  List<int> Leaders=new List();
  Set<int> array=new Set();
  array=getElements();
  print("Array : $array");
  Leaders=getLeaders(array);
  print("Leaders : $Leaders");
}
