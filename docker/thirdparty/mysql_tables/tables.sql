CREATE TABLE `tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `tenant_name` varchar(500) NOT NULL,
  `tenant_uuid` varchar(256) NOT NULL
);


ALTER TABLE `users`
ADD `tenant_id` bigint NOT NULL;
