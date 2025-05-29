package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.BrandId;

public class BrandNotFoundException extends RuntimeException {
	public BrandNotFoundException(BrandId brandId) {
		super(String.format("Brand with brandId %s not found", brandId.value()));
	}
}
