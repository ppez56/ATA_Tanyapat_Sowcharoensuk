import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.time.Duration;

public class SeleniumTest {
    private WebDriver driver;
    private WebDriverWait wait;

    @BeforeClass
    public void setUp() {
        System.setProperty("webdriver.chrome.driver", "/Users/peempeem/Downloads/chromedriver-mac-arm64/chromedriver");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
    }

    @Test(priority = 1)
    public void openSaucedemo() throws InterruptedException {
        Thread.sleep(2000);
        driver.get("https://www.saucedemo.com/");
    }

    @Test(priority = 2)
    public void verifyLoginWithValidUser() throws InterruptedException {
        Thread.sleep(2000);
        driver.findElement(By.id("user-name")).sendKeys("standard_user");
        driver.findElement(By.id("password")).sendKeys("secret_sauce");
        driver.findElement(By.id("login-button")).click();

        WebElement productTitle = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[@data-test='title']")));
        Assert.assertEquals(productTitle.getText(), "Products");
    }

    @Test(priority = 3)
    public void verifySortingProductsFromHighToLow() throws InterruptedException {
        Thread.sleep(2000);
        Select sortingDropdown = new Select(driver.findElement(By.xpath("//select[@class='product_sort_container']")));
        sortingDropdown.selectByValue("hilo");
    }

    @Test(priority = 4)
    public void verifyAddingCart2Items() throws InterruptedException {
        Thread.sleep(2000);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("add-to-cart-sauce-labs-fleece-jacket"))).click();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("add-to-cart-sauce-labs-onesie"))).click();
    }

    @Test(priority = 5)
    public void verifyProceedToCheckOut() throws InterruptedException {
        Thread.sleep(2000);
        driver.findElement(By.xpath("//a[@class='shopping_cart_link']")).click();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("checkout"))).click();
        Thread.sleep(1000);
        driver.findElement(By.id("first-name")).sendKeys("Tanyapat");
        driver.findElement(By.id("last-name")).sendKeys("Sowcharoensuk");
        driver.findElement(By.id("postal-code")).sendKeys("10500");
        Thread.sleep(1000);
        driver.findElement(By.id("continue")).click();
    }

    @Test(priority = 6)
    public void verifyCheckOutSummary() throws InterruptedException {
        Thread.sleep(3000);
        WebElement summary = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='summary_info']")));
        System.out.println("The Checkout Summary: " + summary.getText());
        Thread.sleep(1000);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("finish"))).click();
        Thread.sleep(1000);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("back-to-products"))).click();
    }

    @Test(priority = 7)
    public void verifyLogoutSuccess() throws InterruptedException {
        Thread.sleep(2000);
        driver.findElement(By.id("react-burger-menu-btn")).click();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("logout_sidebar_link"))).click();
    }

    @Test(priority = 8)
    public void verifyValidateLockedOutUser() throws InterruptedException {
        Thread.sleep(2000);
        driver.findElement(By.id("user-name")).sendKeys("locked_out_user");
        driver.findElement(By.id("password")).sendKeys("secret_sauce");
        driver.findElement(By.id("login-button")).click();
        Thread.sleep(2000);
        WebElement error = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//h3[@data-test='error']")));
        System.out.println("The Error are: " + error.getText());
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
