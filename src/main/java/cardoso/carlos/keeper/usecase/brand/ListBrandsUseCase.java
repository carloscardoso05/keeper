package cardoso.carlos.keeper.usecase.brand;

import cardoso.carlos.keeper.domain.brand.BrandGateway;
import cardoso.carlos.keeper.dtos.brand.BrandResponse;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ListBrandsUseCase {
	private final BrandGateway brandGateway;

	public ListBrandsUseCase(BrandGateway brandGateway) {
		this.brandGateway = brandGateway;
	}

	public List<BrandResponse> execute(int page, int size) {
		if (page < 0 || size <= 0) {
			throw new IllegalArgumentException("Page must be >= 0 and size must be > 0");
		}

		return brandGateway.findAll(page, size)
						   .stream()
						   .map(BrandResponse::new)
						   .toList();
	}
}
