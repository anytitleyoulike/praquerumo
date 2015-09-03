ALTER TABLE `praquerumo`.`newsletter` 
ADD COLUMN `codigo_verificacao` VARCHAR(35) NULL AFTER `email`,
ADD COLUMN `ativo` INT NULL AFTER `codigo_verificacao`;