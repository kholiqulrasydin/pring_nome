import 'package:flutter/material.dart';
import 'package:pringnome/ui/components/theme.dart';
import 'package:pringnome/ui/pages/home/components/currentdata.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildItem("Today", "18 Customers", MyColors.primaryColor),
            _buildDivider(),
            _buildItem("Canceled", "7 Customers", Color(0xffff1759)),
          ],
        ),
        Row(
          children: <Widget>[
            _buildItem("Sent", "7 Customers", Colors.amber),
            _buildDivider(),
            _buildItem("Arrived", "7 Customers", Colors.green),
          ],
        ),
      ],
    );
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
