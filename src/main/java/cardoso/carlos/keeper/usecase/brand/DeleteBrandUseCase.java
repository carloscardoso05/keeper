package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.BrandGateway;
import cardoso.carlos.keeper.domain.brand.BrandId;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class DeleteBrandUseCase {
	private final BrandGateway brandGateway;

	public DeleteBrandUseCase(BrandGateway brandGateway) {
		this.brandGateway = brandGateway;
	}

	public void execute(BrandId brandId) {
		Assert.notNull(brandId, "BrandId must not be null");

		brandGateway.delete(brandId);
	}
}
