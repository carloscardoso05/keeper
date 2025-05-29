package cardoso.carlos.keeper.usecase.project;

import cardoso.carlos.keeper.domain.project.ProjectId;

public class ProjectNotFoundException extends RuntimeException {
	public ProjectNotFoundException(ProjectId projectId) {
		super(String.format("Project with id %s not found", projectId.value()));
	}
}
