import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl; // Replace with the full image URL

  ImageViewer(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Image.network(
          imageUrl, // Provide the full image URL here
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Text('Image not found');
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImageViewer('http://localhost:8080/uploads/14a5f358-74c2-11ee-88bc-8c859014fd23/test.png'),
  ));
}
