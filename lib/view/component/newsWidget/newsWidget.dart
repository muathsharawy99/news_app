import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/model/newsModel/newModel.dart';


class NewsWidget extends StatelessWidget {
  Articles? article;
  NewsWidget({required this.article,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        //padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),border: Border.all(width: 2.w,color: Colors.blue)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.network(
              article?.urlToImage ?? "https://avatars.githubusercontent.com/u/239500?s=280&v=4",
              cacheHeight: 297,
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  Text(
                    article?.title ?? "Title must be here",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Row(
                    children: [
                      Text(
                        article?.publishedAt??"Published At",
                        style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      Spacer(),
                      Text(
                        article?.source?.name??"Source",
                        style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
