package cardoso.carlos.keeper;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.modulith.core.ApplicationModules;

@SpringBootTest
class KeeperApplicationTests {
    private static final Logger log = LoggerFactory.getLogger(KeeperApplicationTests.class);

    @Test
    void contextLoads() {
    }

    @Test
    void testModules() {
        var modules = ApplicationModules.of(KeeperApplication.class);
        log.info("Modules:\n{}", modules);
        modules.verify();
    }

}
