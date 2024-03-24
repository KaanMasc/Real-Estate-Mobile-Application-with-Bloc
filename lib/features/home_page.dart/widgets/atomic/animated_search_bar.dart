import 'package:flutter/material.dart';
import 'package:api/product/enums/colors.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _ProjectSearchSectionState();
}

class _ProjectSearchSectionState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500));

  late final Animation<double> width = Tween<double>(
          begin: MediaQuery.of(context).size.height / 10,
          end: MediaQuery.of(context).size.height * 4 / 10)
      .animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0, curve: Curves.ease)));
          

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const VerticalDivider(
                thickness: 7,
                color: Color.fromARGB(196, 255, 153, 0),
              ),
              const SizedBox(
                width: 8,
              ),
       _buildTextSection(),
            ],
          ),
          GestureDetector(
            onTap: () {
             _toggleSelection(); // isSelected durumunu değiştir
    if (isSelected) {
      _controller.forward(); // isSelected true ise animasyonu başlat
    } else {
      _controller.reverse(); // isSelected false ise animasyonu ters yönde çalıştır
    }
            },
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: width.value,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ProjectColors.mortarGrey.color,
                        width: 4,
                      ),
                    ),
                    child: isSelected == false
                        ? Center(
                            child: Icon(
                              Icons.search_outlined,
                              color: ProjectColors.spanishGrey.color,
                              size: 30,
                            ),
                          )
                        : null,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: MediaQuery.of(context).size.height / 10,

      child: isSelected == false
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Find',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Expanded(
                    child: Text('The Perfect', style: TextStyle(fontSize: 22))),
                Expanded(child: Text('Place', style: TextStyle(fontSize: 22))),
              ],
            )
          : Text(''),
    );
  }

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}
