package cardoso.carlos.keeper.dtos.project;

import cardoso.carlos.keeper.validations.nullOrNotEmpty.NullOrNotBlank;

public record ProjectUpdateRequest(
		@NullOrNotBlank(message = "Name must not be blank")
		String name,
		@NullOrNotBlank(message = "Description must not be blank")
		String description
) {
}
