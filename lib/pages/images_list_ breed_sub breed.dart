import 'package:deliveristo_test/components/imports/imports.dart';

class ImageListByBreedAndSuBBreed extends StatefulWidget {
  const ImageListByBreedAndSuBBreed({super.key});

  @override
  State<ImageListByBreedAndSuBBreed> createState() =>
      _ImageListByBreedAndSuBBreedState();
}

class _ImageListByBreedAndSuBBreedState
    extends State<ImageListByBreedAndSuBBreed> {
  bool isLoading = false;
  List<String> uniqueList = [];

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
            onTap: () {
              controllerProvider.breedController.clear();
              controllerProvider.subBreedController.clear();
              apiProvider.subBreedAllImages.clear();
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: CustomText(
            title: 'Images list by breed and sub breed', color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomBreedDropdownFormField(
                    items: apiProvider.breedsList,
                    onChanged: (newValue) {
                      setState(() {
                      controllerProvider.breedController.text = newValue!;
                      apiProvider.subBreedsList.clear();
                      apiProvider.subBreedAllImages.clear();
                      controllerProvider.subBreedController.clear();
                      isLoading=false;
                      });
                    },
                    hintText: 'Select Dog Breed',
                    controller: controllerProvider.breedController,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomSubBreedDropdownFormField(
                    onTap: () async {
                      await apiProvider.getSubBreedList(
                          controllerProvider.breedController.text, context);
                      if (apiProvider.subBreedsList.isEmpty) {
                        ToastService.showToast(context, 'No Sub Breed available for the selected dog breed');
                      }
                    },
                    selectedValue: apiProvider.subBreedsList.isNotEmpty?apiProvider.subBreedsList.first:'',
                    items: apiProvider.subBreedsList,
                    onChanged: (newValue) {
                      controllerProvider.subBreedController.text = newValue!;
                    },
                    hintText: 'Select Sub-Breed',
                    controller: controllerProvider.subBreedController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await apiProvider.getSubBreedAllImages(
                    controllerProvider.breedController.text,
                    controllerProvider.subBreedController.text,
                    context);
                setState(() {
                  isLoading = true;
                });
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
            apiProvider.showAllSubImages
                ? Expanded(
                    child: ListView.builder(
                      itemCount: apiProvider.subBreedAllImages.length,
                      itemBuilder: (context, index) {
                        return CustomButton(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          height: 200,
                          width: 100,
                          widget: Image.network(
                            apiProvider.subBreedAllImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            Visibility(
                visible: isLoading, child: const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}