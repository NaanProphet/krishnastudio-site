# krishnastudio-site

[![Netlify Status](https://api.netlify.com/api/v1/badges/f4986ea9-6ce2-4e8d-ae23-95cbc089ebf6/deploy-status)](https://app.netlify.com/sites/hardcore-kepler-dcbf80/deploys)

Personal journal of learning how to record, mix and master music.

## Tech Stack

* [Jekyll](https://jekyllrb.com) with [Minima](https://github.com/jekyll/minima)
* [Netlify](https://www.netlify.com)
* [Algolia](https://www.algolia.com)
* [Google Analytics](https://www.google.com/analytics)

## Notes

* To install all necessary dependencies on your machine, first run `bundle install`
* To publish new articles, first push new data to Algolia `ALGOLIA_API_KEY='your_admin_api_key' bundle exec jekyll algolia`
* To run the localhost server, use `bundle exec jekyll --serve`
* In Netlify, set `JEKYLL_ENV=production` to enable Google Analytics