package cardoso.carlos.keeper.dtos.project;

import cardoso.carlos.keeper.domain.project.Project;

import java.util.UUID;

public record ProjectResponse(
		UUID id,
		String name,
		String description,
		UUID managerId
) {
	public ProjectResponse(Project project) {
		this(
				project.getId().value(),
				project.getName(),
				project.getDescription(),
				project.getManagerId().value()
		);
	}
}
