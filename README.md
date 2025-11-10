# Broadway-Musical-Explorer
An iOS app built with SwiftUI that helps users explore Broadway musicals with show details, images, and more.

## Users can:

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

##  Screenshots

### Homepage
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 20 44 AM" src="https://github.com/user-attachments/assets/44bafa78-a8eb-40ae-94b1-25a88bc46e46" />


### Detailpage
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 21 02 AM" src="https://github.com/user-attachments/assets/25824785-9c74-45d6-8bb9-1a4b8daa1731" />
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 21 07 AM" src="https://github.com/user-attachments/assets/4cfa43b9-0298-4af8-a85f-9bb4874bc7e0" />

### Albumpage
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 21 13 AM" src="https://github.com/user-attachments/assets/b1e72bc9-8e47-41c2-829c-042a58a4ea4f" />

### Castpage
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 21 16 AM" src="https://github.com/user-attachments/assets/b191bd9d-8bdb-4f6c-b2b0-6476aa0a5e47" />

### Favoritepage
<img width="504" height="956" alt="Screenshot 2025-11-10 at 5 21 25 AM" src="https://github.com/user-attachments/assets/36d0a228-c569-476c-ba8a-4933619d326a" />






##  Running the App in Xcode

To run this app in Xcode:
Make sure you are using Xcode 15 or later.
Select the target: Broadway-Musical-Explorer.
Use the simulator: iPhone 16 Pro.
- Earlier simulators (like iPhone 14/15 or lower OS versions) may cause layout issues or black screen.
Press ⌘R to build and run.





Note: This repository was reconstructed for presentation purposes. The commit history reflects a cleaned-up version of the original project for clarity.

## 🔖 Author

Created by Yang-Ting Lin
