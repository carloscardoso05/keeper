package cardoso.carlos.keeper.dtos.project;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ProjectCreateRequest(
		@NotBlank(message = "Name must not be empty")
		String name,
		@NotNull(message = "Description must not be null")
		String description
) {
}
