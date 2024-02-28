# Valorant Companion App

## Overview
The Valorant Companion App is an iOS application designed to provide users with access to Valorant game data, including maps, bundles, and agents, through integration with the Valorant API. Users can easily navigate between different sections using the navigation bar. Additionally, the app stores agent data locally using Realm, allowing users to access it even when offline. Furthermore, users can view detailed information about each agent by tapping on their profile. Images are cached using SDWebImage to reduce network usage.

## Features
- Fetches data from the Valorant API, including maps, bundles, and agents.
- Utilizes a navigation bar for seamless navigation between different sections.
- Stores agent data locally using Realm for offline access.
- Allows users to view detailed information about each agent.
- Images are cached using SDWebImage to reduce network usage.

## Installation
1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Build and run the application on a simulator or device.

## Usage
- Upon launching the app, users are presented with the home screen displaying various sections such as maps, bundles, and agents.
- Users can navigate between sections using the navigation bar at the top.
- Agent data is automatically synced and stored locally using Realm for offline access.
- Tapping on an agent's profile reveals detailed information about the agent.

## Dependencies
- [Realm](https://realm.io/) - A mobile database that enables efficient data storage and retrieval, used for storing agent data offline.
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) - An asynchronous image downloader with caching support, used for caching images to reduce network usage.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).
