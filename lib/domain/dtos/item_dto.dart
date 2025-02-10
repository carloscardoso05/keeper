class ItemDto {
  int? id;
  String assetCode;
  String name;
  String description;
  int? holderId;

  ItemDto({
    this.id,
    this.assetCode = '',
    this.name = '',
    this.description = '',
    this.holderId,
  });
}
