package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.BrandGateway;
import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.dtos.brand.BrandUpdateRequest;
import jakarta.validation.Valid;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class UpdateBrandUseCase {
	private final BrandGateway brandGateway;

	public UpdateBrandUseCase(BrandGateway brandGateway) {
		this.brandGateway = brandGateway;
	}

	public void execute(BrandId brandId, @Valid BrandUpdateRequest request) {
		Assert.notNull(brandId, "BrandId is required");

		var brand = brandGateway.findById(brandId).orElseThrow(() -> new BrandNotFoundException(brandId));
		brand.setName(request.name());
		brandGateway.save(brand);
	}
}
