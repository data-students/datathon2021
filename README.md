# Reviews Challange - Datathon FME 2021

This repository contains the data and resources to be used during the 3rd challenge in the [Datathon FME 2021](https://datathon.cat/). The data contains restaurant reviews data from google. There are 150 restaurants from barcelona and each restaurant has around 140 reviews. The data was obtained with the help of [SerpApi](serpapi.com).

## What can you find?


The data for this challenge is split between two files `train_reviews.json` and `test_reviews.json` so that all participants that decide to create an ML model can report their performance metrics on the same data (i.e. `test_reviews.json`). More information on the challenge can be found in `challenge_notebook.ipynb` with ideas on how to tackle this challenge. To use the `transformers` library (used in the notebook) you have to install either TensorFlow or Pytorch. Refer to the library's [installation guide](https://huggingface.co/transformers/installation.html#installation-with-pip). This is the only requirement to use the notebook other than a working installation of Python and Jupyter Notebook. Refer to the installation guide of those if intending to use them.

The json files are a lists of restaurants, each restaurant contains relevant data from the restaurant including user reviews.
This is the restaurant element scheme:

```{json}
{
    "title",
    "place_id",
    "data_id",
    "data_cid"
    "gps_coordinates": {"latitude", "longitude"},
    "rating",
    "reviews",
    "price",
    "type",
    "address",
    "open_state",
    "hours",
    "phone",
    "service_options": {"dine_in",
                        "takeout",
                        "delivery"
                        },
    "thumbnail",
    "reviews_data": [{"user": {"name",
                               "link",
                               "thumbnail",
                               "reviews"
                               },
                     "rating",
                     "date",
                     "snippet"}, ...]
}
```
