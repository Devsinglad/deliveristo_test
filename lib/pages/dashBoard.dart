
import 'package:deliveristo_test/components/imports/imports.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello Deliveristo!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/dog.png'),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  ItemDashboard(
                    title: 'Random image by breed',
                    img: 'assets/images/dog5.jpeg',
                    background: Colors.deepOrange,
                    onTap: () {
                      print('Tapped on "Random Image by Breed"');
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const RandomBreedPage()));
                    },
                  ),
                  ItemDashboard(
                    title: 'Images list by breed',
                    img: 'assets/images/dog2.jpeg',
                    background: Colors.green,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const BreedImagePage()));
                    },
                  ),
                  ItemDashboard(
                    title: 'Random image by breed and sub breed',
                    img: 'assets/images/dog3.jpeg',
                    background: Colors.purple,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const RandomImageByBreedAndSubPage()));
                    },
                  ),
                  ItemDashboard(
                    title: 'Images list by breed and sub breed',
                    img: 'assets/images/dog4.jpeg',
                    background: Colors.brown,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const ImageListByBreedAndSuBBreed()));                   },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

}