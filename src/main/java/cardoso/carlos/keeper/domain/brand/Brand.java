package cardoso.carlos.keeper.domain.brand;

import org.springframework.util.Assert;

public class Brand {
    private BrandId id;
    private String name;

    public Brand(BrandId id, String name) {
        Assert.notNull(id, "Id must not be null");
        Assert.hasText(name, "Name must not be empty or null");
        this.id = id;
        this.name = name;
    }

    public BrandId getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        // TODO verificar se o nome já existe
        Assert.hasText(name, "Name must not be empty or null");
        this.name = name;
    }
}
