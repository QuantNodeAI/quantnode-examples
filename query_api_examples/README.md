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
- [**Open Interest**](open_interest.ipynb)
    - Downloading and plotting Binance open interest data
- [**Telegram Activity**](telegram_activity.ipynb)
    - Get and plot telegram activity and sentiment for given tag (token) with its price as well
- [**Topics**](topics.ipynb)
    - Obtaining trending topics at the moment
- [**WordCloud**](wordcloud.ipynb)
    - Get Word clouds (most frequent words) for Social and News articles