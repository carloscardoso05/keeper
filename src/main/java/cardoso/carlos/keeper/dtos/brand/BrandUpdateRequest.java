package cardoso.carlos.keeper.dtos.brand;

import jakarta.validation.constraints.NotBlank;

public record BrandUpdateRequest(
		@NotBlank(message = "Name must not be blank")
		String name
) {
}
