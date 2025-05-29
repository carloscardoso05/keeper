package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.item.ItemGateway;
import cardoso.carlos.keeper.domain.item.ItemId;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class DeleteItemUseCase {
	private final ItemGateway itemGateway;

	public DeleteItemUseCase(ItemGateway itemGateway) {
		this.itemGateway = itemGateway;
	}

	public void execute(Input input) {
		itemGateway.delete(input.itemId());
	}

	public record Input(ItemId itemId) {
		public Input {
			Assert.notNull(itemId, "ItemId must not be null");
		}
	}

}
