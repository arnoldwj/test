from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait


def main():
    scrape()


def set_options():
    # additional settings for chrome options.
    options = webdriver.ChromeOptions()
    options.headless = True
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    return options


def configure_driver():
    return webdriver.Chrome(options=set_options())


def scrape():
    driver = configure_driver()
    driver.get("http://www.montypythononlinestore.com/")

    # accesses search box, find el by ID = search-field
    search_box = driver.find_element(By.ID, "search-field")
    # types in t-shirt
    search_box.send_keys("book")
    # presses enter
    search_box.send_keys(Keys.ENTER)

    # waits for result to show
    wait = WebDriverWait(driver, 10)
    wait.until(expected_conditions.presence_of_element_located((By.TAG_NAME, "h2")))
    element = wait.until(expected_conditions
                         .presence_of_element_located((By.TAG_NAME, "h2")))

    element_text = element.text
    print(element_text)

    result = driver.find_elements(By.CLASS_NAME, 'product')
    print(f'Total number of books:{len(result)}')

    driver.quit()

    return len(result)


if __name__ == "__main__":
    main()
