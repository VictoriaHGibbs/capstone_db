INSERT INTO `image` (`id`, `recipe_id`, `image_line_item`, `image_url`, `sort_order`) 
VALUES 
(NULL, '1', '1', 'default_recipe2.webp', '1'), 
(NULL, '2', '1', 'default_recipe3.webp', '1'),
(NULL, '3', '1', 'default_recipe3.webp', '1'), 
(NULL, '4', '1', 'default_recipe1.webp', '1'), 
(NULL, '5', '1', 'default_recipe2.webp', '1'), 
(NULL, '6', '1', 'default_recipe3.webp', '1'), 
(NULL, '7', '1', 'default_recipe1.webp', '1'), 
(NULL, '9', '1', 'default_recipe2.webp', '1'), 
(NULL, '10', '1', 'default_recipe3.webp', '1');


ALTER TABLE recipe_meal_type
RENAME COLUMN recipe_meal_type_id TO id;

ALTER TABLE recipe_style
RENAME COLUMN recipe_style_id TO id;

ALTER TABLE recipe_diet
RENAME COLUMN recipe_diet_id TO id;

ALTER TABLE comment
RENAME COLUMN comment_id TO id;

ALTER TABLE follow
RENAME COLUMN follow_id TO id;

-------------------------------------------------------

ALTER TABLE table_name
DROP PRIMARY KEY,
CHANGE COLUMN old_column_name new_column_name column_definition,
ADD PRIMARY KEY (new_column_name);

ALTER TABLE recipe_meal_type
DROP PRIMARY KEY,
CHANGE COLUMN recipe_meal_type_id id int UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (id);
