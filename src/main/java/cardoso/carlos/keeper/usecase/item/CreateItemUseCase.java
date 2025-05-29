package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.domain.item.Item;
import cardoso.carlos.keeper.domain.item.ItemGateway;
import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class CreateItemUseCase {
	private final ItemGateway itemGateway;

	public CreateItemUseCase(ItemGateway itemGateway) {
		this.itemGateway = itemGateway;
	}

	public void execute(Input input) {
		itemGateway.save(
				new Item(
						new ItemId(),
						input.assetCode,
						input.name,
						input.description,
						new BrandId(input.brandId()),
						null
				)
		);
	}

	public record Input(
			String assetCode,
			String name,
			String description,
			UUID brandId
	) {
	}
}