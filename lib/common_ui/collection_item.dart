import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem(
      {super.key, this.leftTop, this.avatar, this.date, this.leftBottom, this.content, this.rightBottom});

  final String? leftTop;

  final String? avatar;

  final String? date;

  final String? leftBottom;

  final String? content;

  final Widget? rightBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (avatar != null) // 根据 avatar 是否有值来决定是否展示 ClipRRect
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    avatar!, // 使用传递的 avatar 值
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
              if (avatar != null) Padding(padding: EdgeInsets.only(left: 5)), // 确保 Padding 只在有 avatar 时显示
              Padding(
                padding: EdgeInsets.only(left: avatar == null ? 5 : 0), // 调整 Padding 根据 avatar 是否有值
                child: Text(
                  leftTop ?? '', // 使用 item 的 name 属性
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                date ?? '',
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(content ?? '',
              style: TextStyle(color: Colors.black, fontSize: 15)),
          Row(
            children: [
              Text(
                leftBottom ?? '',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
              Expanded(
                child: SizedBox(),
              ),
              rightBottom ?? const SizedBox(),
            ],
          )
        ],
      ),
    );
  }

}