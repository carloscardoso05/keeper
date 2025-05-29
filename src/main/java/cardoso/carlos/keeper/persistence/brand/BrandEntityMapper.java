package cardoso.carlos.keeper.persistence.brand;

import cardoso.carlos.keeper.domain.brand.Brand;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

@Component
public class BrandEntityMapper {
    public BrandEntity toEntity(@NonNull Brand brand) {
        return new BrandEntity() {{
            setId(brand.id());
            setName(brand.name());
        }};
    }

    public Brand toModel(@NonNull BrandEntity brandEntity) {
        return new Brand(brandEntity.getId(), brandEntity.getName());
    }
}
