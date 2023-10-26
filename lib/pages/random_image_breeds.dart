import 'package:deliveristo_test/components/imports/imports.dart';

class RandomBreedPage extends StatefulWidget {
  const RandomBreedPage({super.key});

  @override
  State<RandomBreedPage> createState() => _RandomBreedPageState();
}

class _RandomBreedPageState extends State<RandomBreedPage> {
  List<String> _suggestedBreeds = [];
  bool showList = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var apiProvider = Provider.of<FetchDogData>(context,listen: false);
      apiProvider.getDogList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<SearchingController>(context, listen: false);
    var apiProvider = Provider.of<FetchDogData>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                apiProvider.randomImages.clear();
                Navigator.pop(context);

              },
              child: const Icon(Icons.arrow_back)),
          title: CustomText(

            title: 'Random Image List by breeds',
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Search for random image by breeds',
                controller: controller.randomSearch,
                onchanged: (value) {
                  setState(() {
                    _suggestedBreeds = apiProvider.breedsList
                            .where((breed) => breed
                                .toLowerCase()
                                .contains(value!.toLowerCase()))
                            .toList() ;
                    showList = true;
                  });
                },
              ),
              showList
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _suggestedBreeds.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                showList = false;
                                apiProvider.getRandomImageByBreeds(_suggestedBreeds[index]);
                                controller.randomSearch.clear();
                              });
                            },
                            title: Text(_suggestedBreeds[index]),
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
              apiProvider.showImages?Expanded(
                      child: ListView.builder(
                        itemCount: apiProvider.randomImages.length,
                        itemBuilder: (context, index) {
                          return CustomButton(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: 200,
                            width: 100,
                            widget: Image.network(
                              apiProvider.randomImages[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ):const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}