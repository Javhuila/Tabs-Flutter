import 'package:flutter/material.dart';

import 'package:rive_animation/models/producat.dart';

import '../../../splashs/anime_pcircle.dart';
import 'categpro.dart';

class CateList extends StatefulWidget {
  const CateList({
    Key? key,
    required this.categone,
  }) : super(key: key);

  final CategoryTwo categone;

  @override
  State<CateList> createState() => _CateListState();
}

class _CateListState extends State<CateList>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  
  List<CategoryTwo> categorythrees = [];

  @override
  void initState() {
    tabController = TabController(length: categorythrees.length, vsync: this);
    // tabController = TabController(length: 6, vsync: this);
    super.initState();
  }
  
  @override
   void dispose() {
     tabController!.dispose();
     super.dispose();
   }
   
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        // Color para la animación
        backgroundColor: Colors.grey[200],
        body: AnimePCircle(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.red,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.categone.name),
                background: Image.asset(
                  widget.categone.imgtab!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverAppBar(
              // Ocultar icono
              automaticallyImplyLeading: false,
              pinned: true,
              primary: false,
              elevation: 8,
              backgroundColor: Colors.redAccent,
              title: Align(
                alignment: AlignmentDirectional.center,
                child: TabBar(
                    controller: tabController,
                    indicatorColor: Colors.yellowAccent,
                    isScrollable: true,
                    tabs: widget.categone.itemsss
                         .map((item) => Tab(text: item))
                         .toList(),

                    ),
              ),
            ),
          ],
        )));
  }
}
