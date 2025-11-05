// GENERATED CODE - DO NOT MODIFY BY HAND

/*part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 0;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      brand: fields[8] as CategoryEntity,
      id: fields[0] as String,
      imageCover: fields[1] as String,
      images: (fields[2] as List).cast<String>(),
      title: fields[3] as String,
      description: fields[4] as String,
      price: fields[5] as num,
      rating: fields[6] as num,
      ratingCount: fields[7] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageCover)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.ratingCount)
      ..writeByte(8)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}*/
