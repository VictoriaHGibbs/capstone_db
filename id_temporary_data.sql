-- Random data created by chatGPT

-- 5 random users with NULL as the profile image. password_hash values use bcrypt-like placeholder hashes (hashed version of "password123")
INSERT INTO `user` (username, profile_image_url, f_name, l_name, email_address, password_hash, joined_at, role_id, active) VALUES
('johhnydoughboy', NULL, 'John', 'Doe', 'testuser1@example.com', UNHEX('2432612431322461314F4B74617A626C55693578714C397048444F565345354C6D70535651757574687269456D736E356441535639347953'), NOW(), 2, 1),
('JaSmithy', NULL, 'Jane', 'Smith', 'testuser2@example.com', UNHEX('2432612431322461314F4B74617A626C55693578714C397048444F565345354C6D70535651757574687269456D736E356441535639347953'), NOW(), 2, 1),
('dickdick', NULL, 'Richard', 'Johnson', 'testuser3@example.com', UNHEX('2432612431322461314F4B74617A626C55693578714C397048444F565345354C6D70535651757574687269456D736E356441535639347953'), NOW(), 3, 1),
('Emememememe', NULL, 'Emily', 'Davis', 'testuser4@example.com', UNHEX('2432612431322461314F4B74617A626C55693578714C397048444F565345354C6D70535651757574687269456D736E356441535639347953'), NOW(), 1, 1),
('MeowHiss', NULL, 'Chris', 'Brown', 'testuser5@example.com', UNHEX('2432612431322461314F4B74617A626C55693578714C397048444F565345354C6D70535651757574687269456D736E356441535639347953'), NOW(), 2, 1);


-- RECIPES FOR THE TABLES: RECIPE, INGREDIENT, AND DIRECTION


-- Recipe for mashed potatoes
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(1, 'Classic Mashed Potatoes', 15, 20, 'Creamy and buttery mashed potatoes, perfect as a side dish.', 4, 9, 4, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 2, 'Russet potatoes', 9, 1), -- 2 pounds of potatoes
(@recipe_id, 2, 0, 'Salt', 1, 2),           -- 1 teaspoon of salt
(@recipe_id, 3, 4, 'Butter', 8, 3),         -- 4 ounces of butter
(@recipe_id, 4, 0, 'Black pepper', 1, 4),   -- 1 teaspoon of black pepper
(@recipe_id, 5, 0.5, 'Milk', 3, 5);         -- 1/2 cup of milk

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Peel and cut potatoes into even chunks.', 1),
(@recipe_id, 2, 'Boil potatoes in salted water for 15-20 minutes until fork-tender.', 2),
(@recipe_id, 3, 'Drain potatoes and return them to the pot.', 3),
(@recipe_id, 4, 'Mash potatoes while adding butter and milk.', 4),
(@recipe_id, 5, 'Season with salt and black pepper to taste.', 5),
(@recipe_id, 6, 'Serve warm and enjoy!', 6);



-- Recipe for Steak au Poivre 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(1, 'Steak au Poivre', 10, 15, 'A classic French dish featuring steak coated in crushed peppercorns and served with a rich, creamy sauce.', 2, 9, 2, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 2, 'Beef tenderloin steaks', 8, 1),  -- 2 (8 oz each) beef tenderloin steaks
(@recipe_id, 2, 2, 'Black peppercorns, crushed', 2, 2), -- 2 tablespoons crushed black peppercorns
(@recipe_id, 3, 1, 'Salt', 1, 3), -- 1 teaspoon salt
(@recipe_id, 4, 2, 'Butter', 8, 4), -- 2 ounces butter
(@recipe_id, 5, 1, 'Olive oil', 2, 5), -- 1 tablespoon olive oil
(@recipe_id, 6, 0.5, 'Cognac or brandy', 3, 6), -- 1/2 cup cognac or brandy
(@recipe_id, 7, 0.5, 'Heavy cream', 3, 7); -- 1/2 cup heavy cream

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Season steaks with salt and press crushed peppercorns onto both sides.', 1),
(@recipe_id, 2, 'Heat olive oil and butter in a pan over medium-high heat.', 2),
(@recipe_id, 3, 'Sear steaks for 3-4 minutes per side for medium-rare, then remove from pan and set aside.', 3),
(@recipe_id, 4, 'Carefully add cognac or brandy to the pan and ignite to burn off alcohol.', 4),
(@recipe_id, 5, 'Reduce heat and stir in heavy cream, simmering until thickened.', 5),
(@recipe_id, 6, 'Return steaks to the pan, spoon sauce over them, and serve immediately.', 6);



-- recipe for green bean casserole 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(3, 'Green Bean Casserole', 10, 30, 'A creamy and savory baked casserole made with green beans, mushroom soup, and crispy fried onions.', 6, 9, 6, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 4, 'Green beans, trimmed and cut', 3, 1),  -- 4 cups of fresh green beans
(@recipe_id, 2, 1, 'Salt', 1, 2),  -- 1 teaspoon salt
(@recipe_id, 3, 10, 'Condensed cream of mushroom soup', 8, 3),  -- 10 ounces canned cream of mushroom soup
(@recipe_id, 4, 0.5, 'Milk', 3, 4),  -- 1/2 cup milk
(@recipe_id, 5, 1, 'Black pepper', 1, 5),  -- 1 teaspoon black pepper
(@recipe_id, 6, 1, 'Garlic powder', 1, 6),  -- 1 teaspoon garlic powder
(@recipe_id, 7, 1.5, 'French fried onions', 3, 7);  -- 1.5 cups crispy fried onions

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Preheat oven to 350°F (175°C).', 1),
(@recipe_id, 2, 'Bring a pot of salted water to a boil and blanch the green beans for 3-4 minutes.', 2),
(@recipe_id, 3, 'Drain and transfer green beans to a large mixing bowl.', 3),
(@recipe_id, 4, 'Stir in condensed cream of mushroom soup, milk, black pepper, and garlic powder.', 4),
(@recipe_id, 5, 'Transfer the mixture to a baking dish and bake for 25 minutes.', 5),
(@recipe_id, 6, 'Remove from oven, sprinkle crispy fried onions on top, and bake for another 5 minutes.', 6),
(@recipe_id, 7, 'Let cool for a few minutes and serve warm.', 7);



-- recipe for pancakes 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(4, 'Homemade Pancakes', 10, 15, 'Fluffy homemade pancakes made from scratch with simple ingredients.', 4, 9, 4, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 1.5, 'All-purpose flour', 3, 1),  -- 1.5 cups flour
(@recipe_id, 2, 3.5, 'Baking powder', 1, 2),  -- 3.5 teaspoons baking powder
(@recipe_id, 3, 1, 'Salt', 1, 3),  -- 1 teaspoon salt
(@recipe_id, 4, 1, 'Granulated sugar', 2, 4),  -- 1 tablespoon sugar
(@recipe_id, 5, 1.25, 'Milk', 3, 5),  -- 1 1/4 cups milk
(@recipe_id, 6, 1, 'Egg', 8, 6),  -- 1 egg
(@recipe_id, 7, 3, 'Butter, melted', 2, 7);  -- 3 tablespoons butter

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'In a large bowl, whisk together flour, baking powder, salt, and sugar.', 1),
(@recipe_id, 2, 'In another bowl, beat the egg, then add milk and melted butter. Mix well.', 2),
(@recipe_id, 3, 'Gradually pour the wet ingredients into the dry ingredients and whisk until smooth.', 3),
(@recipe_id, 4, 'Heat a lightly oiled skillet or griddle over medium heat.', 4),
(@recipe_id, 5, 'Pour about 1/4 cup of batter onto the skillet for each pancake.', 5),
(@recipe_id, 6, 'Cook until bubbles form on the surface, then flip and cook until golden brown.', 6),
(@recipe_id, 7, 'Serve warm with butter, syrup, or desired toppings.', 7);



--recipe for red velvet cheesecake 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(1, 'Red Velvet Cheesecake', 30, 60, 'A rich and creamy red velvet cheesecake with a chocolatey crust and smooth cream cheese topping.', 1, 9, 12, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
-- Crust
(@recipe_id, 1, 2, 'Chocolate cookie crumbs', 3, 1),  -- 2 cups chocolate cookie crumbs
(@recipe_id, 2, 0.5, 'Unsalted butter, melted', 3, 2),  -- 1/2 cup melted butter

-- Cheesecake Filling
(@recipe_id, 3, 24, 'Cream cheese, softened', 8, 3),  -- 24 ounces cream cheese
(@recipe_id, 4, 1.5, 'Granulated sugar', 3, 4),  -- 1.5 cups sugar
(@recipe_id, 5, 3, 'Eggs', 8, 5),  -- 3 eggs
(@recipe_id, 6, 1, 'Sour cream', 3, 6),  -- 1 cup sour cream
(@recipe_id, 7, 2, 'Cocoa powder', 2, 7),  -- 2 tablespoons cocoa powder
(@recipe_id, 8, 1, 'Vanilla extract', 2, 8),  -- 1 tablespoon vanilla extract
(@recipe_id, 9, 1, 'White vinegar', 2, 9),  -- 1 tablespoon white vinegar
(@recipe_id, 10, 1, 'Red food coloring', 2, 10),  -- 1 tablespoon red food coloring

-- Cream Cheese Frosting
(@recipe_id, 11, 8, 'Cream cheese, softened', 8, 11),  -- 8 ounces cream cheese
(@recipe_id, 12, 0.5, 'Unsalted butter, softened', 3, 12),  -- 1/2 cup butter
(@recipe_id, 13, 2, 'Powdered sugar', 3, 13),  -- 2 cups powdered sugar
(@recipe_id, 14, 1, 'Vanilla extract', 2, 14);  -- 1 tablespoon vanilla extract

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
-- Crust
(@recipe_id, 1, 'Preheat oven to 325°F (163°C).', 1),
(@recipe_id, 2, 'Mix chocolate cookie crumbs with melted butter and press into the bottom of a springform pan.', 2),
(@recipe_id, 3, 'Bake for 10 minutes, then let cool.', 3),

-- Cheesecake Filling
(@recipe_id, 4, 'In a large bowl, beat cream cheese and sugar until smooth.', 4),
(@recipe_id, 5, 'Add eggs one at a time, mixing after each addition.', 5),
(@recipe_id, 6, 'Mix in sour cream, cocoa powder, vanilla extract, vinegar, and red food coloring.', 6),
(@recipe_id, 7, 'Pour the filling over the crust and smooth the top.', 7),
(@recipe_id, 8, 'Bake for 50-60 minutes or until the center is set.', 8),
(@recipe_id, 9, 'Turn off the oven and let the cheesecake cool inside for 1 hour with the door slightly open.', 9),
(@recipe_id, 10, 'Refrigerate for at least 4 hours or overnight.', 10),

-- Cream Cheese Frosting
(@recipe_id, 11, 'Beat cream cheese and butter until fluffy.', 11),
(@recipe_id, 12, 'Gradually add powdered sugar and vanilla, mixing until smooth.', 12),
(@recipe_id, 13, 'Spread the frosting evenly over the chilled cheesecake before serving.', 13);



-- recipe for a plate of nachos 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(2, 'Large Plate of Nachos', 15, 10, 'Crispy tortilla chips topped with melted cheese, seasoned beef, and fresh toppings.', 1, 9, 6, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
-- Base
(@recipe_id, 1, 12, 'Tortilla chips', 8, 1),  -- 12 ounces tortilla chips
(@recipe_id, 2, 2, 'Cheddar cheese, shredded', 3, 2),  -- 2 cups cheddar cheese
(@recipe_id, 3, 1, 'Monterey Jack cheese, shredded', 3, 3),  -- 1 cup Monterey Jack cheese

-- Toppings
(@recipe_id, 4, 1, 'Ground beef', 9, 4),  -- 1 pound ground beef
(@recipe_id, 5, 1, 'Taco seasoning', 2, 5),  -- 1 tablespoon taco seasoning
(@recipe_id, 6, 0.25, 'Water', 3, 6),  -- 1/4 cup water (to mix with seasoning)
(@recipe_id, 7, 1, 'Black beans, drained and rinsed', 3, 7),  -- 1 cup black beans
(@recipe_id, 8, 1, 'Jalapeño, sliced', 8, 8),  -- 1 jalapeño, sliced
(@recipe_id, 9, 0.5, 'Tomatoes, diced', 3, 9),  -- 1/2 cup diced tomatoes
(@recipe_id, 10, 0.25, 'Red onion, diced', 3, 10),  -- 1/4 cup diced red onion
(@recipe_id, 11, 0.5, 'Sour cream', 3, 11),  -- 1/2 cup sour cream
(@recipe_id, 12, 0.5, 'Guacamole', 3, 12),  -- 1/2 cup guacamole
(@recipe_id, 13, 2, 'Green onions, chopped', 2, 13),  -- 2 tablespoons chopped green onions
(@recipe_id, 14, 2, 'Cilantro, chopped', 2, 14);  -- 2 tablespoons chopped cilantro

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Preheat oven to 375°F (190°C).', 1),
(@recipe_id, 2, 'Spread tortilla chips in an even layer on a large baking sheet.', 2),
(@recipe_id, 3, 'Sprinkle shredded cheddar and Monterey Jack cheese over the chips.', 3),
(@recipe_id, 4, 'In a skillet over medium heat, cook the ground beef until browned.', 4),
(@recipe_id, 5, 'Drain excess fat, then stir in taco seasoning and water. Simmer for 2-3 minutes.', 5),
(@recipe_id, 6, 'Spread seasoned beef evenly over the chips and cheese.', 6),
(@recipe_id, 7, 'Add black beans and jalapeño slices.', 7),
(@recipe_id, 8, 'Bake for 8-10 minutes, or until the cheese is fully melted.', 8),
(@recipe_id, 9, 'Remove from the oven and top with diced tomatoes, red onions, sour cream, and guacamole.', 9),
(@recipe_id, 10, 'Garnish with green onions and cilantro before serving.', 10);



-- recipe for meat lovers pizza 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(5, 'Meat Lovers Pizza', 10, 15, 'A delicious pizza loaded with pepperoni, sausage, bacon, and ham on a crispy crust.', 1, 9, 4, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 1, 'Pre-made pizza crust', 8, 1),  -- 1 pizza crust
(@recipe_id, 2, 0.5, 'Pizza sauce', 3, 2),  -- 1/2 cup pizza sauce
(@recipe_id, 3, 1.5, 'Mozzarella cheese, shredded', 3, 3),  -- 1.5 cups shredded mozzarella
(@recipe_id, 4, 0.5, 'Pepperoni slices', 8, 4),  -- 1/2 cup pepperoni slices
(@recipe_id, 5, 0.5, 'Cooked Italian sausage, crumbled', 9, 5),  -- 1/2 pound cooked sausage
(@recipe_id, 6, 0.5, 'Cooked bacon, crumbled', 8, 6),  -- 1/2 cup cooked, crumbled bacon
(@recipe_id, 7, 0.5, 'Diced ham', 8, 7),  -- 1/2 cup diced ham
(@recipe_id, 8, 0.25, 'Parmesan cheese, grated', 3, 8),  -- 1/4 cup Parmesan
(@recipe_id, 9, 0.5, 'Red onion, thinly sliced', 3, 9),  -- 1/2 cup thinly sliced red onion
(@recipe_id, 10, 1, 'Olive oil', 2, 10),  -- 1 tablespoon olive oil
(@recipe_id, 11, 1, 'Italian seasoning', 2, 11);  -- 1 teaspoon Italian seasoning

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Preheat oven to 425°F (218°C).', 1),
(@recipe_id, 2, 'Place the pre-made pizza crust on a baking sheet or pizza stone.', 2),
(@recipe_id, 3, 'Spread pizza sauce evenly over the crust.', 3),
(@recipe_id, 4, 'Sprinkle mozzarella cheese evenly over the sauce.', 4),
(@recipe_id, 5, 'Top with pepperoni slices, crumbled sausage, bacon, and diced ham.', 5),
(@recipe_id, 6, 'Add red onions and sprinkle Parmesan cheese on top.', 6),
(@recipe_id, 7, 'Drizzle olive oil over the pizza and sprinkle with Italian seasoning.', 7),
(@recipe_id, 8, 'Bake for 12-15 minutes or until cheese is melted and crust is golden brown.', 8),
(@recipe_id, 9, 'Remove from oven and let sit for a few minutes before slicing.', 9),
(@recipe_id, 10, 'Serve hot and enjoy!', 10);



-- recipe for buffalo wings 
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(5, 'Buffalo Wings', 15, 25, 'Crispy, spicy buffalo wings coated in a tangy sauce, perfect for game day or any gathering.', 24, 8, 4, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 2, 'Chicken wings, split at joints, tips removed', 9, 1),  -- 2 pounds chicken wings
(@recipe_id, 2, 0.5, 'Flour', 3, 2),  -- 1/2 cup flour
(@recipe_id, 3, 1, 'Baking powder', 2, 3),  -- 1 tablespoon baking powder
(@recipe_id, 4, 1, 'Salt', 2, 4),  -- 1 teaspoon salt
(@recipe_id, 5, 0.5, 'Black pepper', 2, 5),  -- 1/2 teaspoon black pepper
(@recipe_id, 6, 0.5, 'Garlic powder', 2, 6),  -- 1/2 teaspoon garlic powder
(@recipe_id, 7, 0.5, 'Paprika', 2, 7),  -- 1/2 teaspoon paprika
(@recipe_id, 8, 1, 'Butter, melted', 3, 8),  -- 1/2 cup melted butter
(@recipe_id, 9, 0.5, 'Hot sauce', 3, 9),  -- 1/2 cup hot sauce
(@recipe_id, 10, 1, 'White vinegar', 2, 10),  -- 1 tablespoon white vinegar
(@recipe_id, 11, 0.5, 'Worcestershire sauce', 2, 11),  -- 1/2 teaspoon Worcestershire sauce
(@recipe_id, 12, 1, 'Vegetable oil (for frying)', 3, 12);  -- 1 cup for frying or spray for baking
(@recipe_id, 13, 1, 'Cooking spray (for baking)', 3, 13);  -- 1 cup for frying or spray for baking

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Preheat oven to 425°F (218°C) if baking, or heat oil in a deep fryer to 375°F (190°C) if frying.', 1),
(@recipe_id, 2, 'In a large bowl, mix flour, baking powder, salt, black pepper, garlic powder, and paprika.', 2),
(@recipe_id, 3, 'Pat chicken wings dry with paper towels, then toss in the flour mixture until evenly coated.', 3),
(@recipe_id, 4, 'For baking: Place wings on a wire rack over a baking sheet and spray lightly with cooking spray.', 4),
(@recipe_id, 5, 'Bake for 20-25 minutes, flipping halfway, until crispy and golden brown.', 5),
(@recipe_id, 6, 'For frying: Fry wings in hot oil for 8-10 minutes until crispy and fully cooked.', 6),
(@recipe_id, 7, 'In a separate bowl, whisk melted butter, hot sauce, vinegar, and Worcestershire sauce together.', 7),
(@recipe_id, 8, 'Toss cooked wings in the buffalo sauce until well coated.', 8),
(@recipe_id, 9, 'Serve immediately with ranch or blue cheese dressing and celery sticks.', 9);



-- recipe for grilled steak with grilled asparagus
-- Insert the recipe into the recipe table
INSERT INTO recipe (user_id, recipe_title, prep_time_minutes, cook_time_minutes, description, yield, measurement_id, servings, visibility_id)
VALUES 
(3, 'Grilled Steak with Grilled Asparagus', 10, 15, 'Juicy grilled steak paired with tender, smoky asparagus for a simple yet delicious meal.', 2, 9, 2, 1);

-- Get the last inserted recipe_id (replace with the actual recipe_id if needed)
SET @recipe_id = LAST_INSERT_ID();

-- Insert ingredients into the ingredient table
INSERT INTO ingredient (recipe_id, ingredient_line_item, quantity, ingredient_name, measurement_id, sort_order)
VALUES
(@recipe_id, 1, 2, 'Steak (ribeye, sirloin, or filet mignon)', 9, 1),  -- 2 steaks
(@recipe_id, 2, 1, 'Olive oil', 3, 2),  -- 1/4 cup olive oil
(@recipe_id, 3, 1, 'Salt', 2, 3),  -- 1 teaspoon salt
(@recipe_id, 4, 0.5, 'Black pepper', 2, 4),  -- 1/2 teaspoon black pepper
(@recipe_id, 5, 1, 'Garlic powder', 2, 5),  -- 1 teaspoon garlic powder
(@recipe_id, 6, 0.5, 'Paprika', 2, 6),  -- 1/2 teaspoon paprika
(@recipe_id, 7, 1, 'Asparagus spears, trimmed', 9, 7),  -- 1 pound asparagus
(@recipe_id, 8, 1, 'Lemon juice', 3, 8),  -- 1 tablespoon lemon juice
(@recipe_id, 9, 1, 'Parmesan cheese, grated', 8, 9);  -- 1/4 cup grated Parmesan cheese

-- Insert directions into the direction table
INSERT INTO direction (recipe_id, direction_line_item, direction_text, sort_order)
VALUES
(@recipe_id, 1, 'Preheat grill to medium-high heat (about 400°F).', 1),
(@recipe_id, 2, 'Rub steaks with olive oil, salt, black pepper, garlic powder, and paprika. Let sit for 10 minutes.', 2),
(@recipe_id, 3, 'Drizzle asparagus with olive oil, salt, and black pepper.', 3),
(@recipe_id, 4, 'Place steaks on the grill and cook for 4-5 minutes per side for medium-rare (longer for well-done).', 4),
(@recipe_id, 5, 'While steaks are grilling, place asparagus on the grill and cook for 3-5 minutes until tender and slightly charred.', 5),
(@recipe_id, 6, 'Remove steaks from the grill and let them rest for 5 minutes before serving.', 6),
(@recipe_id, 7, 'Drizzle grilled asparagus with lemon juice and sprinkle with Parmesan cheese.', 7),
(@recipe_id, 8, 'Serve steaks with grilled asparagus on the side.', 8);



-- recipe for  --------------------------------------------------








-- recipe for  --------------------------------------------------
-- recipe for  --------------------------------------------------
