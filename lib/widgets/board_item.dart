import 'package:flutter/material.dart';

Widget buildItem({
  required String imageUrl,
  required String title,
  required String location,
  required String price,
  int likes = 0,
  int comments = 0,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상품 이미지
        Container(
          width: 150,
          height: 150,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),

        // 텍스트 정보
        Expanded(
          child: SizedBox(
            height: 150, // 이미지와 높이를 맞추기 위해 설정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '$location · 알바',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Spacer로 아래로 밀기
                Spacer(),

                // 좋아요, 댓글
                if (likes > 0 || comments > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (comments > 0) ...[
                        Icon(Icons.person, color: Colors.grey, size: 14),
                        Text(' $comments',
                            style: TextStyle(color: Colors.grey)),
                      ],
                      const SizedBox(width: 6),
                      if (likes > 0) ...[
                        Icon(Icons.favorite_border,
                            color: Colors.grey, size: 14),
                        Text(' $likes', style: TextStyle(color: Colors.grey)),
                      ]
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
