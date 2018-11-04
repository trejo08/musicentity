# README

**Musicentity** is an app to find some music recomendations using **IBM Watson personality insigths** combined with **LAST.FM API** and **Twitter API**.

You can visit the app by hitting this [link](https://musicentity.herokuapp.com/)

To run this app, you have to follow the next steps:
  * set .env file with:
    - API_KEY(twitter)
    - API_SECRET(twitter)
    - TOKEN(twitter)
    - TOKEN_SECRET(twitter)
    - LASTFM_API(api key)
    - LASTFM_SECRET(secret key)
    - WATSON_API_KEY(watson api key in order to get an IAM Bearer token authentication)

  * run **rails db:create** command
  * run **rails db:migrate** command
  * run **rails db:seed** command to set users
  * run **rails assets:precompile --production** - only if you are running the app in self      hosted server and you want to run it in production mode.