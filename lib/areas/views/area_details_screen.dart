import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/areas/view_models/area_view_model.dart';
import 'package:tvlms/areas/views/edit_area_screen.dart';

class AreaDetailsScreen extends StatelessWidget {
  const AreaDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/area-details-screen';

  @override
  Widget build(BuildContext context) {
    AreaViewModel areaViewModel = context.watch<AreaViewModel>();
    int total = areaViewModel.selectedArea!.places?.length as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('${areaViewModel.selectedArea?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Name of Area'),
                Text(
                  '${areaViewModel.selectedArea?.name}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Code'),
                Text(
                  '${areaViewModel.selectedArea?.code}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Centers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50.0 * total,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.amber)),
              child: ListView.builder(
                itemCount: areaViewModel.selectedArea!.places?.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(
                    '${areaViewModel.selectedArea?.places![index].name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Latitude ${areaViewModel.selectedArea?.places![index].location.latitude}'),
                      Text(
                          'Longitude ${areaViewModel.selectedArea?.places![index].location.latitude}'),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditAreaScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                areaViewModel.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<AreaViewModel>(context,
                                  listen: false)
                              .deleteArea(
                                  areaViewModel.selectedArea?.id as int);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
