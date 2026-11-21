import yfinance as yf

# Tickers
tickers = [
    "AAPL",  # Apple - Technology
    "JPM",   # JPMorgan Chase - Financials
    "JNJ",   # Johnson & Johnson - Healthcare
    "XOM",   # ExxonMobil - Energy
    "PG",    # Procter & Gamble - Consumer Staples
    "CAT",   # Caterpillar - Industrials
    "AMZN",  # Amazon - Consumer Discretionary
    "NEE",   # NextEra Energy - Utilities
    "LIN",   # Linde - Materials
    "PLD"   # Prologis - Real Estate
]
data = yf.download(tickers, period="5d", interval="1d")
closes = data["Close"]
closes.to_csv("test.csv")
print(data)