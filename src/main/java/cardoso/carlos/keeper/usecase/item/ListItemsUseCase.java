package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.brand.Brand;
import cardoso.carlos.keeper.domain.item.Item;
import cardoso.carlos.keeper.domain.item.ItemGateway;
import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.stereotype.Component;

@Component
public class ListItemsUseCase {
	private final ItemGateway itemGateway;

	public ListItemsUseCase(ItemGateway itemGateway) {
		this.itemGateway = itemGateway;
	}

	public record Output() {
	}
}
