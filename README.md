# Pokemon
Pokemon

https://pokeapi.co/ API RESTful services:

This small app uses an open API with RESTful services to get data about Pokemons from the service.
For this project I tried to use MVVM+Clean Architecture and dependencies injection as well.
The app has 3 screens: Launch Screen, Main Screen and Details Screen. Since it is a small app I'm using storyboards to design the screens layout
but some of the components are custom or are programatically implemented.
Each time we run the app we can get a different pokemon, since I'm getting random elements from the array of endpoints urls each time the service 
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

