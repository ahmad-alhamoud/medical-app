// import 'package:json_annotation/json_annotation.dart';
//
// part 'blog_response_body.g.dart';
//
//
//
// @JsonSerializable()
// class Blog {
//   Blog({
//     required this.data,
//     required this.meta,
//   });
//
//   final List<BlogDatum>? data;
//   final Meta? meta;
//
//   factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
//
//   Map<String, dynamic> toJson() => _$BlogToJson(this);
//
// }
//
// @JsonSerializable()
// class BlogDatum {
//   BlogDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final PurpleAttributes? attributes;
//
//   factory BlogDatum.fromJson(Map<String, dynamic> json) => _$BlogDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$BlogDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class PurpleAttributes {
//   PurpleAttributes({
//     required this.title,
//     required this.date,
//     required this.mainImage,
//     required this.paragraph,
//     required this.relatedblogs,
//     required this.blogSlug,
//     required this.seo,
//     required this.tags,
//     required this.authors,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? title;
//   final DateTime? date;
//   final MainImage? mainImage;
//   final List<Paragraph>? paragraph;
//   final Relatedblogs? relatedblogs;
//   final String? blogSlug;
//
//   @JsonKey(name: 'SEO')
//   final Seo? seo;
//   final String? tags;
//   final Authors? authors;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final DateTime? publishedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory PurpleAttributes.fromJson(Map<String, dynamic> json) => _$PurpleAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PurpleAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Authors {
//   Authors({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.profile,
//   });
//
//   final int? id;
//   final String? name;
//   final String? description;
//   final GImage? profile;
//
//   factory Authors.fromJson(Map<String, dynamic> json) => _$AuthorsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$AuthorsToJson(this);
//
// }
//
// @JsonSerializable()
// class GImage {
//   GImage({
//     required this.data,
//   });
//
//   final List<GImageDatum>? data;
//
//   factory GImage.fromJson(Map<String, dynamic> json) => _$GImageFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GImageToJson(this);
//
// }
//
// @JsonSerializable()
// class GImageDatum {
//   GImageDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final FluffyAttributes? attributes;
//
//   factory GImageDatum.fromJson(Map<String, dynamic> json) => _$GImageDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GImageDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class FluffyAttributes {
//   FluffyAttributes({
//     required this.name,
//     required this.alternativeText,
//     required this.caption,
//     required this.width,
//     required this.height,
//     required this.formats,
//     required this.hash,
//     required this.ext,
//     required this.mime,
//     required this.size,
//     required this.url,
//     required this.previewUrl,
//     required this.provider,
//     required this.providerMetadata,
//     required this.related,
//     required this.folder,
//     required this.folderPath,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? name;
//   final String? alternativeText;
//   final String? caption;
//   final int? width;
//   final int? height;
//   final String? formats;
//   final String? hash;
//   final String? ext;
//   final String? mime;
//   final int? size;
//   final String? url;
//   final String? previewUrl;
//   final String? provider;
//
//   @JsonKey(name: 'provider_metadata')
//   final String? providerMetadata;
//   final Related? related;
//   final CreatedBy? folder;
//   final String? folderPath;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory FluffyAttributes.fromJson(Map<String, dynamic> json) => _$FluffyAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$FluffyAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class CreatedBy {
//   CreatedBy({
//     required this.data,
//   });
//
//   final Dat? data;
//
//   factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CreatedByToJson(this);
//
// }
//
// @JsonSerializable()
// class Dat {
//   Dat({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final TentacledAttributes? attributes;
//
//   factory Dat.fromJson(Map<String, dynamic> json) => _$DatFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DatToJson(this);
//
// }
//
// @JsonSerializable()
// class TentacledAttributes {
//
//   TentacledAttributes({required this.json});
//
//   factory TentacledAttributes.fromJson(Map<String, dynamic> json) => _$TentacledAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TentacledAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Related {
//   Related({
//     required this.data,
//   });
//
//   final List<Dat>? data;
//
//   factory Related.fromJson(Map<String, dynamic> json) => _$RelatedFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RelatedToJson(this);
//
// }
//
// @JsonSerializable()
// class MainImage {
//   MainImage({
//     required this.data,
//   });
//
//   final List<PurpleDatum>? data;
//
//   factory MainImage.fromJson(Map<String, dynamic> json) => _$MainImageFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MainImageToJson(this);
//
// }
//
// @JsonSerializable()
// class PurpleDatum {
//   PurpleDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final StickyAttributes? attributes;
//
//   factory PurpleDatum.fromJson(Map<String, dynamic> json) => _$PurpleDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PurpleDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class StickyAttributes {
//   StickyAttributes({
//     required this.name,
//     required this.alternativeText,
//     required this.caption,
//     required this.width,
//     required this.height,
//     required this.formats,
//     required this.hash,
//     required this.ext,
//     required this.mime,
//     required this.size,
//     required this.url,
//     required this.previewUrl,
//     required this.provider,
//     required this.providerMetadata,
//     required this.related,
//     required this.folder,
//     required this.folderPath,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? name;
//   final String? alternativeText;
//   final String? caption;
//   final int? width;
//   final int? height;
//   final String? formats;
//   final String? hash;
//   final String? ext;
//   final String? mime;
//   final int? size;
//   final String? url;
//   final String? previewUrl;
//   final String? provider;
//
//   @JsonKey(name: 'provider_metadata')
//   final String? providerMetadata;
//   final Related? related;
//   final Folder? folder;
//   final String? folderPath;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory StickyAttributes.fromJson(Map<String, dynamic> json) => _$StickyAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$StickyAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Folder {
//   Folder({
//     required this.data,
//   });
//
//   final FolderData? data;
//
//   factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
//
//   Map<String, dynamic> toJson() => _$FolderToJson(this);
//
// }
//
// @JsonSerializable()
// class FolderData {
//   FolderData({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final IndigoAttributes? attributes;
//
//   factory FolderData.fromJson(Map<String, dynamic> json) => _$FolderDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$FolderDataToJson(this);
//
// }
//
// @JsonSerializable()
// class IndigoAttributes {
//   IndigoAttributes({
//     required this.name,
//     required this.pathId,
//     required this.parent,
//     required this.children,
//     required this.files,
//     required this.path,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? name;
//   final int? pathId;
//   final CreatedBy? parent;
//   final Related? children;
//   final Files? files;
//   final String? path;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory IndigoAttributes.fromJson(Map<String, dynamic> json) => _$IndigoAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$IndigoAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Files {
//   Files({
//     required this.data,
//   });
//
//   final List<FilesDatum>? data;
//
//   factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$FilesToJson(this);
//
// }
//
// @JsonSerializable()
// class FilesDatum {
//   FilesDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final IndecentAttributes? attributes;
//
//   factory FilesDatum.fromJson(Map<String, dynamic> json) => _$FilesDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$FilesDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class IndecentAttributes {
//   IndecentAttributes({
//     required this.name,
//     required this.alternativeText,
//     required this.caption,
//     required this.width,
//     required this.height,
//     required this.formats,
//     required this.hash,
//     required this.ext,
//     required this.mime,
//     required this.size,
//     required this.url,
//     required this.previewUrl,
//     required this.provider,
//     required this.providerMetadata,
//     required this.related,
//     required this.folder,
//     required this.folderPath,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? name;
//   final String? alternativeText;
//   final String? caption;
//   final int? width;
//   final int? height;
//   final String? formats;
//   final String? hash;
//   final String? ext;
//   final String? mime;
//   final int? size;
//   final String? url;
//   final String? previewUrl;
//   final String? provider;
//
//   @JsonKey(name: 'provider_metadata')
//   final String? providerMetadata;
//   final Related? related;
//   final CreatedBy? folder;
//   final String? folderPath;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final PurpleCreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory IndecentAttributes.fromJson(Map<String, dynamic> json) => _$IndecentAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$IndecentAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class PurpleCreatedBy {
//   PurpleCreatedBy({
//     required this.data,
//   });
//
//   final CreatedByData? data;
//
//   factory PurpleCreatedBy.fromJson(Map<String, dynamic> json) => _$PurpleCreatedByFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PurpleCreatedByToJson(this);
//
// }
//
// @JsonSerializable()
// class CreatedByData {
//   CreatedByData({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final HilariousAttributes? attributes;
//
//   factory CreatedByData.fromJson(Map<String, dynamic> json) => _$CreatedByDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CreatedByDataToJson(this);
//
// }
//
// @JsonSerializable()
// class HilariousAttributes {
//   HilariousAttributes({
//     required this.firstname,
//     required this.lastname,
//     required this.username,
//     required this.email,
//     required this.resetPasswordToken,
//     required this.registrationToken,
//     required this.isActive,
//     required this.roles,
//     required this.blocked,
//     required this.preferedLanguage,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? firstname;
//   final String? lastname;
//   final String? username;
//   final String? email;
//   final String? resetPasswordToken;
//   final String? registrationToken;
//   final bool? isActive;
//   final Roles? roles;
//   final bool? blocked;
//   final String? preferedLanguage;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory HilariousAttributes.fromJson(Map<String, dynamic> json) => _$HilariousAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$HilariousAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Roles {
//   Roles({
//     required this.data,
//   });
//
//   final List<RolesDatum>? data;
//
//   factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RolesToJson(this);
//
// }
//
// @JsonSerializable()
// class RolesDatum {
//   RolesDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final AmbitiousAttributes? attributes;
//
//   factory RolesDatum.fromJson(Map<String, dynamic> json) => _$RolesDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RolesDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class AmbitiousAttributes {
//   AmbitiousAttributes({
//     required this.name,
//     required this.code,
//     required this.description,
//     required this.users,
//     required this.permissions,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? name;
//   final String? code;
//   final String? description;
//   final Related? users;
//   final Permissions? permissions;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory AmbitiousAttributes.fromJson(Map<String, dynamic> json) => _$AmbitiousAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$AmbitiousAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Permissions {
//   Permissions({
//     required this.data,
//   });
//
//   final List<PermissionsDatum>? data;
//
//   factory Permissions.fromJson(Map<String, dynamic> json) => _$PermissionsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PermissionsToJson(this);
//
// }
//
// @JsonSerializable()
// class PermissionsDatum {
//   PermissionsDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final CunningAttributes? attributes;
//
//   factory PermissionsDatum.fromJson(Map<String, dynamic> json) => _$PermissionsDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PermissionsDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class CunningAttributes {
//   CunningAttributes({
//     required this.action,
//     required this.actionParameters,
//     required this.subject,
//     required this.properties,
//     required this.conditions,
//     required this.role,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? action;
//   final String? actionParameters;
//   final String? subject;
//   final String? properties;
//   final String? conditions;
//   final CreatedBy? role;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory CunningAttributes.fromJson(Map<String, dynamic> json) => _$CunningAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CunningAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Paragraph {
//   Paragraph({
//     required this.id,
//     required this.title,
//     required this.content,
//   });
//
//   final int? id;
//   final String? title;
//   final String? content;
//
//   factory Paragraph.fromJson(Map<String, dynamic> json) => _$ParagraphFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ParagraphToJson(this);
//
// }
//
// @JsonSerializable()
// class Relatedblogs {
//   Relatedblogs({
//     required this.data,
//   });
//
//   final List<RelatedblogsDatum>? data;
//
//   factory Relatedblogs.fromJson(Map<String, dynamic> json) => _$RelatedblogsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RelatedblogsToJson(this);
//
// }
//
// @JsonSerializable()
// class RelatedblogsDatum {
//   RelatedblogsDatum({
//     required this.id,
//     required this.attributes,
//   });
//
//   final int? id;
//   final MagentaAttributes? attributes;
//
//   factory RelatedblogsDatum.fromJson(Map<String, dynamic> json) => _$RelatedblogsDatumFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RelatedblogsDatumToJson(this);
//
// }
//
// @JsonSerializable()
// class MagentaAttributes {
//   MagentaAttributes({
//     required this.title,
//     required this.date,
//     required this.mainImage,
//     required this.paragraph,
//     required this.relatedblogs,
//     required this.blogSlug,
//     required this.seo,
//     required this.tags,
//     required this.authors,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });
//
//   final String? title;
//   final DateTime? date;
//   final GImage? mainImage;
//   final List<Paragraph>? paragraph;
//   final Related? relatedblogs;
//   final String? blogSlug;
//
//   @JsonKey(name: 'SEO')
//   final Seo? seo;
//   final String? tags;
//   final Authors? authors;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final DateTime? publishedAt;
//   final CreatedBy? createdBy;
//   final CreatedBy? updatedBy;
//
//   factory MagentaAttributes.fromJson(Map<String, dynamic> json) => _$MagentaAttributesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MagentaAttributesToJson(this);
//
// }
//
// @JsonSerializable()
// class Seo {
//   Seo({
//     required this.id,
//     required this.documentTitle,
//     required this.ogTitle,
//     required this.gImage,
//     required this.keywords,
//     required this.ogDescription,
//   });
//
//   final int? id;
//
//   @JsonKey(name: 'DocumentTitle')
//   final String? documentTitle;
//   final String? ogTitle;
//   final GImage? gImage;
//   final String? keywords;
//   final String? ogDescription;
//
//   factory Seo.fromJson(Map<String, dynamic> json) => _$SeoFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SeoToJson(this);
//
// }
//
// @JsonSerializable()
// class Meta {
//   Meta({
//     required this.pagination,
//   });
//
//   final Pagination? pagination;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MetaToJson(this);
//
// }
//
// @JsonSerializable()
// class Pagination {
//   Pagination({
//     required this.page,
//     required this.pageSize,
//     required this.pageCount,
//     required this.total,
//   });
//
//   final int? page;
//   final int? pageSize;
//   final int? pageCount;
//   final int? total;
//
//   factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PaginationToJson(this);
//
// }
