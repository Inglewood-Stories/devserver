Config = {}

Config.locale = 'en'

Config.marker = {
    type = 2,
    scale = {
        x = 0.4,
        y = 0.4,
        z = 0.3
    },
    color = {
        r = 100,
        g = 200,
        b = 50,
        a = 100
    },
    face = true
}

Config.shops = {
    CornerStores = {
        name = 'Corner Store',
        description = 'Corner Store',
        blip = {
			id = 59, colour = 69, scale = 0.8
		},
        items = {
            { type = 'food', name = '5md_gsmms', description = 'A classic pack of M&Ms to satisfy your sweet tooth.', price = 1.89 },
            { type = 'food', name = '5md_gsmmspnut', description = 'Peanut M&Ms, perfect for a crunchy, chocolatey snack.', price = 2.19 },
            { type = 'food', name = '5md_gsreeses', description = 'Reese’s Peanut Butter Cups, the ultimate chocolate and peanut butter combo.', price = 1.99 },
            { type = 'food', name = '5md_gsreesesheart', description = 'Reese’s Heart-shaped treats, ideal for special occasions or indulgence.', price = 2.49 },
            { type = 'food', name = '5md_gsskittles', description = 'Taste the rainbow with these fruity Skittles candies.', price = 1.79 },
            { type = 'food', name = '5md_gsskittlestropic', description = 'Tropical Skittles, bringing exotic flavors to your snack time.', price = 1.89 },
            { type = 'food', name = '5md_gsskittleswildb', description = 'Wild Berry Skittles for a burst of berry-flavored sweetness.', price = 1.89 },
            { type = 'food', name = '5md_gscheetos', description = 'Crunchy Cheetos, the perfect cheesy snack to enjoy anywhere.', price = 1.99 },
            { type = 'food', name = '5md_gscheetosp', description = 'Cheetos Puffs, light, airy, and packed with cheesy flavor.', price = 2.49 },
            { type = 'food', name = '5md_gsdoritosbbqheat', description = 'Doritos BBQ Heatwave, smoky and spicy chips to fire up your taste buds.', price = 1.99 },
            { type = 'food', name = '5md_gsdoritosblaze', description = 'Doritos Blaze, packed with bold, fiery flavors for heat lovers.', price = 1.99 },
            { type = 'food', name = '5md_gsdoritoschipcheat', description = 'Doritos Chipotle Cheese for a smoky, cheesy experience.', price = 1.99 },
            { type = 'food', name = '5md_gsdoritosenchsup', description = 'Doritos Enchilada Supreme, a spicy twist on classic tortilla chips.', price = 2.29 },
            { type = 'food', name = '5md_gsdoritosjalpj', description = 'Doritos Jalapeño Jack, combining heat with cheesy goodness.', price = 2.29 },
            { type = 'food', name = '5md_gsdoritoskebab', description = 'Doritos Kebab flavor, delivering a unique and savory taste.', price = 2.29 },
            { type = 'food', name = '5md_gsdoritosranchdhw', description = 'Doritos Cool Ranch Double Heatwave, the perfect blend of cool and spicy.', price = 2.29 },
            { type = 'food', name = '5md_gsdoritosroulette', description = 'Doritos Roulette, where every bite is a surprise of fiery heat.', price = 1.99 },
            { type = 'food', name = '5md_gsdoritosschipbbq', description = 'Doritos Sweet Chili BBQ, a balance of sweet and smoky.', price = 1.99 },
            { type = 'food', name = '5md_gsdoritossfchx', description = 'Doritos Spicy Nacho, turning up the heat on the classic nacho flavor.', price = 2.19 },
            { type = 'food', name = '5md_gsdoritostaco', description = 'Doritos Taco flavor, bringing the taste of taco night to your snack time.', price = 1.89 },
            { type = 'food', name = '5md_gslaysboba', description = 'Lay’s Bubble Tea flavor, an unusual but delightful combination.', price = 2.29 },
            { type = 'food', name = '5md_gslayscharhd', description = 'Lay’s Charred Honey Duck flavor, inspired by gourmet cuisine.', price = 2.29 },
            { type = 'food', name = '5md_gslaysclime', description = 'Lay’s Chili Lime, a zesty and spicy snack to wake up your taste buds.', price = 1.99 },
            { type = 'food', name = '5md_gslaysdeggs', description = 'Lay’s Deviled Eggs flavor, a unique twist for adventurous snackers.', price = 2.19 },
            { type = 'food', name = '5md_gslayshpizza', description = 'Lay’s Hawaiian Pizza, combining sweet pineapple and savory pizza flavors.', price = 2.19 },
            { type = 'food', name = '5md_gslayskcake', description = 'Lay’s King Cake flavor, capturing the essence of a Mardi Gras treat.', price = 2.29 },
            { type = 'food', name = '5md_gslayslettc', description = 'Lay’s Lettuce and Cheese, light and refreshing with a cheesy kick.', price = 1.99 },
            { type = 'food', name = '5md_gslaysmelticc', description = 'Lay’s Melted Ice Cream, a sweet and creamy chip for dessert lovers.', price = 2.29 },
            { type = 'food', name = '5md_gslayssoty', description = 'Lay’s Sweet Onion Teriyaki, blending sweet and savory Asian flavors.', price = 2.19 },
            { type = 'food', name = '5md_gslaysstraws', description = 'Lay’s Strawberry Shortcake, a sweet chip for an indulgent treat.', price = 2.29 },
            { type = 'food', name = '5md_gstakisfuego', description = 'Takis Fuego, rolled tortilla chips with intense heat and lime.', price = 2.49 },
            { type = 'food', name = '5md_gstakisbheat', description = 'Takis Blue Heat, a spicy snack with a bold blue twist.', price = 2.49 },
            { type = 'food', name = '5md_gscombos', description = 'Combos Stuffed Snacks, the perfect blend of crunch and filling.', price = 2.99 },
            { type = 'food', name = '5md_gsgoldfish', description = 'Goldfish Crackers, a classic and fun snack for any occasion.', price = 1.79 },
            { type = 'food', name = '5md_gschexmixhn', description = 'Chex Mix Honey Nut, a sweet and crunchy snack mix.', price = 2.49 },
            { type = 'food', name = '5md_gsmmscookies', description = 'M&M’s Cookies, soft-baked and loaded with chocolate candies.', price = 3.49 },
            { type = 'food', name = '5md_gsanimalc', description = 'Animal Crackers, a nostalgic snack for kids and adults alike.', price = 1.59 },
            { type = 'food', name = '5md_gswelchsfruit', description = 'Welch’s Fruit Snacks, packed with real fruit flavor.', price = 2.19 },
            { type = 'food', name = '5md_gswelchsapp', description = 'Welch’s Apple Fruit Snacks, tangy and sweet apple goodness.', price = 2.19 },
            { type = 'drink', name = '5md_gscoke', description = 'Classic Coca-Cola, the refreshing soda loved around the world.', price = 1.99 },
            { type = 'drink', name = '5md_gsdietcoke', description = 'Diet Coke, the same great Coke taste with zero calories.', price = 1.99 },
            { type = 'drink', name = '5md_gscokezero', description = 'Coca-Cola Zero Sugar, bold and refreshing with zero sugar.', price = 1.99 },
            { type = 'drink', name = '5md_gspepsi', description = 'Pepsi, the bold cola flavor that stands out.', price = 1.99 },
            { type = 'drink', name = '5md_gsdietpepsi', description = 'Diet Pepsi, the light, crisp cola without the calories.', price = 1.99 },
            { type = 'drink', name = '5md_gsmountaindew', description = 'Mountain Dew, a citrusy soda bursting with energy.', price = 1.99 },
            { type = 'drink', name = '5md_gsmountaindewcode', description = 'Mountain Dew Code Red, packed with bold cherry flavor.', price = 2.19 },
            { type = 'drink', name = '5md_gssprite', description = 'Sprite, a crisp lemon-lime soda for ultimate refreshment.', price = 1.99 },
            { type = 'drink', name = '5md_gsfantaorange', description = 'Fanta Orange, the vibrant soda with bold orange flavor.', price = 1.99 },
            { type = 'drink', name = '5md_gsfantagrape', description = 'Fanta Grape, a sweet and fizzy grape-flavored delight.', price = 1.99 },
            { type = 'drink', name = '5md_gsdrpepper', description = 'Dr. Pepper, a uniquely bold soda with 23 flavors.', price = 1.99 },
            { type = 'drink', name = '5md_gsdpdiet', description = 'Diet Dr. Pepper, the same great taste with fewer calories.', price = 1.99 },
            { type = 'drink', name = '5md_gsdpcream', description = 'Dr. Pepper Cream Soda, a smooth and creamy twist on a classic.', price = 2.19 },
            { type = 'drink', name = '5md_gswater', description = 'Refreshing bottled water to quench your thirst.', price = 1.49 },
            { type = 'drink', name = '5md_gsparklingwater', description = 'Sparkling water, a fizzy and refreshing alternative.', price = 1.99 },
            { type = 'drink', name = '5md_gsgatoradeorange', description = 'Gatorade Orange, the perfect sports drink for rehydration.', price = 1.99 },
            { type = 'drink', name = '5md_gsgatoradefruit', description = 'Gatorade Fruit Punch, a fruity and revitalizing beverage.', price = 1.99 },
            { type = 'drink', name = '5md_gsmonster', description = 'Monster Energy, packed with energy to fuel your day.', price = 2.49 },
            { type = 'drink', name = '5md_gsredbull', description = 'Red Bull Energy Drink, giving you wings when you need them.', price = 2.99 },
            { type = 'drink', name = '5md_gsredbullsugarfree', description = 'Red Bull Sugarfree, energy without the sugar.', price = 2.99 },
            { type = 'drink', name = '5md_gsstarbucksfrap', description = 'Starbucks Bottled Frappuccino, a creamy coffee treat on the go.', price = 3.49 },
            { type = 'drink', name = '5md_gsminuteoj', description = 'Minute Maid Orange Juice, made from real oranges for a fresh start.', price = 1.99 },
            { type = 'drink', name = '5md_gsapplejuice', description = 'Apple Juice, a sweet and refreshing classic.', price = 1.99 },
            { type = 'drink', name = '5md_gsmilk', description = 'Fresh milk, perfect for pairing with snacks or cereal.', price = 1.79 },
            { type = 'drink', name = '5md_gschocmilk', description = 'Chocolate milk, a rich and creamy favorite.', price = 1.99 },
            { type = 'drink', name = '5md_gstea', description = 'Iced tea, brewed for a refreshing and lightly sweetened drink.', price = 1.99 },
            { type = 'drink', name = '5md_gslemonade', description = 'Classic lemonade, sweet and tangy for ultimate refreshment.', price = 1.99 },
            { type = 'drink', name = '5md_gsarnoldpalmer', description = 'Arnold Palmer, a perfect mix of iced tea and lemonade.', price = 2.19 },
            { type = 'drink', name = '5md_gsenergyshot', description = 'Energy shot, a quick boost for those on the go.', price = 2.99 },
            { type = 'drink', name = '5md_gsproteinshake', description = 'Protein shake, packed with nutrients to power your day.', price = 3.49 },                   
        },
        filters = {
            food = 'Food',
            drink = 'Drinks',

        },
        locations = {
            vec3(25.65, -1348.05, 29.50),
            vec3(-3038.57, 585.93, 7.91),
            vec3(-3241.42, 1001.09, 12.83),
            vec3(1728.62, 6414.06, 35.04),
            vec3(1698.11, 4924.43, 42.06),
            vec3(1961.42, 3740.07, 32.34),
            vec3(547.79, 2671.85, 42.16),
            vec3(2679.23, 3280.09, 55.24),
            vec3(2557.95, 381.98, 108.62),
            vec3(373.56, 325.51, 103.57),
            vec3(49.09, -1475.04, 29.30),
        }
    },

    LiquorStores = {
        name = 'Liquor Store',
        description = 'Liquor Store',
        blip = {
			id = 93, colour = 69, scale = 0.8
		},
        items = {
            { type = 'liquor', name = 'moscowmule', description = 'A refreshing cocktail with vodka, ginger beer, and lime.', price = 12 },
            { type = 'liquor', name = 'margarita', description = 'A tequila-based cocktail with lime and triple sec.', price = 14 },
            { type = 'liquor', name = 'vodkalemon', description = 'A simple and citrusy vodka and lemon drink.', price = 10 },
            { type = 'liquor', name = 'gyntonic', description = 'A classic mix of gin and tonic with a hint of lime.', price = 11 },
            { type = 'liquor', name = 'vodkaredbull', description = 'A vodka and energy drink combination.', price = 13 },
            { type = 'liquor', name = 'oldfashioned', description = 'A whiskey cocktail with bitters and orange.', price = 15 },
            { type = 'liquor', name = 'martini', description = 'A classic gin or vodka cocktail with vermouth.', price = 14 },
            { type = 'liquor', name = 'cosmopolitan', description = 'A vodka cocktail with cranberry, lime, and triple sec.', price = 14 },
            { type = 'liquor', name = 'negroni', description = 'A bold cocktail of gin, Campari, and sweet vermouth.', price = 13 },
            { type = 'liquor', name = 'bluelagoon', description = 'A tropical vodka cocktail with blue curaçao and lemonade.', price = 12 },
            { type = 'liquor', name = 'jagerbomb', description = 'A Jägermeister shot dropped into energy drink.', price = 10 },
            { type = 'liquor', name = 'morganrum', description = 'Captain Morgan spiced rum, perfect for mixing.', price = 10 },
            { type = 'liquor', name = 'jdwhiskey', description = 'Jack Daniels Tennessee whiskey.', price = 12 },
            { type = 'liquor', name = 'bacardi', description = 'Classic white rum, ideal for cocktails.', price = 10 },
            { type = 'liquor', name = 'absolut', description = 'Absolut Vodka, smooth and versatile.', price = 11 },
            { type = 'liquor', name = 'fireball', description = 'A cinnamon-flavored whiskey with a kick.', price = 12 },
            { type = 'liquor', name = 'jimbeam', description = 'A smooth and flavorful Kentucky bourbon.', price = 11 },
            { type = 'liquor', name = 'josecuervo', description = 'Jose Cuervo tequila, ideal for margaritas.', price = 13 },
            { type = 'liquor', name = 'skyy', description = 'Skyy Vodka, distilled for exceptional smoothness.', price = 11 },
            { type = 'liquor', name = 'greygoose', description = 'Premium French vodka with a smooth taste.', price = 15 },
            { type = 'liquor', name = 'jager', description = 'Herbal liqueur with a bold flavor.', price = 12 },
            { type = 'liquor', name = 'hennessy', description = 'Fine Cognac, rich and complex.', price = 18 },
            { type = 'liquor', name = 'jameson', description = 'Smooth Irish whiskey with rich flavor.', price = 14 },
            { type = 'liquor', name = 'budlight', description = 'Light, crisp, and refreshing lager.', price = 5 },
            { type = 'liquor', name = 'coorslight', description = 'Cold and easy-drinking lager.', price = 5 },
            { type = 'liquor', name = 'miller', description = 'Miller Lite, a smooth and crisp beer.', price = 5 },
            { type = 'liquor', name = 'perignon', description = 'Dom Pérignon, a luxury champagne.', price = 250 },
            { type = 'liquor', name = 'iceimperial', description = 'Moët Ice Impérial, designed to be served over ice.', price = 60 },
            { type = 'liquor', name = 'brut', description = 'A classic dry champagne.', price = 50 },
            { type = 'liquor', name = 'pinotnoir', description = 'A smooth and fruity red wine.', price = 45 },            
        },
        filters = {
            liquor = 'Liquor'

        },
        locations = {
            vec3(1135.57, -982.40, 46.42),
            vec3(-1222.70, -907.16, 12.33),
            vec3(-1487.30, -378.95, 40.16),
            vec3(-2967.63, 392.38, 15.04),
            vec3(1167.25, 2709.53, 38.25),
            vec3(1393.75, 3605.45, 34.98),
            vec3(-1393.29, -606.37, 30.32),
            vec3(58.86, -1473.67, 29.30),
            vec3(60.79, -1471.29, 29.30),

        }
    },
    -- YouTool = {
	-- 	name = 'YouTool',
    --     description = 'All your tools and gadgets in one place',
	-- 	blip = {
	-- 		id = 402, colour = 69, scale = 0.8
	-- 	}, 
    --     items = {
    --         { type = 'tool', name = 'lockpick', description = 'You better keep this a secret', price = 10 },
    --     },
    --     filters = {
    --         tool = 'Tools'
    --     },
    --     locations = {
	-- 		vec3( c),
	-- 		vec3(342.99, -1298.26, 32.51)
	-- 	}
	-- },
}