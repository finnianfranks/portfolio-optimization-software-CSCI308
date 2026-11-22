import yfinance as yf

# Tickers
tickers = [
    "MSFT",  # Microsoft - Information Technology
    "JPM",   # JPMorgan Chase - Financials
    "JNJ",   # Johnson & Johnson - Healthcare
    "XOM",   # ExxonMobil - Energy
    "PG",    # Procter & Gamble - Consumer Staples
    "CAT",   # Caterpillar - Industrials
    "AMT",  # American Tower - Real Estate
    "NEE",   # NextEra Energy - Utilities
    "HD",   # Home Depot - Consumer Discretionary
    "GOOGL"   # Alphabet - Communication Services
]
data = yf.download(tickers, start="2021-10-01", end="2026-11-01", interval="1mo")
closes = data["Close"]
closes.to_csv("../OCaml/monthly_prices.csv")

# print(data)