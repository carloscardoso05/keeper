package cardoso.carlos.keeper.dtos.brand;

import cardoso.carlos.keeper.domain.brand.Brand;

import java.util.UUID;

public record BrandResponse(UUID id, String name) {
	public BrandResponse(Brand brand) {
		this(brand.getId().value(), brand.getName());
	}
}
