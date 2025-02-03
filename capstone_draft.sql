CREATE DATABASE IF NOT EXISTS grub;
USE grub;

CREATE TABLE `user` (
  `user_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(20) UNIQUE NOT NULL,
  `profile_image_url` varchar(255),
  `f_name` varchar(50),
  `l_name` varchar(50),
  `email_address` varchar(100) UNIQUE NOT NULL,
  `password_hash` varbinary(60) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_role_id` tinyint(1) NOT NULL unsigned,
  `active` boolean NOT NULL DEFAULT 1
);

CREATE TABLE `role` (
  `user_role_id` tinyint(1) UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_role` varchar(10) NOT NULL
);

CREATE TABLE `recipe` (
  `recipe_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_title` varchar(100) NOT NULL,
  `prep_time_minutes` int NOT NULL unsigned,
  `cook_time_minutes` int NOT NULL unsigned,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yield` int NOT NULL unsigned,
  `yield_measurement_id` tinyint NOT NULL,
  `servings` smallint NOT NULL unsigned,
  `visibility_id` tinyint(1) NOT NULL unsigned,

  FULLTEXT (`recipe_title`, `description`);
);

CREATE TABLE `ingredient` (
  `recipe_id` int NOT NULL,
  `ingredient_line_item` tinyint NOT NULL AUTO_INCREMENT unsigned,
  `quantity` int NOT NULL unsigned,
  `ingredient_name` varchar(50) NOT NULL,
  `measurement_id` tinyint NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT (`ingredient_line_item`),
  CONSTRAINT ingredient_pk
    PRIMARY KEY (`recipe_id`, `ingredient_line_item`)
);

CREATE TABLE `measurement` (
  `measurement_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `measurement_unit` varchar(255) NOT NULL
);

CREATE TABLE `direction` (
  `recipe_id` int NOT NULL,
  `direction_line_item` tinyint NOT NULL AUTO_INCREMENT unsigned,
  `direction_text` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT (`direction_line_item`),
  CONSTRAINT direction_pk
    PRIMARY KEY (`recipe_id`, `direction_line_item`)
);

CREATE TABLE `rating` (
  `recipe_id` int NOT NULL,
  `rater_user_id` int NOT NULL,
  `rating_level` ENUM ('1', '2', '3', '4', '5') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT rating_pk
    PRIMARY KEY (`recipe_id`, `rater_user_id`)
);

CREATE TABLE `image` (
  `recipe_id` int NOT NULL,
  `image_line_item` tinyint NOT NULL AUTO_INCREMENT unsigned,
  `image_url` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT (`image_line_item`),
  CONSTRAINT image_pk
    PRIMARY KEY (`recipe_id`, `image_line_item`)
);

CREATE TABLE `video` (
  `recipe_id` int NOT NULL,
  `youtube_url` varchar(125) NOT NULL
);

CREATE TABLE `recipe_meal_type` (
  `meal_type_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`, `meal_type_id`)
);

CREATE TABLE `meal_type` (
  `meal_type_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `meal_type` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `recipe_style` (
  `style_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`, `style_id`)
);

CREATE TABLE `style` (
  `style_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `style_type` varchar(35) UNIQUE NOT NULL
);

CREATE TABLE `recipe_diet` (
  `diet_id` tinyint NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`, `diet_id`)
);

CREATE TABLE `diet` (
  `diet_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `diet` varchar(35) UNIQUE NOT NULL
);

CREATE TABLE `visibility` (
  `visibility_id` tinyint UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `visibility_type` varchar(255) NOT NULL
);

CREATE TABLE `comment` (
  `commenter_user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `comment_text` text NOT NULL,
  `comment_left_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commenter_user_id`, `recipe_id`)
);

CREATE TABLE `follow` (
  `following_user_id` int NOT NULL,
  `followed_user_id` int NOT NULL,
  `followed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`following_user_id`, `followed_user_id`)
);


ALTER TABLE `recipe` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `direction` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `ingredient` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `ingredient` ADD FOREIGN KEY (`measurement_id`) REFERENCES `measurement` (`measurement_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`user_role_id`) REFERENCES `role` (`user_role_id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`rater_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `image` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`meal_type_id`) REFERENCES `meal_type` (`meal_type_id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`diet_id`) REFERENCES `diet` (`diet_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`yield_measurement_id`) REFERENCES `measurement` (`measurement_id`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`visibility_id`) REFERENCES `visibility` (`visibility_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`commenter_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `follow` ADD FOREIGN KEY (`following_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `follow` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `video` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);
