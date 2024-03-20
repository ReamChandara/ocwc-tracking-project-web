import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    "Worker Detail",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "កក សំណាង",
                          style: GoogleFonts.battambang(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kork Samnang",
                          style: GoogleFonts.battambang(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "OCWC No",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "KH-MOU00793568",
                            style: GoogleFonts.battambang(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Country",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Thailand",
                            style: GoogleFonts.battambang(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Send Agency ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "ABC COMPANY LIMITED",
                            style: GoogleFonts.battambang(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
