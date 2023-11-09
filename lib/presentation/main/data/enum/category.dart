enum CategoryType {
  movie("영화", categoryId: 1, fileName: "movie"),
  book("독서", categoryId: 6, fileName: "book"),
  musical("뮤지컬", categoryId: 2, fileName: "musical"),
  exhibition("전시회", categoryId: 4, fileName: "exhibition"),
  drama("드라마", categoryId: 3, fileName: "drama"),
  popup("팝업스토어", categoryId: 7, fileName: "popup"),
  sports("스포츠", categoryId: 8, fileName: "sports"),
  etc("기타", categoryId: 9, fileName: "etc");

  final String name;
  final int categoryId;
  final String fileName;

  const CategoryType(this.name, {required this.categoryId, required this.fileName});
}
