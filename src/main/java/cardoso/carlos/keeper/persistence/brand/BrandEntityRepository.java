package cardoso.carlos.keeper.persistence.brand;

import cardoso.carlos.keeper.application.brand.BrandId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrandEntityRepository extends JpaRepository<BrandEntity, BrandId> {
}
