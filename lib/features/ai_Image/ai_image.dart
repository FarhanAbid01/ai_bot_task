import 'package:ai_bot_task/features/create_image/create_image_proivder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiImagePage extends StatefulWidget {
  const AiImagePage({super.key});

  @override
  State<AiImagePage> createState() => _AiImagePageState();
}

class _AiImagePageState extends State<AiImagePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CreateImageProvider>(
      builder: (context, createImageVm , child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Generated Result'),
                SizedBox(height: 10,),
                Expanded(child: GridView.builder(
                  itemCount: createImageVm.images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10

                    ),
                    itemBuilder: (context , index){
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(imageUrl: createImageVm.images[index]??''));
                }))
              ],
            ),
          ),
        );
      }
    );
  }
}
