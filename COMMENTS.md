# Claro Brasil Challenge - iOS

This code is for a challenge proposed by Claro.


## Architecture's choice

In the project I chose to use the MVP (model-view-presenter) architecture because it's the architecture with which I am accustomed to work, speeding the development. Another justification is because it is an architecture based on the one recommended by Apple (MVC), facilitating the division of responsibilities of the project.

## Libraries used
* [AlamofireObjectMapper](https://github.com/tristanhimmelman/AlamofireObjectMapper) -> For mapping the objects in the consumption of Api in a fast and intuitive way.
* [RealmSwift](https://realm.io/docs/swift/latest/) -> For data persistence, because it is easy to implement.
* [Quick](https://github.com/Quick/Quick) e [Nimble](https://github.com/Quick/Nimble) -> For execution of unit tests of data persistence.

## General comments about development

If you had a little more time to develop the app (and it's a future plan to continue with this project), it would certainly enhance the design. I was not satisfied with the delivery of it. Just like fine adjustments in the application in general :)


## Obligatory requirements not delivered:
* Landscape orientation during trailer display -> This feature only works when the phone's screen rotation is unlocked. With the rotation locked, the application displays in portrait orientation.
* At least one automated test interface -> As I never did, I did not have time to learn and implement. Stay for the next steps :)