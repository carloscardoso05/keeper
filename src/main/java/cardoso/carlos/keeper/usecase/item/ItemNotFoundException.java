package cardoso.carlos.keeper.usecase.item;

import cardoso.carlos.keeper.domain.item.ItemId;

public class ItemNotFoundException extends RuntimeException {
	public ItemNotFoundException(ItemId itemId) {
		super(String.format("Item with ID %s not found", itemId.value()));
	}
}
