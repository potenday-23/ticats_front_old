import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tickets/presentation/authentication/data/model/user_model.dart';
import 'package:tickets/presentation/home/data/model/category_model.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
class TicketModel with _$TicketModel {
  const factory TicketModel({
    required int id,
    required String title,
    required String imageUrl,
    required DateTime ticketDate,
    required double rating,
    required String? memo,
    required String? seat,
    required String? location,
    required int? price,
    required String? friend,
    required String? ticketType,
    required String? layoutType,
    required bool isLike,
    required String isPrivate,
    required CategoryModel category,
    required Member member,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, Object?> json) => _$TicketModelFromJson(json);
}
