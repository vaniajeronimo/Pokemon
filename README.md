# Pokemon
Pokemon

https://pokeapi.co/ API RESTful services:

This small app uses an open API with RESTful services to get data about Pokemons from the service.
For this project I used MVVM + Clean Architecture and dependencies injection.
The app has 3 screens: "Launch Screen", "Main Screen" and "Details Screen". 
Since it's a small app I'm using storyboards to design the screens layout but some of the components are custom made or are programatically implemented.
Each time we run the app we can get a different pokemon, since I'm sorting random elements from the array of url endpoints, each time the service 
is called.
The app layout is prepared to support light and darkmode and devices with different screen sizes (iphones/ ipads). 
Although is not designed to support landscape mode.

The frameworks that were installed through cocoapods are:
- SnapKit
- SwiftLint
- Nimble
- AlamoFire

(And I'm also using Combine).

The app has integrated a folder of utilities to use across the app and a module for unit tests (PokemonTests).

