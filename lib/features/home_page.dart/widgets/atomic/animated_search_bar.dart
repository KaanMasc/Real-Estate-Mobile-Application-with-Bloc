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
  TextEditingController _textEditingController = TextEditingController();

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

  late final Animation<double> width = Tween<double>(
          begin: MediaQuery.of(context).size.height / 10,
          end: MediaQuery.of(context).size.height * 4 / 10)
      .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)));

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
                _textEditingController.clear(); // Text alanını temizle
                FocusScope.of(context).unfocus(); // Klavyeyi kapat
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
                    child: Stack(
                      children: [
                        if (!isSelected)
                          Center(
                            child: Icon(
                              Icons.search_outlined,
                              color: ProjectColors.spanishGrey.color,
                              size: 30,
                            ),
                          ),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: ProjectColors.spanishGrey.color),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: isSelected ? Duration(milliseconds: 200) : Duration(milliseconds: 520),
          width: isSelected ? 0.0 : 130.0,
          curve: Curves.easeInOut,
          child: const Column(
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
                child: Text('The Perfect', style: TextStyle(fontSize: 22)),
              ),
              Expanded(
                child: Text('Place', style: TextStyle(fontSize: 22)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}
