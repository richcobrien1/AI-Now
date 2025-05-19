import requests
from bs4 import BeautifulSoup

URL = "https://example-ai-news-site.com"
response = requests.get(URL)
soup = BeautifulSoup(response.content, "html.parser")

for article in soup.find_all("div", class_="news-card"):
    title = article.find("h2").text
    summary = article.find("p").text
    link = article.find("a")["href"]
    print(f"Title: {title}\nSummary: {summary}\nLink: {link}\n")