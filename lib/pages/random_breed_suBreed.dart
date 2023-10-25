


import 'package:deliveristo_test/components/imports/imports.dart';

class RandomImageByBreedAndSubPage extends StatefulWidget {
  const RandomImageByBreedAndSubPage({super.key});

  @override
  State<RandomImageByBreedAndSubPage> createState() =>
      _RandomImageByBreedAndSubPageState();
}

class _RandomImageByBreedAndSubPageState
    extends State<RandomImageByBreedAndSubPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var apiProvider = Provider.of<FetchDogData>(context, listen: false);
      apiProvider.getDogList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllerProvider = Provider.of<SearchingController>(context);
    var apiProvider = Provider.of<FetchDogData>(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              controllerProvider.breedController.clear();
              controllerProvider.subBreedController.clear();
              apiProvider.subBreedRandomImages.clear();
              Navigator.pop(context);

            },
            child: const Icon(Icons.arrow_back)),

        title: CustomText(
            title: 'Random image by breed and sub breed', color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomDropdownFormField(
                    items: apiProvider.breedsList,
                    onChanged: (newValue) {
                      controllerProvider.breedController.text = newValue!;
                      print(
                          'Selected: ${controllerProvider.breedController.text}');
                      apiProvider.getSubBreedList(
                          controllerProvider.breedController.text, context);
                      if (apiProvider.subBreedsList == []) {
                        ToastService.showToast(context,
                            'No Sub Breed available for the selected dog breed');
                      }
                      setState(() {});
                    },
                    hintText: 'Select Dog Breed',
                    controller: controllerProvider.breedController,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdownFormField(
                    onTap: () {
                      if (apiProvider.subBreedsList.isEmpty) {
                        ToastService.showToast(context,
                            'No Sub Breed available for the selected dog breed');
                      }
                    },
                    items: apiProvider.subBreedsList,
                    onChanged: (newValue) {
                      controllerProvider.subBreedController.text = newValue!;
                      print(
                          'Selected: ${controllerProvider.subBreedController.text}');
                    },
                    hintText: 'Select Sub-Breed',
                    controller: controllerProvider.subBreedController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                apiProvider.getSubBreedRandomImages(
                    controllerProvider.breedController.text,
                    controllerProvider.subBreedController.text,
                    context);
              },
              height: 50,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              radius: BorderRadius.circular(15),
              widget: Center(
                child: CustomText(
                    title: 'Search Images', color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            apiProvider.showRandomSubImages?Expanded(
              child: ListView.builder(
                itemCount: apiProvider.subBreedRandomImages.length,
                itemBuilder: (context, index) {
                  return CustomButton(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: 100,
                    widget: Image.network(
                      apiProvider.subBreedRandomImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ):const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}