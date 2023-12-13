import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> dataMorning = [
    {
      "image": "assets/images/morning-ideas1.png",
      "title": "Pelemahan Harga Komoditas, Gimana Nasib IHSG?",
    },
    {
      "image": "assets/images/morning-ideas2.png",
      "title":
          "Net Sell Asing Semakin Deras, Tapi IHSG Diselamatkan Oleh Kinerja Emiten",
    },
    {
      "image": "assets/images/morning-ideas3.png",
      "title": "GDP Amerika Tumbuh, IHSG Bakal Sumringah?",
    },
    {
      "image": "assets/images/morning-ideas4.png",
      "title": "IHSG Di Titik Rawan, Karena Ketidakpastian Global",
    },
    {
      "image": "assets/images/morning-ideas5.png",
      "title": "GDP Amerika Tumbuh, IHSG Bakal Sumringah?",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(22, 10, 22, 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/bg-appbar2.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    scale: 7.5,
                  ),
                  SizedBox(height: height * 0.07),
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Achmad Ziyan Saputra",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 42, 22, 22),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(blurRadius: 6, spreadRadius: -4),
                ],
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                // spacing: width * 0.15,
                runSpacing: 18,
                children: [
                  GestureDetector(
                    onTap: () => debugPrint("memo click"),
                    child: SizedBox(
                      width: width * 0.26,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-memo.png", scale: 3),
                          Text(
                            "Memo",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("Opening Account Trackers click"),
                    child: SizedBox(
                      width: width * 0.3,
                      // height: height * 0.125,
                      child: Column(
                        children: [
                          Image.asset("assets/images/icon-acc_tracker.png",
                              scale: 3),
                          Text(
                            "Opening Account Trackers",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("user click"),
                    child: SizedBox(
                      width: width * 0.26,
                      child: Column(
                        children: [
                          Image.asset("assets/images/icon-user.png", scale: 3),
                          Text(
                            "User",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("banners click"),
                    child: SizedBox(
                      width: width * 0.26,
                      child: Column(
                        children: [
                          Image.asset("assets/images/icon-banner.png",
                              scale: 3),
                          Text(
                            "Gambar Banners",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("riset click"),
                    child: SizedBox(
                      width: width * 0.26,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-riset.png", scale: 3),
                          Text(
                            "Riset",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("invest bank click"),
                    child: SizedBox(
                      width: width * 0.26,
                      child: Column(
                        children: [
                          Image.asset("assets/images/icon-invest_bank.png",
                              scale: 3),
                          Text(
                            "Invesment Banking",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Morning Ideas",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Lihat Semua",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20),
            Container(
              height: height * 0.28,
              // margin: EdgeInsets.symmetric(vertical: 20),
              child: ListView.separated(
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
                scrollDirection: Axis.horizontal,
                itemCount: dataMorning.length,
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.60,
                    // height: height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          // offset: Offset(0, 4),
                          blurRadius: 5,
                          spreadRadius: -3,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      children: [
                        Image.asset(dataMorning[index]["image"]),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              // padding: EdgeInsets.all(8),
                              children: [
                                Text(
                                  dataMorning[index]["title"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "2023-10-31 01:51:19",
                                    // textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
