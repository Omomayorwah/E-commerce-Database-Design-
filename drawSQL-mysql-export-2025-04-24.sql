CREATE TABLE `product_item`(
    `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` INT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `quantity_in_stock` INT NOT NULL
);
CREATE TABLE `product_image`(
    `Image_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` INT NOT NULL,
    `image_url` VARCHAR(255) NOT NULL,
    `image_alt_text` VARCHAR(255) NOT NULL,
    `display_order` INT NOT NULL
);
CREATE TABLE `product_category`(
    `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `category_description` VARCHAR(255) NOT NULL
);
CREATE TABLE `color`(
    `color_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `color_name` VARCHAR(255) NOT NULL,
    `color_code` VARCHAR(255) NOT NULL
);
CREATE TABLE `attribute_category`(
    `attribute_category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `size_option`(
    `size_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `size_category_id` INT NOT NULL,
    `size_value` VARCHAR(255) NOT NULL,
    `size_description` VARCHAR(255) NOT NULL,
    `display_order` INT NOT NULL
);
CREATE TABLE `product_item_variation`(
    `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `variation_id` INT NOT NULL,
    PRIMARY KEY(`variation_id`)
);
CREATE TABLE `product`(
    `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(255) NOT NULL,
    `category_id` INT NOT NULL,
    `base_price` DECIMAL(8, 2) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `size_category`(
    `size_category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_variation`(
    `variation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` INT NOT NULL,
    `variation_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `brand`(
    `brand_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `brand_name` VARCHAR(255) NOT NULL,
    `brand_description` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_attribute`(
    `attribute_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` INT NOT NULL,
    `attribute_category_id` INT NOT NULL,
    `attribute_type_id` INT NOT NULL,
    `attribute_name` VARCHAR(255) NOT NULL,
    `attribute_value` TEXT NOT NULL,
    `display_order` INT NOT NULL
);
CREATE TABLE `attribute_type`(
    `attribute_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_item_size`(
    `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `size_id` INT NOT NULL,
    PRIMARY KEY(`size_id`)
);
CREATE TABLE `product_item_color`(
    `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `color_id` INT NOT NULL,
    PRIMARY KEY(`color_id`)
);
ALTER TABLE
    `product_item_color` ADD CONSTRAINT `product_item_color_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `product_item`(`item_id`);
ALTER TABLE
    `product_attribute` ADD CONSTRAINT `product_attribute_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `product_item_variation` ADD CONSTRAINT `product_item_variation_variation_id_foreign` FOREIGN KEY(`variation_id`) REFERENCES `product_variation`(`variation_id`);
ALTER TABLE
    `product_attribute` ADD CONSTRAINT `product_attribute_attribute_category_id_foreign` FOREIGN KEY(`attribute_category_id`) REFERENCES `attribute_category`(`attribute_category_id`);
ALTER TABLE
    `product_image` ADD CONSTRAINT `product_image_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `product_category`(`category_id`);
ALTER TABLE
    `size_option` ADD CONSTRAINT `size_option_size_id_foreign` FOREIGN KEY(`size_id`) REFERENCES `product_item_size`(`size_id`);
ALTER TABLE
    `product_item_size` ADD CONSTRAINT `product_item_size_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `product_item`(`item_id`);
ALTER TABLE
    `product_item` ADD CONSTRAINT `product_item_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `size_option` ADD CONSTRAINT `size_option_size_category_id_foreign` FOREIGN KEY(`size_category_id`) REFERENCES `size_category`(`size_category_id`);
ALTER TABLE
    `product_item` ADD CONSTRAINT `product_item_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `product_item_variation`(`item_id`);
ALTER TABLE
    `color` ADD CONSTRAINT `color_color_id_foreign` FOREIGN KEY(`color_id`) REFERENCES `product_item_color`(`color_id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `brand`(`brand_id`);
ALTER TABLE
    `product_attribute` ADD CONSTRAINT `product_attribute_attribute_type_id_foreign` FOREIGN KEY(`attribute_type_id`) REFERENCES `attribute_type`(`attribute_type_id`);