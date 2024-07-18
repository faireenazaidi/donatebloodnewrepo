
import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Routes/app_routes.dart';
import '../Widgets/listItem.dart';
import 'dashboardController.dart';
import 'package:flutter/material.dart' as flutter;


class DashboardView extends GetView<DashboardController>{
  final DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: AppColor.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logoHeader2.png"),
              const SizedBox(width: 5,),
              Image.asset("assets/logoHeader.png"),
            ],
          ),
          actions:[
             Padding(
              padding: EdgeInsets.all(9.0),
              child: CircleAvatar(

              ),
            ),],
          leading: Builder(
            builder: (context)=>IconButton(
                onPressed: ()=>Scaffold.of(context).openDrawer(), icon: const Icon(Icons.menu,color: Colors.white,)),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColor.tile6Color,
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home_work_outlined,color: Colors.white,),
                title: const flutter.Text('Dashboard',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),
                tileColor: AppColor.tile1Color,
                onTap: () {

                },
              ),
                  ListTile(
                    leading: const Icon(Icons.person,color: Colors.white,),
                  title: const flutter.Text('View Profile',style: TextStyle(color: Colors.white,),),
                  tileColor:AppColor.tile2Color,
                  onTap: () {
                      Get.toNamed(AppRoutes.profileView);

                  },
                ),

              ListTile(
                leading: const Icon(Icons.menu,color: Colors.white,),
                title: const flutter.Text('Donate',style: TextStyle(color: Colors.white,),),
                tileColor: AppColor.tile3Color,
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Icons.report_gmailerrorred,color: Colors.white,),
                title: const flutter.Text('Report',style: TextStyle(color: Colors.white,),),
                tileColor: AppColor.tile4Color,
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Icons.security_outlined,color: Colors.white,),
                title: const flutter.Text('Change Password',style: TextStyle(color: Colors.white,),),
                tileColor: AppColor.tile5Color,
                onTap: () {
              Get.toNamed(AppRoutes.changePassRoute);

                },
              ),
              ListTile(
                  leading: const Icon(Icons.logout,color: Colors.white,),
                  title: const flutter.Text('Logout',style: TextStyle(color: Colors.white,),),
                tileColor:AppColor.tile6Color,
                onTap:(){}
              ),
            ],

          ),

        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20.0),
                child: const TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Search for categories..",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0)
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              // Adjust the height as needed
              child: flutter.ListView(
                scrollDirection: flutter.Axis.horizontal,
                children: <flutter.Widget>[
                  Container(
                      child: const ListItemWidget(icon:Icons.accessibility_outlined, label:'All Needs')),
                  const ListItemWidget(icon:Icons.category_outlined, label: 'Categories'),
                  const ListItemWidget(icon:Icons.monetization_on_outlined, label: 'Donate'),
                ],
              ),
            ),
            SizedBox(
              height: 200,width: Get.width,
              child: PageView.builder(
                // pageSnapping: true,
                itemCount: controller.imageUrls.length,
                controller: controller.pageController,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(controller.imageUrls[index],fit: BoxFit.fill,)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count:  4,
                    axisDirection: Axis.horizontal,
                    effect:  const SlideEffect(
                        spacing:  8.0,
                        radius:  4.0,
                        dotWidth:  5.0,
                        dotHeight:  5.0,
                        paintStyle:  PaintingStyle.fill,
                        strokeWidth:  1.5,
                        dotColor:  Colors.grey,
                        activeDotColor:  Colors.black
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const flutter.Text("Explore by Categories",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                  TextButton(onPressed: (){},
                      child: flutter.Text('View All',style: TextStyle(color: AppColor.buttonColor),))
                ],
              ),

            ),
          ],
        ),
             Expanded(
               child: ListView.builder(

                   itemCount: 4,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: const Offset(0, 3),
                             ),
                           ],
                         ),
                         child: ListTile(
                           leading: Image.asset(dashboardController.category[index]['image'].toString()),
                           title: flutter.Text(dashboardController.category[index]['name'].toString()),
                           trailing: Container(
                             height: 35,
                             decoration: BoxDecoration(
                               color: Colors.grey[200],
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Icon(Icons.person_outline_outlined,color: AppColor.buttonColor,),
                                 const SizedBox(width: 4),
                                 Text(dashboardController.category[index]['member'].toString(),style: TextStyle(color: AppColor.buttonColor),),
                                 const SizedBox(
                                   width: 4,
                                 ),
                                 Text("People",style: TextStyle(color: AppColor.buttonColor),),
                                 Icon(Icons.arrow_forward_ios,size: 15,color: AppColor.buttonColor,),

                               ],
                             ),
                           ),
                           onTap: () {
                             Get.toNamed(AppRoutes.categoryRoute);
                             // Add your onTap code here!
                           },
                         ),
                       ),
                     );
                   }
               ),
             ),
              const SizedBox(height: 20,)
            ]
        ),
          );


  }


}
