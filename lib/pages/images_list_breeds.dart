

import 'package:deliveristo_test/components/imports/imports.dart';

class BreedImagePage extends StatefulWidget {
  const BreedImagePage({super.key});

  @override
  State<BreedImagePage> createState() => _BreedImagePageState();
}

class _BreedImagePageState extends State<BreedImagePage> {
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
              apiProvider.getAllBreedImages.clear();
              Navigator.pop(context);

            },
              child: const Icon(Icons.arrow_back)),
          title: CustomText(
            title: 'All Image List by breeds',
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Search for  image by breeds',
                controller: controller.search,
                onchanged: (value) {
                  print(value);
                  setState(() {
                    _suggestedBreeds = apiProvider.breedsList
                            .where((breed) => breed
                                .toLowerCase()
                                .contains(value!.toLowerCase()))
                            .toList();
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
                                apiProvider.getAllImageListByBreed(
                                    _suggestedBreeds[index],context);
                                controller.search.clear();
                              });
                            },
                            title: Text(_suggestedBreeds[index]),
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
                apiProvider.showAllImages?Expanded(
                  child: ListView.builder(
                    itemCount: apiProvider.getAllBreedImages.length,
                    itemBuilder: (context, index) {
                      return CustomButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 200,
                        width: 100,
                        widget: Image.network(
                          apiProvider.getAllBreedImages[index],
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