import 'package:flutter/material.dart';
import 'package:rugwell/screens/intro_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 207, 207),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => IntroPage(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                '\nTaznakht rugs are a type of traditional Moroccan rug that is known for its intricate patterns, vibrant colors, and exquisite craftsmanship. These rugs are made by the Berber people of the Taznakht region in southern Morocco, using a combination of wool, cotton, and sometimes silk.\n\n\tThe process of making a Taznakht rug is a time-consuming and labor-intensive process. First, the wool is sheared from the sheep, and then it is washed, spun, and dyed using natural ingredients such as henna, saffron, and indigo. The wool is then woven into the base of the rug, which can take several weeks to complete depending on the size of the rug.\n\n\tOnce the base of the rug is complete, the weavers begin to add the intricate patterns and designs. These patterns are often inspired by traditional Berber symbols and motifs, and they are created by hand using a technique known as knotting. Each knot is carefully tied and trimmed to ensure that the pattern is crisp and clear.\n\n\tOne of the most striking features of Taznakht rugs is their use of color. These rugs often feature bright, bold colors such as red, orange, and blue, which are used to create striking geometric patterns and designs. The use of color is an important aspect of Berber culture, and it is reflected in the vibrant hues of Taznakht rugs.\n\n\tTaznakht rugs are highly valued for their beauty and quality, and they are often passed down as family heirlooms. They are also sought after by collectors and interior designers who appreciate their unique aesthetic and cultural significance. While they can be quite expensive, handmade Taznakht rugs are considered to be a worthwhile investment due to their durability and timeless beauty.\n\n\t In conclusion, handmade Taznakht rugs are a testament to the skill and creativity of the Berber people of southern Morocco. These rugs are a beautiful and meaningful addition to any home, and they serve as a reminder of the rich cultural heritage of this ancient region.')),
      ),
    );
  }
}
