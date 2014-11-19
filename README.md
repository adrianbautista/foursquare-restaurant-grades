# Foursquare Restaurant Grades

The data and work in this repoistory attempts to identify any relationship between the tips Foursquare users leave for a NYC restaurant and the restaurant's sanitation grade from the NYC Department of Health and Mental Hygiene (NYCDOHMH). It is also my final project for the Fall 2014 session of General Assembly's [Data Science course](https://generalassemb.ly/education/data-science/).

Also in this repoistory is old work for my first project idea about Hollywood films and China box office results.

## About

What if the NYCDOHMH could prioritize restaurants in need of health inspections based on text reviews left by patron? The this project's regression models attempt to answer this question by analyzing over 10,000 tips left by Foursquare users at restaurants and predicting, based on adjectives used in the tips, whether the restaurant was a grade "A" or grade "C" restaurant.

Scores and Area Under the Curve (AUC) values produced from the data indicate that randomness has a strong impact on any modeled relationship.

## Moving Forward

Idea and suggestions on how work in this project could be improved:

- The number of tips per restaurant is fairly low, so using more tips or refining the model to restaurants with a minimum number of tips might help.
- Using Bigrams and Trigrams to measure the impact of word combos since sentiment analysis is weak when only used against individual words.
- Doing a deeper dive into certain areas of NYC instead of all restaurants in the city.

## Data sources

- [NYC OpenData: Restaurant Inspection Results](https://nycopendata.socrata.com/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59?)
- [Foursquare API](https://developer.foursquare.com/)
- [NYC Zipcode Tabulation Area](http://data.nycprepared.org/dataset/nyc-zip-code-tabulation-areas)

## Languages and packages used

- Python 2.7.8
- [pandas](https://github.com/pydata/pandas)
- [scikit-learn](https://github.com/scikit-learn/scikit-learn)
- [nltk](https://github.com/nltk/nltk)
- [folium](https://github.com/wrobstory/folium)
