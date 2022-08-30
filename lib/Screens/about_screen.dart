import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';
import '../widget/app_bar_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.purple,
      appBar: const AppBarWidget(
        homeButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoogleFontText5(
                data: 'About PTMOSE',
              ),
              SizedBox(
                height: 10.h,
              ),
              Html(data: r"""<h1>THE BIRTH OF PTMOSE</h1> <h3>PAPERLESS TASTING MENU ORDER SHIP EVENT</h3> <p>The onset of covid-19 in January 2020 found the world at a time when touching objects outside of your home could be a hazard. Hugging, kissing, or hand shaking gave way to wearing masks, staying 6 feet apart, washing hands, and wearing gloves. I asked my manager about inventing a paperless app that was 100% green and 100% safe. His reply was that it was a great idea, and that no one offered anything like that now.</p></br>
 <p> On March 25th, 2020 (15 days after my 10 year anniversary of employment) the winery with whom I was employed terminated me as a result of the covid-19 pandemic. The rationale was that my age group was more susceptible to the virus. At the time, I was 65 years old. Commerce in California (and the world, for that matter), had slowed to a fraction of its previous levels, and a “shelter in place” state of emergency was in effect. PTMOSE was committed to paper from my head, then progressed from a patent application to a working application, working next toward the ultimate patent approval.</p></br>
 <h3>PTMOSE</h3> <p>A well-known factor in the wine business- after guests enjoy wine, garnering information is often done incorrectly, if it is done at all. This can kill the sale before it is placed. The customer’s information is vital, and correct legible information is priceless. Customers always have their mobile devices, facilitating access to that information, including history, visits, and purchases. PTMOSE has alleviated some of the cumbersome paper tasting menus, paper order forms, paper wine club applications, paper shipping information, tasting menus (which may change monthly) and all other documents a customer must contend with. This helps in our efforts to operate in a green environment and cutting needless trees in the process, using less toner, etc. My thoughts at this time? Paperless Tasting Menu Orders Ship Events, and thus PTMOSE was born. Customers will purchase PTMOSE on play store- only 1 registration per person per credit card. Once registered with PTMOSE, a member number is assigned. Registration is completed before the winery visit (must be 21 years of age). </p></br>
 <p>All information is securely encrypted. After arriving at the first winery, customers download the winery’s website. See PTMOSE, click on it, and your paperless experience begins on your mobile device. A list of hosts is provided, and selecting your host provides you with all your pertinent info, such as membership status, trade or industry, whether a retail customer or not, number of tastings, etc. This entire menu is at the customer’s disposal. After each wine is tasted, click yes/no, the number of bottles to purchase, and after each wine tasted, an opportunity to rate. To do a more detailed or in depth rating, each wine will require an upgraded membership. </p></br>
 <p>At the bottom of each tasting menu are additional buttons- each button offers the customer options for added purchases.</p> <ul>  <li><p>Large format bottles</p></li> <li><p>Library wines (i.e. 1970)</p></li> <li><p>Order/carry out</p></li> <li><p>Ship wines</p></li> <li><p>Event</p></li> </ul> <p>Each button you click will provide your information, letting customers and the host know if the winery may ship to them or not. E-Commerce Page/ Last page will show all pages containing transactions, subtotals, tip line, grand total, authorization (click), to be saved on the mobile device for 30 days. </p></br>""",
              style: {"h1": Style(color: Colors.white),
                "h3": Style(color: Colors.white),
                "p": Style(color: Colors.white),
                "li": Style(color: Colors.white)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
