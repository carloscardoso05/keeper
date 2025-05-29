package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.Brand;
import cardoso.carlos.keeper.domain.brand.BrandGateway;
import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.dtos.brand.BrandResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class FindBrandByIdUseCase {
	private final BrandGateway brandGateway;

	public FindBrandByIdUseCase(BrandGateway brandGateway) {
		this.brandGateway = brandGateway;
	}

	public BrandResponse execute(BrandId brandId) throws BrandNotFoundException {
		Assert.notNull(brandId, "BrandId must not be null");

		return brandGateway.findById(brandId)
						   .map(BrandResponse::new)
						   .orElseThrow(() -> new BrandNotFoundException(brandId));
	}
}
