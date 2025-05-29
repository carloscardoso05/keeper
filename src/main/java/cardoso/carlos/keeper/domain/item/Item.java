package cardoso.carlos.keeper.domain.item;

import cardoso.carlos.keeper.domain.brand.BrandId;
import jakarta.annotation.Nullable;
import org.springframework.util.Assert;

public class Item {
	private ItemId id;
	private String assetCode;
	private String name;
	private String description;
	private BrandId brandId;
	@Nullable
	private Allocation allocation;

	public Item(
			ItemId id,
			String assetCode,
			String name,
			String description,
			BrandId brandId,
			@Nullable Allocation allocation
	) {
		setId(id);
		setAssetCode(assetCode);
		setName(name);
		setDescription(description);
		setBrandId(brandId);
		setAllocation(allocation);
	}

	public ItemId getId() {
		return id;
	}

	public void setId(ItemId id) {
		Assert.notNull(id, "Id must not be null");
		this.id = id;
	}

	public String getAssetCode() {
		Assert.hasText(assetCode, "Asset code must not be empty or null");
		return assetCode;
	}

	public void setAssetCode(String assetCode) {
		this.assetCode = assetCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		Assert.hasText(name, "Name must not be empty or null");
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		Assert.notNull(brandId, "Brand Id must not be null");
		this.description = description;
	}

	public BrandId getBrandId() {
		Assert.notNull(description, "Description must not be null");
		return brandId;
	}

	public void setBrandId(BrandId brandId) {
		this.brandId = brandId;
	}

	public Allocation getAllocation() {
		return allocation;
	}

	public void setAllocation(@Nullable Allocation allocation) {
		this.allocation = allocation;
	}
}
