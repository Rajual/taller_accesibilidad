import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';

import '../../domain/banner/banner.dart';
import 'dot_indicator_widget.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget(
      {required this.banners, this.action, super.key, required this.itemModel});
  final ItemModel itemModel;
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
          return Semantics(
            label: widget.itemModel.semantic,
            sortKey: OrdinalSortKey(widget.itemModel.semanticOrdinal),
            child: MergeSemantics(
              child: Stack(
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: Semantics(
                            label: snapshot.data?[index].name ?? '',
                            child: Image.asset(
                                snapshot.data?[index].urlPhoto ?? '')),
                      );
                    },
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.39,
                    child: BannerIndicatorWidget(
                        activePage: activePage,
                        length: snapshot.data?.length ?? 0),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class BannerIndicatorWidget extends StatelessWidget {
  const BannerIndicatorWidget({
    super.key,
    required this.length,
    required this.activePage,
  });

  final int activePage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${activePage + 1} de $length',
      child: Row(
        children: List<Widget>.generate(length, (index) {
          return DotIndicatorWidget(
            isCurrentIndex: activePage == index,
          );
        }),
      ),
    );
  }
}
