import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const FacebookPage(),
    );
  }
}

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});
  final List<String> imagesPaths = const [
    'assets/images/1.webp',
    'assets/images/2.jpeg',
    'assets/images/3.png',
    'assets/images/4.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: SvgPicture.asset('assets/icons/facebook.svg'),
          actions: [
            _CustomIconButton(
              onTap: () {},
              icon: SvgPicture.asset(
                'assets/icons/add.svg',
                height: 20,
                width: 20,
              ),
            ),
            _CustomIconButton(
              onTap: () {},
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                height: 20,
                width: 20,
              ),
            ),
            _CustomIconButton(
              onTap: () {},
              icon: SvgPicture.asset(
                'assets/icons/messenger.svg',
                height: 24,
                width: 24,
              ),
            ),
          ],
          bottom: TabBar(tabs: [
            Tab(icon: SvgPicture.asset('assets/icons/home.svg')),
            Tab(icon: SvgPicture.asset('assets/icons/video.svg')),
            Tab(icon: SvgPicture.asset('assets/icons/people.svg')),
            Tab(icon: SvgPicture.asset('assets/icons/mart.svg')),
            Tab(icon: SvgPicture.asset('assets/icons/bell.svg')),
          ]),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/2.jpeg',
                          fit: BoxFit.cover),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            hintText: "What's on your mind?"),
                      ),
                    )),
                    _CustomIconButton(
                        showBackgroundColor: false,
                        icon: SvgPicture.asset(
                          'assets/icons/share.svg',
                          height: 20,
                          width: 20,
                        ),
                        onTap: () {})
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 180,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: imagesPaths.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, index) => const SizedBox(width: 6),
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Image.asset(
                                          imagesPaths[index],
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 180 * .6,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: _CustomIconButton(
                                            icon: SvgPicture.asset(
                                                'assets/icons/add.svg'),
                                            onTap: () {}),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text('Create Story')
                                ],
                              ),
                            ),
                          );
                        }
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                Image.asset(
                                  imagesPaths[index],
                                  fit: BoxFit.cover,
                                  height: 180,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.blue)),
                                        child:
                                            Image.asset('assets/images/2.jpeg'),
                                      ),
                                      const Spacer(),
                                      Text('Abdul Mannan')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              const SizedBox(height: 10),
              ListView.separated(
                  itemCount: imagesPaths.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    return ColoredBox(
                      color: Colors.white,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              _ProfilePicture(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hammad Parveez'),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text('4h',
                                            style: TextStyle(fontSize: 12)),
                                        const SizedBox(width: 8),
                                        SvgPicture.asset(
                                          'assets/icons/settings.svg',
                                          height: 12,
                                          width: 12,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              _CustomIconButton(
                                  icon: SvgPicture.asset(
                                      'assets/icons/hzt_dots.svg'),
                                  showBackgroundColor: false,
                                  onTap: () {}),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.close)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              Image.asset(imagesPaths[index],
                                  width: double.infinity, fit: BoxFit.cover),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _ProfilePicture(),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Hammad Parveez',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Text('Reels',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white)),
                                                  const SizedBox(width: 8),
                                                  Text('5h',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white)),
                                                  const SizedBox(width: 8),
                                                  SvgPicture.asset(
                                                      'assets/icons/world.svg',
                                                      color: Colors.white,
                                                      height: 12,
                                                      width: 12),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                    _CustomIconButton(
                                        icon: Icon(Icons.headset_mic_sharp,
                                            color: Colors.grey),
                                        showBackgroundColor: false,
                                        onTap: () {})
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text('The Roman Circus...',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(' more',
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text('Posted By Aliyah Duah',
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/thumb_color.svg',
                                    height: 20,
                                  ),
                                  Transform.translate(
                                    offset: const Offset(-6, 0),
                                    child: SvgPicture.asset(
                                      'assets/icons/heart_color.svg',
                                      height: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text('1 Share'),
                                  const SizedBox(width: 5),
                                  Text('2.6M '),
                                  const SizedBox(width: 5),
                                  Text('views', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _CustomTextButton(
                                      onTap: () {},
                                      iconPath: 'assets/icons/thumb.svg',
                                      title: 'Like'),
                                  _CustomTextButton(
                                      onTap: () {},
                                      iconPath: 'assets/icons/comment.svg',
                                      title: 'Comment'),
                                  _CustomTextButton(
                                      onTap: () {},
                                      iconPath: 'assets/icons/share.svg',
                                      title: 'Share'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  const _CustomTextButton({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String iconPath, title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black87)),
        onPressed: () {},
        icon: SvgPicture.asset(iconPath, height: 20),
        label: Text(title));
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/1.webp'))),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {Key? key,
      this.showBackgroundColor = true,
      required this.icon,
      required this.onTap})
      : super(key: key);
  final Widget icon;
  final VoidCallback onTap;
  final bool showBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: const EdgeInsets.only(right: 6),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: showBackgroundColor ? Colors.grey[300] : null,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: icon,
        ),
      ),
    );
  }
}
