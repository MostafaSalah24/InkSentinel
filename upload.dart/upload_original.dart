import 'package:flutter/material.dart';

class Upphoto extends StatefulWidget {
  const Upphoto({super.key});

  @override
  State<Upphoto> createState() => _UpphotoState();
}
class _UpphotoState extends State<Upphoto> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 2)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            const Text(
              'Upload Images',
              style: TextStyle(
                  fontSize: 32, color: Color.fromRGBO(37, 159, 162, 1)),
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Please Upload Current signature',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 250,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(197, 198, 204, 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Text(''),
        ),
        const SizedBox(
          height: 70,
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Set to true for full screen
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    width: 500,
                    height: MediaQuery.of(context).size.height *
                        0.3, // Adjust height as needed
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 131, 126, 126),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //const Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(500, 70),
                                  backgroundColor:
                                      const Color.fromARGB(78, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: const Text(
                                'Gallery',
                                style: TextStyle(
                                    fontSize: 28, color: Color.fromRGBO(37, 159, 162, 1)),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(400, 70),
                                  backgroundColor:
                                      const Color.fromARGB(78, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: const Text(
                                'Scan',
                                style: TextStyle(
                                    fontSize: 28, color: Color.fromRGBO(37, 159, 162, 1)),
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(500, 70),
                                  backgroundColor:
                                      const Color.fromARGB(200, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 28, color: Color.fromRGBO(37, 159, 162, 1)),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(330, 80),
              backgroundColor: const Color.fromRGBO(37, 159, 162, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: const Text('Upload Image',
              style: TextStyle(color: Colors.white, fontSize: 28)),
        ),
      ]),
    );
  }
}
