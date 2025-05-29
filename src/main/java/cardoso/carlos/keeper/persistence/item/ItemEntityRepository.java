package cardoso.carlos.keeper.persistence.item;

import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemEntityRepository extends JpaRepository<ItemEntity, ItemId> {
}
