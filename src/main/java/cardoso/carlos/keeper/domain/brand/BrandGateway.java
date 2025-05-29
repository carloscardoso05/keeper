package cardoso.carlos.keeper.domain.brand;

import cardoso.carlos.keeper.domain.CrudGateway;

import java.util.Optional;

public interface BrandGateway extends CrudGateway<Brand, BrandId> {

	Optional<Brand> findByName(String name);

}
