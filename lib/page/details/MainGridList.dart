import 'package:flutter/material.dart';

class MainGridList extends StatelessWidget {
  List<_Photo> _photos() {
    return [
      _Photo(
          imageURL:
              'https://azmtradings.com/wp-content/uploads/2020/11/AZM_ICT_Services.jpg',
          title: 'ICT & Telecoomunication equipment',
          subtitle: 'Mainframes, printers,personal computer etc'),
      _Photo(
          imageURL:
              'https://image.shutterstock.com/image-vector/set-kitchen-appliance-electronics-home-260nw-1521150890.jpg',
          title: 'Consumer Equipment',
          subtitle: 'CFL,TFL,LED,Bulbs etc.'),
      _Photo(
          imageURL:
              'https://3.imimg.com/data3/JY/GO/MY-8550580/medical-equipment-batteries-500x500.jpg',
          title: 'Batteries',
          subtitle: 'Lead batt, laptop batt etc'),
      _Photo(
          imageURL:
              'https://5.imimg.com/data5/LN/BF/MY-2246628/medical-devices-500x500.jpg',
          title: 'Medical Equipment',
          subtitle: 'Scanner,stethoscope, etc.'),
      _Photo(
          imageURL:
              'https://www.superiorlighting.com/content/vspfiles/assets/images/fluorescent-lighting.jpg',
          title: 'Bulbs',
          subtitle: 'Fluorescents tubes'),
      _Photo(
          imageURL:
              'https://4.imimg.com/data4/KW/BI/MY-2944238/pvc-insulated-wires-500x500.png',
          title: 'wires and cables',
          subtitle: 'all type of plastic insulated wires and cables.'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            childAspectRatio: 1,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: _photos().map<Widget>((photo) {
              return _GridDemoPhotoItem(
                photo: photo,
              );
            }).toList()),
      ),
    );
  }
}

class _Photo {
  _Photo({
    this.imageURL,
    this.title,
    this.subtitle,
  });

  final String imageURL;
  final String title;
  final String subtitle;
}

class GridSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text('List of Types of E-Waste we handle',
          style: TextStyle(
              fontFamily: 'ConcertOne-Regular',
              fontSize: 24,
              fontWeight: FontWeight.bold)),
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        photo.imageURL,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}
