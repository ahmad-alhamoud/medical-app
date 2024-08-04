import 'package:json_annotation/json_annotation.dart';

part 'blog_response_body.g.dart';

@JsonSerializable(createToJson: false)
class BlogResponseBody {
  BlogResponseBody({
    required this.data,
  });

  final List<BlogResponseData>? data;

  factory BlogResponseBody.fromJson(Map<String, dynamic> json) => _$BlogResponseBodyFromJson(json);

}

@JsonSerializable(createToJson: false)
class BlogResponseData {
  BlogResponseData({
    required this.id,
    required this.attributes,
  });

  final int? id;
  final Attributes? attributes;

  factory BlogResponseData.fromJson(Map<String, dynamic> json) => _$BlogResponseDataFromJson(json);

}

@JsonSerializable(createToJson: false)
class Attributes {
  Attributes({
    required this.title,
    required this.mainImage,
    required this.paragraph,
  });

  final String? title;
  final MainImage? mainImage;
  final List<Paragraph>? paragraph;

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);

}

@JsonSerializable(createToJson: false)
class MainImage {
  MainImage({
    required this.data,
  });

  final List<MainImageData>? data;

  factory MainImage.fromJson(Map<String, dynamic> json) => _$MainImageFromJson(json);

}

@JsonSerializable(createToJson: false)
class MainImageData {
  MainImageData({
    required this.id,
    required this.attributes,
  });

  final int? id;
  final ImageAttributes? attributes;

  factory MainImageData.fromJson(Map<String, dynamic> json) => _$MainImageDataFromJson(json);

}

@JsonSerializable(createToJson: false)
class ImageAttributes {
  ImageAttributes({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory ImageAttributes.fromJson(Map<String, dynamic> json) => _$ImageAttributesFromJson(json);

}

@JsonSerializable(createToJson: false)
class Paragraph {
  Paragraph({
    required this.id,
    required this.title,
    required this.content,
  });

  final int? id;
  final String? title;
  final String? content;

  factory Paragraph.fromJson(Map<String, dynamic> json) => _$ParagraphFromJson(json);

}


