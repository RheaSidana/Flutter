/*
Q5. Find the Anagram String
“silent”
“listen”
*/


import 'dart:io';
List<String> get2Strings(){
  List<String> str=new List();
  String value,ans;
  while(true){
  print("Enter String :");
  value=stdin.readLineSync();
  str.add(value);
  print("Do you want to enter more?(y/n)");
  ans=stdin.readLineSync()[0];
  if(ans=='n' || ans=='N')break;
  }
  return str;
}

String sortString(String ele){
  List<String> temp=new List();
  for(int i=0;i<ele.length;i++){
    temp.add(ele[i]);
  }
  temp.sort();
  ele="";
  for(int i=0;i<temp.length;i++){
    ele+=temp[i];
  }
  return ele;
}

int isAnagram(List<String> arr){
  int strLength=0;
  String str;
  strLength=arr[0].length;
  arr.forEach((ele){
    if(ele.length!=strLength)
      return 1;
  });
  for(int i=0;i<arr.length;i++){
    arr[i]=sortString(arr[i]);
  }
  str=arr[0];
  for(int i=0;i<arr.length;i++){
    if(arr[i]!=str){
      return 1;
    }
  }
  return 0;
}

void main(){
  int checkAnagram;
  List<String> anagram=new List();
  anagram=get2Strings();
  checkAnagram=isAnagram(anagram);
  if(checkAnagram==1){
    print("Not Anagram Strings");
  }
  else{
    print("Anagram Strings ");
  }
}

