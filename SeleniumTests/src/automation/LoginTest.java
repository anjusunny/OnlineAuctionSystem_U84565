package automation;

import org.testng.annotations.Test;
import org.testng.annotations.BeforeMethod;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;

public class LoginTest 
{
	
	private WebDriver driver;
	private String baseWebUrl = "http://localhost:8080/OnlineAuctionSystem/";
	
	
	@BeforeMethod
	public void beforeMethod() 
	{
		System.setProperty("webdriver.chrome.driver", "D:\\chromedriver.exe");
		driver = new ChromeDriver();
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
	}
	
	@Test
	public void TestLogin() 
	{
		driver.get(baseWebUrl);
		driver.manage().window().maximize();
		
		WebDriverWait wait = new WebDriverWait(driver,20);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Seller")));
		driver.findElement(By.linkText("Seller")).click();
		WebDriverWait wait1 = new WebDriverWait(driver,20);
		wait1.until(ExpectedConditions.visibilityOfElementLocated(By.name("username")));
		driver.findElement(By.name("username")).sendKeys("ram");;
		driver.findElement(By.name("password")).sendKeys("ram12");;
		driver.findElement(By.name("Login")).click();
	}
	
  @AfterMethod
  public void afterMethod() 
  {
	  driver.quit();
  }

}
