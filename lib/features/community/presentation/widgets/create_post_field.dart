import 'package:ezycourse_community/features/community/presentation/screens/create_post_screen.dart';
import 'package:flutter/material.dart';

class CreatePostField extends StatelessWidget {

  const CreatePostField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.grey),
          const SizedBox(width: 8.0),
          Expanded(
            child: InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) =>  CreatePostScreen(
                
                  )));

              },
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text('What\'s on your mind?', style: TextStyle(color: Colors.grey[600]),),
                ),
            
              ),
            ),
          )
         
        ],
      ),
    );
  }
}