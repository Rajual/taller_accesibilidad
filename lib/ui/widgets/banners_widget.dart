import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/widgets/banner_indicator_widget.dart';

import '../../domain/banner/banner.dart';
import '../pages/home_page/home_page_view.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({required this.banners, this.action, super.key});
  final Future<List<BannerModel>> banners;
  final VoidCallback? action;

  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: widget.banners,
      builder:
          (BuildContext context, AsyncSnapshot<List<BannerModel>> snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              PageView.builder(
                itemCount: snapshot.data?.length ?? 0,
                pageSnapping: true,
                onPageChanged: (value) {
                  setState(() {
                    activePage = value;
                    widget.action?.call();
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Image.asset(snapshot.data?[index].urlPhoto ?? ''),
                  );
                },
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.39,
                child: Row(
                  children: List<Widget>.generate(snapshot.data?.length ?? 0,
                      (index) {
                    return BannerIndicatorWidget(
                      isCurrentIndex: activePage == index,
                    );
                  }),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
