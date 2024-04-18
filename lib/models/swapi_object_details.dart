import '../services/swapi_service.dart';

import '../utils/string_extension.dart';

class SwapiObjectDetails {
  Map<String, dynamic> details;

  SwapiObjectDetails({required this.details});

  factory SwapiObjectDetails.fromJson(Map<String, dynamic> json) {
    return SwapiObjectDetails(details: json);
  }

  Map<String, dynamic> convertKeyNames() {
    Map<String, dynamic> convertedDetails = {};
    details.forEach((key, value) {
      String newKey = key.replaceAll('_', ' ').toTitleCase();
      convertedDetails[newKey] = value;
    });
    return convertedDetails;
  }

  Future<String> getListNames(List list) async {
    List<String> listNames = [];
    for (var element in list) {
      SwapiObjectDetails objectDetails =
          await SwapiService().getDetails(element);
      listNames
          .add(objectDetails.details['name'] ?? objectDetails.details['title']);
    }
    return listNames.join(", ");
  }
}
