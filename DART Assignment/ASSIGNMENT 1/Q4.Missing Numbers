/*
  Q4. Find the Missing Number
You are given a list of n-1 integers 
and these integers are in the range of 
1 to n. There are no duplicates in the 
list. One of the integers is missing in 
the list. Write an efficient code to 
find the missing integer.

Input: arr[] = {1, 2, 4, 6, 3, 7, 8}
Output: 5
Input: arr[] = {1, 2, 3, 5}
Output: 4

BY: RHEA SIDANA 
*/


import 'dart:io';

List<int> getListElements(){
  List<int> temp=new List();
  int ele;
  String ans;
  print("Enter the elements of the list: ");
  while(true){
    ele=int.parse(stdin.readLineSync());
    temp.add(ele);
    print("Do you want to enter more?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }
  return temp;
}

void printMissingElement(List<int> arr){
  int ele=0;
  for(int i=0;i<arr.length;i++){
    ele++;
    if(ele!=arr[i]){
      print(ele);
      break;
    }
  }
}

void main(){
  List<int> arr=new List();
  arr=getListElements();
  arr.sort();
  print("\nOutput:");
  printMissingElement(arr);
}
