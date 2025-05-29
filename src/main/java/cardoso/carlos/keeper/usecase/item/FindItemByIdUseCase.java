package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.domain.item.Item;
import cardoso.carlos.keeper.domain.item.ItemGateway;
import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.stereotype.Component;

@Component
public class FindItemByIdUseCase {
	private final ItemGateway itemGateway;

	public FindItemByIdUseCase(ItemGateway itemGateway) {
		this.itemGateway = itemGateway;
	}

	public Output execute(Input input) {
		return itemGateway
				.findById(input.itemId)
				.map(Output::new)
				.orElseThrow(() -> new ItemNotFoundException(input.itemId));
	}

	public record Input(ItemId itemId) {
	}

	public record Output(
			ItemId itemId,
			String assetCode,
			String name,
			String description,
			BrandId brandId
	) {
		public Output(Item item) {
			this(
					item.getId(),
					item.getAssetCode(),
					item.getName(),
					item.getDescription(),
					item.getBrandId()
			);
		}
	}
}
