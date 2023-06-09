import 'package:flutter/material.dart';


import '../models/usuario.dart';
import '../pages/live_page.dart';

class Profile extends StatefulWidget {
  final Usuario usuario;

  const Profile({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final bool aovivo = false;

  getAvatarBorder() {
    return (widget.usuario.aovivo) ? 'aovivo' : 'story';
  }

  goToLive() {
    if (widget.usuario.aovivo) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LivePage(usuario: widget.usuario),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: goToLive,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('images/${getAvatarBorder()}.png'),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.usuario.avatar),
                  ),
                ),
                if (widget.usuario.aovivo)
                  Container(
                    width: 60,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffa50f87), Color(0xffdd0e49)],
                      ),
                    ),
                    child: const Text(
                      'AO VIVO',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            ),
            Text(
              widget.usuario.username,
            ),
          ],
        ),
      ),
    );
  }
}
