package cardoso.carlos.keeper.domain;

import java.util.List;
import java.util.Optional;

public interface CrudGateway<Model, Id> {
	void save(Model model);

	void delete(Id id);

	Optional<Model> findById(Id id);

	List<Model> findAll(int page, int size);
}
