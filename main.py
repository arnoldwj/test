from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait

driver = webdriver.Chrome('/usr/lib/chromium-browser/chromedriver')
print(driver.name)
driver.get("http://www.montypythononlinestore.com/")

# accesses search box, find el by ID = search-field
search_box = driver.find_element(By.ID, "search-field")
# types in t-shirt
search_box.send_keys("book")
# presses enter
search_box.send_keys(Keys.ENTER)

# waits for result to show
wait = WebDriverWait(driver, 10)
element = wait.until(expected_conditions
                     .presence_of_element_located((By.TAG_NAME, "h2")))

element_text = element.text
print(element_text)

all_products = driver.find_elements(By.CLASS_NAME, 'product')
print(f'There are {len(all_products)} shown')

driver.quit()
