import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Detail Page"),
      // ),
      body: Stack(
        children: [
          Image.network(
            data['largeImageURL'],
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          Image.network(
            "https://o.remove.bg/downloads/02c2150b-ba72-43db-bef8-2feb40a0675f/Untitled-removebg-preview.png",
            fit: BoxFit.fill,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: data['largeImageURL'],
            goToHome: true,
            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
          );
        },
        child: const Icon(Icons.wallpaper),
      ),
    );
  }
}
