package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.Brand;
import cardoso.carlos.keeper.domain.brand.BrandGateway;
import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.dtos.brand.BrandCreateRequest;
import jakarta.validation.Valid;
import org.springframework.stereotype.Component;

@Component
public class CreateBrandUseCase {
	private final BrandGateway brandGateway;

	public CreateBrandUseCase(BrandGateway brandGateway) {
		this.brandGateway = brandGateway;
	}

	public void execute(@Valid BrandCreateRequest request) {
		var brand = new Brand(new BrandId(), request.name());
		brandGateway.save(brand);
	}
}
