import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyContactShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext buildContext, int index) {
          return _LoadingItem();
        });
  }
}

class _LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, left: 0.0, bottom: 5.0, right: 0.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.white,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 14, left: 14),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 14.0),
                                  child: Container(
                                    height: 9.5,
                                    width: 140.0,
                                    color: Colors.black12,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 10.0),
                                  child: Container(
                                    height: 9.0,
                                    width: 100.0,
                                    color: Colors.black12,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 10.0),
                                  child: Container(
                                    height: 9.0,
                                    width: 100.0,
                                    color: Colors.black12,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.black12,
                            width: 14,
                            height: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 14, left: 0, right: 0, bottom: 8),
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black12,
                            width: 14,
                            height: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
