/*
Q1.
✅Maintain 5 Customer Records 
and
✅Customer are access by Name.
✅Each Customer has Address , 
✅Address can be office, res

Amit —> Address
Office , res
✅Office address can be N But Unique =SET
✅Res Address can be N But Unique =SET

✅Customer also has Orders , 
✅Orders are N 
and 
✅Order are access BY Id, 
✅Order Contains Product, 
✅Product can be N, 
✅Product are sorted by Prices.
✅Product can be Duplicate.

Also Print Summary Report
Total Amount of Product.

BY:RHEA SIDANA
*/


import 'dart:io';

//products section begins
Map getProducts(){
  int id=0,qty;
  String name,ans;
  double price;
  //Product<id,List<name,price,qty>>
  Map<int,List<dynamic>> Product=new Map();
  
  while(true){
    List<dynamic> sub=new List();
    if(id==0) id=1;
    else id+=1;
    print("\nEnter the Product Name: ");
    name=stdin.readLineSync();
    sub.add(name);
    print("Enter the Product Price: ");
    price=double.parse(stdin.readLineSync());
    sub.add(price);
    print("Enter the Product Quantity :");
    qty=int.parse(stdin.readLineSync());
    sub.add(qty);
    Product[id]=sub;
    print("Do you want to enter more?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }
  Product=BubbleSort(Product);
  //Product.entries.forEach((e)=>print(e));
  return Product;
}

Map BubbleSort(Map price){
  List temp=new List();
  for(int i=0;i<(price.length);i++){
    for(int j=0;j<(price.length-1-i);j++){
      if(price[j+1][1]>price[j+1+1][1]){
        temp=price[j+1];
        price[j+1]=price[j+1+1];
        price[j+1+1]=temp;
      }
    }
  }
  return price;
}

void displayProducts(Map Products){
  int i=1;
  Products.forEach((k,v){
    if(v[2]!=0){
      print("$i.${v[0]}(${v[2]}): Rs.${v[1]}(each)");
      i++;
    }
  });
}
//products section ends


/*customers section begins*/
Map getCustomer(){
  String name,addr,ans;
  //Customer<Name,List<Address>>
  Map<String,List> Customer=new Map();
  
  while(true){
    List<Set<String>> Address=new List();
    Set<String> office=new Set();
    Set<String> res=new Set();
    print("\nEnter the Customer name");
    name=stdin.readLineSync();
    while(true){
      int type;
      print("Enter the address type");
      print("1.Office Address");
      print("2.Residential Address");
      type=int.parse(stdin.readLineSync());
      print("Enter the adrress");
      addr=stdin.readLineSync();
      switch(type){
        case 1: office.add(addr);
          break;
        case 2:res.add(addr);
          break;
        default: print("Invalid option!");
          break;
      }
      print("Do you want to enter more address?(y/n)");
      ans=stdin.readLineSync()[0];
      if(ans=='n' || ans=='N')break;
    }
    if(office.isEmpty)office={};
    if(res.isEmpty)res={};
    Address.add(office);
    Address.add(res);
    Customer[name]=Address;
    print("Do you want to enter more customers?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }
  //Customer.entries.forEach((e)=>print(e));
  return Customer;
}

// Customers section ends 


// orders section begins 
Map placeOrders(Map nameAddr,Map orders,Map products){
  //orderProducts<Customer<Name,Address>,OrderPlaced<orderId,List<ProductsId,Qty>>>
  //Map<Map<String,String>,Map<int,List>> orderProducts=new Map();
  String ans;
  int orderId,flag=0;
  List<List<int>> productList=new List();
  Map<int,List<List<int>>> order=new Map();
  while(true){
    int pno,qty,confirm;
    List<int> productQty=new List();
    
    //display products
    print("\nProducts are as follows:");
    displayProducts(products);
    
    print("\nEnter the products number: ");
    pno=int.parse(stdin.readLineSync());
    //get product id
    pno=getProductId(products,pno);
    print("Enter the quantity: ");
    qty=int.parse(stdin.readLineSync());
    
    //decrese qty of products
    confirm=confirmOrder(products,pno,qty);
    
    switch(confirm){
      case 1: print("\nProduct added");
        productQty.add(pno);
        productQty.add(qty);
        productList.add(productQty);
        break;
      case 2: print("\nProduct not added");
        break;
    }
    print("\nDo you want to enter more?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }
  orders.keys.forEach((e){
    if(e.containsKey(nameAddr.keys.elementAt(0)) && e.containsValue(nameAddr.values.elementAt(0))){
      order=orders[e];
      orderId=order.keys.elementAt(order.length-1)+1;
      flag=1;
    }
  });
  if(flag==0)orderId=1;
  order[orderId]=productList;
  
  orders[nameAddr]=order;
  //print(orders);
  return orders;
}

int getProductId(Map item,int pno){
  int no=0;
  for(int i=0;i<item.length;i++){
    if(item.values.elementAt(i)[2]!=0){
      no++;
      if(no==pno){
        return item.keys.elementAt(i);
      }
    }
  }
}

int confirmOrder(Map products,int id,int qty){
  if((products[id][2]-qty)<0)return 2;
  int price=products[id][2]-qty;
  products[id][2]=price;
  return 1;
}

void displayOrder(Map orderPlaced,Map nameAddr,Map products){
  //print(orderPlaced);
  //print(nameAddr);
  int flag=0;
  Map orders=new Map();
  Map orderno=new Map();
  orderPlaced.keys.forEach((e){
    if(e.containsKey(nameAddr.keys.elementAt(0)) && e.containsValue(nameAddr.values.elementAt(0))){
      orders=orderPlaced[e];
      orderno=e;
      flag=1;
    }
  });
  if(flag==0)
    print("No order placed");
  else{
    orders.forEach((k,v)=>print(k));
    print("Enter the order no.");
    int orderId=int.parse(stdin.readLineSync());
    Map temp=new Map();
    temp[orderno]=orderId;
    displayOrderSummary(orderPlaced,products,temp);
  }
}

void displayOrderSummary(Map order,Map products,Map nameOrder){
  Map orderPlaced=order[nameOrder.keys.elementAt(0)];
  List productList=orderPlaced[nameOrder.values.elementAt(0)];
  double totalBill=0;
  print("\nCustomer Name: ${nameOrder.keys.elementAt(0).keys.elementAt(0)}");
  print("Customer Address: ${nameOrder.keys.elementAt(0).values.elementAt(0)}");
  print("Order Number: ${nameOrder.values.elementAt(0)}");
  print("Product List");
  //print("Item       MRP     QTY     PRICE");
  productList.forEach((e){
    List item=products[e[0]];
    print("${item[0]} :   ${item[1]}(×${e[1]})  \n   Price:Rs.${item[1]*e[1]}");
    totalBill+=(item[1]*e[1]);
  });
  print("\nTotal Bill Payable : $totalBill");
}

String getCustomerAddress(Map Customer,String name){
  List custAddr= Customer[name];
  List temp=new List();
  int i=1;
  //String addr;
  print("Displaying the address of Customer");
  custAddr.forEach((e)=>e.forEach((el){
    print("$i.$el");
    temp.add(el);
    i++;
  }));
  print("Enter Address Number");
  i=int.parse(stdin.readLineSync());
  return temp[i-1];
}
// orders section ends 


void main(){
  //products section
  Map ProductDetails=new Map();
  print("Enter Product Details");
  ProductDetails=getProducts();
  //print("\nProducts Contains: ");
  //displayProducts(ProductDetails);
  
  //Map ProductDetails={1: ["socks", 222.0, 4], 2: ["shoes", 333.0, 3], 3: ["shirt", 444.0, 4], 4: ["trouser", 555.0, 5], 5: ["belt", 566.0, 5]};
  //print(ProductDetails);
  
  //customer section
  Map Customer=getCustomer();
  
  //Map Customer={"Rhea":[{"Delhi","Dehradun"},{"Delhi"}],"Sonu":[{"Bombay","Jaipur"},{"Delhi"}],"Paakhi":[{"Delhi","Amritsar"},{"Amritsar"}],"Promila":[{"Delhi"},{"Jaipur","Delhi"}],"Reema":[{"Delhi","Bombay"},{"Bombay","Jammu","Jaipur"}]};
  //print(Customer);
  
  //order section
  Map order=new Map();
  
  String ans;
  while(true){
    int orderChoice;
    String Name,Address;
    Map NameAddr=new Map();
    print("\nEnter your choice: ");
    print("1.Place Order ");
    print("2.View Order Summary");
    orderChoice=int.parse(stdin.readLineSync());
    print("Enter the username");
    Name=stdin.readLineSync();
    Address=getCustomerAddress(Customer,Name);
    NameAddr[Name]=Address;
    //print(NameAddr);
    switch(orderChoice){
      case 1: 
        //call placeOrders
        order=placeOrders(NameAddr,order,ProductDetails);
        break;
      case 2:
        //call displayOrder
        displayOrder(order,NameAddr,ProductDetails);
        break;
      default: print("Invalid option");
        break;
    }
    print(order);
    print("Do you want to enter more orders?(y/n)");
    ans=stdin.readLineSync()[0];
    if(ans=='n' || ans=='N')break;
  }
}




    



    
