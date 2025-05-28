package cardoso.carlos.keeper.items.persistence;

import cardoso.carlos.keeper.application.brand.Brand;
import cardoso.carlos.keeper.application.brand.BrandId;
import cardoso.carlos.keeper.persistence.brand.BrandEntity;
import cardoso.carlos.keeper.persistence.brand.BrandEntityMapper;
import org.junit.jupiter.api.Test;

import java.util.concurrent.atomic.AtomicReference;

import static org.junit.jupiter.api.Assertions.*;

class BrandEntityMapperTest {
    private final BrandEntityMapper mapper = new BrandEntityMapper();

    @Test
    void givenBrand_whenToEntity_thenReturnBrandEntity() {
        // Given
        var id = new BrandId();
        var name = "Test Brand";
        var brand = new Brand(id, name);

        // When
        var brandRef = new AtomicReference<BrandEntity>();
        assertDoesNotThrow(() -> brandRef.set(mapper.toEntity(brand)));
        var brandEntity = brandRef.get();

        // Then
        assertNotNull(brandRef);
        assertEquals(id, brandEntity.getId());
        assertEquals(name, brandEntity.getName());
    }

    @Test
    void givenBrandEntity_whenToModel_thenReturnBrand() {
        // Given
        var id = new BrandId();
        var name = "Test Brand";
        var brandEntity = new BrandEntity() {{
            setId(id);
            setName(name);
        }};

        // When
        var brandRef = new AtomicReference<Brand>();
        assertDoesNotThrow(() -> brandRef.set(mapper.toModel(brandEntity)));
        var brand = brandRef.get();

        // Then
        assertNotNull(brandRef);
        assertEquals(id, brand.id());
        assertEquals(name, brand.name());
    }
}