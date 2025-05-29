package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.brand.BrandId;
import cardoso.carlos.keeper.domain.item.ItemGateway;
import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class UpdateItemUseCase {
	private final ItemGateway itemGateway;

	public UpdateItemUseCase(ItemGateway itemGateway) {
		this.itemGateway = itemGateway;
	}

	public void execute(Input input) {
		var item = itemGateway.findById(input.itemId).orElseThrow(() -> new ItemNotFoundException(input.itemId));
		if (input.assetCode != null) {
			item.setAssetCode(input.assetCode);
		}
		if (input.name != null) {
			item.setName(input.name);
		}
		if (input.description != null) {
			item.setDescription(input.description);
		}
		if (input.brandId != null) {
			item.setBrandId(input.brandId);
		}
		itemGateway.save(item);
	}

	public record Input(
			ItemId itemId,
			String assetCode,
			String name,
			String description,
			BrandId brandId
	) {
		public Input {
			Assert.notNull(itemId, "ItemId must not be null");
		}
	}
}
