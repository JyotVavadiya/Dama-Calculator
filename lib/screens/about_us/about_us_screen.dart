import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac aliquam dolor. Proin ac neque sem. Donec vitae lacus vel ante mollis ornare. Duis egestas neque sed dui congue, sed semper nisl tincidunt. Nam vitae aliquet tortor. Cras lobortis sollicitudin sapien. Nulla a lorem enim. Vestibulum sed arcu eros. Maecenas vel rutrum nibh. Nullam luctus tortor tortor, nec varius ex pellentesque sed. Maecenas eget felis congue, scelerisque sapien id, dignissim odio. Integer commodo quam vel lacinia sagittis. Morbi sed justo ex. Nam facilisis vestibulum lorem a mollis. Morbi viverra neque a ante commodo, vitae tincidunt libero elementum. Vivamus metus lacus, bibendum vel dui eu, faucibus porttitor enim. Curabitur tempus, risus eget dignissim dapibus, nisl leo malesuada neque, quis sollicitudin libero mauris hendrerit augue. Donec vel cursus sapien. In gravida tortor nibh, eget laoreet nibh pellentesque in."),
        ],
      ),
    );
  }
}
