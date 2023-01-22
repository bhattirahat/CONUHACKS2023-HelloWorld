// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(60, 0, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          ProfileCard(
            name: "Rahat",
            github: "rahatbhatti",
            linkedin: "rahat bhatti",
          ),
          ProfileCard(
            name: "Siddhesh",
            github: "SiddheshMishra1999",
            linkedin: "SiddeshMishra1999",
          ),
          ProfileCard(
            name: "Devin",
            github: "devinKuriya",
            linkedin: "Devin Kuriya",
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Text("Product Description"),
              SizedBox(height: 20),
              Container(
                child: Text(
                    "EcoFriendly is an innovative tool that can be used by all ages. It allows users to determine whether their trash should be sent to the compost, a recycling plant or a landfill. Powered by AI and ML using Microsoft Azure, we can offer reliable results to help preserve our planet for future generations"),
                
                width: 350,
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard(
      {Key? key,
      required this.name,
      required this.github,
      required this.linkedin})
      : super(key: key);
  final String name;
  final String github;
  final String linkedin;
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: [
            Row(
              children: [
                Text("Name"),
                SizedBox(
                  height: 30,
                  width: 40,
                ),
                Text(widget.name)
              ],
            ),
            Row(
              children: [
                Text("Github"),
                SizedBox(
                  height: 30,
                  width: 35,
                ),
                Text(widget.github)
              ],
            ),
            Row(
              children: [
                Text("Linkedin"),
                SizedBox(
                  height: 30,
                  width: 25,
                ),
                Text(widget.linkedin)
              ],
            )
          ],
        )
      ],
    ));
  }
}
