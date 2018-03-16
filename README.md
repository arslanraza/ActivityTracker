[![Build Status](https://travis-ci.org/arslanraza/ActivityTracker.svg?branch=master)](https://travis-ci.org/arslanraza/ActivityTracker)

# ActivityTracker
This app displays a list of activities on a certain location in Australia

## Platform:

* XCode 9.2
* Minimum iOS Version: 10.0
* The app supports all orientations and screen sizes.

---
## About:

* The goal of the project is to create an ActivityTracker that displays a list of Locaton from which a detail of that location including list of top runners and activities can be seen.


## Structure:

* The app is divided in 3 main targets

### ActivityTracker

* This target uses MVVM pattern to layout the UI. The ViewModels hold the business logic and the network interactions. They do not know about the views which makes them reuseable and portable for different projects.

* **LocationsListViewController**: Displays a list of locations with their position on a non-interactive-map
* **LocationDetailViewController**: Displays a the detail of the location. This screen is divided into 3 sections. **Map, Top Runners and Activities** for easier control over the UI.

### ATLocationCore (framework)

* Defines the entities that will be used in the app. The entities conforms to Codable protocol for json serialization

### ATNetwork (framework)

##### Network

* Defines a generic protocol based APIClient and Result class that carries out the network operation for fetching and uploading the image

## Unit Tests

##### Unit tests are written using _**QUICK**_ and _**NIMBLE**_ frameworks and covers the following targets

* **ActivityTracker** target for individual ViewControllers testing
* Model serialization in **ATLocationCore** framekwork
* Network operations in **ATNetworkusing** using mock APIClient and and MockURLSession to mimic the behavior of the server.

##### Code Coverage:

* ActivityTracker: 42%
* ATNetwork: 83%
* ATLocationCore: 100%

## 3rd Party frameworks

##### Following frameworks has been used

* **SDWebImage**: This framework is used to load images from a given url and cache them.
* **QUICK**: BDD unit testing framework
* **NIMBLE**: A matcher framework to make expectations in unit tests more readable.

## Suggested Improvements:

* Loading state for the view when network request is in progress
* Display message when the request fails.
* Improve transition from Locations list to Location detail view
* Detail view for Activity and Profile screens so that the Location detail can be more interactive.
* Additional test coverage for UI



