from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.get("https://example-ai-news-site.com")

articles = driver.find_elements(By.CLASS_NAME, "news-card")
for article in articles:
    title = article.find_element(By.TAG_NAME, "h2").text
    summary = article.find_element(By.TAG_NAME, "p").text
    print(f"Title: {title}\nSummary: {summary}\n")

driver.quit()