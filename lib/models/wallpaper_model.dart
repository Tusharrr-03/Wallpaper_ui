class SourceModel {
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;

  SourceModel({required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
        landscape: json['landscape'],
        large: json['large'],
        large2x: json['large2x'],
        medium: json['medium'],
        original: json['original'],
        portrait: json['portrait'],
        small: json['small'],
        tiny: json['tiny']);
  }
}

class PhotoModel {
  int? id;
  int? width;
  int? height;
  int? photographer_id;
  bool? liked;
  String? alt;
  String? avg_color;
  String? photographer;
  String? photographer_url;
  String? url;
  SourceModel? src;

  PhotoModel({required this.url,
    required this.id,
    required this.width,
    required this.height,
    required this.alt,
    required this.avg_color,
    required this.liked,
    required this.photographer,
    required this.photographer_id,
    required this.photographer_url,
    required this.src});

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
        url: json['url'],
        id: json['id'],
        width: json['width'],
        height: json['height'],
        alt: json['alt'],
        avg_color: json['avg_color'],
        liked: json['liked'],
        photographer: json['photographer'],
        photographer_id: json['photographer_id'],
        photographer_url: json['photographer_url'],
        src: SourceModel.fromJson(json['src']));
  }
}

class DataPhotoModel {
  num? page;
  num? per_page;
  num? total_results;
  String? next_page;
  List<PhotoModel>? photos;

  DataPhotoModel({
    required this.next_page,
        required this.page,
        required this.per_page,
        required this.photos,
        required this.total_results
      });

  factory DataPhotoModel.fromJson(Map<String, dynamic> json){

    List<PhotoModel> mPhotos = [];

    for(Map<String, dynamic> eachPhoto in (json['photos'] ?? [])){
      mPhotos.add(PhotoModel.fromJson(eachPhoto));
    }

    return DataPhotoModel(
        next_page: json['next_page'],
        page: json['page'],
        per_page: json['per_page'],
        photos: mPhotos,
        total_results: json['total_results']);
  }
}