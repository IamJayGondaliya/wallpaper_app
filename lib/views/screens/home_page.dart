import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controllers/api_data_provider.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/models/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Page"),
        centerTitle: true,
      ),
      body: Consumer<ApiController>(builder: (context, pro, _) {
        List data = pro.data;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onSubmitted: (val) {
                    print("SEARCH: $val");
                    pro.search(val: val);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  // child: StaggeredGrid.count(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 12,
                  //   children: pro.data.isNotEmpty
                  //       ? pro.data.map((e) {
                  //           print("Data: $e");
                  //           return Card(
                  //             child: Text("DATA"),
                  //           );
                  //         }).toList()
                  //       : [
                  //           const CircularProgressIndicator(),
                  //         ],
                  // ),
                  child: GridView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('detail_page', arguments: data[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          data[index]['largeImageURL'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ],
            ),
            // return MasonryGridView.builder(
            //   itemCount: snapShot.data!.length,
            //   crossAxisSpacing: 5,
            //   mainAxisSpacing: 5,
            //   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (context, index) => Card(
            //     color: Colors.primaries[index % 18],
            //     child: GridTile(
            //       child: FlutterLogo(),
            //     ),
            //   ),
            // );
          ),
        );
      }),
      // body: Consumer<ApiController>(
      //   builder: (context, pro, _) => pro.post != null
      //       ? Center(
      //           child: ListTile(
      //             title: Text(pro.post!.title),
      //           ),
      //         )
      //       : const Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ApiController>(context, listen: false).getData();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
