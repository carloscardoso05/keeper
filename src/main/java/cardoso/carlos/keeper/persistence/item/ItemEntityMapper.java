package cardoso.carlos.keeper.persistence.item;

import cardoso.carlos.keeper.application.item.Item;
import cardoso.carlos.keeper.persistence.allocation.AllocationEntity;
import cardoso.carlos.keeper.persistence.brand.BrandEntityMapper;
import org.springframework.stereotype.Component;

@Component
public class ItemEntityMapper {
    private final BrandEntityMapper brandEntityMapper;

    public ItemEntityMapper(BrandEntityMapper brandEntityMapper) {
        this.brandEntityMapper = brandEntityMapper;
    }

    public Item toModel(ItemEntity itemEntity) {
        return new Item(
                itemEntity.getId(),
                itemEntity.getAssetCode(),
                itemEntity.getName(),
                itemEntity.getDescription(),
                brandEntityMapper.toModel(itemEntity.getBrand()),
                itemEntity.getAllocation().getId()
        );
    }

    public ItemEntity toEntity(Item item, AllocationEntity allocationEntity) {
        return new ItemEntity(
                item.id(),
                item.assetCode(),
                item.name(),
                item.description(),
                brandEntityMapper.toEntity(item.brand()),
                allocationEntity
        );
    }
}
