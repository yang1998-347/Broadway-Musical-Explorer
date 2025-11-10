# Broadway-Musical-Explorer
An iOS app built with SwiftUI that helps users explore Broadway musicals with show details, images, and more.

#  Broadway Musicals App

This is a SwiftUI app that showcases currently running Broadway musicals. Users can:

- Browse musicals and search by title
- View detailed info (description, runtime, schedule, tickets)
- Check cast and listen to album via Spotify
- Favorite a show and write a review

##  Built With

- SwiftUI
- Kingfisher (image loading)
- UserDefaults (local persistence)
- Spotify Web API (album & track data)
- Playbill (scraped for current musical info)

##  Data Source

Data is preprocessed and stored in local `.json` files, extracted from:

- Playbill.com (via Python scraper)
- Spotify (via OAuth + API)

##  Features

- LazyVGrid musical grid view
- NavigationLink-based navigation
- Favorite/Review persistence
- ScrollView album/track view
- Cast listing with images




Note: This repository was reconstructed for presentation purposes. The commit history reflects a cleaned-up version of the original project for clarity.

## 🔖 Author

Created by Yang-Ting Lin
