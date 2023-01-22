// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          name: "Rahat",
          github: "rahatbhatti",
          linkedin: "rahat bhatti",
        ),
        ProfileCard(
          name: "Siddhesh",
          github: "SiddheshMishra1999",
          linkedin: "rahat bhatti",
        ),
        ProfileCard(
          name: "Rahat",
          github: "bhatti",
          linkedin: "rahatbhatti",
        ),
      ],
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