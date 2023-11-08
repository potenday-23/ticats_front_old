// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketModelImpl _$$TicketModelImplFromJson(Map<String, dynamic> json) =>
    _$TicketModelImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      ticketDate: DateTime.parse(json['ticketDate'] as String),
      rating: (json['rating'] as num).toDouble(),
      memo: json['memo'] as String?,
      seat: json['seat'] as String?,
      location: json['location'] as String?,
      price: json['price'] as int?,
      friend: json['friend'] as String?,
      ticketType: json['ticketType'] as String?,
      layoutType: json['layoutType'] as String?,
      isLike: json['isLike'] as bool,
      isPrivate: json['isPrivate'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TicketModelImplToJson(_$TicketModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'ticketDate': instance.ticketDate.toIso8601String(),
      'rating': instance.rating,
      'memo': instance.memo,
      'seat': instance.seat,
      'location': instance.location,
      'price': instance.price,
      'friend': instance.friend,
      'ticketType': instance.ticketType,
      'layoutType': instance.layoutType,
      'isLike': instance.isLike,
      'isPrivate': instance.isPrivate,
      'category': instance.category,
      'member': instance.member,
    };
