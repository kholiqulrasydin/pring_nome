import 'package:flutter/material.dart';
import 'package:pringnome/ui/components/theme.dart';
import 'package:pringnome/ui/pages/home/appointmentcard.dart';
import 'package:pringnome/ui/pages/home/chartpainter.dart';
import 'package:pringnome/ui/pages/home/components/accountcard.dart';
import 'package:pringnome/ui/pages/home/components/currentdata.dart';

Color primaryColor = Color(0xff0074ff);

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Dashboard'),
      backgroundColor: primaryColor,
      elevation: 0,
      actions: <Widget>[
        Icon(Icons.notifications),
        Container(
          width: 50,
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00ff1d),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Monthly",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter: ChartPainter(),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: _buildChartLegend(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
//            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        Text(
                          "Appointments",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildCard(
                          context,
                          child: Row(
                            children: <Widget>[
                              _buildItem("Today", "18 Customers", MyColors.primaryColor),
                              _buildDivider(),
                              _buildItem("Canceled", "7 Customers", Color(0xffff1759)),
                            ],
                          ),
                        ),
                        _buildCard(
                          context,
                          child: Row(
                            children: <Widget>[
                              _buildItem("Sent", "5 Customers", Colors.amber),
                              _buildDivider(),
                              _buildItem("Arrived", "6 Customers", Colors.green),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Product Dispatched",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            _buildCard(
                              context,
                              child: AccountCard(
                                name: 'Louisa Patel',
                                id: 'JD1234L',
                                productTotal: 'Rp. 24000',
                                active: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildCard(
                              context,
                              child: AccountCard(
                                name: 'Louisa Patel',
                                id: 'JD1234L',
                                productTotal: 'Rp. 24000',
                                active: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildCard(
                              context,
                              child: AccountCard(
                                name: 'Louisa Patel',
                                id: 'JD1234L',
                                productTotal: 'Rp. 24000',
                                active: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildCard(
                              context,
                              child: AccountCard(
                                name: 'Louisa Patel',
                                id: 'JD1234L',
                                productTotal: 'Rp. 24000',
                                active: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildCard(
                              context,
                              child: AccountCard(
                                name: 'Louisa Patel',
                                id: 'JD1234L',
                                productTotal: 'Rp. 24000',
                                active: true,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }

  Widget _buildDivider() {
    return Flexible(
      flex: 1,
      child: SizedBox(
        width: 5,
        child: Container(
          alignment: Alignment.centerRight,
          height: 70,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String subtitle, Color chartColor) {
    return Flexible(
      flex: 5,
      child: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 60,
                height: 80,
                child: CustomPaint(
                  painter: CurrentDataChartPainter(
                    chartColor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}