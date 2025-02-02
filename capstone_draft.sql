CREATE TABLE `user` (
  `user_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `username` varchar(20) UNIQUE NOT NULL,
  `profile_image_url` varchar(255),
  `f_name` varchar(50),
  `l_name` varchar(50),
  `email_address` varchar(100) UNIQUE NOT NULL,
  `password_hash` varbinary NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `user_role_id` tinyint(1) NOT NULL COMMENT 'unsigned',
  `active` boolean NOT NULL DEFAULT 1
);

CREATE TABLE `role` (
  `user_role_id` tinyint(1) UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `user_role` varchar(10) NOT NULL COMMENT 'member, admin, superadmin'
);

CREATE TABLE `recipe` (
  `recipe_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `user_id` int NOT NULL,
  `recipe_title` varchar(100) NOT NULL COMMENT 'url slug from here',
  `prep_time_minutes` int NOT NULL,
  `cook_time_minutes` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `yield` int NOT NULL,
  `yield_measurement_id` tinyint NOT NULL,
  `servings` smallint NOT NULL COMMENT 'unsigned',
  `visibility_id` tinyint(1) NOT NULL COMMENT 'unsigned'
);

CREATE TABLE `ingredient` (
  `recipe_id` int NOT NULL,
  `ingredient_line_item` tinyint NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `quantity` int NOT NULL COMMENT 'unsigned',
  `ingredient_name` varchar(50) NOT NULL,
  `measurement_id` tinyint NOT NULL COMMENT 'unsigned',
  `sort_order` tinyint DEFAULT 'ingredient_line_item',
  PRIMARY KEY (`recipe_id`, `ingredient_line_item`)
);

CREATE TABLE `measurement` (
  `measurement_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `measurement_unit` varchar(255) NOT NULL COMMENT 'list of measurement options'
);

CREATE TABLE `direction` (
  `recipe_id` int NOT NULL,
  `direction_line_item` tinyint NOT NULL AUTO_INCREMENT,
  `direction_text` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT 'direction_line_item',
  PRIMARY KEY (`recipe_id`, `direction_line_item`)
);

CREATE TABLE `rating` (
  `recipe_id` int NOT NULL,
  `rater_user_id` int NOT NULL,
  `rating_level` ENUM ('1', '2', '3', '4', '5') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`recipe_id`, `rater_user_id`)
);

CREATE TABLE `image` (
  `recipe_id` int NOT NULL,
  `image_line_item` tinyint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT 'image_line_item',
  PRIMARY KEY (`recipe_id`, `image_line_item`)
);

CREATE TABLE `video` (
  `recipe_id` int NOT NULL,
  `youtube_url` varchar(100) NOT NULL
);

CREATE TABLE `recipe_meal_type` (
  `meal_type_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`meal_type_id`, `recipe_id`)
);

CREATE TABLE `meal_type` (
  `meal_type_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `meal_type` varchar(20) UNIQUE NOT NULL
);

CREATE TABLE `recipe_style` (
  `style_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`, `style_id`)
);

CREATE TABLE `style` (
  `style_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `style_type` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `recipe_diet` (
  `diet_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`, `diet_id`)
);

CREATE TABLE `diet` (
  `diet_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `diet` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `visibility` (
  `visibility_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'unsigned',
  `visibility_type` varchar(255) NOT NULL COMMENT 'private, public, friend'
);

CREATE TABLE `comment` (
  `commenter_user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `comment_text` text NOT NULL,
  `comment_left_on` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`commenter_user_id`, `recipe_id`)
);

CREATE TABLE `follow` (
  `following_user_id` int NOT NULL,
  `followed_user_id` int NOT NULL,
  `followed_on` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`following_user_id`, `followed_user_id`)
);

CREATE INDEX `recipe_index_0` ON `recipe` (`recipe_title`, `description`);

CREATE INDEX `recipe_index_1` ON `recipe` (`recipe_title`);

CREATE INDEX `recipe_index_2` ON `recipe` (`description`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `direction` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `ingredient` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `L_measurement` ADD FOREIGN KEY (`measurement_id`) REFERENCES `ingredient` (`measurement_id`);

ALTER TABLE `L_role` ADD FOREIGN KEY (`user_role_id`) REFERENCES `user` (`user_role_id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`rater_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `image` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`meal_type_id`) REFERENCES `L_meal_type` (`meal_type_id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`diet_id`) REFERENCES `L_diet` (`diet_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`style_id`) REFERENCES `L_style` (`style_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `L_measurement` ADD FOREIGN KEY (`measurement_id`) REFERENCES `recipe` (`yield_measurement_id`);

ALTER TABLE `L_visibility` ADD FOREIGN KEY (`visibility_id`) REFERENCES `recipe` (`visibility_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`commenter_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `follow` ADD FOREIGN KEY (`following_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `follow` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `video` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);
