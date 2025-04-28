CREATE DATABASE IF NOT EXISTS victori1_grub;
USE victori1_grub;

CREATE TABLE `user` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(20) UNIQUE NOT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `f_name` varchar(50),
  `l_name` varchar(50),
  `email_address` varchar(100) UNIQUE NOT NULL,
  `password_hash` varbinary(60) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` tinyint NOT NULL DEFAULT 1,
  `active` boolean NOT NULL DEFAULT 1
);

CREATE TABLE `role` (
  `role_id` tinyint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role` varchar(11) NOT NULL
);

CREATE TABLE `recipe` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `recipe_title` varchar(100) NOT NULL,
  `prep_time_minutes` int UNSIGNED NOT NULL,
  `cook_time_minutes` int UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yield` decimal(10,2) NOT NULL,
  `measurement_id` tinyint UNSIGNED NOT NULL,
  `servings` smallint UNSIGNED NOT NULL,
  `visibility_id` tinyint UNSIGNED NOT NULL,

  FULLTEXT (`recipe_title`, `description`)
);

CREATE TABLE `ingredient` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `ingredient_line_item` tinyint UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `measurement_id` tinyint UNSIGNED,
  `sort_order` tinyint NOT NULL DEFAULT (`ingredient_line_item`),
    UNIQUE INDEX (`recipe_id`, `ingredient_line_item`)
);

CREATE TABLE `measurement` (
  `measurement_id` tinyint UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `measurement` varchar(255) NOT NULL
);

CREATE TABLE `direction` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `direction_line_item` tinyint UNSIGNED NOT NULL,
  `direction_text` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT (`direction_line_item`),
    UNIQUE INDEX (`recipe_id`, `direction_line_item`)
);

CREATE TABLE `rating` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `rater_user_id` int UNSIGNED NOT NULL,
  `rating_level` ENUM ('1', '2', '3', '4', '5') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX (`recipe_id`, `rater_user_id`)
);

CREATE TABLE `image` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `image_line_item` tinyint UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` tinyint DEFAULT (`image_line_item`),
    UNIQUE INDEX (`recipe_id`, `image_line_item`)
);

CREATE TABLE `video` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `youtube_url` varchar(125) NOT NULL
);

CREATE TABLE `recipe_meal_type` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `meal_type_id` tinyint UNSIGNED NOT NULL,
  `recipe_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX (`recipe_id`, `meal_type_id`)
);

CREATE TABLE `meal_type` (
  `meal_type_id` tinyint UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `meal_type` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `recipe_style` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `style_id` tinyint UNSIGNED NOT NULL,
  `recipe_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX (`recipe_id`, `style_id`)
);

CREATE TABLE `style` (
  `style_id` tinyint UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `style` varchar(35) UNIQUE NOT NULL
);

CREATE TABLE `recipe_diet` (
  `id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `diet_id` tinyint UNSIGNED NOT NULL,
  `recipe_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX (`recipe_id`, `diet_id`)
);

CREATE TABLE `diet` (
  `diet_id` tinyint UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `diet` varchar(35) UNIQUE NOT NULL
);

CREATE TABLE `visibility` (
  `visibility_id` tinyint UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `visibility` varchar(255) NOT NULL
);


ALTER TABLE `recipe` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `direction` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `ingredient` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `ingredient` ADD FOREIGN KEY (`measurement_id`) REFERENCES `measurement` (`measurement_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`rater_user_id`) REFERENCES `user` (`id`);

ALTER TABLE `rating` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `image` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `recipe_meal_type` ADD FOREIGN KEY (`meal_type_id`) REFERENCES `meal_type` (`meal_type_id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`diet_id`) REFERENCES `diet` (`diet_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`);

ALTER TABLE `recipe_style` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `recipe_diet` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`measurement_id`) REFERENCES `measurement` (`measurement_id`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`visibility_id`) REFERENCES `visibility` (`visibility_id`);

ALTER TABLE `video` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);
