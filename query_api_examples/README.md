# Examples

You can directly open _Jupyter Notebook_ files and see the code with the outputs.

In order to run examples, there should be `.env` file with Authorization token for api.

Example of .env file:

```dotenv
# Authorization token
AUTH_TOKEN=<your_authorization_token>
```

**Content:**
- [**Events example**](events-example.ipynb)
    - Example of query for upcoming crypto events
- [**LP Pool Liquidity vs Price**](liquidity_vs_price.ipynb)
    - Query and plot LP Pool Liquidity of given LP Token 
- [**Open Interest**](open_interest.ipynb)
    - Downloading and plotting Binance open interest data
- [**Telegram Activity**](telegram_activity.ipynb)
    - Get and plot telegram activity and sentiment for given tag (token) with its price as well
- [**Tokens By Liquidity**](tokens_by_liquidity.ipynb)
    - Get tokens by its liquidity against the biggest tokens (WETH, USDT, USDC) on ETH
- [**Topics**](topics.ipynb)
    - Obtaining trending topics at the moment
- [**WordCloud**](wordcloud.ipynb)
    - Get Word clouds (most frequent words) for Social and News articles
- [**Portfolio**](portfolio.ipynb)
    - Get portfolio for given wallet