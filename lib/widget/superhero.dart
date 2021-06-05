import 'package:flutter/material.dart';
import 'package:superhero_app/info_hero/heroitem.dart';
import 'package:superhero_app/screens/details.dart';
import 'package:superhero_app/widget/superhero_avatar.dart';

// ignore: must_be_immutable
class SuperHero extends StatefulWidget {
  HeroItem heroItem;

  SuperHero({
    Key key,
    @required this.heroItem,
  }) : super(key: key);

  @override
  _SuperHeroState createState() => _SuperHeroState();
}

class _SuperHeroState extends State<SuperHero> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(
            heroItem: widget.heroItem,
          );
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  Hero(
                    tag: widget.heroItem.id,
                    child: SuperheroAvatar(img: widget.heroItem.images.md),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.heroItem.name}",
                            style: textTheme.headline6,
                          ),
                          Text(
                            widget.heroItem.biography.fullName.isEmpty
                                ? widget.heroItem.name
                                : widget.heroItem.biography.fullName,
                            style: textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${widget.heroItem.biography.publisher}",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
