import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/producat.dart';
import 'detallesprodu.dart';
import 'vista_buqueda/busform.dart';
import 'vista_categorias/catelist.dart';

class BusqProdu extends StatefulWidget {
  const BusqProdu({super.key});

  @override
  State<BusqProdu> createState() => _BusqProduState();
}

class _BusqProduState extends State<BusqProdu> {
  // final CategoryTwo? category;
  late final List<CategoryTwo> catePrincipal;
  @override
  Widget build(BuildContext context) {
    // if (products != null) {
    //   List<Product> filteredProducts =
    //       products!.where((p) => p.categoryId == 1).toList();
    //   print(filteredProducts);
    // }
    List<Product> category1Products = [];
    List<Product> category2Products = [];
    List<Product> category3Products = [];

    //Ciclo para comprobar el producto según la categoría
    for (Product product in demoproduct) {
      if (product.categoryId == 1) {
        category1Products.add(product);
      } else if (product.categoryId == 2) {
        category2Products.add(product);
      } else if (product.categoryId == 3) {
        category3Products.add(product);
      }
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explora y Busca',
                  style: Theme.of(context)
                      .textTheme
                      // Es reemplazada por .caption!
                      // Porque la variable caption ya no es funcional
                      .bodySmall!
                      .copyWith(
                          color: kActiveColor, fontWeight: FontWeight.w600),
                ),
                const Text(
                  " lo que más desees",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: BusFrom(),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    categorythree.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          child: ListCateProdu(
                            icon: categorythree[index].icon,
                            title: categorythree[index].name,
                            press: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                // reverseTransitionDuration: Duration(seconds: 3),
                                pageBuilder: (context, animation, _) {
                                  return CateList(
                                      categone: categorythree[index]);
                                },
                                opaque: false,
                              ));
                            },
                          ),
                        )),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle1(
                title: "Tendencia en Licores",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              // color: Colors.green,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: category1Products.length,
                  itemBuilder: (context, index) {
                    // final product = category1Products[index];
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: defaultPadding, right: defaultPadding),
                        child: ProductNum(
                          press: () {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (context, animation, _) {
                                return DetallesProdu(
                                    product: category1Products[index]);
                              },
                            ));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DetallesProdu(
                            //           product: category1Products[index]),
                            //     ));
                          },
                          image: category1Products[index].image,
                          title: category1Products[index].title,
                          bgColor: category1Products[index].bgColor!,
                          price: category1Products[index].price,
                        ));
                  }),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle1(
                title: "Tendencia en Aseo Personal",
                press: () {
                  // Error al leer el index
                  // Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => CateList(
                  //                       categone: demo_categories[index]),
                  //                 ));
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              // color: Colors.blue,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: category2Products.length,
                  itemBuilder: (context, index) {
                    // final product = category1Products[index];
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: defaultPadding, right: defaultPadding),
                        child: ProductNum(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetallesProdu(
                                      product: category2Products[index]),
                                ));
                          },
                          image: category2Products[index].image,
                          title: category2Products[index].title,
                          bgColor: category2Products[index].bgColor!,
                          price: category2Products[index].price,
                        ));
                  }),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle1(
                title: "Tendencia en Bebidas",
                press: () {
                  // Error al leer el index
                  // Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => CateList(
                  //                       categone: category3Products[index]),
                  //                 ));
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              // color: Colors.blue,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: category3Products.length,
                  itemBuilder: (context, index) {
                    // final product = category1Products[index];
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: defaultPadding, right: defaultPadding),
                        child: ProductNum(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetallesProdu(
                                      product: category3Products[index]),
                                ));
                          },
                          image: category3Products[index].image,
                          title: category3Products[index].title,
                          bgColor: category3Products[index].bgColor!,
                          price: category3Products[index].price,
                        ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductNum extends StatelessWidget {
  const ProductNum({
    super.key,
    required this.image,
    required this.title,
    required this.bgColor,
    required this.price,
    required this.press,
  });

  final String image, title;
  final Color bgColor;
  final int price;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor, //Color(0xFFEFEFF2)
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                image, //"assets/images/product_0.png"
                height: 132,
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: defaultPadding / 4,
                ),
                Text(
                  "\$$price",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle1 extends StatefulWidget {
  const SectionTitle1({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  State<SectionTitle1> createState() => _SectionTitle1State();
}

class _SectionTitle1State extends State<SectionTitle1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
            onPressed: widget.press,
            child: const Text(
              "Ver más",
              style: TextStyle(
                color: Colors.black54,
              ),
            )),
      ],
    );
  }
}

class ListCateProdu extends StatelessWidget {
  const ListCateProdu({
    super.key,
    this.icon,
    required this.title,
    required this.press,
  });

  final String title;
  final String? icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 4,
          vertical: defaultPadding / 2,
        ),
        child: Column(
          children: [
            SvgPicture.asset(icon!),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
