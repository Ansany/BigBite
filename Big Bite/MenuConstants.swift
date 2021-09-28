//
//  MenuConstants.swift
//  Big Bite
//
//  Created by Andrey Alymov on 27.09.2021.
//

import Foundation

struct Menu {
    
    struct Burgers {
        
        static let blackStar: Dish = .init(id: "id1", name: "Black Star", description: "Allen Yelent gives fans the best of both worlds: a still-juicy center but ample crust on the patties, which are always stacked double; the meat is more pressed around the edges than some of the city’s other smashburgers, providing plenty of texture in every bite.", image: "BlackStar", price: 8.4)
        
        static let falconi: Dish = .init(id: "id2 ", name: "Falconi", description: "This is a burger purist’s platonic ideal. Unassuming but beloved by all, E.R.B.’s Single Burger is proof that less is more. Nearly impossible to savor slowly, this burger disappears in seconds, probably due to that perfect balance of salty, juicy medium-rare beef to squishy bun to dairy.", image: "Falconi",price: 9.9)
        
        static let smokey: Dish = .init(id: "id3", name: "Smokey Burger", description: "This burger hybrid arrives a picture of decadence so large and enticing you don’t even know where to begin. (We recommend starting with a fork and knife; it’s that or like 40 napkins.) This the high-low of gourmet burgers: Soaking in a rich bordelaise, this thin-pattied beauty features bougie ingredients while also sporting perfect, pedestrian American cheese.", image: "Smokey", price: 9.9)
        
        static let lucien: Dish = .init(id: "id4", name: "Lucien", description: "We know the seafood at Connie & Ted’s is where it’s typically at, but hear us out: The Lucie is one of the best things on the menu, seafood or no. It’s juicy, it’s perfectly seared, it’s topped with thousand island, pickles, onion and lettuce, and it’s a burger we would eat daily if we didn’t consider our health from time to time. ", image: "Lucien", price: 12.5)
        
        static let macRow: Dish = .init(id: "id5", name: "Mac Row", description: "When you bite into Mac Row, you might detect an extra hint of char and smokiness—that’s because the Lucques and Sqirl vet cooks over a Japanese charcoal grill, imparting layers of flavor into the pressed-thin beef patties.", image: "MacRow", price: 12.5)
    }
    
    struct Pizza {
        
        static let margherita: Dish = .init(id: "id6", name: "Margherita", description: "It's a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil.", image: "Margherita", price: 9.2)
        
        static let californiaStyle: Dish = .init(id: "id7", name: "California Style", description: "Main ingredients: Shrimps, asparagus, seafood and pineapple", image: "CaliforniaStyle", price: 14.5)
        
        static let greekStyle: Dish = .init(id: "id8", name: "Greek Style", description: "Main ingredients: Tomato sauce, oregano, Feta cheese, Kalamata olives, artichokes", image: "GreekStyle", price: 13.7)
        
        static let pepperoni: Dish = .init(id: "id9", name: "Pepperoni", description: "So simple, just tomato sauce, Mozzarella cheese and pepperoni", image: "Pepperoni", price: 12.4)
        
        static let cheese: Dish = .init(id: "id10", name: "Four Cheese", description: "Tomato sauce, Mozzarella cheese, Dorblu, Feta and Parmesan", image: "4Cheese", price: 11.8)
    }
    
    struct Sushi {
        
        static let unagiNigiri: Dish = .init(id: "id11", name: "Unagi nigiri", description: "Unagi nigiri sushi is a traditional Japanese type of nigiri sushi. It consists of hand-pressed sushi rice that's topped with slices of freshwater eel that's usually cooked. The dish has a soft texture and a mild flavor. If desired, the eel can be lightly seared with a blowtorch.", image: "UnagiNigiri", price: 6)
        
        static let uramaki: Dish = .init(id: "id12", name: "Uramaki", description: "This sushi roll is prepared with sushi rice, nori, crab or surimi, avocado, and cucumber. It differs from other sushi types because the rice is on the exterior, wrapped around nori seaweed that is in the inner part and surrounds the filling. Uramaki is often rolled in roasted sesame seeds.", image: "Uramaki", price: 6.4)
        
        static let makizushi: Dish = .init(id: "id13", name: "Makizushi", description: "Uruchimai, rice vinegar, nori, kombu, eggs, persian cucumber, tuna, surimi", image: "Makizushi", price: 4.8)
        
    }
    
    struct Salads {
        
        static let caesar: Dish = .init(id: "id14", name: "Caesar", description: "A Caesar salad (also spelled Cesar and Cesare) is a green salad of romaine lettuce and croutons dressed with lemon juice (or lime juice), olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper.", image: "Caesar", price: 14.2)
        
        static let olivier: Dish = .init(id: "id15", name: "Olivier", description: "Olivier is a traditional salad dish in Russian cuisine, which is also popular in other post-Soviet countries and around the world. In different modern recipes, it is usually made with diced boiled potatoes, carrots, brined dill pickles (or cucumber), green peas, eggs, celeriac, onions, diced boiled chicken or bologna sausage (sometimes ham or hot dogs), and tart apples, with salt, pepper, and mustard added to enhance flavor, dressed with mayonnaise.", image: "Olivier", price: 12.9)
        
        static let blackBean: Dish = .init(id: "id16", name: "Black Bean", description: "It’s tangy and delicious, perfectly seasoned with cumin, garlic, and apple cider vinegar, and mixed with colored bell peppers, green onions and rice. ", image: "BlackBean", price: 9.9)
    }
    
    struct Drinks {
        
        static let cola: Dish = .init(id: "id17", name: "Coca-Cola 0.5", description: "The original cola drink by Pemberton contained caffeine from coca leaves as well. His non-alcoholic recipe was inspired by the coca wine of pharmacist Angelo Mariani, created in 1863", image: "Cola", price: 2)
        
        static let fanta: Dish = .init(id: "id18", name: "Fanta 0.5", description: "Bright, bubbly and popular, Fanta is the soft drink that intensifies fun. Introduced in 1940, Fanta is the second oldest brand of The Coca-Cola Company.", image: "Fanta", price: 2)
        
        static let sprite: Dish = .init(id: "id19", name: "Sprite 0.5", description: "TSprite is a lemon-lime flavored soft drink with a crisp, clean taste that gives you the ultimate cut-through refreshment.", image: "Sprite", price: 2)
        
        static let berryJuice: Dish = .init(id: "id20", name: "Berry Juice 0.5", description: "Home made Jucie. Just water, berries, ice and sugar", image: "BerryJuice", price: 3)
        
        static let water: Dish = .init(id: "id21", name: "Still water 0.5", description: "This water from a mountain spring is very healthy and clean", image: "Water", price: 1)
    }
    
    struct GlutenFree {
        
        static let glazedSalmon: Dish = .init(id: "id22", name: "Glazed Salmon", description: "Gluten Free Asian Glazed Salmon with Edamame Rice", image: "GlazedSalmon", price: 16.2)
        
        static let skillet: Dish = .init(id: "id23", name: "Skillet Chicken", description: "Gluten Free dish with chiken, rice and special sauce", image: "Skillet", price: 13.4)
        
        static let larendy: Dish = .init(id: "id24", name: "Larendy", description: "A very nutritious and tasty dish that will energize the whole day. Gluten Free", image: "Larendy", price: 12)
    }
    
    struct Categories {
        
        static let pizzaCategory: DishCategory = .init(id: "categoryID1", name: "Pizza", image: "PizzaCategory")
        static let burgerCategory: DishCategory = .init(id: "categoryID2", name: "Burgers", image: "BurgerCategory")
        static let sushiCategory: DishCategory = .init(id: "categoryID3", name: "Sushi", image: "SushiCategory")
        static let saladCategory: DishCategory = .init(id: "categoryID4", name: "Salads", image: "SaladCategory")
        static let drinkCategory: DishCategory = .init(id: "categoryID5", name: "Drinks", image: "DrinkCategory")
        
    }
    
}
