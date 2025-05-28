package cardoso.carlos.keeper.items.persistence;

import cardoso.carlos.keeper.items.Brand;
import cardoso.carlos.keeper.items.BrandId;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

@Component
public class BrandEntityMapper {
    public BrandEntity toEntity(@NonNull Brand brand) {
        return new BrandEntity() {{
            setId(brand.id().value());
            setName(brand.name());
        }};
    }

    public Brand toModel(@NonNull BrandEntity brandEntity) {
        return new Brand(new BrandId(brandEntity.getId()), brandEntity.getName());
    }
}
