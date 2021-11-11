# The Barcelona Challange 2021

This repository contains restaurant reviews data from google. There are 150 restaurants from barcelona and each restaurant has around 150 reviews. The data was obtained with the help of [SerpApi](serpapi.com).

## What you can find?

The json file is a list of restaurants, each restaurant contains relevant data from the restaurant including user reviews.
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
## TO DO

- Finish notebook (more info and links to resources)
- Doing something with the AIRBNB dataset?
- Create a requirements.txt for the notebook
