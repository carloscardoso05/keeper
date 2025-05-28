package cardoso.carlos.keeper.items.persistence;

import cardoso.carlos.keeper.items.AllocationId;
import cardoso.carlos.keeper.items.Item;
import cardoso.carlos.keeper.items.ItemId;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ItemEntityMapper {
    private final BrandEntityMapper brandEntityMapper;

    public Item toModel(ItemEntity itemEntity) {
        return new Item(
                new ItemId(itemEntity.getId()),
                itemEntity.getAssetCode(),
                itemEntity.getName(),
                itemEntity.getDescription(),
                brandEntityMapper.toModel(itemEntity.getBrand()),
                new AllocationId(itemEntity.getAllocation().getId())
        );
    }

    public ItemEntity toEntity(Item item, AllocationEntity allocationEntity) {
        return new ItemEntity(
                item.id().value(),
                item.assetCode(),
                item.name(),
                item.description(),
                brandEntityMapper.toEntity(item.brand()),
                allocationEntity
        );
    }
}
