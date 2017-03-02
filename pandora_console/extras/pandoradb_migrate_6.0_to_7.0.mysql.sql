-- ---------------------------------------------------------------------
-- Table `titem`
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `titem` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_map` int(10) unsigned NOT NULL default 0,
	`x` INTEGER NOT NULL default 0,
	`y` INTEGER NOT NULL default 0,
	`z` INTEGER NOT NULL default 0,
	`deleted` INTEGER(1) unsigned NOT NULL default 0,
	`type` INTEGER UNSIGNED NOT NULL default 0,
	`refresh` INTEGER UNSIGNED NOT NULL default 0,
	`source` INTEGER UNSIGNED NOT NULL default 0,
	`source_data` varchar(250) default '',
	`options` TEXT,
	`style` TEXT,
	PRIMARY KEY(`id`)
)  ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------------------
-- Table `tmap`
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmap` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_group` int(10) unsigned NOT NULL default 0,
	`id_user` varchar(250) NOT NULL default '',
	`type` int(10) unsigned NOT NULL default 0,
	`subtype` int(10) unsigned NOT NULL default 0,
	`name` varchar(250) default '',
	`description` TEXT,
	`height` INTEGER UNSIGNED NOT NULL default 0,
	`width` INTEGER UNSIGNED NOT NULL default 0,
	`center_x` INTEGER NOT NULL default 0,
	`center_y` INTEGER NOT NULL default 0,
	`background` varchar(250) default '',
	`background_options` INTEGER UNSIGNED NOT NULL default 0,
	`source_period` INTEGER UNSIGNED NOT NULL default 0,
	`source` INTEGER UNSIGNED NOT NULL default 0,
	`source_data`  varchar(250) default '',
	`generation_method` INTEGER UNSIGNED NOT NULL default 0,
	`generated` INTEGER UNSIGNED NOT NULL default 0,
	`filter` TEXT,
	PRIMARY KEY(`id`)
)  ENGINE = InnoDB DEFAULT CHARSET=utf8;


-- ---------------------------------------------------------------------
-- Table `trel_item`
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trel_item` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_parent` int(10) unsigned NOT NULL default 0,
	`id_child` int(10) unsigned NOT NULL default 0,
	`id_map` int(10) unsigned NOT NULL default 0,
	`id_parent_source_data` int(10) unsigned NOT NULL default 0,
	`id_child_source_data` int(10) unsigned NOT NULL default 0,
	`parent_type` int(10) unsigned NOT NULL default 0,
	`child_type` int(10) unsigned NOT NULL default 0,
	`id_item` int(10) unsigned NOT NULL default 0,
	`deleted` int(1) unsigned NOT NULL default 0,
	PRIMARY KEY(`id`)
)  ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------------------
-- Table `talert_templates`
-- ---------------------------------------------------------------------
ALTER TABLE talert_templates ADD COLUMN `min_alerts_reset_counter` tinyint(1) DEFAULT 0;
ALTER TABLE talert_templates ADD COLUMN `field11` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field12` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field13` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field14` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field15` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field11_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field12_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field13_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field14_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_templates ADD COLUMN `field15_recovery` TEXT NOT NULL DEFAULT "";

-- ---------------------------------------------------------------------
-- Table `talert_snmp`
-- ---------------------------------------------------------------------
ALTER TABLE talert_snmp ADD COLUMN `al_field11` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp ADD COLUMN `al_field12` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp ADD COLUMN `al_field13` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp ADD COLUMN `al_field14` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp ADD COLUMN `al_field15` TEXT NOT NULL DEFAULT "";

-- ---------------------------------------------------------------------
-- Table `talert_snmp_action`
-- ---------------------------------------------------------------------
ALTER TABLE talert_snmp_action ADD COLUMN `al_field11` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp_action ADD COLUMN `al_field12` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp_action ADD COLUMN `al_field13` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp_action ADD COLUMN `al_field14` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_snmp_action ADD COLUMN `al_field15` TEXT NOT NULL DEFAULT "";

-- ----------------------------------------------------------------------
-- Table `tserver`
-- ----------------------------------------------------------------------
ALTER TABLE tserver ADD COLUMN `server_keepalive` int(11) DEFAULT 0;

-- ----------------------------------------------------------------------
-- Table `tagente_estado`
-- ----------------------------------------------------------------------
ALTER TABLE tagente_estado MODIFY `status_changes` tinyint(4) unsigned default 0;
ALTER TABLE tagente_estado CHANGE `last_known_status` `known_status` tinyint(4) default 0;
ALTER TABLE tagente_estado ADD COLUMN `last_known_status` tinyint(4) default 0;

-- ---------------------------------------------------------------------
-- Table `talert_actions`
-- ---------------------------------------------------------------------
UPDATE talert_actions SET   `field4` = 'integria',
							`field5` = '_agent_:&#x20;_alert_name_',
							`field6` = '1',
							`field7` = '3',
							`field8` = 'copy@dom.com',
							`field9` = 'admin',
							`field10` = '_alert_description_'
WHERE `id` = 4 AND `id_alert_command` = 11;
ALTER TABLE talert_actions ADD COLUMN `field11` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field12` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field13` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field14` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field15` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field11_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field12_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field13_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field14_recovery` TEXT NOT NULL DEFAULT "";
ALTER TABLE talert_actions ADD COLUMN `field15_recovery` TEXT NOT NULL DEFAULT "";

-- ---------------------------------------------------------------------
-- Table `talert_commands`
-- ---------------------------------------------------------------------
UPDATE `talert_commands` SET `fields_descriptions` = '[\"Integria&#x20;IMS&#x20;API&#x20;path\",\"Integria&#x20;IMS&#x20;API&#x20;pass\",\"Integria&#x20;IMS&#x20;user\",\"Integria&#x20;IMS&#x20;user&#x20;pass\",\"Ticket&#x20;title\",\"Ticket&#x20;group&#x20;ID\",\"Ticket&#x20;priority\",\"Email&#x20;copy\",\"Ticket&#x20;owner\",\"Ticket&#x20;description\"]', `fields_values` = '[\"\",\"\",\"\",\"\",\"\",\"\",\"10,Maintenance;0,Informative;1,Low;2,Medium;3,Serious;4,Very&#x20;Serious\",\"\",\"\",\"\"]' WHERE `id` = 11 AND `name` = 'Integria&#x20;IMS&#x20;Ticket';

-- ---------------------------------------------------------------------
-- Table `tmap`
-- ---------------------------------------------------------------------
ALTER TABLE tmap MODIFY `id_user` varchar(128);

-- ---------------------------------------------------------------------
-- Table `titem`
-- ---------------------------------------------------------------------
ALTER TABLE titem MODIFY `source_data` int(10) unsigned;

-- ---------------------------------------------------------------------
-- Table `trel_item`
-- ---------------------------------------------------------------------
ALTER TABLE trel_item ADD `id_parent_source_data` int(11) NOT NULL DEFAULT 0;
ALTER TABLE trel_item ADD `id_child_source_data` int(11) NOT NULL DEFAULT 0;
ALTER TABLE trel_item ADD `id_map` int(11) NOT NULL DEFAULT 0;

-- ---------------------------------------------------------------------
-- Table `tconfig`
-- ---------------------------------------------------------------------
INSERT INTO `tconfig` (`token`, `value`) VALUES ('big_operation_step_datos_purge', '100');
INSERT INTO `tconfig` (`token`, `value`) VALUES ('small_operation_step_datos_purge', '1000');
INSERT INTO `tconfig` (`token`, `value`) VALUES ('days_autodisable_deletion', '30');
INSERT INTO `tconfig` (`token`, `value`) VALUES ('MR', 0);
UPDATE tconfig SET value = 'https://licensing.artica.es/pandoraupdate7/server.php' WHERE token='url_update_manager';
DELETE FROM `tconfig` WHERE `token` = 'current_package_enterprise';
INSERT INTO `tconfig` (`token`, `value`) VALUES ('current_package_enterprise', '700');

-- ---------------------------------------------------------------------
-- Table `tplanned_downtime_agents`
-- ---------------------------------------------------------------------
ALTER TABLE tplanned_downtime_agents ADD COLUMN `manually_disabled` tinyint(1) DEFAULT 0;


-- ---------------------------------------------------------------------
-- Table `tlink`
-- ---------------------------------------------------------------------
UPDATE `tlink` SET `link` = 'http://library.pandorafms.com/' WHERE `name` = 'Module library';
UPDATE `tlink` SET `name` = 'Enterprise Edition' WHERE `id_link` = 0000000002;
UPDATE `tlink` SET `name` = 'Documentation', `link` = 'http://wiki.pandorafms.com/' WHERE `id_link` = 0000000001;
UPDATE `tlink` SET `link` = 'http://forums.pandorafms.com/index.php?board=22.0' WHERE `id_link` = 0000000004;
UPDATE `tlink` SET `link` = 'https://github.com/pandorafms/pandorafms/issues' WHERE `id_link` = 0000000003;

-- ---------------------------------------------------------------------
-- Table `tevent_filter`
-- ---------------------------------------------------------------------
ALTER TABLE tevent_filter ADD COLUMN `date_from` date DEFAULT NULL;
ALTER TABLE tevent_filter ADD COLUMN `date_to` date DEFAULT NULL;

-- ---------------------------------------------------------------------
-- Table `tusuario`
-- ---------------------------------------------------------------------
ALTER TABLE tusuario ADD COLUMN `id_filter` int(10) unsigned NULL default NULL;
ALTER TABLE tusuario ADD COLUMN CONSTRAINT `fk_id_filter` FOREIGN KEY (id_filter) REFERENCES tevent_filter(id_filter) ON DELETE SET NULL;
ALTER TABLE tusuario ADD COLUMN `session_time` int(10) signed NOT NULL default '0';

-- ---------------------------------------------------------------------
-- Table `tagente_modulo`
-- ---------------------------------------------------------------------
ALTER TABLE tagente_modulo ADD COLUMN `dynamic_next` bigint(20) NOT NULL default '0';
ALTER TABLE tagente_modulo ADD COLUMN `dynamic_two_tailed` tinyint(1) unsigned default '0';
ALTER TABLE tagente_modulo ADD COLUMN `parent_module_id` int(10) unsigned NOT NULL;

-- ---------------------------------------------------------------------
-- Table `tagente_datos`
-- ---------------------------------------------------------------------
ALTER TABLE tagente_datos MODIFY `datos` double(22,5);

-- ---------------------------------------------------------------------
-- Table `tagente_datos_inc`
-- ---------------------------------------------------------------------
ALTER TABLE tagente_datos_inc MODIFY `datos` double(22,5);

-- ---------------------------------------------------------------------
-- Table `tnetwork_component`
-- ---------------------------------------------------------------------
ALTER TABLE tnetwork_component ADD COLUMN `dynamic_interval` int(4) unsigned default '0';
ALTER TABLE tnetwork_component ADD COLUMN `dynamic_max` int(4) default '0';
ALTER TABLE tnetwork_component ADD COLUMN `dynamic_min` int(4) default '0';
ALTER TABLE tnetwork_component ADD COLUMN `dynamic_next` bigint(20) NOT NULL default '0';
ALTER TABLE tnetwork_component ADD COLUMN `dynamic_two_tailed` tinyint(1) unsigned default '0';

-- ---------------------------------------------------------------------
-- Table `tagente`
-- ---------------------------------------------------------------------
ALTER TABLE tagente ADD `transactional_agent` tinyint(1) NOT NULL default 0;
ALTER TABLE tagente ADD `remote` tinyint(1) NOT NULL default 0;
ALTER TABLE tagente ADD `cascade_protection_module` int(10) unsigned default '0';
ALTER TABLE tagente ADD COLUMN (alias varchar(600) not null default '');

UPDATE tagente SET tagente.alias = tagente.nombre;
-- ---------------------------------------------------------------------
-- Table `tlayout`
-- ---------------------------------------------------------------------
ALTER TABLE tlayout ADD `background_color` varchar(50) NOT NULL default '#FFF';

-- ---------------------------------------------------------------------
-- Table `tlayout_data`
-- ---------------------------------------------------------------------
ALTER TABLE tlayout_data ADD `type_graph` varchar(50) NOT NULL default 'area';
ALTER TABLE tlayout_data ADD `label_position` varchar(50) NOT NULL default 'down';

-- ---------------------------------------------------------------------
-- Table `tagent_custom_fields`
-- ---------------------------------------------------------------------
INSERT INTO `tagent_custom_fields` (`name`) VALUES ('eHorusID');

-- ---------------------------------------------------------------------
-- Table `tagente_modulo` Fixed problems with blank space 
-- in cron interval and problems with process data from pandora server
-- ---------------------------------------------------------------------
UPDATE tagente_modulo SET cron_interval = '' WHERE cron_interval LIKE '%    %';

-- ---------------------------------------------------------------------
-- Table `tgraph`
-- ---------------------------------------------------------------------
ALTER TABLE tgraph ADD COLUMN `percentil` int(4) unsigned default '0';

-- ---------------------------------------------------------------------
-- Table `tnetflow_filter`
-- ---------------------------------------------------------------------
ALTER TABLE tnetflow_filter ADD COLUMN `router_ip` TEXT NOT NULL DEFAULT "";

-- ---------------------------------------------------------------------
-- Table `treport_custom_sql`
-- ---------------------------------------------------------------------
UPDATE treport_custom_sql SET `sql` = 'select&#x20;direccion,&#x20;alias,&#x20;comentarios,&#x20;&#40;select&#x20;nombre&#x20;from&#x20;tgrupo&#x20;where&#x20;tgrupo.id_grupo&#x20;=&#x20;tagente.id_grupo&#41;&#x20;as&#x20;`group`&#x20;from&#x20;tagente;' 
	WHERE id = 1;
UPDATE treport_custom_sql SET `sql` = 'select&#x20;&#40;select&#x20;tagente.alias&#x20;from&#x20;tagente&#x20;where&#x20;tagente.id_agente&#x20;=&#x20;tagente_modulo.id_agente&#41;&#x20;as&#x20;agent_nombre,&#x20;nombre&#x20;,&#x20;&#40;select&#x20;tmodule_group.name&#x20;from&#x20;tmodule_group&#x20;where&#x20;tmodule_group.id_mg&#x20;=&#x20;tagente_modulo.id_module_group&#41;&#x20;as&#x20;module_group,&#x20;module_interval&#x20;from&#x20;tagente_modulo&#x20;where&#x20;delete_pending&#x20;=&#x20;0&#x20;order&#x20;by&#x20;nombre;' 
	WHERE id = 2;
UPDATE treport_custom_sql SET `sql` = 'select&#x20;t1.alias&#x20;as&#x20;agent_name,&#x20;t2.nombre&#x20;as&#x20;module_name,&#x20;&#40;select&#x20;talert_templates.name&#x20;from&#x20;talert_templates&#x20;where&#x20;talert_templates.id&#x20;=&#x20;t3.id_alert_template&#41;&#x20;as&#x20;template,&#x20;&#40;select&#x20;group_concat&#40;t02.name&#41;&#x20;from&#x20;talert_template_module_actions&#x20;as&#x20;t01&#x20;inner&#x20;join&#x20;talert_actions&#x20;as&#x20;t02&#x20;on&#x20;t01.id_alert_action&#x20;=&#x20;t02.id&#x20;where&#x20;t01.id_alert_template_module&#x20;=&#x20;t3.id&#x20;group&#x20;by&#x20;t01.id_alert_template_module&#41;&#x20;as&#x20;actions&#x20;from&#x20;tagente&#x20;as&#x20;t1&#x20;inner&#x20;join&#x20;tagente_modulo&#x20;as&#x20;t2&#x20;on&#x20;t1.id_agente&#x20;=&#x20;t2.id_agente&#x20;inner&#x20;join&#x20;talert_template_modules&#x20;as&#x20;t3&#x20;on&#x20;t2.id_agente_modulo&#x20;=&#x20;t3.id_agent_module&#x20;order&#x20;by&#x20;agent_name,&#x20;module_name;' 
	WHERE id = 3;