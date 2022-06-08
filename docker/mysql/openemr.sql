SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
	  `id` int(11) NOT NULL DEFAULT '0',
	  `line1` varchar(255) DEFAULT NULL,
	  `line2` varchar(255) DEFAULT NULL,
	  `city` varchar(255) DEFAULT NULL,
	  `state` varchar(35) DEFAULT NULL,
	  `zip` varchar(10) DEFAULT NULL,
	  `plus_four` varchar(4) DEFAULT NULL,
	  `country` varchar(255) DEFAULT NULL,
	  `foreign_id` int(11) DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  KEY `foreign_id` (`foreign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `amc_misc_data`;
CREATE TABLE `amc_misc_data` (
	  `amc_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
	  `pid` bigint(20) DEFAULT NULL,
	  `map_category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Maps to an object category (such as prescriptions etc.)',
	  `map_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Maps to an object id (such as prescription id etc.)',
	  `date_created` datetime DEFAULT NULL,
	  `date_completed` datetime DEFAULT NULL,
	  `soc_provided` datetime DEFAULT NULL,
	  KEY `amc_id` (`amc_id`,`pid`,`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `amendments`;
CREATE TABLE `amendments` (
	  `amendment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
	  `amendment_date` date NOT NULL COMMENT 'Amendement request date',
	  `amendment_by` varchar(50) NOT NULL COMMENT 'Amendment requested from',
	  `amendment_status` varchar(50) DEFAULT NULL COMMENT 'Amendment status accepted/rejected/null',
	  `pid` bigint(20) NOT NULL COMMENT 'Patient ID from patient_data',
	  `amendment_desc` text COMMENT 'Amendment Details',
	  `created_by` int(11) NOT NULL COMMENT 'references users.id for session owner',
	  `modified_by` int(11) DEFAULT NULL COMMENT 'references users.id for session owner',
	  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
	  `modified_time` timestamp NULL DEFAULT NULL COMMENT 'modified time',
	  PRIMARY KEY (`amendment_id`),
	  KEY `amendment_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `amendments_history`;
CREATE TABLE `amendments_history` (
	  `amendment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
	  `amendment_note` text COMMENT 'Amendment requested from',
	  `amendment_status` varchar(50) DEFAULT NULL COMMENT 'Amendment Request Status',
	  `created_by` int(11) NOT NULL COMMENT 'references users.id for session owner',
	  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
	  KEY `amendment_history_id` (`amendment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `api_token`;
CREATE TABLE `api_token` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `user_id` bigint(20) NOT NULL,
	  `token` text,
	  `token_auth_salt` varchar(255) DEFAULT NULL,
	  `token_auth` text,
	  `expiry` datetime DEFAULT NULL,
	  `email` varchar(255) DEFAULT NULL,
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Appointment`;
CREATE TABLE `Appointment` (
	  `prac_uuid` varchar(255) NOT NULL,
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `date` date NOT NULL,
	  `startTime` time NOT NULL,
	  `endTime` time NOT NULL,
	  `pid` varchar(255) NOT NULL,
	  `tenant_uuid` varchar(255) NOT NULL,
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ar_activity`;
CREATE TABLE `ar_activity` (
	  `pid` int(11) NOT NULL,
	  `encounter` int(11) NOT NULL,
	  `sequence_no` int(10) unsigned NOT NULL COMMENT 'Ar_activity sequence_no, incremented in code',
	  `code_type` varchar(12) NOT NULL DEFAULT '',
	  `code` varchar(20) NOT NULL COMMENT 'empty means claim level',
	  `modifier` varchar(12) NOT NULL DEFAULT '',
	  `payer_type` int(11) NOT NULL COMMENT '0=pt, 1=ins1, 2=ins2, etc',
	  `post_time` datetime NOT NULL,
	  `post_user` int(11) NOT NULL COMMENT 'references users.id',
	  `session_id` int(10) unsigned NOT NULL COMMENT 'references ar_session.session_id',
	  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT 'adjustment reasons go here',
	  `pay_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'either pay or adj will always be 0',
	  `adj_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
	  `modified_time` datetime NOT NULL,
	  `follow_up` char(1) NOT NULL,
	  `follow_up_note` text,
	  `account_code` varchar(15) NOT NULL,
	  `reason_code` varchar(255) DEFAULT NULL COMMENT 'Use as needed to show the primary payer adjustment reason code',
	  PRIMARY KEY (`pid`,`encounter`,`sequence_no`),
	  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ar_session`;
CREATE TABLE `ar_session` (
	  `session_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	  `payer_id` int(11) NOT NULL COMMENT '0=pt else references insurance_companies.id',
	  `user_id` int(11) NOT NULL COMMENT 'references users.id for session owner',
	  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
	  `reference` varchar(255) NOT NULL DEFAULT '' COMMENT 'check or EOB number',
	  `check_date` date DEFAULT NULL,
	  `deposit_date` date DEFAULT NULL,
	  `pay_total` decimal(12,2) NOT NULL DEFAULT '0.00',
	  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  `modified_time` datetime NOT NULL,
	  `global_amount` decimal(12,2) NOT NULL,
	  `payment_type` varchar(50) NOT NULL,
	  `description` text,
	  `adjustment_code` varchar(50) NOT NULL,
	  `post_to_date` date NOT NULL,
	  `patient_id` bigint(20) NOT NULL,
	  `payment_method` varchar(25) NOT NULL,
	  PRIMARY KEY (`session_id`),
	  KEY `user_closed` (`user_id`,`closed`),
	  KEY `deposit_date` (`deposit_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `audit_details`;
CREATE TABLE `audit_details` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `table_name` varchar(100) NOT NULL COMMENT 'openemr table name',
	  `field_name` varchar(100) NOT NULL COMMENT 'openemr table''s field name',
	  `field_value` text COMMENT 'openemr table''s field value',
	  `audit_master_id` bigint(20) NOT NULL COMMENT 'Id of the audit_master table',
	  `entry_identification` varchar(255) NOT NULL DEFAULT '1' COMMENT 'Used when multiple entry occurs from the same table.1 means no multiple entry',
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `route` varchar(255) DEFAULT NULL,
	  `verb` varchar(255) DEFAULT NULL,
	  `user_email` varchar(255) DEFAULT NULL,
	  `user_role` varchar(255) DEFAULT NULL,
	  `tenant` varchar(255) DEFAULT NULL,
	  `req_body` text,
	  `rsp_body` text,
	  `rsp_code` int(11) DEFAULT NULL,
	  `pid` varchar(255) DEFAULT NULL,
	  `createdAt` datetime NOT NULL,
	  `updatedAt` datetime NOT NULL,
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `audit_master`;
CREATE TABLE `audit_master` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `pid` bigint(20) NOT NULL,
	  `user_id` bigint(20) NOT NULL COMMENT 'The Id of the user who approves or denies',
	  `approval_status` tinyint(4) NOT NULL COMMENT '1-Pending,2-Approved,3-Denied,4-Appointment directly updated to calendar table,5-Cancelled appointment',
	  `comments` text,
	  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  `modified_time` datetime NOT NULL,
	  `ip_address` varchar(100) NOT NULL,
	  `type` tinyint(4) NOT NULL COMMENT '1-new patient,2-existing patient,3-change is only in the document,4-Patient upload,5-random key,10-Appointment',
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `automatic_notification`;
CREATE TABLE `automatic_notification` (
	  `notification_id` int(5) NOT NULL AUTO_INCREMENT,
	  `sms_gateway_type` varchar(255) NOT NULL,
	  `next_app_date` date NOT NULL,
	  `next_app_time` varchar(10) NOT NULL,
	  `provider_name` varchar(100) NOT NULL,
	  `message` text,
	  `email_sender` varchar(100) NOT NULL,
	  `email_subject` varchar(100) NOT NULL,
	  `type` enum('SMS','Email') NOT NULL DEFAULT 'SMS',
	  `notification_sent_date` datetime NOT NULL,
	  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `background_services`;
CREATE TABLE `background_services` (
	  `name` varchar(31) NOT NULL,
	  `title` varchar(127) NOT NULL COMMENT 'name for reports',
	  `active` tinyint(1) NOT NULL DEFAULT '0',
	  `running` tinyint(1) NOT NULL DEFAULT '-1' COMMENT 'True indicates managed service is busy. Skip this interval',
	  `next_run` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  `execute_interval` int(11) NOT NULL DEFAULT '0' COMMENT 'minimum number of minutes between function calls,0=manual mode',
	  `function` varchar(127) NOT NULL COMMENT 'name of background service function',
	  `require_once` varchar(255) DEFAULT NULL COMMENT 'include file (if necessary)',
	  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT 'lower numbers will be run first',
	  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `batchcom`;
CREATE TABLE `batchcom` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `patient_id` bigint(20) NOT NULL DEFAULT '0',
	  `sent_by` bigint(20) NOT NULL DEFAULT '0',
	  `msg_type` varchar(60) DEFAULT NULL,
	  `msg_subject` varchar(255) DEFAULT NULL,
	  `msg_text` mediumtext,
	  `msg_date_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `tenant_uuid` varchar(255) NOT NULL,
	  `bed_uuid` varchar(255) NOT NULL,
	  `bed_num` varchar(100) NOT NULL,
	  `archive` smallint(6) NOT NULL,
	  `active` tinyint(4) NOT NULL,
	  `location_uuid` varchar(255) NOT NULL,
	  `date` datetime DEFAULT NULL,
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `benefit_eligibility`;
CREATE TABLE `benefit_eligibility` (
	  `response_id` bigint(20) NOT NULL,
	  `verification_id` bigint(20) NOT NULL,
	  `type` varchar(4) DEFAULT NULL,
	  `benefit_type` varchar(255) DEFAULT NULL,
	  `start_date` date DEFAULT NULL,
	  `end_date` date DEFAULT NULL,
	  `coverage_level` varchar(255) DEFAULT NULL,
	  `coverage_type` varchar(512) DEFAULT NULL,
	  `plan_type` varchar(255) DEFAULT NULL,
	  `plan_description` varchar(255) DEFAULT NULL,
	  `coverage_period` varchar(255) DEFAULT NULL,
	  `amount` decimal(5,2) DEFAULT NULL,
	  `percent` decimal(3,2) DEFAULT NULL,
	  `network_ind` varchar(2) DEFAULT NULL,
	  `message` varchar(512) DEFAULT NULL,
	  `response_status` enum('A','D') DEFAULT 'A',
	  `response_create_date` date DEFAULT NULL,
	  `response_modify_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `date` datetime DEFAULT NULL,
	  `code_type` varchar(15) DEFAULT NULL,
	  `code` varchar(20) DEFAULT NULL,
	  `pid` bigint(20) DEFAULT NULL,
	  `provider_id` int(11) DEFAULT NULL,
	  `user` int(11) DEFAULT NULL,
	  `groupname` varchar(255) DEFAULT NULL,
	  `authorized` tinyint(1) DEFAULT NULL,
	  `encounter` int(11) DEFAULT NULL,
	  `code_text` longtext,
	  `billed` tinyint(1) DEFAULT NULL,
	  `activity` tinyint(1) DEFAULT NULL,
	  `payer_id` int(11) DEFAULT NULL,
	  `bill_process` tinyint(2) NOT NULL DEFAULT '0',
	  `bill_date` datetime DEFAULT NULL,
	  `process_date` datetime DEFAULT NULL,
	  `process_file` varchar(255) DEFAULT NULL,
	  `modifier` varchar(12) DEFAULT NULL,
	  `units` int(11) DEFAULT NULL,
	  `fee` decimal(12,2) DEFAULT NULL,
	  `justify` varchar(255) DEFAULT NULL,
	  `target` varchar(30) DEFAULT NULL,
	  `x12_partner_id` int(11) DEFAULT NULL,
	  `ndc_info` varchar(255) DEFAULT NULL,
	  `notecodes`P TABLE IF EXISTS `claims`;
	CREATE TABLE `claims` (
		  `patient_id` bigint(20) NOT NULL,
		  `encounter_id` int(11) NOT NULL,
		  `version` int(10) unsigned NOT NULL COMMENT 'Claim version, incremented in code',
		  `payer_id` int(11) NOT NULL DEFAULT '0',
		  `status` tinyint(2) NOT NULL DEFAULT '0',
		  `payer_type` tinyint(4) NOT NULL DEFAULT '0',
		  `bill_process` tinyint(2) NOT NULL DEFAULT '0',
		  `bill_time` datetime DEFAULT NULL,
		  `process_time` datetime DEFAULT NULL,
		  `process_file` varchar(255) DEFAULT NULL,
		  `target` varchar(30) DEFAULT NULL,
		  `x12_partner_id` int(11) NOT NULL DEFAULT '0',
		  `submitted_claim` text COMMENT 'This claims form claim data',
		  PRIMARY KEY (`patient_id`,`encounter_id`,`version`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `clinical_plans`;
	CREATE TABLE `clinical_plans` (
		  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans',
		  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table',
		  `normal_flag` tinyint(1) DEFAULT NULL COMMENT 'Normal Activation Flag',
		  `cqm_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_measure_group` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure Group Identifier',
		  PRIMARY KEY (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `clinical_plans_rules`;
	CREATE TABLE `clinical_plans_rules` (
		  `plan_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans',
		  `rule_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
		  PRIMARY KEY (`plan_id`,`rule_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `clinical_rules`;
	CREATE TABLE `clinical_rules` (
		  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
		  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table',
		  `active_alert_flag` tinyint(1) DEFAULT NULL COMMENT 'Active Alert Widget Module flag - note not yet utilized',
		  `passive_alert_flag` tinyint(1) DEFAULT NULL COMMENT 'Passive Alert Widget Module flag',
		  `cqm_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Clinical Quality Measure flag (unable to customize per patient)',
		  `cqm_nqf_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure NQF identifier',
		  `cqm_pqri_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure PQRI identifier',
		  `amc_flag` tinyint(1) DEFAULT NULL COMMENT 'Automated Measure Calculation flag (unable to customize per patient)',
		  `amc_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Automated Measure Calculation flag for (unable to customize per patient)',
		  `amc_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Automated Measure Calculation flag for (unable to customize per patient)',
		  `amc_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Automated Measure Calculation indentifier (MU rule)',
		  `amc_code_2014` varchar(30) NOT NULL DEFAULT '' COMMENT 'Automated Measure Calculation 2014 indentifier (MU rule)',
		  `amc_2014_stage1_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Stage 1 - Automated Measure Calculation flag for (unable to customize per patient)',
		  `amc_2014_stage2_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Stage 2 - Automated Measure Calculation flag for (unable to customize per patient)',
		  `patient_reminder_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Reminder Module flag',
		  `developer` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Developer',
		  `funding_source` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Funding Source',
		  `release_version` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Release Version',
		  `web_reference` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Web Reference',
		  `access_control` varchar(255) NOT NULL DEFAULT 'patients:med' COMMENT 'ACO link for access control',
		  PRIMARY KEY (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `clinical_rules_log`;
	CREATE TABLE `clinical_rules_log` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) NOT NULL DEFAULT '0',
		  `uid` bigint(20) NOT NULL DEFAULT '0',
		  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'An example category is clinical_reminder_widget',
		  `value` text,
		  `new_value` text,
		  PRIMARY KEY (`id`),
		  KEY `pid` (`pid`),
		  KEY `uid` (`uid`),
		  KEY `category` (`category`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `codes`;
	CREATE TABLE `codes` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `code_text` varchar(255) NOT NULL DEFAULT '',
		  `code_text_short` varchar(24) NOT NULL DEFAULT '',
		  `code` varchar(25) NOT NULL DEFAULT '',
		  `code_type` smallint(6) DEFAULT NULL,
		  `modifier` varchar(12) NOT NULL DEFAULT '',
		  `units` int(11) DEFAULT NULL,
		  `fee` decimal(12,2) DEFAULT NULL,
		  `superbill` varchar(31) NOT NULL DEFAULT '',
		  `related_code` varchar(255) NOT NULL DEFAULT '',
		  `taxrates` varchar(255) NOT NULL DEFAULT '',
		  `cyp_factor` float NOT NULL DEFAULT '0' COMMENT 'quantity representing a years supply',
		  `active` tinyint(1) DEFAULT '1' COMMENT '0 = inactive, 1 = active',
		  `reportable` tinyint(1) DEFAULT '0' COMMENT '0 = non-reportable, 1 = reportable',
		  `financial_reporting` tinyint(1) DEFAULT '0' COMMENT '0 = negative, 1 = considered important code in financial reporting',
		  `revenue_code` varchar(6) NOT NULL DEFAULT '' COMMENT 'Item revenue code',
		  PRIMARY KEY (`id`),
		  KEY `code` (`code`),
		  KEY `code_type` (`code_type`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `codes_history`;
	CREATE TABLE `codes_history` (
		  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `code` varchar(25) DEFAULT NULL,
		  `modifier` varchar(12) DEFAULT NULL,
		  `active` tinyint(1) DEFAULT NULL,
		  `diagnosis_reporting` tinyint(1) DEFAULT NULL,
		  `financial_reporting` tinyint(1) DEFAULT NULL,
		  `category` varchar(255) DEFAULT NULL,
		  `code_type_name` varchar(255) DEFAULT NULL,
		  `code_text` varchar(255) DEFAULT NULL,
		  `code_text_short` varchar(24) DEFAULT NULL,
		  `prices` text,
		  `action_type` varchar(25) DEFAULT NULL,
		  `update_by` varchar(255) DEFAULT NULL,
		  PRIMARY KEY (`log_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `code_types`;
	CREATE TABLE `code_types` (
		  `ct_key` varchar(15) NOT NULL COMMENT 'short alphanumeric name',
		  `ct_id` int(11) NOT NULL COMMENT 'numeric identifier',
		  `ct_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sort order',
		  `ct_mod` int(11) NOT NULL DEFAULT '0' COMMENT 'length of modifier field',
		  `ct_just` varchar(15) NOT NULL DEFAULT '' COMMENT 'ct_key of justify type, if any',
		  `ct_mask` varchar(9) NOT NULL DEFAULT '' COMMENT 'formatting mask for code values',
		  `ct_fee` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if fees are used',
		  `ct_rel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if can relate to other code types',
		  `ct_nofs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if to be hidden in the fee sheet',
		  `ct_diag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a diagnosis type',
		  `ct_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if this is active',
		  `ct_label` varchar(31) NOT NULL DEFAULT '' COMMENT 'label of this code type',
		  `ct_external` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if stored codes in codes tables, 1 or greater if codes stored in external tables',
		  `ct_claim` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is used in claims',
		  `ct_proc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a procedure type',
		  `ct_term` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a clinical term',
		  `ct_problem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medical problem',
		  `ct_drug` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medication',
		  PRIMARY KEY (`ct_key`),
		  UNIQUE KEY `ct_id` (`ct_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	SET NAMES utf8mb4;

	DROP TABLE IF EXISTS `connector`;
	CREATE TABLE `connector` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `url` varchar(255) DEFAULT NULL,
		  `username` varchar(255) DEFAULT NULL,
		  `password` varchar(255) DEFAULT NULL,
		  `crontime` timestamp NULL DEFAULT NULL,
		  `connector_uuid` varchar(255) DEFAULT NULL,
		  `resources` varchar(255) DEFAULT NULL,
		  `connector_specifics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
		  `date` datetime DEFAULT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `customlists`;
	CREATE TABLE `customlists` (
		  `cl_list_slno` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `cl_list_id` int(10) unsigned NOT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_id)+1',
		  `cl_list_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_item_id)+1',
		  `cl_list_type` int(10) unsigned NOT NULL COMMENT '0=>List Name 1=>list items 2=>Context 3=>Template 4=>Sentence 5=> SavedTemplate 6=>CustomButton',
		  `cl_list_item_short` varchar(10) DEFAULT NULL,
		  `cl_list_item_long` text,
		  `cl_list_item_level` int(11) DEFAULT NULL COMMENT 'Flow level for List Designation',
		  `cl_order` int(11) DEFAULT NULL,
		  `cl_deleted` tinyint(1) DEFAULT '0',
		  `cl_creator` int(11) DEFAULT NULL,
		  PRIMARY KEY (`cl_list_slno`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `dated_reminders`;
	CREATE TABLE `dated_reminders` (
		  `dr_id` int(11) NOT NULL AUTO_INCREMENT,
		  `dr_from_ID` int(11) NOT NULL,
		  `dr_message_text` varchar(160) NOT NULL,
		  `dr_message_sent_date` datetime NOT NULL,
		  `dr_message_due_date` date NOT NULL,
		  `pid` bigint(20) NOT NULL,
		  `message_priority` tinyint(1) NOT NULL,
		  `message_processed` tinyint(1) NOT NULL DEFAULT '0',
		  `processed_date` timestamp NULL DEFAULT NULL,
		  `dr_processed_by` int(11) NOT NULL,
		  PRIMARY KEY (`dr_id`),
		  KEY `dr_from_ID` (`dr_from_ID`,`dr_message_due_date`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `dated_reminders_link`;
	CREATE TABLE `dated_reminders_link` (
		  `dr_link_id` int(11) NOT NULL AUTO_INCREMENT,
		  `dr_id` int(11) NOT NULL,
		  `to_id` int(11) NOT NULL,
		  PRIMARY KEY (`dr_link_id`),
		  KEY `to_id` (`to_id`),
		  KEY `dr_id` (`dr_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `direct_message_log`;
	CREATE TABLE `direct_message_log` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `msg_type` char(1) NOT NULL COMMENT 'S=sent,R=received',
		  `msg_id` varchar(127) NOT NULL,
		  `sender` varchar(255) NOT NULL,
		  `recipient` varchar(255) NOT NULL,
		  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  `status` char(1) NOT NULL COMMENT 'Q=queued,D=dispatched,R=received,F=failed',
		  `status_info` varchar(511) DEFAULT NULL,
		  `status_ts` timestamp NULL DEFAULT NULL,
		  `patient_id` bigint(20) DEFAULT NULL,
		  `user_id` bigint(20) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  KEY `msg_id` (`msg_id`),
		  KEY `patient_id` (`patient_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `documents`;
	CREATE TABLE `documents` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `type` enum('file_url','blob','web_url') DEFAULT NULL,
		  `size` int(11) DEFAULT NULL,
		  `date` datetime DEFAULT NULL,
		  `url` varchar(255) DEFAULT NULL,
		  `thumb_url` varchar(255) DEFAULT NULL,
		  `mimetype` varchar(255) DEFAULT NULL,
		  `pages` int(11) DEFAULT NULL,
		  `owner` int(11) DEFAULT NULL,
		  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  `foreign_id` bigint(20) DEFAULT NULL,
		  `docdate` date DEFAULT NULL,
		  `hash` varchar(40) DEFAULT NULL COMMENT '40-character SHA-1 hash of document',
		  `list_id` bigint(20) NOT NULL DEFAULT '0',
		  `couch_docid` varchar(100) DEFAULT NULL,
		  `couch_revid` varchar(100) DEFAULT NULL,
		  `storagemethod` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0->Harddisk,1->CouchDB',
		  `path_depth` tinyint(4) DEFAULT '1' COMMENT 'Depth of path to use in url to find document. Not applicable for CouchDB.',
		  `imported` tinyint(4) DEFAULT '0' COMMENT 'Parsing status for CCR/CCD/CCDA importing',
		  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Encounter id if tagged',
		  `encounter_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If encounter is created while tagging',
		  `audit_master_approval_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'approval_status from audit_master table',
		  `audit_master_id` int(11) DEFAULT NULL,
		  `documentationOf` varchar(255) DEFAULT NULL,
		  `encrypted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0->No,1->Yes',
		  PRIMARY KEY (`id`),
		  KEY `revision` (`revision`),
		  KEY `foreign_id` (`foreign_id`),
		  KEY `owner` (`owner`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `documents_legal_categories`;
	CREATE TABLE `documents_legal_categories` (
		  `dlc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `dlc_category_type` int(10) unsigned NOT NULL COMMENT '1 category 2 subcategory',
		  `dlc_category_name` varchar(45) NOT NULL,
		  `dlc_category_parent` int(10) unsigned DEFAULT NULL,
		  PRIMARY KEY (`dlc_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `documents_legal_detail`;
	CREATE TABLE `documents_legal_detail` (
		  `dld_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `dld_pid` int(10) unsigned DEFAULT NULL,
		  `dld_facility` int(10) unsigned DEFAULT NULL,
		  `dld_provider` int(10) unsigned DEFAULT NULL,
		  `dld_encounter` int(10) unsigned DEFAULT NULL,
		  `dld_master_docid` int(10) unsigned NOT NULL,
		  `dld_signed` smallint(5) unsigned NOT NULL COMMENT '0-Not Signed or Cannot Sign(Layout),1-Signed,2-Ready to sign,3-Denied(Pat Regi),4-Patient Upload,10-Save(Layout)',
		  `dld_signed_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  `dld_filepath` varchar(75) DEFAULT NULL,
		  `dld_filename` varchar(45) NOT NULL,
		  `dld_signing_person` varchar(50) NOT NULL,
		  `dld_sign_level` int(11) NOT NULL COMMENT 'Sign flow level',
		  `dld_content` varchar(50) NOT NULL COMMENT 'Layout sign position',
		  `dld_file_for_pdf_generation` blob NOT NULL COMMENT 'The filled details in the fdf file is stored here.Patient Registration Screen',
		  `dld_denial_reason` longtext,
		  `dld_moved` tinyint(4) NOT NULL DEFAULT '0',
		  `dld_patient_comments` text COMMENT 'Patient comments stored here',
		  PRIMARY KEY (`dld_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `documents_legal_master`;
	CREATE TABLE `documents_legal_master` (
		  `dlm_category` int(10) unsigned DEFAULT NULL,
		  `dlm_subcategory` int(10) unsigned DEFAULT NULL,
		  `dlm_document_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `dlm_document_name` varchar(75) NOT NULL,
		  `dlm_filepath` varchar(75) NOT NULL,
		  `dlm_facility` int(10) unsigned DEFAULT NULL,
		  `dlm_provider` int(10) unsigned DEFAULT NULL,
		  `dlm_sign_height` double NOT NULL,
		  `dlm_sign_width` double NOT NULL,
		  `dlm_filename` varchar(45) NOT NULL,
		  `dlm_effective_date` datetime NOT NULL,
		  `dlm_version` int(10) unsigned NOT NULL,
		  `content` varchar(255) NOT NULL,
		  `dlm_savedsign` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
		  `dlm_review` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
		  `dlm_upload_type` tinyint(4) DEFAULT '0' COMMENT '0-Provider Uploaded,1-Patient Uploaded',
		  PRIMARY KEY (`dlm_document_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of Master Docs to be signed';


	DROP TABLE IF EXISTS `drugs`;
	CREATE TABLE `drugs` (
		  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
		  `name` varchar(255) NOT NULL DEFAULT '',
		  `ndc_number` varchar(20) NOT NULL DEFAULT '',
		  `on_order` int(11) NOT NULL DEFAULT '0',
		  `reorder_point` float NOT NULL DEFAULT '0',
		  `max_level` float NOT NULL DEFAULT '0',
		  `last_notify` date NOT NULL DEFAULT '0000-00-00',
		  `reactions` text,
		  `form` int(3) NOT NULL DEFAULT '0',
		  `size` varchar(25) NOT NULL DEFAULT '',
		  `unit` int(11) NOT NULL DEFAULT '0',
		  `route` int(11) NOT NULL DEFAULT '0',
		  `substitute` int(11) NOT NULL DEFAULT '0',
		  `related_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'may reference a related codes.code',
		  `cyp_factor` float NOT NULL DEFAULT '0' COMMENT 'quantity representing a years supply',
		  `active` tinyint(1) DEFAULT '1' COMMENT '0 = inactive, 1 = active',
		  `allow_combining` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = allow filling an order from multiple lots',
		  `allow_multiple` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = allow multiple lots at one warehouse',
		  `drug_code` varchar(25) DEFAULT NULL,
		  `consumable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = will not show on the fee sheet',
		  `dispensable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = pharmacy elsewhere, 1 = dispensed here',
		  PRIMARY KEY (`drug_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `drug_inventory`;
	CREATE TABLE `drug_inventory` (
		  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
		  `drug_id` int(11) NOT NULL,
		  `lot_number` varchar(20) DEFAULT NULL,
		  `expiration` date DEFAULT NULL,
		  `manufacturer` varchar(255) DEFAULT NULL,
		  `on_hand` int(11) NOT NULL DEFAULT '0',
		  `warehouse_id` varchar(31) NOT NULL DEFAULT '',
		  `vendor_id` bigint(20) NOT NULL DEFAULT '0',
		  `last_notify` date NOT NULL DEFAULT '0000-00-00',
		  `destroy_date` date DEFAULT NULL,
		  `destroy_method` varchar(255) DEFAULT NULL,
		  `destroy_witness` varchar(255) DEFAULT NULL,
		  `destroy_notes` varchar(255) DEFAULT NULL,
		  PRIMARY KEY (`inventory_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `drug_sales`;
	CREATE TABLE `drug_sales` (
		  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
		  `drug_id` int(11) NOT NULL,
		  `inventory_id` int(11) NOT NULL,
		  `prescription_id` int(11) NOT NULL DEFAULT '0',
		  `pid` bigint(20) NOT NULL DEFAULT '0',
		  `encounter` int(11) NOT NULL DEFAULT '0',
		  `user` varchar(255) DEFAULT NULL,
		  `sale_date` date NOT NULL,
		  `quantity` int(11) NOT NULL DEFAULT '0',
		  `fee` decimal(12,2) NOT NULL DEFAULT '0.00',
		  `billed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'indicates if the sale is posted to accounting',
		  `xfer_inventory_id` int(11) NOT NULL DEFAULT '0',
		  `distributor_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id',
		  `notes` varchar(255) NOT NULL DEFAULT '',
		  `bill_date` datetime DEFAULT NULL,
		  `pricelevel` varchar(31) DEFAULT '',
		  `selector` varchar(255) DEFAULT '' COMMENT 'references drug_templates.selector',
		  PRIMARY KEY (`sale_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `drug_templates`;
	CREATE TABLE `drug_templates` (
		  `drug_id` int(11) NOT NULL,
		  `selector` varchar(255) NOT NULL DEFAULT '',
		  `dosage` varchar(10) DEFAULT NULL,
		  `period` int(11) NOT NULL DEFAULT '0',
		  `quantity` int(11) NOT NULL DEFAULT '0',
		  `refills` int(11) NOT NULL DEFAULT '0',
		  `taxrates` varchar(255) DEFAULT NULL,
		  PRIMARY KEY (`drug_id`,`selector`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `eligibility_verification`;
	CREATE TABLE `eligibility_verification` (
		  `verification_id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `response_id` varchar(32) DEFAULT NULL,
		  `insurance_id` bigint(20) DEFAULT NULL,
		  `eligibility_check_date` datetime DEFAULT NULL,
		  `copay` int(11) DEFAULT NULL,
		  `deductible` int(11) DEFAULT NULL,
		  `deductiblemet` enum('Y','N') DEFAULT 'Y',
		  `create_date` date DEFAULT NULL,
		  PRIMARY KEY (`verification_id`),
		  KEY `insurance_id` (`insurance_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `employer_data`;
	CREATE TABLE `employer_data` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `name` varchar(255) DEFAULT NULL,
		  `street` varchar(255) DEFAULT NULL,
		  `postal_code` varchar(255) DEFAULT NULL,
		  `city` varchar(255) DEFAULT NULL,
		  `state` varchar(255) DEFAULT NULL,
		  `country` varchar(255) DEFAULT NULL,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  KEY `pid` (`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `enc_category_map`;
	CREATE TABLE `enc_category_map` (
		  `rule_enc_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'encounter id from rule_enc_types list in list_options',
		  `main_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT 'category id from event category in openemr_postcalendar_categories',
		  KEY `rule_enc_id` (`rule_enc_id`,`main_cat_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `erx_narcotics`;
	CREATE TABLE `erx_narcotics` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `drug` varchar(255) NOT NULL,
		  `dea_number` varchar(5) NOT NULL,
		  `csa_sch` varchar(2) NOT NULL,
		  `narc` varchar(2) NOT NULL,
		  `other_names` varchar(255) NOT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `erx_rx_log`;
	CREATE TABLE `erx_rx_log` (
		  `id` int(20) NOT NULL AUTO_INCREMENT,
		  `prescription_id` int(6) NOT NULL,
		  `date` varchar(25) NOT NULL,
		  `time` varchar(15) NOT NULL,
		  `code` int(6) NOT NULL,
		  `status` text,
		  `message_id` varchar(100) DEFAULT NULL,
		  `read` int(1) DEFAULT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `erx_ttl_touch`;
	CREATE TABLE `erx_ttl_touch` (
		  `patient_id` bigint(20) unsigned NOT NULL COMMENT 'Patient record Id',
		  `process` enum('allergies','medications') NOT NULL COMMENT 'NewCrop eRx SOAP process',
		  `updated` datetime NOT NULL COMMENT 'Date and time of last process update for patient',
		  PRIMARY KEY (`patient_id`,`process`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store records last update per patient data process';


	DROP TABLE IF EXISTS `erx_weno_drugs`;
	CREATE TABLE `erx_weno_drugs` (
		  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
		  `rxcui_drug_coded` int(11) DEFAULT NULL,
		  `generic_rxcui` int(11) DEFAULT NULL,
		  `drug_db_code_qualifier` text,
		  `full_name` varchar(250) NOT NULL,
		  `rxn_dose_form` text,
		  `full_generic_name` varchar(250) NOT NULL,
		  `brand_name` varchar(250) NOT NULL,
		  `display_name` varchar(250) NOT NULL,
		  `route` text,
		  `new_dose_form` varchar(100) DEFAULT NULL,
		  `strength` varchar(15) DEFAULT NULL,
		  `supress_for` text,
		  `display_name_synonym` text,
		  `is_retired` text,
		  `sxdg_rxcui` varchar(10) DEFAULT NULL,
		  `sxdg_tty` text,
		  `sxdg_name` varchar(100) DEFAULT NULL,
		  `psn_drugdescription` varchar(100) DEFAULT NULL,
		  `ncpdp_quantity_term` text,
		  `potency_unit_code` varchar(10) DEFAULT NULL,
		  `dea_schedule_no` int(2) DEFAULT NULL,
		  `dea_schedule` varchar(7) DEFAULT NULL,
		  `ingredients` varchar(100) DEFAULT NULL,
		  `drug_interaction` varchar(100) DEFAULT NULL,
		  `unit_source_code` varchar(3) DEFAULT NULL,
		  `code_list_qualifier` int(3) DEFAULT NULL,
		  PRIMARY KEY (`drug_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `esign_signatures`;
	CREATE TABLE `esign_signatures` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `tid` int(11) NOT NULL COMMENT 'Table row ID for signature',
		  `table` varchar(255) NOT NULL COMMENT 'table name for the signature',
		  `uid` int(11) NOT NULL COMMENT 'user id for the signing user',
		  `datetime` datetime NOT lity_id` bigint(20) DEFAULT NULL,
		  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
		  `field_value` text,
		  PRIMARY KEY (`id`),
		  KEY `uid` (`uid`,`facility_id`,`field_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `fee_sheet_options`;
	CREATE TABLE `fee_sheet_options` (
		  `fs_category` varchar(63) DEFAULT NULL,
		  `fs_option` varchar(63) DEFAULT NULL,
		  `fs_codes` varchar(255) DEFAULT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `forms`;
	CREATE TABLE `forms` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `encounter` bigint(20) DEFAULT NULL,
		  `form_name` longtext,
		  `form_id` bigint(20) DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'flag indicates form has been deleted',
		  `formdir` longtext,
		  `therapy_group_id` int(11) DEFAULT NULL,
		  `issue_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references lists.id to identify a case',
		  `provider_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id to identify a provider',
		  PRIMARY KEY (`id`),
		  KEY `pid_encounter` (`pid`,`encounter`),
		  KEY `form_id` (`form_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_care_plan`;
	CREATE TABLE `form_care_plan` (
		  `id` bigint(20) NOT NULL,
		  `date` date DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `encounter` varchar(255) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  `code` varchar(255) DEFAULT NULL,
		  `codetext` text,
		  `description` text,
		  `external_id` varchar(30) DEFAULT NULL,
		  `care_plan_type` varchar(30) DEFAULT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_clinical_instructions`;
	CREATE TABLE `form_clinical_instructions` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `pid` bigint(20) DEFAULT NULL,
		  `encounter` varchar(255) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `instruction` text,
		  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  `activity` tinyint(4) DEFAULT '1',
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_dictation`;
	CREATE TABLE `form_dictation` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  `dictation` longtext,
		  `additional_notes` longtext,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_encounter`;
	CREATE TABLE `form_encounter` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `reason` longtext,
		  `facility` longtext,
		  `facility_id` int(11) NOT NULL DEFAULT '0',
		  `pid` bigint(20) DEFAULT NULL,
		  `encounter` bigint(20) DEFAULT NULL,
		  `onset_date` datetime DEFAULT NULL,
		  `sensitivity` varchar(30) DEFAULT NULL,
		  `billing_note` text,
		  `pc_catid` int(11) NOT NULL DEFAULT '5' COMMENT 'event category from openemr_postcalendar_categories',
		  `last_level_billed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
		  `last_level_closed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
		  `last_stmt_date` date DEFAULT NULL,
		  `stmt_count` int(11) NOT NULL DEFAULT '0',
		  `provider_id` int(11) DEFAULT '0' COMMENT 'default and main provider for this visit',
		  `supervisor_id` int(11) DEFAULT '0' COMMENT 'supervising provider, if any, for this visit',
		  `invoice_refno` varchar(31) NOT NULL DEFAULT '',
		  `referral_source` varchar(31) NOT NULL DEFAULT '',
		  `billing_facility` int(11) NOT NULL DEFAULT '0',
		  `external_id` varchar(20) DEFAULT NULL,
		  `pos_code` tinyint(4) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  KEY `pid_encounter` (`pid`,`encounter`),
		  KEY `encounter_date` (`date`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_acuity`;
	CREATE TABLE `form_eye_acuity` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `SCODVA` varchar(25) DEFAULT NULL,
		  `SCOSVA` varchar(25) DEFAULT NULL,
		  `PHODVA` varchar(25) DEFAULT NULL,
		  `PHOSVA` varchar(25) DEFAULT NULL,
		  `CTLODVA` varchar(25) DEFAULT NULL,
		  `CTLOSVA` varchar(25) DEFAULT NULL,
		  `MRODVA` varchar(25) DEFAULT NULL,
		  `MROSVA` varchar(25) DEFAULT NULL,
		  `SCNEARODVA` varchar(25) DEFAULT NULL,
		  `SCNEAROSVA` varchar(25) DEFAULT NULL,
		  `MRNEARODVA` varchar(25) DEFAULT NULL,
		  `MRNEAROSVA` varchar(25) DEFAULT NULL,
		  `GLAREODVA` varchar(25) DEFAULT NULL,
		  `GLAREOSVA` varchar(25) DEFAULT NULL,
		  `GLARECOMMENTS` varchar(255) DEFAULT NULL,
		  `ARODVA` varchar(25) DEFAULT NULL,
		  `AROSVA` varchar(25) DEFAULT NULL,
		  `CRODVA` varchar(25) DEFAULT NULL,
		  `CROSVA` varchar(25) DEFAULT NULL,
		  `CTLODVA1` varchar(25) DEFAULT NULL,
		  `CTLOSVA1` varchar(25) DEFAULT NULL,
		  `PAMODVA` varchar(25) DEFAULT NULL,
		  `PAMOSVA` varchar(25) DEFAULT NULL,
		  `LIODVA` varchar(25) NOT NULL,
		  `LIOSVA` varchar(25) NOT NULL,
		  `WODVANEAR` varchar(25) DEFAULT NULL,
		  `OSVANEARCC` varchar(25) DEFAULT NULL,
		  `BINOCVA` varchar(25) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_antseg`;
	CREATE TABLE `form_eye_antseg` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `ODSCHIRMER1` varchar(25) DEFAULT NULL,
		  `OSSCHIRMER1` varchar(25) DEFAULT NULL,
		  `ODSCHIRMER2` varchar(25) DEFAULT NULL,
		  `OSSCHIRMER2` varchar(25) DEFAULT NULL,
		  `ODTBUT` varchar(25) DEFAULT NULL,
		  `OSTBUT` varchar(25) DEFAULT NULL,
		  `OSCONJ` varchar(25) DEFAULT NULL,
		  `ODCONJ` text,
		  `ODCORNEA` text,
		  `OSCORNEA` text,
		  `ODAC` text,
		  `OSAC` text,
		  `ODLENS` text,
		  `OSLENS` text,
		  `ODIRIS` text,
		  `OSIRIS` text,
		  `PUPIL_NORMAL` varchar(2) DEFAULT '1',
		  `ODPUPILSIZE1` varchar(25) DEFAULT NULL,
		  `ODPUPILSIZE2` varchar(25) DEFAULT NULL,
		  `ODPUPILREACTIVITY` char(25) DEFAULT NULL,
		  `ODAPD` varchar(25) DEFAULT NULL,
		  `OSPUPILSIZE1` varchar(25) DEFAULT NULL,
		  `OSPUPILSIZE2` varchar(25) DEFAULT NULL,
		  `OSPUPILREACTIVITY` char(25) DEFAULT NULL,
		  `OSAPD` varchar(25) DEFAULT NULL,
		  `DIMODPUPILSIZE1` varchar(25) DEFAULT NULL,
		  `DIMODPUPILSIZE2` varchar(25) DEFAULT NULL,
		  `DIMODPUPILREACTIVITY` varchar(25) DEFAULT NULL,
		  `DIMOSPUPILSIZE1` varchar(25) DEFAULT NULL,
		  `DIMOSPUPILSIZE2` varchar(25) DEFAULT NULL,
		  `DIMOSPUPILREACTIVITY` varchar(25) DEFAULT NULL,
		  `PUPIL_COMMENTS` text,
		  `ODKTHICKNESS` varchar(25) DEFAULT NULL,
		  `OSKTHICKNESS` varchar(25) DEFAULT NULL,
		  `ODGONIO` varchar(25) DEFAULT NULL,
		  `OSGONIO` varchar(25) DEFAULT NULL,
		  `ANTSEG_COMMENTS` text,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_base`;
	CREATE TABLE `form_eye_base` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Links to forms.form_id',
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_biometrics`;
	CREATE TABLE `form_eye_biometrics` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `ODK1` varchar(10) DEFAULT NULL,
		  `ODK2` varchar(10) DEFAULT NULL,
		  `ODK2AXIS` varchar(10) DEFAULT NULL,
		  `OSK1` varchar(10) DEFAULT NULL,
		  `OSK2` varchar(10) DEFAULT NULL,
		  `OSK2AXIS` varchar(10) DEFAULT NULL,
		  `ODAXIALLENGTH` varchar(20) DEFAULT NULL,
		  `OSAXIALLENGTH` varchar(20) DEFAULT NULL,
		  `ODPDMeasured` varchar(20) DEFAULT NULL,
		  `OSPDMeasured` varchar(20) DEFAULT NULL,
		  `ODACD` varchar(20) DEFAULT NULL,
		  `OSACD` varchar(20) DEFAULT NULL,
		  `ODW2W` varchar(20) DEFAULT NULL,
		  `OSW2W` varchar(20) DEFAULT NULL,
		  `ODLT` varchar(20) DEFAULT NULL,
		  `OSLT` varchar(20) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_external`;
	CREATE TABLE `form_eye_external` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `RUL` text,
		  `LUL` text,
		  `RLL` text,
		  `LLL` text,
		  `RBROW` text,
		  `LBROW` text,
		  `RMCT` text,
		  `LMCT` text,
		  `RADNEXA` text,
		  `LADNEXA` text,
		  `RMRD` varchar(25) DEFAULT NULL,
		  `LMRD` varchar(25) DEFAULT NULL,
		  `RLF` varchar(25) DEFAULT NULL,
		  `LLF` varchar(25) DEFAULT NULL,
		  `RVFISSURE` varchar(25) DEFAULT NULL,
		  `LVFISSURE` varchar(25) DEFAULT NULL,
		  `ODHERTEL` varchar(25) DEFAULT NULL,
		  `OSHERTEL` varchar(25) DEFAULT NULL,
		  `HERTELBASE` varchar(25) DEFAULT NULL,
		  `RCAROTID` text,
		  `LCAROTID` text,
		  `RTEMPART` text,
		  `LTEMPART` text,
		  `RCNV` text,
		  `LCNV` text,
		  `RCNVII` text,
		  `LCNVII` text,
		  `EXT_COMMENTS` text,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_hpi`;
	CREATE TABLE `form_eye_hpi` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `CC1` varchar(255) DEFAULT NULL,
		  `HPI1` text,
		  `QUALITY1` varchar(255) DEFAULT NULL,
		  `TIMING1` varchar(255) DEFAULT NULL,
		  `DURATION1` varchar(255) DEFAULT NULL,
		  `CONTEXT1` varchar(255) DEFAULT NULL,
		  `SEVERITY1` varchar(255) DEFAULT NULL,
		  `MODIFY1` varchar(255) DEFAULT NULL,
		  `ASSOCIATED1` varchar(255) DEFAULT NULL,
		  `LOCATION1` varchar(255) DEFAULT NULL,
		  `CHRONIC1` varchar(255) DEFAULT NULL,
		  `CHRONIC2` varchar(255) DEFAULT NULL,
		  `CHRONIC3` varchar(255) DEFAULT NULL,
		  `CC2` text,
		  `HPI2` text,
		  `QUALITY2` text,
		  `TIMING2` text,
		  `DURATION2` text,
		  `CONTEXT2` text,
		  `SEVERITY2` text,
		  `MODIFY2` text,
		  `ASSOCIATED2` text,
		  `LOCATION2` text,
		  `CC3` text,
		  `HPI3` text,
		  `QUALITY3` text,
		  `TIMING3` text,
		  `DURATION3` text,
		  `CONTEXT3` text,
		  `SEVERITY3` text,
		  `MODIFY3` text,
		  `ASSOCIATED3` text,
		  `LOCATION3` text,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_locking`;
	CREATE TABLE `form_eye_locking` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `IMP` text,
		  `PLAN` text,
		  `Resource` varchar(50) DEFAULT NULL,
		  `Technician` varchar(50) DEFAULT NULL,
		  `LOCKED` varchar(3) DEFAULT NULL,
		  `LOCKEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  `LOCKEDBY` varchar(50) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_mag_dispense`;
	CREATE TABLE `form_eye_mag_dispense` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  `encounter` bigint(20) DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  `REFDATE` datetime DEFAULT NULL,
		  `REFTYPE` varchar(10) DEFAULT NULL,
		  `RXTYPE` varchar(20) DEFAULT NULL,
		  `ODSPH` varchar(10) DEFAULT NULL,
		  `ODCYL` varchar(10) DEFAULT NULL,
		  `ODAXIS` varchar(10) DEFAULT NULL,
		  `OSSPH` varchar(10) DEFAULT NULL,
		  `OSCYL` varchar(10) DEFAULT NULL,
		  `OSAXIS` varchar(10) DEFAULT NULL,
		  `ODMIDADD` varchar(10) DEFAULT NULL,
		  `OSMIDADD` varchar(10) DEFAULT NULL,
		  `ODADD` varchar(10) DEFAULT NULL,
		  `OSADD` varchar(10) DEFAULT NULL,
		  `ODHPD` varchar(20) DEFAULT NULL,
		  `ODHBASE` varchar(20) DEFAULT NULL,
		  `ODVPD` varchar(20) DEFAULT NULL,
		  `ODVBASE` varchar(20) DEFAULT NULL,
		  `ODSLABOFF` varchar(20) DEFAULT NULL,
		  `ODVERTEXDIST` varchar(20) DEFAULT NULL,
		  `OSHPD` varchar(20) DEFAULT NULL,
		  `OSHBASE` varchar(20) DEFAULT NULL,
		  `OSVPD` varchar(20) DEFAULT NULL,
		  `OSVBASE` varchar(20) DEFAULT NULL,
		  `OSSLABOFF` varchar(20) DEFAULT NULL,
		  `OSVERTEXDIST` varchar(20) DEFAULT NULL,
		  `ODMPDD` varchar(20) DEFAULT NULL,
		  `ODMPDN` varchar(20) DEFAULT NULL,
		  `OSMPDD` varchar(20) DEFAULT NULL,
		  `OSMPDN` varchar(20) DEFAULT NULL,
		  `BPDD` varchar(20) DEFAULT NULL,
		  `BPDN` varchar(20) DEFAULT NULL,
		  `LENS_MATERIAL` varchar(20) DEFAULT NULL,
		  `LENS_TREATMENTS` varchar(100) DEFAULT NULL,
		  `CTLMANUFACTUREROD` varchar(25) DEFAULT NULL,
		  `CTLMANUFACTUREROS` varchar(25) DEFAULT NULL,
		  `CTLSUPPLIEROD` varchar(25) DEFAULT NULL,
		  `CTLSUPPLIEROS` varchar(25) DEFAULT NULL,
		  `CTLBRANDOD` varchar(50) DEFAULT NULL,
		  `CTLBRANDOS` varchar(50) DEFAULT NULL,
		  `CTLODQUANTITY` varchar(255) DEFAULT NULL,
		  `CTLOSQUANTITY` varchar(255) DEFAULT NULL,
		  `ODDIAM` varchar(50) DEFAULT NULL,
		  `ODBC` varchar(50) DEFAULT NULL,
		  `OSDIAM` varchar(50) DEFAULT NULL,
		  `OSBC` varchar(50) DEFAULT NULL,
		  `RXCOMMENTS` text,
		  `COMMENTS` text,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `pid` (`pid`,`encounter`,`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_mag_impplan`;
	CREATE TABLE `form_eye_mag_impplan` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `form_id` bigint(20) NOT NULL,
		  `pid` bigint(20) NOT NULL,
		  `title` varchar(255) NOT NULL,
		  `code` varchar(50) DEFAULT NULL,
		  `codetype` varchar(50) DEFAULT NULL,
		  `codedesc` varchar(255) DEFAULT NULL,
		  `codetext` varchar(255) DEFAULT NULL,
		  `plan` varchar(3000) DEFAULT NULL,
		  `PMSFH_link` varchar(50) DEFAULT NULL,
		  `IMPPLAN_order` tinyint(4) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `second_index` (`form_id`,`pid`,`title`,`plan`(20))
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_mag_orders`;
	CREATE TABLE `form_eye_mag_orders` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `form_id` int(20) NOT NULL,
		  `pid` bigint(20) NOT NULL,
		  `ORDER_DETAILS` varchar(255) NOT NULL,
		  `ORDER_STATUS` varchar(50) DEFAULT NULL,
		  `ORDER_PRIORITY` varchar(50) DEFAULT NULL,
		  `ORDER_DATE_PLACED` date NOT NULL,
		  `ORDER_PLACED_BYWHOM` varchar(50) DEFAULT NULL,
		  `ORDER_DATE_COMPLETED` date DEFAULT NULL,
		  `ORDER_COMPLETED_BYWHOM` varchar(50) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `VISIT_ID` (`pid`,`ORDER_DETAILS`,`ORDER_DATE_PLACED`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_mag_prefs`;
	CREATE TABLE `form_eye_mag_prefs` (
		  `PEZONE` varchar(25) DEFAULT NULL,
		  `LOCATION` varchar(25) DEFAULT NULL,
		  `LOCATION_text` varchar(25) NOT NULL,
		  `id` bigint(20) DEFAULT NULL,
		  `selection` varchar(255) DEFAULT NULL,
		  `ZONE_ORDER` int(11) DEFAULT NULL,
		  `GOVALUE` varchar(10) DEFAULT '0',
		  `ordering` tinyint(4) DEFAULT NULL,
		  `FILL_ACTION` varchar(10) NOT NULL DEFAULT 'ADD',
		  `GORIGHT` varchar(50) NOT NULL,
		  `GOLEFT` varchar(50) NOT NULL,
		  `UNSPEC` varchar(50) NOT NULL,
		  UNIQUE KEY `id` (`id`,`PEZONE`,`LOCATION`,`selection`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_mag_wearing`;
	CREATE TABLE `form_eye_mag_wearing` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `ENCOUNTER` int(11) NOT NULL,
		  `FORM_ID` smallint(6) NOT NULL,
		  `PID` bigint(20) NOT NULL,
		  `RX_NUMBER` int(11) NOT NULL,
		  `ODSPH` varchar(10) DEFAULT NULL,
		  `ODCYL` varchar(10) DEFAULT NULL,
		  `ODAXIS` varchar(10) DEFAULT NULL,
		  `OSSPH` varchar(10) DEFAULT NULL,
		  `OSCYL` varchar(10) DEFAULT NULL,
		  `OSAXIS` varchar(10) DEFAULT NULL,
		  `ODMIDADD` varchar(10) DEFAULT NULL,
		  `OSMIDADD` varchar(10) DEFAULT NULL,
		  `ODADD` varchar(10) DEFAULT NULL,
		  `OSADD` varchar(10) DEFAULT NULL,
		  `ODVA` varchar(10) DEFAULT NULL,
		  `OSVA` varchar(10) DEFAULT NULL,
		  `ODNEARVA` varchar(10) DEFAULT NULL,
		  `OSNEARVA` varchar(10) DEFAULT NULL,
		  `ODHPD` varchar(20) DEFAULT NULL,
		  `ODHBASE` varchar(20) DEFAULT NULL,
		  `ODVPD` varchar(20) DEFAULT NULL,
		  `ODVBASE` varchar(20) DEFAULT NULL,
		  `ODSLABOFF` varchar(20) DEFAULT NULL,
		  `ODVERTEXDIST` varchar(20) DEFAULT NULL,
		  `OSHPD` varchar(20) DEFAULT NULL,
		  `OSHBASE` varchar(20) DEFAULT NULL,
		  `OSVPD` varchar(20) DEFAULT NULL,
		  `OSVBASE` varchar(20) DEFAULT NULL,
		  `OSSLABOFF` varchar(20) DEFAULT NULL,
		  `OSVERTEXDIST` varchar(20) DEFAULT NULL,
		  `ODMPDD` varchar(20) DEFAULT NULL,
		  `ODMPDN` varchar(20) DEFAULT NULL,
		  `OSMPDD` varchar(20) DEFAULT NULL,
		  `OSMPDN` varchar(20) DEFAULT NULL,
		  `BPDD` varchar(20) DEFAULT NULL,
		  `BPDN` varchar(20) DEFAULT NULL,
		  `LENS_MATERIAL` varchar(20) DEFAULT NULL,
		  `LENS_TREATMENTS` varchar(100) DEFAULT NULL,
		  `RX_TYPE` varchar(25) DEFAULT NULL,
		  `COMMENTS` text,
		  UNIQUE KEY `id` (`id`),
		  UNIQUE KEY `FORM_ID` (`FORM_ID`,`ENCOUNTER`,`PID`,`RX_NUMBER`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_neuro`;
	CREATE TABLE `form_eye_neuro` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `ACT` char(3) NOT NULL DEFAULT 'on',
		  `ACT5CCDIST` text,
		  `ACT1CCDIST` text,
		  `ACT2CCDIST` text,
		  `ACT3CCDIST` text,
		  `ACT4CCDIST` text,
		  `ACT6CCDIST` text,
		  `ACT7CCDIST` text,
		  `ACT8CCDIST` text,
		  `ACT9CCDIST` text,
		  `ACT10CCDIST` text,
		  `ACT11CCDIST` text,
		  `ACT1SCDIST` text,
		  `ACT2SCDIST` text,
		  `ACT3SCDIST` text,
		  `ACT4SCDIST` text,
		  `ACT5SCDIST` text,
		  `ACT6SCDIST` text,
		  `ACT7SCDIST` text,
		  `ACT8SCDIST` text,
		  `ACT9SCDIST` text,
		  `ACT10SCDIST` text,
		  `ACT11SCDIST` text,
		  `ACT1SCNEAR` text,
		  `ACT2SCNEAR` text,
		  `ACT3SCNEAR` text,
		  `ACT4SCNEAR` text,
		  `ACT5CCNEAR` text,
		  `ACT6CCNEAR` text,
		  `ACT7CCNEAR` text,
		  `ACT8CCNEAR` text,
		  `ACT9CCNEAR` text,
		  `ACT10CCNEAR` text,
		  `ACT11CCNEAR` text,
		  `ACT5SCNEAR` text,
		  `ACT6SCNEAR` text,
		  `ACT7SCNEAR` text,
		  `ACT8SCNEAR` text,
		  `ACT9SCNEAR` text,
		  `ACT10SCNEAR` text,
		  `ACT11SCNEAR` text,
		  `ACT1CCNEAR` text,
		  `ACT2CCNEAR` text,
		  `ACT3CCNEAR` text,
		  `ACT4CCNEAR` text,
		  `MOTILITYNORMAL` char(3) NOT NULL DEFAULT 'on',
		  `MOTILITY_RS` char(1) DEFAULT '0',
		  `MOTILITY_RI` char(1) DEFAULT '0',
		  `MOTILITY_RR` char(1) DEFAULT '0',
		  `MOTILITY_RL` char(1) DEFAULT '0',
		  `MOTILITY_LS` char(1) DEFAULT '0',
		  `MOTILITY_LI` char(1) DEFAULT '0',
		  `MOTILITY_LR` char(1) DEFAULT '0',
		  `MOTILITY_LL` char(1) DEFAULT '0',
		  `MOTILITY_RRSO` int(1) DEFAULT NULL,
		  `MOTILITY_RLSO` int(1) DEFAULT NULL,
		  `MOTILITY_RRIO` int(1) DEFAULT NULL,
		  `MOTILITY_RLIO` int(1) DEFAULT NULL,
		  `MOTILITY_LRSO` int(1) DEFAULT NULL,
		  `MOTILITY_LLSO` int(1) DEFAULT NULL,
		  `MOTILITY_LRIO` int(1) DEFAULT NULL,
		  `MOTILITY_LLIO` int(1) DEFAULT NULL,
		  `NEURO_COMMENTS` text,
		  `STEREOPSIS` varchar(25) DEFAULT NULL,
		  `ODNPA` text,
		  `OSNPA` text,
		  `VERTFUSAMPS` text,
		  `DIVERGENCEAMPS` text,
		  `NPC` varchar(10) DEFAULT NULL,
		  `DACCDIST` varchar(20) DEFAULT NULL,
		  `DACCNEAR` varchar(20) DEFAULT NULL,
		  `CACCDIST` varchar(20) DEFAULT NULL,
		  `CACCNEAR` varchar(20) DEFAULT NULL,
		  `ODCOLOR` text,
		  `OSCOLOR` text,
		  `ODCOINS` text,
		  `OSCOINS` text,
		  `ODREDDESAT` varchar(20) DEFAULT NULL,
		  `OSREDDESAT` varchar(20) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_postseg`;
	CREATE TABLE `form_eye_postseg` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `ODDISC` text,
		  `OSDISC` text,
		  `ODCUP` text,
		  `OSCUP` text,
		  `ODMACULA` text,
		  `OSMACULA` text,
		  `ODVESSELS` text,
		  `OSVESSELS` text,
		  `ODVITREOUS` text,
		  `OSVITREOUS` text,
		  `ODPERIPH` text,
		  `OSPERIPH` text,
		  `ODCMT` text,
		  `OSCMT` text,
		  `RETINA_COMMENTS` text,
		  `DIL_RISKS` char(2) NOT NULL DEFAULT 'on',
		  `DIL_MEDS` mediumtext,
		  `WETTYPE` varchar(10) NOT NULL,
		  `ATROPINE` varchar(25) NOT NULL,
		  `CYCLOMYDRIL` varchar(25) NOT NULL,
		  `TROPICAMIDE` varchar(25) NOT NULL,
		  `CYCLOGYL` varchar(25) NOT NULL,
		  `NEO25` varchar(25) NOT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_refraction`;
	CREATE TABLE `form_eye_refraction` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `MRODSPH` varchar(25) DEFAULT NULL,
		  `MRODCYL` varchar(25) DEFAULT NULL,
		  `MRODAXIS` varchar(25) DEFAULT NULL,
		  `MRODPRISM` varchar(25) DEFAULT NULL,
		  `MRODBASE` varchar(25) DEFAULT NULL,
		  `MRODADD` varchar(25) DEFAULT NULL,
		  `MROSSPH` varchar(25) DEFAULT NULL,
		  `MROSCYL` varchar(25) DEFAULT NULL,
		  `MROSAXIS` varchar(25) DEFAULT NULL,
		  `MROSPRISM` varchar(50) DEFAULT NULL,
		  `MROSBASE` varchar(50) DEFAULT NULL,
		  `MROSADD` varchar(25) DEFAULT NULL,
		  `MRODNEARSPHERE` varchar(25) DEFAULT NULL,
		  `MRODNEARCYL` varchar(25) DEFAULT NULL,
		  `MRODNEARAXIS` varchar(25) DEFAULT NULL,
		  `MRODPRISMNEAR` varchar(50) DEFAULT NULL,
		  `MRODBASENEAR` varchar(25) DEFAULT NULL,
		  `MROSNEARSHPERE` varchar(25) DEFAULT NULL,
		  `MROSNEARCYL` varchar(25) DEFAULT NULL,
		  `MROSNEARAXIS` varchar(125) DEFAULT NULL,
		  `MROSPRISMNEAR` varchar(50) DEFAULT NULL,
		  `MROSBASENEAR` varchar(25) DEFAULT NULL,
		  `CRODSPH` varchar(25) DEFAULT NULL,
		  `CRODCYL` varchar(25) DEFAULT NULL,
		  `CRODAXIS` varchar(25) DEFAULT NULL,
		  `CROSSPH` varchar(25) DEFAULT NULL,
		  `CROSCYL` varchar(25) DEFAULT NULL,
		  `CROSAXIS` varchar(25) DEFAULT NULL,
		  `CRCOMMENTS` varchar(255) DEFAULT NULL,
		  `BALANCED` char(2) NOT NULL,
		  `ARODSPH` varchar(25) DEFAULT NULL,
		  `ARODCYL` varchar(25) DEFAULT NULL,
		  `ARODAXIS` varchar(25) DEFAULT NULL,
		  `AROSSPH` varchar(25) DEFAULT NULL,
		  `AROSCYL` varchar(25) DEFAULT NULL,
		  `AROSAXIS` varchar(25) DEFAULT NULL,
		  `ARODADD` varchar(25) DEFAULT NULL,
		  `AROSADD` varchar(25) DEFAULT NULL,
		  `ARNEARODVA` varchar(25) DEFAULT NULL,
		  `ARNEAROSVA` varchar(25) DEFAULT NULL,
		  `ARODPRISM` varchar(50) DEFAULT NULL,
		  `AROSPRISM` varchar(50) DEFAULT NULL,
		  `CTLODSPH` varchar(25) DEFAULT NULL,
		  `CTLODCYL` varchar(25) DEFAULT NULL,
		  `CTLODAXIS` varchar(25) DEFAULT NULL,
		  `CTLODBC` varchar(25) DEFAULT NULL,
		  `CTLODDIAM` varchar(25) DEFAULT NULL,
		  `CTLOSSPH` varchar(25) DEFAULT NULL,
		  `CTLOSCYL` varchar(25) DEFAULT NULL,
		  `CTLOSAXIS` varchar(25) DEFAULT NULL,
		  `CTLOSBC` varchar(25) DEFAULT NULL,
		  `CTLOSDIAM` varchar(25) DEFAULT NULL,
		  `CTL_COMMENTS` text,
		  `CTLMANUFACTUREROD` varchar(50) DEFAULT NULL,
		  `CTLSUPPLIEROD` varchar(50) DEFAULT NULL,
		  `CTLBRANDOD` varchar(50) DEFAULT NULL,
		  `CTLMANUFACTUREROS` varchar(50) DEFAULT NULL,
		  `CTLSUPPLIEROS` varchar(50) DEFAULT NULL,
		  `CTLBRANDOS` varchar(50) DEFAULT NULL,
		  `CTLODADD` varchar(25) DEFAULT NULL,
		  `CTLOSADD` varchar(25) DEFAULT NULL,
		  `NVOCHECKED` varchar(25) DEFAULT NULL,
		  `ADDCHECKED` varchar(25) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_ros`;
	CREATE TABLE `form_eye_ros` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `ROSGENERAL` text,
		  `ROSHEENT` text,
		  `ROSCV` text,
		  `ROSPULM` text,
		  `ROSGI` text,
		  `ROSGU` text,
		  `ROSDERM` text,
		  `ROSNEURO` text,
		  `ROSPSYCH` text,
		  `ROSMUSCULO` text,
		  `ROSIMMUNO` text,
		  `ROSENDOCRINE` text,
		  `ROSCOMMENTS` text,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_pid` (`id`,`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_eye_vitals`;
	CREATE TABLE `form_eye_vitals` (
		  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
		  `pid` bigint(20) DEFAULT NULL,
		  `alert` char(3) DEFAULT 'yes',
		  `oriented` char(3) DEFAULT 'TPP',
		  `confused` char(3) DEFAULT 'nml',
		  `ODIOPAP` varchar(10) DEFAULT NULL,
		  `OSIOPAP` varchar(10) DEFAULT NULL,
		  `ODIOPTPN` varchar(10) DEFAULT NULL,
		  `OSIOPTPN` varchar(10) DEFAULT NULL,
		  `ODIOPFTN` varchar(10) DEFAULT NULL,
		  `OSIOPFTN` varchar(10) DEFAULT NULL,
		  `IOPTIME` time NOT NULL,
		  `ODIOPPOST` varchar(10) NOT NULL,
		  `OSIOPPOST` varchar(10) NOT NULL,
		  `IOPPOSTTIME` time DEFAULT NULL,
		  `ODIOPTARGET` varchar(10) NOT NULL,
		  `OSIOPTARGET` varchar(10) NOT NULL,
		  `AMSLEROD` smallint(1) DEFAULT NULL,
		  `AMSLEROS` smallint(1) DEFAULT NULL,
		  `ODVF1` tinyint(1) DEFAULT NULL,
		  `ODVF2` tinyint(1) DEFAULT Nment_claim` tinyint(1) DEFAULT '0',
		  `icn_resubmission_number` varchar(35) DEFAULT NULL,
		  `box_14_date_qual` char(3) DEFAULT NULL,
		  `box_15_date_qual` char(3) DEFAULT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_observation`;
	CREATE TABLE `form_observation` (
		  `id` bigint(20) NOT NULL,
		  `date` date DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `encounter` varchar(255) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  `code` varchar(255) DEFAULT NULL,
		  `observation` varchar(255) DEFAULT NULL,
		  `ob_value` varchar(255) DEFAULT NULL,
		  `ob_unit` varchar(255) DEFAULT NULL,
		  `description` varchar(255) DEFAULT NULL,
		  `code_type` varchar(255) DEFAULT NULL,
		  `table_code` varchar(255) DEFAULT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_reviewofs`;
	CREATE TABLE `form_reviewofs` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) DEFAULT NULL,
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT NULL,
		  `activity` tinyint(4) DEFAULT NULL,
		  `fever` varchar(5) DEFAULT NULL,
		  `chills` varchar(5) DEFAULT NULL,
		  `night_sweats` varchar(5) DEFAULT NULL,
		  `weight_loss` varchar(5) DEFAULT NULL,
		  `poor_appetite` varchar(5) DEFAULT NULL,
		  `insomnia` varchar(5) DEFAULT NULL,
		  `fatigued` varchar(5) DEFAULT NULL,
		  `depressed` varchar(5) DEFAULT NULL,
		  `hyperactive` varchar(5) DEFAULT NULL,
		  `exposure_to_foreign_countries` varchar(5) DEFAULT NULL,
		  `cataracts` varchar(5) DEFAULT NULL,
		  `cataract_surgery` varchar(5) DEFAULT NULL,
		  `glaucoma` varchar(5) DEFAULT NULL,
		  `double_vision` varchar(5) DEFAULT NULL,
		  `blurred_vision` varchar(5) DEFAULT NULL,
		  `poor_hearing` varchar(5) DEFAULT NULL,
		  `headaches` varchar(5) DEFAULT NULL,
		  `ringing_in_ears` varchar(5) DEFAULT NULL,
		  `bloody_nose` varchar(5) DEFAULT NULL,
		  `sinusitis` varchar(5) DEFAULT NULL,
		  `sinus_surgery` varchar(5) DEFAULT NULL,
		  `dry_mouth` varchar(5) DEFAULT NULL,
		  `strep_throat` varchar(5) DEFAULT NULL,
		  `tonsillectomy` varchar(5) DEFAULT NULL,
		  `swollen_lymph_nodes` varchar(5) DEFAULT NULL,
		  `throat_cancer` varchar(5) DEFAULT NULL,
		  `throat_cancer_surgery` varchar(5) DEFAULT NULL,
		  `heart_attack` varchar(5) DEFAULT NULL,
		  `irregular_heart_beat` varchar(5) DEFAULT NULL,
		  `chest_pains` varchar(5) DEFAULT NULL,
		  `shortness_of_breath` varchar(5) DEFAULT NULL,
		  `high_blood_pressure` varchar(5) DEFAULT NULL,
		  `heart_failure` varchar(5) DEFAULT NULL,
		  `poor_circulation` varchar(5) DEFAULT NULL,
		  `vascular_surgery` varchar(5) DEFAULT NULL,
		  `cardiac_catheterization` varchar(5) DEFAULT NULL,
		  `coronary_artery_bypass` varchar(5) DEFAULT NULL,
		  `heart_transplant` varchar(5) DEFAULT NULL,
		  `stress_test` varchar(5) DEFAULT NULL,
		  `emphysema` varchar(5) DEFAULT NULL,
		  `chronic_bronchitis` varchar(5) DEFAULT NULL,
		  `interstitial_lung_disease` varchar(5) DEFAULT NULL,
		  `shortness_of_breath_2` varchar(5) DEFAULT NULL,
		  `lung_cancer` varchar(5) DEFAULT NULL,
		  `lung_cancer_surgery` varchar(5) DEFAULT NULL,
		  `pheumothorax` varchar(5) DEFAULT NULL,
		  `stomach_pains` varchar(5) DEFAULT NULL,
		  `peptic_ulcer_disease` varchar(5) DEFAULT NULL,
		  `gastritis` varchar(5) DEFAULT NULL,
		  `endoscopy` varchar(5) DEFAULT NULL,
		  `polyps` varchar(5) DEFAULT NULL,
		  `colonoscopy` varchar(5) DEFAULT NULL,
		  `colon_cancer` varchar(5) DEFAULT NULL,
		  `colon_cancer_surgery` varchar(5) DEFAULT NULL,
		  `ulcerative_colitis` varchar(5) DEFAULT NULL,
		  `crohns_disease` varchar(5) DEFAULT NULL,
		  `appendectomy` varchar(5) DEFAULT NULL,
		  `divirticulitis` varchar(5) DEFAULT NULL,
		  `divirticulitis_surgery` varchar(5) DEFAULT NULL,
		  `gall_stones` varchar(5) DEFAULT NULL,
		  `cholecystectomy` varchar(5) DEFAULT NULL,
		  `hepatitis` varchar(5) DEFAULT NULL,
		  `cirrhosis_of_the_liver` varchar(5) DEFAULT NULL,
		  `splenectomy` varchar(5) DEFAULT NULL,
		  `kidney_failure` varchar(5) DEFAULT NULL,
		  `kidney_stones` varchar(5) DEFAULT NULL,
		  `kidney_cancer` varchar(5) DEFAULT NULL,
		  `kidney_infections` varchar(5) DEFAULT NULL,
		  `bladder_infections` varchar(5) DEFAULT NULL,
		  `bladder_cancer` varchar(5) DEFAULT NULL,
		  `prostate_problems` varchar(5) DEFAULT NULL,
		  `prostate_cancer` varchar(5) DEFAULT NULL,
		  `kidney_transplant` varchar(5) DEFAULT NULL,
		  `sexually_transmitted_disease` varchar(5) DEFAULT NULL,
		  `burning_with_urination` varchar(5) DEFAULT NULL,
		  `discharge_from_urethra` varchar(5) DEFAULT NULL,
		  `rashes` varchar(5) DEFAULT NULL,
		  `infections` varchar(5) DEFAULT NULL,
		  `ulcerations` varchar(5) DEFAULT NULL,
		  `pemphigus` varchar(5) DEFAULT NULL,
		  `herpes` varchar(5) DEFAULT NULL,
		  `osetoarthritis` varchar(5) DEFAULT NULL,
		  `rheumotoid_arthritis` varchar(5) DEFAULT NULL,
		  `lupus` varchar(5) DEFAULT NULL,
		  `ankylosing_sondlilitis` varchar(5) DEFAULT NULL,
		  `swollen_joints` varchar(5) DEFAULT NULL,
		  `stiff_joints` varchar(5) DEFAULT NULL,
		  `broken_bones` varchar(5) DEFAULT NULL,
		  `neck_problems` varchar(5) DEFAULT NULL,
		  `back_problems` varchar(5) DEFAULT NULL,
		  `back_surgery` varchar(5) DEFAULT NULL,
		  `scoliosis` varchar(5) DEFAULT NULL,
		  `herniated_disc` varchar(5) DEFAULT NULL,
		  `shoulder_problems` varchar(5) DEFAULT NULL,
		  `elbow_problems` varchar(5) DEFAULT NULL,
		  `wrist_problems` varchar(5) DEFAULT NULL,
		  `hand_problems` varchar(5) DEFAULT NULL,
		  `hip_problems` varchar(5) DEFAULT NULL,
		  `knee_problems` varchar(5) DEFAULT NULL,
		  `ankle_problems` varchar(5) DEFAULT NULL,
		  `foot_problems` varchar(5) DEFAULT NULL,
		  `insulin_dependent_diabetes` varchar(5) DEFAULT NULL,
		  `noninsulin_dependent_diabetes` varchar(5) DEFAULT NULL,
		  `hypothyroidism` varchar(5) DEFAULT NULL,
		  `hyperthyroidism` varchar(5) DEFAULT NULL,
		  `cushing_syndrom` varchar(5) DEFAULT NULL,
		  `addison_syndrom` varchar(5) DEFAULT NULL,
		  `additional_notes` longtext,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_ros`;
	CREATE TABLE `form_ros` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `pid` bigint(20) NOT NULL,
		  `activity` int(11) NOT NULL DEFAULT '1',
		  `date` datetime DEFAULT NULL,
		  `weight_change` varchar(3) DEFAULT NULL,
		  `weakness` varchar(3) DEFAULT NULL,
		  `fatigue` varchar(3) DEFAULT NULL,
		  `anorexia` varchar(3) DEFAULT NULL,
		  `fever` varchar(3) DEFAULT NULL,
		  `chills` varchar(3) DEFAULT NULL,
		  `night_sweats` varchar(3) DEFAULT NULL,
		  `insomnia` varchar(3) DEFAULT NULL,
		  `irritability` varchar(3) DEFAULT NULL,
		  `heat_or_cold` varchar(3) DEFAULT NULL,
		  `intolerance` varchar(3) DEFAULT NULL,
		  `change_in_vision` varchar(3) DEFAULT NULL,
		  `glaucoma_history` varchar(3) DEFAULT NULL,
		  `eye_pain` varchar(3) DEFAULT NULL,
		  `irritation` varchar(3) DEFAULT NULL,
		  `redness` varchar(3) DEFAULT NULL,
		  `excessive_tearing` varchar(3) DEFAULT NULL,
		  `double_vision` varchar(3) DEFAULT NULL,
		  `blind_spots` varchar(3) DEFAULT NULL,
		  `photophobia` varchar(3) DEFAULT NULL,
		  `hearing_loss` varchar(3) DEFAULT NULL,
		  `discharge` varchar(3) DEFAULT NULL,
		  `pain` varchar(3) DEFAULT NULL,
		  `vertigo` varchar(3) DEFAULT NULL,
		  `tinnitus` varchar(3) DEFAULT NULL,
		  `frequent_colds` varchar(3) DEFAULT NULL,
		  `sore_throat` varchar(3) DEFAULT NULL,
		  `sinus_problems` varchar(3) DEFAULT NULL,
		  `post_nasal_drip` varchar(3) DEFAULT NULL,
		  `nosebleed` varchar(3) DEFAULT NULL,
		  `snoring` varchar(3) DEFAULT NULL,
		  `apnea` varchar(3) DEFAULT NULL,
		  `breast_mass` varchar(3) DEFAULT NULL,
		  `breast_discharge` varchar(3) DEFAULT NULL,
		  `biopsy` varchar(3) DEFAULT NULL,
		  `abnormal_mammogram` varchar(3) DEFAULT NULL,
		  `cough` varchar(3) DEFAULT NULL,
		  `sputum` varchar(3) DEFAULT NULL,
		  `shortness_of_breath` varchar(3) DEFAULT NULL,
		  `wheezing` varchar(3) DEFAULT NULL,
		  `hemoptsyis` varchar(3) DEFAULT NULL,
		  `asthma` varchar(3) DEFAULT NULL,
		  `copd` varchar(3) DEFAULT NULL,
		  `chest_pain` varchar(3) DEFAULT NULL,
		  `palpitation` varchar(3) DEFAULT NULL,
		  `syncope` varchar(3) DEFAULT NULL,
		  `pnd` varchar(3) DEFAULT NULL,
		  `doe` varchar(3) DEFAULT NULL,
		  `orthopnea` varchar(3) DEFAULT NULL,
		  `peripheal` varchar(3) DEFAULT NULL,
		  `edema` varchar(3) DEFAULT NULL,
		  `legpain_cramping` varchar(3) DEFAULT NULL,
		  `history_murmur` varchar(3) DEFAULT NULL,
		  `arrythmia` varchar(3) DEFAULT NULL,
		  `heart_problem` varchar(3) DEFAULT NULL,
		  `dysphagia` varchar(3) DEFAULT NULL,
		  `heartburn` varchar(3) DEFAULT NULL,
		  `bloating` varchar(3) DEFAULT NULL,
		  `belching` varchar(3) DEFAULT NULL,
		  `flatulence` varchar(3) DEFAULT NULL,
		  `nausea` varchar(3) DEFAULT NULL,
		  `vomiting` varchar(3) DEFAULT NULL,
		  `hematemesis` varchar(3) DEFAULT NULL,
		  `gastro_pain` varchar(3) DEFAULT NULL,
		  `food_intolerance` varchar(3) DEFAULT NULL,
		  `hepatitis` varchar(3) DEFAULT NULL,
		  `jaundice` varchar(3) DEFAULT NULL,
		  `hematochezia` varchar(3) DEFAULT NULL,
		  `changed_bowel` varchar(3) DEFAULT NULL,
		  `diarrhea` varchar(3) DEFAULT NULL,
		  `constipation` varchar(3) DEFAULT NULL,
		  `polyuria` varchar(3) DEFAULT NULL,
		  `polydypsia` varchar(3) DEFAULT NULL,
		  `dysuria` varchar(3) DEFAULT NULL,
		  `hematuria` varchar(3) DEFAULT NULL,
		  `frequency` varchar(3) DEFAULT NULL,
		  `urgency` varchar(3) DEFAULT NULL,
		  `incontinence` varchar(3) DEFAULT NULL,
		  `renal_stones` varchar(3) DEFAULT NULL,
		  `utis` varchar(3) DEFAULT NULL,
		  `hesitancy` varchar(3) DEFAULT NULL,
		  `dribbling` varchar(3) DEFAULT NULL,
		  `stream` varchar(3) DEFAULT NULL,
		  `nocturia` varchar(3) DEFAULT NULL,
		  `erections` varchar(3) DEFAULT NULL,
		  `ejaculations` varchar(3) DEFAULT NULL,
		  `g` varchar(3) DEFAULT NULL,
		  `p` varchar(3) DEFAULT NULL,
		  `ap` varchar(3) DEFAULT NULL,
		  `lc` varchar(3) DEFAULT NULL,
		  `mearche` varchar(3) DEFAULT NULL,
		  `menopause` varchar(3) DEFAULT NULL,
		  `lmp` varchar(3) DEFAULT NULL,
		  `f_frequency` varchar(3) DEFAULT NULL,
		  `f_flow` varchar(3) DEFAULT NULL,
		  `f_symptoms` varchar(3) DEFAULT NULL,
		  `abnormal_hair_growth` varchar(3) DEFAULT NULL,
		  `f_hirsutism` varchar(3) DEFAULT NULL,
		  `joint_pain` varchar(3) DEFAULT NULL,
		  `swelling` varchar(3) DEFAULT NULL,
		  `m_redness` varchar(3) DEFAULT NULL,
		  `m_warm` varchar(3) DEFAULT NULL,
		  `m_stiffness` varchar(3) DEFAULT NULL,
		  `muscle` varchar(3) DEFAULT NULL,
		  `m_aches` varchar(3) DEFAULT NULL,
		  `fms` varchar(3) DEFAULT NULL,
		  `arthritis` varchar(3) DEFAULT NULL,
		  `loc` varchar(3) DEFAULT NULL,
		  `seizures` varchar(3) DEFAULT NULL,
		  `stroke` varchar(3) DEFAULT NULL,
		  `tia` varchar(3) DEFAULT NULL,
		  `n_numbness` varchar(3) DEFAULT NULL,
		  `n_weakness` varchar(3) DEFAULT NULL,
		  `paralysis` varchar(3) DEFAULT NULL,
		  `intellectual_decline` varchar(3) DEFAULT NULL,
		  `memory_problems` varchar(3) DEFAULT NULL,
		  `dementia` varchar(3) DEFAULT NULL,
		  `n_headache` varchar(3) DEFAULT NULL,
		  `s_cancer` varchar(3) DEFAULT NULL,
		  `psoriasis` varchar(3) DEFAULT NULL,
		  `s_acne` varchar(3) DEFAULT NULL,
		  `s_other` varchar(3) DEFAULT NULL,
		  `s_disease` varchar(3) DEFAULT NULL,
		  `p_diagnosis` varchar(3) DEFAULT NULL,
		  `p_medication` varchar(3) DEFAULT NULL,
		  `depression` varchar(3) DEFAULT NULL,
		  `anxiety` varchar(3) DEFAULT NULL,
		  `social_difficulties` varchar(3) DEFAULT NULL,
		  `thyroid_problems` varchar(3) DEFAULT NULL,
		  `diabetes` varchar(3) DEFAULT NULL,
		  `abnormal_blood` varchar(3) DEFAULT NULL,
		  `anemia` varchar(3) DEFAULT NULL,
		  `fh_blood_problems` varchar(3) DEFAULT NULL,
		  `bleeding_problems` varchar(3) DEFAULT NULL,
		  `allergies` varchar(3) DEFAULT NULL,
		  `frequent_illness` varchar(3) DEFAULT NULL,
		  `hiv` varchar(3) DEFAULT NULL,
		  `hai_status` varchar(3) DEFAULT NULL,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_soap`;
	CREATE TABLE `form_soap` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) DEFAULT '0',
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT '0',
		  `activity` tinyint(4) DEFAULT '0',
		  `subjective` text,
		  `objective` text,
		  `assessment` text,
		  `plan` text,
		  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_taskman`;
	CREATE TABLE `form_taskman` (
		  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
		  `REQ_DATE` datetime NOT NULL,
		  `FROM_ID` bigint(20) NOT NULL,
		  `TO_ID` bigint(20) NOT NULL,
		  `PATIENT_ID` bigint(20) NOT NULL,
		  `DOC_TYPE` varchar(20) DEFAULT NULL,
		  `DOC_ID` bigint(20) DEFAULT NULL,
		  `ENC_ID` bigint(20) DEFAULT NULL,
		  `METHOD` varchar(20) NOT NULL,
		  `COMPLETED` varchar(1) DEFAULT NULL COMMENT '1 = completed',
		  `COMPLETED_DATE` datetime DEFAULT NULL,
		  `COMMENT` varchar(50) DEFAULT NULL,
		  `USERFIELD_1` varchar(50) DEFAULT NULL,
		  PRIMARY KEY (`ID`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `form_vitals`;
	CREATE TABLE `form_vitals` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `date` datetime DEFAULT NULL,
		  `pid` varchar(255) NOT NULL DEFAULT '0',
		  `user` varchar(255) DEFAULT NULL,
		  `groupname` varchar(255) DEFAULT NULL,
		  `authorized` tinyint(4) DEFAULT '0',
		  `activity` tinyint(4) DEFAULT '0',
		  `bps` varchar(40) DEFAULT NULL,
		  `bpd` varchar(40) DEFAULT NULL,
		  `weight` float(5,2) DEFAULT '0.00',
		  `height` float(5,2) DEFAULT '0.00',
		  `temperature` float(5,2) DEFAULT '0.00',
		  `temp_method` varchar(255) DEFAULT NULL,
		  `pulse` float(5,2) DEFAULT '0.00',
		  `respiration` float(5,2) DEFAULT '0.00',
		  `note` varchar(255) DEFAULT NULL,
		  `BMI` float(4,1) DEFAULT '0.0',
		  `BMI_status` varchar(255) DEFAULT NULL,
		  `waist_circ` float(5,2) DEFAULT '0.00',
		  `head_circ` float(4,2) DEFAULT '0.00',
		  `oxygen_saturation` float(5,2) DEFAULT '0.00',
		  `external_id` varchar(20) DEFAULT NULL,
		  `vital_uuid` varchar(255) DEFAULT '0',
		  `spo2` varchar(255) DEFAULT NULL,
		  `pain_index` varchar(255) DEFAULT NULL,
		  `vital_date` date DEFAULT NULL,
		  `tenant_id` varchar(255) DEFAULT NULL,
		  PRIMARY KEY (`id`),
		  KEY `pid` (`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_acl`;
	CREATE TABLE `gacl_acl` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT 'system',
		  `allow` int(11) NOT NULL DEFAULT '0',
		  `enabled` int(11) NOT NULL DEFAULT '0',
		  `return_value` text,
		  `note` text,
		  `updated_date` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  KEY `gacl_enabled_acl` (`enabled`),
		  KEY `gacl_section_value_acl` (`section_value`),
		  KEY `gacl_updated_date_acl` (`updated_date`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_acl_sections`;
	CREATE TABLE `gacl_acl_sections` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(230) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_value_acl_sections` (`value`),
		  KEY `gacl_hidden_acl_sections` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_acl_seq`;
	CREATE TABLE `gacl_acl_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aco`;
	CREATE TABLE `gacl_aco` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(255) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_section_value_value_aco` (`section_value`,`value`),
		  KEY `gacl_hidden_aco` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aco_map`;
	CREATE TABLE `gacl_aco_map` (
		  `acl_id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  PRIMARY KEY (`acl_id`,`section_value`,`value`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aco_sections`;
	CREATE TABLE `gacl_aco_sections` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(230) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_value_aco_sections` (`value`),
		  KEY `gacl_hidden_aco_sections` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aco_sections_seq`;
	CREATE TABLE `gacl_aco_sections_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aco_seq`;
	CREATE TABLE `gacl_aco_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro`;
	CREATE TABLE `gacl_aro` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(255) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_section_value_value_aro` (`section_value`,`value`),
		  KEY `gacl_hidden_aro` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_groups`;
	CREATE TABLE `gacl_aro_groups` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `parent_id` int(11) NOT NULL DEFAULT '0',
		  `lft` int(11) NOT NULL DEFAULT '0',
		  `rgt` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(255) NOT NULL,
		  `value` varchar(150) NOT NULL,
		  PRIMARY KEY (`id`,`value`),
		  UNIQUE KEY `gacl_value_aro_groups` (`value`),
		  KEY `gacl_parent_id_aro_groups` (`parent_id`),
		  KEY `gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_groups_id_seq`;
	CREATE TABLE `gacl_aro_groups_id_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_groups_map`;
	CREATE TABLE `gacl_aro_groups_map` (
		  `acl_id` int(11) NOT NULL DEFAULT '0',
		  `group_id` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`acl_id`,`group_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_map`;
	CREATE TABLE `gacl_aro_map` (
		  `acl_id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  PRIMARY KEY (`acl_id`,`section_value`,`value`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_sections`;
	CREATE TABLE `gacl_aro_sections` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(230) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_value_aro_sections` (`value`),
		  KEY `gacl_hidden_aro_sections` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_sections_seq`;
	CREATE TABLE `gacl_aro_sections_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_aro_seq`;
	CREATE TABLE `gacl_aro_seq` (
		  `id` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_axo`;
	CREATE TABLE `gacl_axo` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `section_value` varchar(150) NOT NULL DEFAULT '0',
		  `value` varchar(150) NOT NULL,
		  `order_value` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(255) NOT NULL,
		  `hidden` int(11) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `gacl_section_value_value_axo` (`section_value`,`value`),
		  KEY `gacl_hidden_axo` (`hidden`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_axo_groups`;
	CREATE TABLE `gacl_axo_groups` (
		  `id` int(11) NOT NULL DEFAULT '0',
		  `parent_id` int(11) NOT NULL DEFAULT '0',
		  `lft` int(11) NOT NULL DEFAULT '0',
		  `rgt` int(11) NOT NULL DEFAULT '0',
		  `name` varchar(255) NOT NULL,
		  `value` varchar(150) NOT NULL,
		  PRIMARY KEY (`id`,`value`),
		  UNIQUE KEY `gacl_value_axo_groups` (`value`),
		  KEY `gacl_parent_id_axo_groups` (`parent_id`),
		  KEY `gacl_lft_rgt_axo_groups` (`lft`,`rgt`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `gacl_axo_groups_map`;
	CREATE TABLE `gacl_axo_groups_map` (
		  `acl_id` iULT NULL,
		  `tonsillectomy` datetime DEFAULT NULL,
		  `cholecystestomy` datetime DEFAULT NULL,
		  `heart_surgery` datetime DEFAULT NULL,
		  `hysterectomy` datetime DEFAULT NULL,
		  `hernia_repair` datetime DEFAULT NULL,
		  `hip_replacement` datetime DEFAULT NULL,
		  `knee_replacement` datetime DEFAULT NULL,
		  `appendectomy` datetime DEFAULT NULL,
		  `date` datetime DEFAULT NULL,
		  `pid` bigint(20) NOT NULL DEFAULT '0',
		  `name_1` varchar(255) DEFAULT NULL,
		  `value_1` varchar(255) DEFAULT NULL,
		  `name_2` varchar(255) DEFAULT NULL,
		  `value_2` varchar(255) DEFAULT NULL,
		  `additional_history` text,
		  `exams` text,
		  `usertext11` text,
		  `usertext12` varchar(255) NOT NULL DEFAULT '',
		  `usertext13` varchar(255) NOT NULL DEFAULT '',
		  `usertext14` varchar(255) NOT NULL DEFAULT '',
		  `usertext15` varchar(255) NOT NULL DEFAULT '',
		  `usertext16` varchar(255) NOT NULL DEFAULT '',
		  `usertext17` varchar(255) NOT NULL DEFAULT '',
		  `usertext18` varchar(255) NOT NULL DEFAULT '',
		  `usertext19` varchar(255) NOT NULL DEFAULT '',
		  `usertext20` varchar(255) NOT NULL DEFAULT '',
		  `usertext21` varchar(255) NOT NULL DEFAULT '',
		  `usertext22` varchar(255) NOT NULL DEFAULT '',
		  `usertext23` varchar(255) NOT NULL DEFAULT '',
		  `usertext24` varchar(255) NOT NULL DEFAULT '',
		  `usertext25` varchar(255) NOT NULL DEFAULT '',
		  `usertext26` varchar(255) NOT NULL DEFAULT '',
		  `usertext27` varchar(255) NOT NULL DEFAULT '',
		  `usertext28` varchar(255) NOT NULL DEFAULT '',
		  `usertext29` varchar(255) NOT NULL DEFAULT '',
		  `usertext30` varchar(255) NOT NULL DEFAULT '',
		  `userdate11` date DEFAULT NULL,
		  `userdate12` date DEFAULT NULL,
		  `userdate13` date DEFAULT NULL,
		  `userdate14` date DEFAULT NULL,
		  `userdate15` date DEFAULT NULL,
		  `userarea11` text,
		  `userarea12` text,
		  PRIMARY KEY (`id`),
		  KEY `pid` (`pid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `icd10_dx_order_code`;
	CREATE TABLE `icd10_dx_order_code` (
		  `dx_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
		  `dx_code` varchar(7) DEFAULT NULL,
		  `formatted_dx_code` varchar(10) DEFAULT NULL,
		  `valid_for_coding` char(1) DEFAULT NULL,
		  `short_desc` varchar(60) DEFAULT NULL,
		  `long_desc` varchar(300) DEFAULT NULL,
		  `active` tinyint(4) DEFAULT '0',
		  `revision` int(11) DEFAULT '0',
		  UNIQUE KEY `dx_id` (`dx_id`),
		  KEY `formatted_dx_code` (`formatted_dx_code`),
		  KEY `active` (`active`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	DROP TABLE IF EXISTS `icd10_gem_dx_10_9`;
	CREATE TABLE `icd10_gem_dx_10_9` (
		  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
		  `dx_icd10_source` varchar(7) DEFAULT NULL,
		  `dx_icd9_target` varchar(5) DEFAULT NULL,
		  `flags` varchar(5) DEFAULT NULL,
		  `active` tinyint(4) DEFAULT '0',
		  `revision` int(11) DEFAULT '0',
		  UNIQUE KEY `map_id` (int(4) DEFAULT '0',
			  `revision` int(11) DEFAULT '0',
			  UNIQUE KEY `sg_id` (`sg_id`),
			  KEY `sg_code` (`sg_code`),
			  KEY `formatted_sg_code` (`formatted_sg_code`),
			  KEY `active` (`active`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `icd9_sg_long_code`;
		CREATE TABLE `icd9_sg_long_code` (
			  `sq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
			  `sg_code` varchar(5) DEFAULT NULL,
			  `long_desc` varchar(300) DEFAULT NULL,
			  `active` tinyint(4) DEFAULT '0',
			  `revision` int(11) DEFAULT '0',
			  UNIQUE KEY `sq_id` (`sq_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `image`;
		CREATE TABLE `image` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `type` varchar(255) DEFAULT NULL,
			  `name` varchar(255) DEFAULT NULL,
			  `data` text,
			  `image_uuid` varchar(255) DEFAULT NULL,
			  `template_uuid` varchar(255) DEFAULT NULL,
			  `template_type` varchar(255) DEFAULT NULL,
			  `date` datetime DEFAULT NULL,
			  `pid` varchar(255) DEFAULT NULL,
			  `tags` json DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `immunizations`;
		CREATE TABLE `immunizations` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `patient_id` bigint(20) DEFAULT NULL,
			  `administered_date` datetime DEFAULT NULL,
			  `immunization_id` int(11) DEFAULT NULL,
			  `cvx_code` varchar(10) DEFAULT NULL,
			  `manufacturer` varchar(100) DEFAULT NULL,
			  `lot_number` varchar(50) DEFAULT NULL,
			  `administered_by_id` bigint(20) DEFAULT NULL,
			  `administered_by` varchar(255) DEFAULT NULL COMMENT 'Alternative to administered_by_id',
			  `education_date` date DEFAULT NULL,
			  `vis_date` date DEFAULT NULL COMMENT 'Date of VIS Statement',
			  `note` text,
			  `create_date` datetime DEFAULT NULL,
			  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  `created_by` bigint(20) DEFAULT NULL,
			  `updated_by` bigint(20) DEFAULT NULL,
			  `amount_administered` float DEFAULT NULL,
			  `amount_administered_unit` varchar(50) DEFAULT NULL,
			  `expiration_date` date DEFAULT NULL,
			  `route` varchar(100) DEFAULT NULL,
			  `administration_site` varchar(100) DEFAULT NULL,
			  `added_erroneously` tinyint(1) NOT NULL DEFAULT '0',
			  `external_id` varchar(20) DEFAULT NULL,
			  `completion_status` varchar(50) DEFAULT NULL,
			  `information_source` varchar(31) DEFAULT NULL,
			  `refusal_reason` varchar(31) DEFAULT NULL,
			  `ordering_provider` int(11) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  KEY `patient_id` (`patient_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `immunization_observation`;
		CREATE TABLE `immunization_observation` (
			  `imo_id` int(11) NOT NULL AUTO_INCREMENT,
			  `imo_im_id` int(11) NOT NULL,
			  `imo_pid` int(11) DEFAULT NULL,
			  `imo_criteria` varchar(255) DEFAULT NULL,
			  `imo_criteria_value` varchar(255) DEFAULT NULL,
			  `imo_user` int(11) DEFAULT NULL,
			  `imo_code` varchar(255) DEFAULT NULL,
			  `imo_codetext` varchar(255) DEFAULT NULL,
			  `imo_codetype` varchar(255) DEFAULT NULL,
			  `imo_vis_date_published` date DEFAULT NULL,
			  `imo_vis_date_presented` date DEFAULT NULL,
			  `imo_date_observation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			  PRIMARY KEY (`imo_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `insurance_companies`;
		CREATE TABLE `insurance_companies` (
			  `id` int(11) NOT NULL DEFAULT '0',
			  `name` varchar(255) DEFAULT NULL,
			  `attn` varchar(255) DEFAULT NULL,
			  `cms_id` varchar(15) DEFAULT NULL,
			  `ins_type_code` tinyint(2) DEFAULT NULL,
			  `x12_receiver_id` varchar(25) DEFAULT NULL,
			  `x12_default_partner_id` int(11) DEFAULT NULL,
			  `alt_cms_id` varchar(15) NOT NULL DEFAULT '',
			  `inactive` int(1) NOT NULL DEFAULT '0',
			  `eligibility_id` varchar(32) DEFAULT NULL,
			  `x12_default_eligibility_id` int(11) DEFAULT 0',
			  `lang_id` int(11) NOT NULL DEFAULT '0',
			  `definition` mediumtext,
			  UNIQUE KEY `def_id` (`def_id`),
			  KEY `cons_id` (`cons_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `lang_languages`;
		CREATE TABLE `lang_languages` (
			  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
			  `lang_code` char(2) NOT NULL DEFAULT '',
			  `lang_description` varchar(100) DEFAULT NULL,
			  `lang_is_rtl` tinyint(4) DEFAULT '0',
			  UNIQUE KEY `lang_id` (`lang_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `layout_group_properties`;
		CREATE TABLE `layout_group_properties` (
			  `grp_form_id` varchar(31) NOT NULL,
			  `grp_group_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'empty when representing the whole form',
			  `grp_title` varchar(63) NOT NULL DEFAULT '' COMMENT 'descriptive name of the form or group',
			  `grp_subtitle` varchar(63) NOT NULL DEFAULT '' COMMENT 'for display under the title',
			  `grp_mapping` varchar(31) NOT NULL DEFAULT '' COMMENT 'the form category',
			  `grp_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'optional order within mapping',
			  `grp_activity` tinyint(1) NOT NULL DEFAULT '1',
			  `grp_repeats` int(11) NOT NULL DEFAULT '0',
			  `grp_columns` int(11) NOT NULL DEFAULT '0',
			  `grp_size` int(11) NOT NULL DEFAULT '0',
			  `grp_issue_type` varchar(75) NOT NULL DEFAULT '',
			  `grp_aco_spec` varchar(63) NOT NULL DEFAULT '',
			  `grp_services` varchar(4095) NOT NULL DEFAULT '',
			  `grp_products` varchar(4095) NOT NULL DEFAU'',
			  `seq` int(11) NOT NULL DEFAULT '0',
			  `is_default` tinyint(1) NOT NULL DEFAULT '0',
			  `option_value` float NOT NULL DEFAULT '0',
			  `mapping` varchar(31) NOT NULL DEFAULT '',
			  `notes` text,
			  `codes` varchar(255) NOT NULL DEFAULT '',
			  `toggle_setting_1` tinyint(1) NOT NULL DEFAULT '0',
			  `toggle_setting_2` tinyint(1) NOT NULL DEFAULT '0',
			  `activity` tinyint(4) NOT NULL DEFAULT '1',
			  `subtype` varchar(31) NOT NULL DEFAULT '',
			  `edit_options` tinyint(1) NOT NULL DEFAULT '1',
			  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			  PRIMARY KEY (`list_id`,`option_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `location`;
		CREATE TABLE `location` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `location_uuid` varchar(255) NOT NULL,
			  `tenant_uuid` varchar(255) NOT NULL,
			  `archive` smallint(6) NOT NULL,
			  `active` smallint(6) NOT NULL,
			  `date` datetime NOT NULL,
			  `building` varchar(100) NOT NULL,
			  `floor` varchar(100) DEFAULT NULL,
			  `ward` varchar(100) DEFAULT NULL,
			  `bed_count` varchar(100) DEFAULT NULL,
			  `address` varchar(1000) DEFAULT NULL,
			  `facility_uuid` varchar(250) DEFAULT NULL,
			  `ward_tag` mediumtext,
			  `building_tag` mediumtext,
			  `floor_tag` mediumtext,
			  `ward_description` longtext,
			  `floor_description` longtext,
			  `building_description` longtext,
			  `current_date` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `log`;
		CREATE TABLE `log` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `event` varchar(255) DEFAULT NULL,
			  `category` varchar(255) DEFAULT NULL,
			  `user` varchar(255) DEFAULT NULL,
			  `groupname` varchar(255) DEFAULT NULL,
			  `comments` longtext,
			  `user_notes` longtext,
			  `patient_id` bigint(20) DEFAULT NULL,
			  `success` tinyint(1) DEFAULT '1',
			  `checksum` longtext,
			  `crt_user` varchar(255) DEFAULT NULL,
			  `log_from` varchar(20) DEFAULT 'open-emr',
			  `menu_item_id` int(11) DEFAULT NULL,
			  `ccda_doc_id` int(11) DEFAULT NULL COMMENT 'CCDA document id from ccda',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `login_mfa_registrations`;
		CREATE TABLE `login_mfa_registrations` (
			  `user_id` bigint(20) NOT NULL,
			  `name` varchar(30) NOT NULL,
			  `last_challenge` datetime DEFAULT NULL,
			  `method` varchar(31) NOT NULL COMMENT 'Q&A, U2F, TOTP etc.',
			  `var1` varchar(4096) NOT NULL DEFAULT '' COMMENT 'Question, U2F registration etc.',
			  `var2` varchar(256) NOT NULL DEFAULT '' COMMENT 'Answer etc.',
			  PRIMARY KEY (`user_id`,`name`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `log_comment_encrypt`;
		CREATE TABLE `log_comment_encrypt` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `log_id` int(11) NOT NULL,
			  `encrypt` enum('Yes','No') NOT NULL DEFAULT 'No',
			  `checksum` longtext,
			  `version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 for mycrypt and 1 for openssl',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `log_validator`;
		CREATE TABLE `log_validator` (
			  `log_id` bigint(20) NOT NULL,
			  `log_checksum` longtext,
			  PRIMARY KEY (`log_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `medex_icons`;
		CREATE TABLE `medex_icons` (
			  `i_UID` int(11) NOT NULL AUTO_INCREMENT,
			  `msg_type` varchar(50) NOT NULL,
			  `msg_status` varchar(10) NOT NULL,
			  `i_description` varchar(255) DEFAULT NULL,
			  `i_html` text,
			  `i_blob` longtext,
			  PRIMARY KEY (`i_UID`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `medex_outgoing`;
		CREATE TABLE `medex_outgoing` (
			  `msg_uid` int(11) NOT NULL AUTO_INCREMENT,
			  `msg_pid` int(11) NOT NULL,
			  `msg_pc_eid` varchar(11) NOT NULL,
			  `campaign_uid` int(11) NOT NULL DEFAULT '0',
			  `msg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			  `msg_type` varchar(50) NOT NULL,
			  `msg_reply` varchar(50) DEFAULT NULL,
			  `msg_extra_text` text,
			  `medex_uid` int(11) DEFAULT NULL,
			  PRIMARY KEY (`msg_uid`),
			  UNIQUE KEY `msg_eid` (`msg_uid`,`msg_pc_eid`,`medex_uid`),
			  KEY `i_msg_date` (`msg_date`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `medex_prefs`;
		CREATE TABLE `medex_prefs` (
			  `MedEx_id` int(11) DEFAULT '0',
			  `ME_username` varchar(100) DEFAULT NULL,
			  `ME_api_key` text,
			  `ME_facilities` varchar(50) DEFAULT NULL,
			  `ME_providers` varchar(100) DEFAULT NULL,
			  `ME_hipaa_default_override` varchar(3) DEFAULT NULL,
			  `PHONE_country_code` int(4) NOT NULL DEFAULT '1',
			  `MSGS_default_yes` varchar(3) DEFAULT NULL,
			  `POSTCARDS_local` varchar(3) DEFAULT NULL,
			  `POSTCARDS_remote` varchar(3) DEFAULT NULL,
			  `LABELS_local` varchar(3) DEFAULT NULL,
			  `LABELS_choice` varchar(50) DEFAULT NULL,
			  `combine_time` tinyint(4) DEFAULT NULL,
			  `postcard_top` varchar(255) DEFAULT NULL,
			  `status` text,
			  `MedEx_lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			  UNIQUE KEY `ME_username` (`ME_username`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `medex_recalls`;
		CREATE TABLE `medex_recalls` (
			  `r_ID` int(11) NOT NULL AUTO_INCREMENT,
			  `r_PRACTID` int(11) NOT NULL,
			  `r_pid` int(11) NOT NULL COMMENT 'PatientID from pat_data',
			  `r_eventDate` date NOT NULL COMMENT 'Date of Appt or Recall',
			  `r_facility` int(11) NOT NULL,
			  `r_provider` int(11) NOT NULL,
			  `r_reason` varchar(255) DEFAULT NULL,
			  `r_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`r_ID`),
			  UNIQUE KEY `r_PRACTID` (`r_PRACTID`,`r_pid`),
			  KEY `i_eventDate` (`r_eventDate`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `medscheds`;
		CREATE TABLE `medscheds` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `prescription_id` int(11) NOT NULL,
			  `endedAt` datetime DEFAULT NULL,
			  `createdAt` datetime NOT NULL,
			  `updatedAt` datetime NOT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=latin1;


		DROP TABLE IF EXISTS `misc_address_book`;
		CREATE TABLE `misc_address_book` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `fname` varchar(255) DEFAULT NULL,
			  `mname` varchar(255) DEFAULT NULL,
			  `lname` varchar(255) DEFAULT NULL,
			  `street` varchar(60) DEFAULT NULL,
			  `city` varchar(30) DEFAULT NULL,
			  `state` varchar(30) DEFAULT NULL,
			  `zip` varchar(20) DEFAULT NULL,
			  `phone` varchar(30) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `modules`;
		CREATE TABLE `modules` (
			  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
			  `mod_name` varchar(64) NOT NULL DEFAULT '0',
			  `mod_directory` varchar(64) NOT NULL DEFAULT '',
			  `mod_parent` varchar(64) NOT NULL DEFAULT '',
			  `mod_type` varchar(64) NOT NULL DEFAULT '',
			  `mod_active` int(1) unsigned NOT NULL DEFAULT '0',
			  `mod_ui_name` varchar(20) NOT NULL DEFAULT '''',
			  `mod_relative_link` varchar(64) NOT NULL DEFAULT '',
			  `mod_ui_order` tinyint(3) NOT NULL DEFAULT '0',
			  `mod_ui_active` int(1) unsigned NOT NULL DEFAULT '0',
			  `mod_description` varchar(255) NOT NULL DEFAULT '',
			  `mod_nick_name` varchar(25) NOT NULL DEFAULT '',
			  `mod_enc_menu` varchar(10) NOT NULL DEFAULT 'no',
			  `permissions_item_table` char(100) DEFAULT NULL,
			  `directory` varchar(255) NOT NULL,
			  `date` datetime NOT NULL,
			  `sql_run` tinyint(4) DEFAULT '0',
			  `type` tinyint(4) DEFAULT '0',
			  PRIMARY KEY (`mod_id`,`mod_directory`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `modules_hooks_settings`;
		CREATE TABLE `modules_hooks_settings` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `mod_id` int(11) DEFAULT NULL,
			  `enabled_hooks` varchar(255) DEFAULT NULL,
			  `attached_to` varchar(45) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `modules_settings`;
		CREATE TABLE `modules_settings` (
			  `mod_id` int(11) DEFAULT NULL,
			  `fld_type` smallint(6) DEFAULT NULL COMMENT '1=>ACL,2=>preferences,3=>hooks',
			  `obj_name` varchar(255) DEFAULT NULL,
			  `menu_name` varchar(255) DEFAULT NULL,
			  `path` varchar(255) DEFAULT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `module_acl_group_settings`;
		CREATE TABLE `module_acl_group_settings` (
			  `module_id` int(11) NOT NULL,
			  `group_id` int(11) NOT NULL,
			  `section_id` int(11) NOT NULL,
			  `allowed` tinyint(1) DEFAULT NULL,
			  PRIMARY KEY (`module_id`,`group_id`,`section_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `module_acl_sections`;
		CREATE TABLE `module_acl_sections` (
			  `section_id` int(11) DEFAULT NULL,
			  `section_name` varchar(255) DEFAULT NULL,
			  `parent_section` int(11) DEFAULT NULL,
			  `section_identifier` varchar(50) DEFAULT NULL,
			  `module_id` int(11) DEFAULT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `module_acl_user_settings`;
		CREATE TABLE `module_acl_user_settings` (
			  `module_id` int(11) NOT NULL,
			  `user_id` int(11) NOT NULL,
			  `section_id` int(11) NOT NULL,
			  `allowed` int(1) DEFAULT NULL,
			  PRIMARY KEY (`module_id`,`user_id`,`section_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `module_configuration`;
		CREATE TABLE `module_configuration` (
			  `module_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
			  `module_id` int(10) unsigned NOT NULL,
			  `field_name` varchar(45) NOT NULL,
			  `field_value` varchar(255) NOT NULL,
			  PRIMARY KEY (`module_config_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `multiple_db`;
		CREATE TABLE `multiple_db` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `namespace` varchar(255) NOT NULL,
			  `username` varchar(255) NOT NULL,
			  `password` text,
			  `dbname` varchar(255) NOT NULL,
			  `host` varchar(255) NOT NULL DEFAULT 'localhost',
			  `port` smallint(4) NOT NULL DEFAULT '3306',
			  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`id`),
			  UNIQUE KEY `namespace` (`namespace`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `notes`;
		CREATE TABLE `notes` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `note_uuid` varchar(250) NOT NULL,
			  `note` longtext,
			  `user_uuid` varchar(255) DEFAULT NULL,
			  `date` datetime DEFAULT NULL COMMENT 'create date time',
			  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  `tenant_id` varchar(255) NOT NULL,
			  `pid` varchar(255) NOT NULL,
			  `note_type` varchar(255) NOT NULL COMMENT 'doctor notes, nurse notes, lab notes, prescription notes',
			  `note_type_uuid` varchar(255) DEFAULT NULL COMMENT 'value of uuid from different tables like prescription_uuid, lab_uuid etc',
			  `flag` smallint(20) DEFAULT '0',
			  `prac_uuid` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  KEY `foreign_id` (`user_uuid`),
			  KEY `foreign_id_2` (`note_uuid`),
			  KEY `date` (`date`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `notification_log`;
		CREATE TABLE `notification_log` (
			  `iLogId` int(11) NOT NULL AUTO_INCREMENT,
			  `pid` bigint(20) NOT NULL,
			  `pc_eid` int(11) unsigned DEFAULT NULL,
			  `sms_gateway_type` varchar(50) NOT NULL,
			  `smsgateway_info` varchar(255) NOT NULL,
			  `message` text,
			  `email_sender` varchar(255) NOT NULL,
			  `email_subject` varchar(255) NOT NULL,
			  `type` enum('SMS','Email') NOT NULL,
			  `patient_info` text,
			  `pc_eventDate` date NOT NULL,
			  `pc_endDate` date NOT NULL,
			  `pc_startTime` time NOT NULL,
			  `pc_endTime` time NOT NULL,
			  `dSentDateTime` datetime NOT NULL,
			  PRIMARY KEY (`iLogId`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `notification_settings`;
		CREATE TABLE `notification_settings` (
			  `SettingsId` int(3) NOT NULL AUTO_INCREMENT,
			  `Send_SMS_Before_Hours` int(3) NOT NULL,
			  `Send_Email_Before_Hours` int(3) NOT NULL,
			  `SMS_gateway_username` varchar(100) NOT NULL,
			  `SMS_gateway_password` varchar(100) NOT NULL,
			  `SMS_gateway_apikey` varchar(100) NOT NULL,
			  `type` varchar(50) NOT NULL,
			  PRIMARY KEY (`SettingsId`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `onotes`;
		CREATE TABLE `onotes` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `body` longtext,
			  `user` varchar(255) DEFAULT NULL,
			  `groupname` varchar(255) DEFAULT NULL,
			  `activity` tinyint(4) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `onsite_documents`;
		CREATE TABLE `onsite_documents` (
			  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
			  `pid` bigint(20) unsigned DEFAULT NULL,
			  `facility` int(10) unsigned DEFAULT NULL,
			  `provider` int(10) unsigned DEFAULT NULL,
			  `encounter` int(10) unsigned DEFAULT NULL,
			  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			  `doc_type` varchar(255) NOT NULL,
			  `patient_signed_status` smallint(5) unsigned NOT NULL,
			  `patient_signed_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
			  `authorize_signed_time` datetime DEFAULT NULL,
			  `accept_signed_status` smallint(5) NOT NULL,
			  `authorizing_signator` varchar(50) NOT NULL,
			  `review_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
			  `denial_reason` varchar(255) NOT NULL,
			  `authorized_signature` text,
			  `patient_signature` text,
			  `full_document` mediumblob,
			  `file_name` varchar(255) NOT NULL,
			  `file_path` varchar(255) NOT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `onsite_mail`;
		CREATE TABLE `onsite_mail` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `owner` varchar(128) DEFAULT NULL,
			  `user` varchar(255) DEFAULT NULL,
			  `groupname` varchar(255) DEFAULT NULL,
			  `activity` tinyint(4) DEFAULT NULL,
			  `authorized` tinyint(4) DEFAULT NULL,
			  `header` varchar(255) DEFAULT NULL,
			  `title` varchar(255) DEFAULT NULL,
			  `body` longtext,
			  `recipient_id` varchar(128) DEFAULT NULL,
			  `recipient_name` varchar(255) DEFAULT NULL,
			  `sender_id` varchar(128) DEFAULT NULL,
			  `sender_name` varchar(255) DEFAULT NULL,
			  `assigned_to` varchar(255) DEFAULT NULL,
			  `deleted` tinyint(4) DEFAULT '0' COMMENT 'flag indicates note is deleted',
			  `delete_date` datetime DEFAULT NULL,
			  `mtype` varchar(128) DEFAULT NULL,
			  `message_status` varchar(20) NOT NULL DEFAULT 'New',
			  `mail_chain` int(11) DEFAULT NULL,
			  `reply_mail_chain` int(11) DEFAULT NULL,
			  `is_msg_encrypted` tinyint(2) DEFAULT '0' COMMENT 'Whether messsage encrypted 0-Not encrypted, 1-Encrypted',
			  PRIMARY KEY (`id`),
			  KEY `pid` (`owner`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `onsite_messages`;
		CREATE TABLE `onsite_messages` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `username` varchar(64) NOT NULL,
			  `message` longtext,
			  `ip` varchar(15) NOT NULL,
			  `date` datetime NOT NULL,
			  `sender_id` varchar(64) DEFAULT NULL COMMENT 'who sent id',
			  `recip_id` varchar(255) NOT NULL COMMENT 'who to id array',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Portal messages';


		DROP TABLE IF EXISTS `onsite_online`;
		CREATE TABLE `onsite_online` (
			  `hash` varchar(32) NOT NULL,
			  `ip` varchar(15) NOT NULL,
			  `l_displayname` varchar(64) DEFAULT NULL,
			  `pn_description` varchar(255) DEFAULT NULL,
			  `pn_regid` int(11) unsigned NOT NULL DEFAULT '0',
			  `pn_directory` varchar(64) DEFAULT NULL,
			  `pn_version` varchar(10) DEFAULT NULL,
			  `pn_admin_capable` tinyint(1) NOT NULL DEFAULT '0',
			  `pn_user_capable` tinyint(1) NOT NULL DEFAULT '0',
			  `pn_state` tinyint(1) NOT NULL DEFAULT '0',
			  PRIMARY KEY (`pn_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `openemr_module_vars`;
		CREATE TABLE `openemr_module_vars` (
			  `pn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `pn_modname` varchar(64) DEFAULT NULL,
			  `pn_name` varchar(64) DEFAULT NULL,
			  `pn_value` longtext,
			  PRIMARY KEY (`pn_id`),
			  KEY `pn_modname` (`pn_modname`),
			  KEY `pn_name` (`pn_name`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `openemr_postcalendar_categories`;
		CREATE TABLE `openemr_postcalendar_categories` (
			  `pc_catid` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `pc_constant_id` varchar(255) DEFAULT NULL,
			  `pc_catname` varchar(100) DEFAULT NULL,
			  `pc_catcolor` varchar(50) DEFAULT NULL,
			  `pc_catdesc` text,
			  `pc_recurrtype` int(1) NOT NULL DEFAULT '0',
			  `pc_enddate` date DEFAULT NULL,
			  `pc_recurrspec` text,
			  `pc_recurrfreq` int(3) NOT NULL DEFAULT '0',
			  `pc_duration` bigint(20) NOT NULL DEFAULT '0',
			  `pc_end_date_flag` tinyint(1) NOT NULL DEFAULT '0',
			  `pc_end_date_type` int(2) DEFAULT NULL,
			  `pc_end_date_freq` int(11) NOT NULL DEFAULT '0',
			  `pc_end_all_day` tinyint(1) NOT NULL DEFAULT '0',
			  `pc_dailylimit` int(2) NOT NULL DEFAULT '0',
			  `pc_cattype` int(11) NOT NULL COMMENT 'Used in grouping categories',
			  `pc_active` tinyint(1) NOT NULL DEFAULT '1',
			  `pc_seq` int(11) NOT NULL DEFAULT '0',
			  `aco_spec` varchar(63) NOT NULL DEFAULT 'encounters|notes',
			  PRIMARY KEY (`pc_catid`),
			  UNIQUE KEY `pc_constant_id` (`pc_constant_id`),
			  KEY `basic_cat` (`pc_catname`,`pc_catcolor`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `openemr_postcalendar_events`;
		CREATE TABLE `openemr_postcalendar_events` (
			  `pc_eid` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `pc_catid` int(11) NOT NULL DEFAULT '0',
			  `pc_multiple` int(10) unsigned NOT NULL,
			  `pc_aid` varchar(30) DEFAULT NULL,
			  `pc_pid` varchar(11) DEFAULT NULL,
			  `pc_gid` int(11) DEFAULT '0',
			  `pc_title` varchar(150) DEFAULT NULL,
			  `pc_time` datetime DEFAULT NULL,
			  `pc_hometext` text,
			  `pc_comments` int(11) DEFAULT '0',
			  `pc_counter` mediumint(8) unsigned DEFAULT '0',
			  `pc_topic` int(3) NOT NULL DEFAULT '1',
			  `pc_informant` varchar(20) DEFAULT NULL,
			  `pc_eventDate` date NOT NULL DEFAULT '0000-00-00',
			  `pc_endDate` date NOT NULL DEFAULT '0000-00-00',
			  `pc_duration` bigint(20) NOT NULL DEFAULT '0',
			  `pc_recurrtype` int(1) NOT NULL DEFAULT '0',
			  `pc_recurrspec` text,
			  `pc_recurrfreq` int(3) NOT NULL DEFAULT '0',
			  `pc_startTime` time DEFAULT NULL,
			  `pc_endTime` time DEFAULT NULL,
			  `pc_alldayevent` int(1) NOT NULL DEFAULT '0',
			  `pc_location` text,
			  `pc_conttel` varchar(50) DEFAULT NULL,
			  `pc_contname` varchar(50) DEFAULT NULL,
			  `pc_contemail` varchar(255) DEFAULT NULL,
			  `pc_website` varchar(255) DEFAULT NULL,
			  `pc_fee` varchar(50) DEFAULT NULL,
			  `pc_eventstatus` int(11) NOT NULL DEFAULT '0',
			  `pc_sharing` int(11) NOT NULL DEFAULT '0',
			  `pc_language` varchar(30) DEFAULT NULL,
			  `pc_apptstatus` varchar(15) NOT NULL DEFAULT '-',
			  `pc_prefcatid` int(11) NOT NULL DEFAULT '0',
			  `pc_facility` int(11) NOT NULL DEFAULT '0' COMMENT 'facility id for this event',
			  `pc_sendalertsms` varchar(3) NOT NULL DEFAULT 'NO',
			  `pc_sendalertemail` varchar(3) NOT NULL DEFAULT 'NO',
			  `pc_billing_location` smallint(6) NOT NULL DEFAULT '0',
			  `pc_room` varchar(20) NOT NULL DEFAULT '',
			  PRIMARY KEY (`pc_eid`),
			  KEY `basic_event` (`pc_catid`,`pc_aid`,`pc_eventDate`,`pc_endDate`,`pc_eventstatus`,`pc_sharing`,`pc_topic`),
			  KEY `pc_eventDate` (`pc_eventDate`),
			  KEY `index_pcid` (`pc_pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patch`;
		CREATE TABLE `patch` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `patch_type` varchar(200) NOT NULL,
			  `patch_name` varchar(200) DEFAULT NULL,
			  `patch_uuid` varchar(250) NOT NULL,
			  `patch_status` varchar(255) NOT NULL,
			  `patch_group_id` varchar(250) DEFAULT NULL,
			  `patch_mac` int(11) DEFAULT NULL,
			  `patch_bluetooth` smallint(6) DEFAULT '1',
			  `patch_sensor_id` varchar(250) DEFAULT NULL,
			  `patch_serial` varchar(250) NOT NULL,
			  `tenant_id` varchar(255) NOT NULL,
			  `pid` varchar(255) NOT NULL DEFAULT '0',
			  `date` datetime DEFAULT NULL,
			  `patch_state` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patch_patient_map`;
		CREATE TABLE `patch_patient_map` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `pid` varchar(255) NOT NULL,
			  `patch_uuid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
			  `tenant_id` varchar(255) NOT NULL,
			  `duration` varchar(300) DEFAULT NULL,
			  `date` datetime DEFAULT NULL,
			  `config` json DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_access_offsite`;
		CREATE TABLE `patient_access_offsite` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `pid` bigint(20) NOT NULL,
			  `portal_username` varchar(100) NOT NULL,
			  `portal_pwd` varchar(100) NOT NULL,
			  `portal_pwd_status` tinyint(4) DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
			  `authorize_net_id` varchar(20) DEFAULT NULL COMMENT 'authorize.net profile id',
			  `portal_relation` varchar(100) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  UNIQUE KEY `pid` (`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_access_onsite`;
		CREATE TABLE `patient_access_onsite` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `pid` bigint(20) DEFAULT NULL,
			  `portal_username` varchar(100) DEFAULT NULL,
			  `portal_pwd` varchar(100) DEFAULT NULL,
			  `portal_pwd_status` tinyint(4) DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
			  `portal_salt` varchar(100) DEFAULT NULL,
			  `portal_login_username` varchar(100) DEFAULT NULL COMMENT 'User entered username',
			  `portal_onetime` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_birthday_alert`;
		CREATE TABLE `patient_birthday_alert` (
			  `pid` bigint(20) NOT NULL DEFAULT '0',
			  `user_id` bigint(20) NOT NULL DEFAULT '0',
			  `turned_off_on` date NOT NULL,
			  PRIMARY KEY (`pid`,`user_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_data`;
		CREATE TABLE `patient_data` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `title` varchar(255) DEFAULT '',
			  `language` varchar(255) DEFAULT '',
			  `financial` varchar(255) DEFAULT '',
			  `fname` varchar(255) DEFAULT '',
			  `lname` varchar(255) NOT NULL DEFAULT '',
			  `mname` varchar(255) DEFAULT '',
			  `DOB` date NOT NULL,
			  `street` varchar(255) DEFAULT '',
			  `postal_code` varchar(255) DEFAULT '',
			  `city` varchar(255) DEFAULT '',
			  `state` varchar(255) DEFAULT '',
			  `country_code` varchar(255) DEFAULT '',
			  `idtype` varchar(255) DEFAULT '',
			  `idnumber` varchar(255) DEFAULT '',
			  `occupation` longtext,
			  `phone_home` varchar(255) DEFAULT '',
			  `phone_biz` varchar(255) DEFAULT '',
			  `phone_contact` varchar(255) DEFAULT '',
			  `phone_cell` varchar(255) DEFAULT '',
			  `pharmacy_id` int(11) DEFAULT '0',
			  `status` varchar(255) DEFAULT '',
			  `contact_relationship` varchar(255) DEFAULT '',
			  `admission_date` date DEFAULT NULL,
			  `sex` varchar(255) NOT NULL DEFAULT '',
			  `referrer` varchar(255) DEFAULT '',
			  `referrerID` varchar(255) DEFAULT '',
			  `providerID` int(11) DEFAULT NULL,
			  `ref_providerID` int(11) DEFAULT NULL,
			  `email` varchar(255) DEFAULT '',
			  `email_direct` varchar(255) DEFAULT '',
			  `ethnoracial` varchar(255) DEFAULT '',
			  `race` varchar(255) DEFAULT '',
			  `ethnicity` varchar(255) DEFAULT '',
			  `religion` varchar(40) DEFAULT '',
			  `interpretter` varchar(255) DEFAULT '',
			  `migrantseasonal` varchar(255) DEFAULT '',
			  `family_size` varchar(255) DEFAULT '',
			  `monthly_income` varchar(255) DEFAULT '',
			  `billing_note` text,
			  `homeless` varchar(255) DEFAULT '',
			  `financial_review` datetime DEFAULT NULL,
			  `pubpid` varchar(255) DEFAULT '',
			  `pid` varchar(255) NOT NULL DEFAULT '0',
			  `genericname1` varchar(255) DEFAULT '',
			  `genericval1` varchar(255) DEFAULT '',
			  `genericname2` varchar(255) DEFAULT '',
			  `genericval2` varchar(255) DEFAULT '',
			  `hipaa_mail` varchar(3) DEFAULT '',
			  `hipaa_voice` varchar(3) DEFAULT '',
			  `hipaa_notice` varchar(3) DEFAULT '',
			  `hipaa_message` varchar(20) DEFAULT '',
			  `hipaa_allowsms` varchar(3) DEFAULT 'NO',
			  `hipaa_allowemail` varchar(3) DEFAULT 'NO',
			  `squad` varchar(32) DEFAULT '',
			  `fitness` int(11) DEFAULT '0',
			  `referral_source` varchar(30) DEFAULT '',
			  `usertext1` varchar(255) DEFAULT '',
			  `usertext2` varchar(255) DEFAULT '',
			  `usertext3` varchar(255) DEFAULT '',
			  `usertext4` varchar(255) DEFAULT '',
			  `usertext5` varchar(255) DEFAULT '',
			  `usertext6` varchar(255) DEFAULT '',
			  `usertext7` varchar(255) DEFAULT '',
			  `usertext8` varchar(255) DEFAULT '',
			  `userlist1` varchar(255) DEFAULT '',
			  `userlist2` varchar(255) DEFAULT '',
			  `userlist3` varchar(255) DEFAULT '',
			  `userlist4` varchar(255) DEFAULT '',
			  `userlist5` varchar(255) DEFAULT '',
			  `userlist6` varchar(255) DEFAULT '',
			  `userlist7` varchar(255) DEFAULT '',
			  `pricelevel` varchar(255) DEFAULT 'standard',
			  `regdate` date DEFAULT NULL COMMENT 'Registration Date',
			  `contrastart` date DEFAULT NULL COMMENT 'Date contraceptives initially used',
			  `completed_ad` varchar(3) DEFAULT 'NO',
			  `ad_reviewed` date DEFAULT NULL,
			  `vfc` varchar(255) DEFAULT '',
			  `mothersname` varchar(255) DEFAULT '',
			  `guardiansname` text,
			  `allow_imm_reg_use` varchar(255) DEFAULT '',
			  `allow_imm_info_share` varchar(255) DEFAULT '',
			  `allow_health_info_ex` varchar(255) DEFAULT '',
			  `allow_patient_portal` varchar(31) DEFAULT '',
			  `deceased_date` date DEFAULT NULL,
			  `deceased_reason` varchar(255) DEFAULT '',
			  `soap_import_status` tinyint(4) DEFAULT NULL COMMENT '1-Prescription Press 2-Prescription Import 3-Allergy Press 4-Allergy Import',
			  `cmsportal_login` varchar(60) DEFAULT '',
			  `care_team` int(11) DEFAULT NULL,
			  `county` varchar(40) DEFAULT '',
			  `industry` text,
			  `imm_reg_status` text,
			  `imm_reg_stat_effdate` text,
			  `publicity_code` text,
			  `publ_code_eff_date` text,
			  `protect_indicator` text,
			  `prot_indi_effdate` text,
			  `guardianrelationship` text,
			  `guardiansex` text,
			  `guardianaddress` text,
			  `guardiancity` text,
			  `guardianstate` text,
			  `guardianpostalcode` text,
			  `guardiancountry` text,
			  `guardianphone` text,
			  `guardianworkphone` text,
			  `guardianemail` text,
			  `tenant_id` varchar(255) NOT NULL,
			  `location_uuid` varchar(255) DEFAULT NULL,
			  `bed_uuid` varchar(255) DEFAULT NULL,
			  `med_record` varchar(150) NOT NULL,
			  `vital_uuid` varchar(255) DEFAULT NULL,
			  `date` datetime DEFAULT NULL,
			  `discharge_date` date DEFAULT NULL,
			  UNIQUE KEY `pid` (`pid`),
			  KEY `id` (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_location_table`;
		CREATE TABLE `patient_location_table` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `ChangeDate` date NOT NULL,
			  `current_date` datetime NOT NULL,
			  `location_uuid` varchar(255) CHARACTER SET utf8 NOT NULL,
			  `location_type` varchar(255) CHARACTER SET utf8 NOT NULL,
			  `bed_no` bigint(20) NOT NULL,
			  `pid` varchar(255) CHARACTER SET utf8 NOT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=latin1;


		DROP TABLE IF EXISTS `patient_medication_table`;
		CREATE TABLE `patient_medication_table` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `pid` varchar(255) CHARACTER SET utf8 NOT NULL,
			  `drug` json NOT NULL,
			  `time_given` date NOT NULL,
			  `internal_time` datetime NOT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=latin1;


		DROP TABLE IF EXISTS `patient_portal_menu`;
		CREATE TABLE `patient_portal_menu` (
			  `patient_portal_menu_id` int(11) NOT NULL AUTO_INCREMENT,
			  `patient_portal_menu_group_id` int(11) DEFAULT NULL,
			  `menu_name` varchar(40) DEFAULT NULL,
			  `menu_order` smallint(4) DEFAULT NULL,
			  `menu_status` tinyint(2) DEFAULT '1',
			  PRIMARY KEY (`patient_portal_menu_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_reminders`;
		CREATE TABLE `patient_reminders` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if active and 0 if not active',
			  `date_inactivated` datetime DEFAULT NULL,
			  `reason_inactivated` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_inactive_opt',
			  `due_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_due_opt',
			  `pid` bigint(20) NOT NULL COMMENT 'id from patient_data table',
			  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
			  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
			  `date_created` datetime DEFAULT NULL,
			  `date_sent` datetime DEFAULT NULL,
			  `voice_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
			  `sms_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
			  `email_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
			  `mail_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
			  PRIMARY KEY (`id`),
			  KEY `pid` (`pid`),
			  KEY `category` (`category`,`item`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_tracker`;
		CREATE TABLE `patient_tracker` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `apptdate` date DEFAULT NULL,
			  `appttime` time DEFAULT NULL,
			  `eid` bigint(20) NOT NULL DEFAULT '0',
			  `pid` bigint(20) NOT NULL DEFAULT '0',
			  `original_user` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the user that created the original record',
			  `encounter` bigint(20) NOT NULL DEFAULT '0',
			  `lastseq` varchar(4) NOT NULL DEFAULT '' COMMENT 'The element file should contain this number of elements',
			  `random_drug_test` tinyint(1) DEFAULT NULL COMMENT 'NULL if not randomized. If randomized, 0 is no, 1 is yes',
			  `drug_screen_completed` tinyint(1) NOT NULL DEFAULT '0',
			  PRIMARY KEY (`id`),
			  KEY `eid` (`eid`),
			  KEY `pid` (`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `patient_tracker_element`;
		CREATE TABLE `patient_tracker_element` (
			  `pt_tracker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'maps to id column in patient_tracker table',
			  `start_datetime` datetime DEFAULT NULL,
			  `room` varchar(20) NOT NULL DEFAULT '',
			  `status` varchar(31) NOT NULL DEFAULT '',
			  `seq` varchar(4) NOT NULL DEFAULT '' COMMENT 'This is a numerical sequence for this pt_tracker_id events',
			  `user` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the user that created this element',
			  KEY `pt_tracker_id` (`pt_tracker_id`,`seq`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `payments`;
		CREATE TABLE `payments` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `pid` bigint(20) NOT NULL DEFAULT '0',
			  `dtime` datetime NOT NULL,
			  `encounter` bigint(20) NOT NULL DEFAULT '0',
			  `user` varchar(255) DEFAULT NULL,
			  `method` varchar(255) DEFAULT NULL,
			  `source` varchar(255) DEFAULT NULL,
			  `amount1` decimal(12,2) NOT NULL DEFAULT '0.00',
			  `amount2` decimal(12,2) NOT NULL DEFAULT '0.00',
			  `posted1` decimal(12,2) NOT NULL DEFAULT '0.00',
			  `posted2` decimal(12,2) NOT NULL DEFAULT '0.00',
			  PRIMARY KEY (`id`),
			  KEY `pid` (`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `payment_gateway_details`;
		CREATE TABLE `payment_gateway_details` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `service_name` varchar(100) DEFAULT NULL,
			  `login_id` varchar(255) DEFAULT NULL,
			  `transaction_key` varchar(255) DEFAULT NULL,
			  `md5` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `pharmacies`;
		CREATE TABLE `pharmacies` (
			  `id` int(11) NOT NULL DEFAULT '0',
			  `name` varchar(255) DEFAULT NULL,
			  `transmit_method` int(11) NOT NULL DEFAULT '1',
			  `email` varchar(255) DEFAULT NULL,
			  `ncpdp` int(12) DEFAULT NULL,
			  `npi` int(12) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `phone_numbers`;
		CREATE TABLE `phone_numbers` (
			  `id` int(11) NOT NULL DEFAULT '0',
			  `country_code` varchar(5) DEFAULT NULL,
			  `area_code` char(3) DEFAULT NULL,
			  `prefix` char(3) DEFAULT NULL,
			  `number` varchar(4) DEFAULT NULL,
			  `type` int(11) DEFAULT NULL,
			  `foreign_id` int(11) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  KEY `foreign_id` (`foreign_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `pnotes`;
		CREATE TABLE `pnotes` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `body` longtext,
			  `pid` bigint(20) DEFAULT NULL,
			  `user` varchar(255) DEFAULT NULL,
			  `groupname` varchar(255) DEFAULT NULL,
			  `activity` tinyint(4) DEFAULT NULL,
			  `authorized` tinyint(4) DEFAULT NULL,
			  `title` varchar(255) DEFAULT NULL,
			  `assigned_to` varchar(255) DEFAULT NULL,
			  `deleted` tinyint(4) DEFAULT '0' COMMENT 'flag indicates note is deleted',
			  `message_status` varchar(20) NOT NULL DEFAULT 'New',
			  `portal_relation` varchar(100) DEFAULT NULL,
			  `is_msg_encrypted` tinyint(2) DEFAULT '0' COMMENT 'Whether messsage encrypted 0-Not encrypted, 1-Encrypted',
			  `update_by` bigint(20) DEFAULT NULL,
			  `update_date` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  KEY `pid` (`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `practictioner_patient_map`;
		CREATE TABLE `practictioner_patient_map` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `users_uuid` json DEFAULT NULL,
			  `tenant_id` varchar(255) DEFAULT NULL,
			  `archive` smallint(6) DEFAULT NULL,
			  `primary` smallint(6) DEFAULT NULL,
			  `pid` varchar(255) DEFAULT NULL,
			  `date` datetime DEFAULT NULL,
			  `primary_consultant` json DEFAULT NULL,
			  `secondary_consultant` json DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `prescriptions`;
		CREATE TABLE `prescriptions` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `prescription_uuid` varchar(250) DEFAULT NULL,
			  `filled_by_id` int(11) DEFAULT NULL,
			  `pharmacy_id` int(11) DEFAULT NULL,
			  `date_added` date DEFAULT NULL,
			  `date_modified` date DEFAULT NULL,
			  `provider_id` int(11) DEFAULT NULL,
			  `encounter` int(11) DEFAULT NULL,
			  `drug` json NOT NULL,
			  `drug_uuid` int(11) DEFAULT '0',
			  `rxnorm_drugcode` int(11) DEFAULT NULL,
			  `form` varchar(250) DEFAULT NULL,
			  `dosage` varchar(500) DEFAULT NULL,
			  `quantity` varchar(31) DEFAULT NULL,
			  `size` varchar(25) DEFAULT NULL,
			  `unit` int(11) DEFAULT NULL,
			  `route` int(11) DEFAULT NULL,
			  `interval` int(11) DEFAULT NULL,
			  `substitute` int(11) DEFAULT NULL,
			  `refills` int(11) DEFAULT NULL,
			  `per_refill` int(11) DEFAULT NULL,
			  `filled_date` date DEFAULT NULL,
			  `medication` int(11) DEFAULT NULL,
			  `note_uuid` varchar(255) DEFAULT NULL,
			  `active` int(11) NOT NULL DEFAULT '1',
			  `date` datetime DEFAULT NULL,
			  `prac_uuid` varchar(250) DEFAULT NULL,
			  `site` varchar(50) DEFAULT NULL,
			  `prescriptionguid` varchar(50) DEFAULT NULL,
			  `erx_source` tinyint(4) DEFAULT '0' COMMENT '0-OpenEMR 1-External',
			  `erx_uploaded` tinyint(4) DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded to NewCrop',
			  `drug_info_erx` text,
			  `external_id` varchar(20) DEFAULT NULL,
			  `end_date` date DEFAULT NULL,
			  `indication` text,
			  `prn` varchar(30) DEFAULT NULL,
			  `ntx` int(2) DEFAULT NULL,
			  `rtx` int(2) DEFAULT NULL,
			  `txDate` date NOT NULL,
			  `tenant_uuid` varchar(255) NOT NULL,
			  `pid` varchar(255) NOT NULL,
			  PRIMARY KEY (`id`),
			  KEY `patient_id` (`prescription_uuid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `prices`;
		CREATE TABLE `prices` (
			  `pr_id` varchar(11) NOT NULL DEFAULT '',
			  `pr_selector` varchar(255) NOT NULL DEFAULT '' COMMENT 'template selector for drugs, empty for codes',
			  `pr_level` varchar(31) NOT NULL DEFAULT '',
			  `pr_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'price in local currency',
			  PRIMARY KEY (`pr_id`,`pr_selector`,`pr_level`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_answers`;
		CREATE TABLE `procedure_answers` (
			  `procedure_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_order.procedure_order_id',
			  `procedure_order_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'references procedure_order_code.procedure_order_seq',
			  `question_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'references procedure_questions.question_code',
			  `answer_seq` int(11) NOT NULL COMMENT 'supports multiple-choice questions. answer_seq, incremented in code',
			  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT 'answer data',
			  PRIMARY KEY (`procedure_order_id`,`procedure_order_seq`,`question_code`,`answer_seq`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_order`;
		CREATE TABLE `procedure_order` (
			  `procedure_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `provider_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id, the ordering provider',
			  `patient_id` bigint(20) NOT NULL COMMENT 'references patient_data.pid',
			  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references form_encounter.encounter',
			  `date_collected` datetime DEFAULT NULL COMMENT 'time specimen collected',
			  `date_ordered` date DEFAULT NULL,
			  `order_priority` varchar(31) NOT NULL DEFAULT '',
			  `order_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'pending,routed,complete,canceled',
			  `patient_instructions` text,
			  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 if deleted',
			  `control_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the CONTROL ID that is sent back from lab',
			  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid',
			  `specimen_type` varchar(31) NOT NULL DEFAULT '' COMMENT 'from the Specimen_Type list',
			  `specimen_location` varchar(31) NOT NULL DEFAULT '' COMMENT 'from the Specimen_Location list',
			  `specimen_volume` varchar(30) NOT NULL DEFAULT '' COMMENT 'from a text input field',
			  `date_transmitted` datetime DEFAULT NULL COMMENT 'time of order transmission, null if unsent',
			  `clinical_hx` varchar(255) NOT NULL DEFAULT '' COMMENT 'clinical history text that may be relevant to the order',
			  `external_id` varchar(20) DEFAULT NULL,
			  `history_order` enum('0','1') DEFAULT '0' COMMENT 'references order is added for history purpose only.',
			  `order_diagnosis` varchar(255) DEFAULT '' COMMENT 'primary order diagnosis',
			  PRIMARY KEY (`procedure_order_id`),
			  KEY `datepid` (`date_ordered`,`patient_id`),
			  KEY `patient_id` (`patient_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_order_code`;
		CREATE TABLE `procedure_order_code` (
			  `procedure_order_id` bigint(20) NOT NULL COMMENT 'references procedure_order.procedure_order_id',
			  `procedure_order_seq` int(11) NOT NULL COMMENT 'Supports multiple tests per order. Procedure_order_seq, incremented in code',
			  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'like procedure_type.procedure_code',
			  `procedure_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive name of the procedure code',
			  `procedure_source` char(1) NOT NULL DEFAULT '1' COMMENT '1=original order, 2=added after order sent',
			  `diagnoses` text COMMENT 'diagnoses and maybe other coding (e.g. ICD9:111.11)',
			  `do_not_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = normal, 1 = do not transmit to lab',
			  `procedure_order_title` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`procedure_order_id`,`procedure_order_seq`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_providers`;
		CREATE TABLE `procedure_providers` (
			  `ppid` bigint(20) NOT NULL AUTO_INCREMENT,
			  `name` varchar(255) NOT NULL DEFAULT '',
			  `npi` varchar(15) NOT NULL DEFAULT '',
			  `send_app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sending application ID (MSH-3.1)',
			  `send_fac_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sending facility ID (MSH-4.1)',
			  `recv_app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Receiving application ID (MSH-5.1)',
			  `recv_fac_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Receiving facility ID (MSH-6.1)',
			  `DorP` char(1) NOT NULL DEFAULT 'D' COMMENT 'Debugging or Production (MSH-11)',
			  `direction` char(1) NOT NULL DEFAULT 'B' COMMENT 'Bidirectional or Results-only',
			  `protocol` varchar(15) NOT NULL DEFAULT 'DL',
			  `remote_host` varchar(255) NOT NULL DEFAULT '',
			  `login` varchar(255) NOT NULL DEFAULT '',
			  `password` varchar(255) NOT NULL DEFAULT '',
			  `orders_path` varchar(255) NOT NULL DEFAULT '',
			  `results_path` varchar(255) NOT NULL DEFAULT '',
			  `notes` text,
			  `lab_director` bigint(20) NOT NULL DEFAULT '0',
			  PRIMARY KEY (`ppid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_questions`;
		CREATE TABLE `procedure_questions` (
			  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid to identify the lab',
			  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'references procedure_type.procedure_code to identify this order type',
			  `question_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'code identifying this question',
			  `seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sequence number for ordering',
			  `question_text` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive text for question_code',
			  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = required, 0 = not',
			  `maxsize` int(11) NOT NULL DEFAULT '0' COMMENT 'maximum length if text input field',
			  `fldtype` char(1) NOT NULL DEFAULT 'T' COMMENT 'Text, Number, Select, Multiselect, Date, Gestational-age',
			  `options` text COMMENT 'choices for fldtype S and T',
			  `tips` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional instructions for answering the question',
			  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
			  PRIMARY KEY (`lab_id`,`procedure_code`,`question_code`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_report`;
		CREATE TABLE `procedure_report` (
			  `procedure_report_id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `procedure_order_id` bigint(20) DEFAULT NULL COMMENT 'references procedure_order.procedure_order_id',
			  `procedure_order_seq` int(11) NOT NULL DEFAULT '1' COMMENT 'references procedure_order_code.procedure_order_seq',
			  `date_collected` datetime DEFAULT NULL,
			  `date_collected_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC',
			  `date_report` datetime DEFAULT NULL,
			  `date_report_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC',
			  `source` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id, who entered this data',
			  `specimen_num` varchar(63) NOT NULL DEFAULT '',
			  `report_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'received,complete,error',
			  `review_status` varchar(31) NOT NULL DEFAULT 'received' COMMENT 'pending review status: received,reviewed',
			  `report_notes` text COMMENT 'notes from the lab',
			  PRIMARY KEY (`procedure_report_id`),
			  KEY `procedure_order_id` (`procedure_order_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_result`;
		CREATE TABLE `procedure_result` (
			  `procedure_result_id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `procedure_report_id` bigint(20) NOT NULL COMMENT 'references procedure_report.procedure_report_id',
			  `result_data_type` char(1) NOT NULL DEFAULT 'S' COMMENT 'N=Numeric, S=String, F=Formatted, E=External, L=Long text as first line of comments',
			  `result_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'LOINC code, might match a procedure_type.procedure_code',
			  `result_text` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description of result_code',
			  `date` datetime DEFAULT NULL COMMENT 'lab-provided date specific to this result',
			  `facility` varchar(255) NOT NULL DEFAULT '' COMMENT 'lab-provided testing facility ID',
			  `units` varchar(31) NOT NULL DEFAULT '',
			  `result` varchar(255) NOT NULL DEFAULT '',
			  `range` varchar(255) NOT NULL DEFAULT '',
			  `abnormal` varchar(31) NOT NULL DEFAULT '' COMMENT 'no,yes,high,low',
			  `comments` text COMMENT 'comments from the lab',
			  `document_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references documents.id if this result is a document',
			  `result_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'preliminary, cannot be done, final, corrected, incomplete...etc.',
			  PRIMARY KEY (`procedure_result_id`),
			  KEY `procedure_report_id` (`procedure_report_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `procedure_type`;
		CREATE TABLE `procedure_type` (
			  `procedure_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `parent` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_type.procedure_type_id',
			  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'name for this category, procedure or result type',
			  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid, 0 means default to parent',
			  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'code identifying this procedure',
			  `procedure_type` varchar(31) NOT NULL DEFAULT '' COMMENT 'see list proc_type',
			  `body_site` varchar(31) NOT NULL DEFAULT '' COMMENT 'where to do injection, e.g. arm, buttock',
			  `specimen` varchar(31) NOT NULL DEFAULT '' COMMENT 'blood, urine, saliva, etc.',
			  `route_admin` varchar(31) NOT NULL DEFAULT '' COMMENT 'oral, injection',
			  `laterality` varchar(31) NOT NULL DEFAULT '' COMMENT 'left, right, ...',
			  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive text for procedure_code',
			  `standard_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'industry standard code type and code (e.g. CPT4:12345)',
			  `related_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'suggested code(s) for followup services if result is abnormal',
			  `units` varchar(31) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.units',
			  `range` varchar(255) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.range',
			  `seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sequence number for ordering',
			  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
			  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT 'additional notes to enhance description',
			  PRIMARY KEY (`procedure_type_id`),
			  KEY `parent` (`parent`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `product_registration`;
		CREATE TABLE `product_registration` (
			  `registration_id` char(36) NOT NULL DEFAULT '',
			  `email` varchar(255) DEFAULT NULL,
			  `opt_out` tinyint(1) DEFAULT NULL,
			  PRIMARY KEY (`registration_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `product_warehouse`;
		CREATE TABLE `product_warehouse` (
			  `pw_drug_id` int(11) NOT NULL,
			  `pw_warehouse` varchar(31) NOT NULL,
			  `pw_min_level` float DEFAULT '0',
			  `pw_max_level` float DEFAULT '0',
			  PRIMARY KEY (`pw_drug_id`,`pw_warehouse`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `registry`;
		CREATE TABLE `registry` (
			  `name` varchar(255) DEFAULT NULL,
			  `state` tinyint(4) DEFAULT NULL,
			  `directory` varchar(255) DEFAULT NULL,
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `sql_run` tinyint(4) DEFAULT NULL,
			  `unpackaged` tinyint(4) DEFAULT NULL,
			  `date` datetime DEFAULT NULL,
			  `priority` int(11) DEFAULT '0',
			  `category` varchar(255) DEFAULT NULL,
			  `nickname` varchar(255) DEFAULT NULL,
			  `patient_encounter` tinyint(4) NOT NULL DEFAULT '1',
			  `therapy_group_encounter` tinyint(4) NOT NULL DEFAULT '0',
			  `aco_spec` varchar(63) NOT NULL DEFAULT 'encounters|notes',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `report_itemized`;
		CREATE TABLE `report_itemized` (
			  `report_id` bigint(20) NOT NULL,
			  `itemized_test_id` smallint(6) NOT NULL,
			  `numerator_label` varchar(25) NOT NULL DEFAULT '' COMMENT 'Only used in special cases',
			  `pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is fail, 1 is pass, 2 is excluded',
			  `pid` bigint(20) NOT NULL,
			  KEY `report_id` (`report_id`,`itemized_test_id`,`numerator_label`,`pass`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `report_results`;
		CREATE TABLE `report_results` (
			  `report_id` bigint(20) NOT NULL,
			  `field_id` varchar(31) NOT NULL DEFAULT '',
			  `field_value` text,
			  PRIMARY KEY (`report_id`,`field_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `role`;
		CREATE TABLE `role` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `title` varchar(100) NOT NULL,
			  `role_uuid` varchar(250) NOT NULL,
			  `description` tinytext,
			  `active` tinyint(2) NOT NULL DEFAULT '0',
			  `createdAt` datetime NOT NULL,
			  `updatedAt` datetime DEFAULT NULL,
			  `content` text,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_action`;
		CREATE TABLE `rule_action` (
			  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
			  `group_id` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Contains group id to identify collection of targets in a rule',
			  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
			  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
			  KEY `id` (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_action_item`;
		CREATE TABLE `rule_action_item` (
			  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action_category',
			  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action',
			  `clin_rem_link` varchar(255) NOT NULL DEFAULT '' COMMENT 'Custom html link in clinical reminder widget',
			  `reminder_message` text COMMENT 'Custom message in patient reminder',
			  `custom_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 indexed to rule_patient_data, 0 indexed within main schema',
			  PRIMARY KEY (`category`,`item`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_filter`;
		CREATE TABLE `rule_filter` (
			  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
			  `include_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is exclude and 1 is include',
			  `required_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is required and 1 is optional',
			  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_filters',
			  `method_detail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options lists rule__intervals',
			  `value` varchar(255) NOT NULL DEFAULT '',
			  KEY `id` (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_patient_data`;
		CREATE TABLE `rule_patient_data` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `pid` bigint(20) NOT NULL,
			  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
			  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
			  `complete` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list yesno',
			  `result` varchar(255) NOT NULL DEFAULT '',
			  PRIMARY KEY (`id`),
			  KEY `pid` (`pid`),
			  KEY `category` (`category`,`item`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_reminder`;
		CREATE TABLE `rule_reminder` (
			  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
			  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_methods',
			  `method_detail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_intervals',
			  `value` varchar(255) NOT NULL DEFAULT '',
			  KEY `id` (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `rule_target`;
		CREATE TABLE `rule_target` (
			  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
			  `group_id` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Contains group id to identify collection of targets in a rule',
			  `include_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is exclude and 1 is include',
			  `required_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is required and 1 is optional',
			  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_targets',
			  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Data is dependent on the method',
			  `interval` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Only used in interval entries',
			  KEY `id` (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `sequences`;
		CREATE TABLE `sequences` (
			  `id` int(11) unsigned NOT NULL DEFAULT '0'
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `shared_attributes`;
		CREATE TABLE `shared_attributes` (
			  `pid` bigint(20) NOT NULL,
			  `encounter` bigint(20) NOT NULL COMMENT '0 if patient attribute, else encounter attribute',
			  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
			  `last_update` datetime NOT NULL COMMENT 'time of last update',
			  `user_id` bigint(20) NOT NULL COMMENT 'user who last updated',
			  `field_value` text,
			  PRIMARY KEY (`pid`,`encounter`,`field_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `standardized_tables_track`;
		CREATE TABLE `standardized_tables_track` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `imported_date` datetime DEFAULT NULL,
			  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'name of standardized tables such as RXNORM',
			  `revision_version` varchar(255) NOT NULL DEFAULT '' COMMENT 'revision of standardized tables that were imported',
			  `revision_date` datetime DEFAULT NULL COMMENT 'revision of standardized tables that were imported',
			  `file_checksum` varchar(32) NOT NULL DEFAULT '',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `supported_external_dataloads`;
		CREATE TABLE `supported_external_dataloads` (
			  `load_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
			  `load_type` varchar(24) NOT NULL DEFAULT '',
			  `load_source` varchar(24) NOT NULL DEFAULT 'CMS',
			  `load_release_date` date NOT NULL,
			  `load_filename` varchar(256) NOT NULL DEFAULT '',
			  `load_checksum` varchar(32) NOT NULL DEFAULT '',
			  UNIQUE KEY `load_id` (`load_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `syndromic_surveillance`;
		CREATE TABLE `syndromic_surveillance` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `lists_id` bigint(20) NOT NULL,
			  `submission_date` datetime NOT NULL,
			  `filename` varchar(255) NOT NULL DEFAULT '',
			  PRIMARY KEY (`id`),
			  KEY `lists_id` (`lists_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `template_users`;
		CREATE TABLE `template_users` (
			  `tu_id` int(11) NOT NULL AUTO_INCREMENT,
			  `tu_user_id` int(11) DEFAULT NULL,
			  `tu_facility_id` int(11) DEFAULT NULL,
			  `tu_template_id` int(11) DEFAULT NULL,
			  `tu_template_order` int(11) DEFAULT NULL,
			  PRIMARY KEY (`tu_id`),
			  UNIQUE KEY `templateuser` (`tu_user_id`,`tu_template_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `tenant`;
		CREATE TABLE `tenant` (
			  `id` bigint(25) NOT NULL AUTO_INCREMENT,
			  `tenant_name` varchar(500) NOT NULL,
			  `tenant_uuid` varchar(256) NOT NULL,
			  `date` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `therapy_groups`;
		CREATE TABLE `therapy_groups` (
			  `group_id` int(11) NOT NULL AUTO_INCREMENT,
			  `group_name` varchar(255) NOT NULL,
			  `group_start_date` date NOT NULL,
			  `group_end_date` date DEFAULT NULL,
			  `group_type` tinyint(4) NOT NULL,
			  `group_participation` tinyint(4) NOT NULL,
			  `group_status` int(11) NOT NULL,
			  `group_notes` text,
			  `group_guest_counselors` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`group_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `therapy_groups_counselors`;
		CREATE TABLE `therapy_groups_counselors` (
			  `group_id` int(11) NOT NULL,
			  `user_id` int(11) NOT NULL,
			  PRIMARY KEY (`group_id`,`user_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `therapy_groups_participants`;
		CREATE TABLE `therapy_groups_participants` (
			  `group_id` int(11) NOT NULL,
			  `pid` bigint(20) NOT NULL,
			  `group_patient_status` int(11) NOT NULL,
			  `group_patient_start` date NOT NULL,
			  `group_patient_end` date DEFAULT NULL,
			  `group_patient_comment` text,
			  PRIMARY KEY (`group_id`,`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `therapy_groups_participant_attendance`;
		CREATE TABLE `therapy_groups_participant_attendance` (
			  `form_id` int(11) NOT NULL,
			  `pid` bigint(20) NOT NULL,
			  `meeting_patient_comment` text,
			  `meeting_patient_status` varchar(15) DEFAULT NULL,
			  PRIMARY KEY (`form_id`,`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `transactions`;
		CREATE TABLE `transactions` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `date` datetime DEFAULT NULL,
			  `title` varchar(255) NOT NULL DEFAULT '',
			  `pid` bigint(20) DEFAULT NULL,
			  `user` varchar(255) NOT NULL DEFAULT '',
			  `groupname` varchar(255) NOT NULL DEFAULT '',
			  `authorized` tinyint(4) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  KEY `pid` (`pid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `users`;
		CREATE TABLE `users` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `username` varchar(255) DEFAULT NULL,
			  `password` longtext,
			  `authorized` tinyint(4) DEFAULT NULL,
			  `info` longtext,
			  `source` tinyint(4) DEFAULT NULL,
			  `fname` varchar(255) DEFAULT NULL,
			  `mname` varchar(255) DEFAULT NULL,
			  `lname` varchar(255) DEFAULT NULL,
			  `suffix` varchar(255) DEFAULT NULL,
			  `federaltaxid` varchar(255) DEFAULT NULL,
			  `federaldrugid` varchar(255) DEFAULT NULL,
			  `upin` varchar(255) DEFAULT NULL,
			  `facility` varchar(255) DEFAULT NULL,
			  `facility_id` int(11) NOT NULL DEFAULT '0',
			  `see_auth` int(11) NOT NULL DEFAULT '1',
			  `active` tinyint(1) NOT NULL DEFAULT '1',
			  `npi` varchar(15) DEFAULT NULL,
			  `title` varchar(30) DEFAULT NULL,
			  `specialty` varchar(255) DEFAULT NULL,
			  `billname` varchar(255) DEFAULT NULL,
			  `email` varchar(255) DEFAULT NULL,
			  `email_direct` varchar(255) NOT NULL DEFAULT '',
			  `url` varchar(255) DEFAULT NULL,
			  `assistant` varchar(255) DEFAULT NULL,
			  `organization` varchar(255) DEFAULT NULL,
			  `valedictory` varchar(255) DEFAULT NULL,
			  `street` varchar(60) DEFAULT NULL,
			  `streetb` varchar(60) DEFAULT NULL,
			  `city` varchar(30) DEFAULT NULL,
			  `state` varchar(30) DEFAULT NULL,
			  `zip` varchar(20) DEFAULT NULL,
			  `street2` varchar(60) DEFAULT NULL,
			  `streetb2` varchar(60) DEFAULT NULL,
			  `city2` varchar(30) DEFAULT NULL,
			  `state2` varchar(30) DEFAULT NULL,
			  `zip2` varchar(20) DEFAULT NULL,
			  `phone` varchar(30) DEFAULT NULL,
			  `fax` varchar(30) DEFAULT NULL,
			  `phonew1` varchar(30) DEFAULT NULL,
			  `phonew2` varchar(30) DEFAULT NULL,
			  `phonecell` varchar(30) DEFAULT NULL,
			  `notes` text,
			  `cal_ui` tinyint(4) NOT NULL DEFAULT '1',
			  `taxonomy` varchar(30) NOT NULL DEFAULT '207Q00000X',
			  `calendar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = appears in calendar',
			  `abook_type` varchar(31) NOT NULL DEFAULT '',
			  `pwd_expiration_date` date DEFAULT NULL,
			  `pwd_history1` longtext,
			  `pwd_history2` longtext,
			  `default_warehouse` varchar(31) NOT NULL DEFAULT '',
			  `irnpool` varchar(31) NOT NULL DEFAULT '',
			  `state_license_number` varchar(25) DEFAULT NULL,
			  `weno_prov_id` varchar(15) DEFAULT NULL,
			  `newcrop_user_role` varchar(30) DEFAULT NULL,
			  `cpoe` tinyint(1) DEFAULT NULL,
			  `physician_type` varchar(50) DEFAULT NULL,
			  `main_menu_role` varchar(50) NOT NULL DEFAULT 'standard',
			  `patient_menu_role` varchar(50) NOT NULL DEFAULT 'standard',
			  `tenant_id` varchar(255) NOT NULL,
			  `role` varchar(255) NOT NULL,
			  `user_uuid` varchar(255) NOT NULL,
			  `date` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `users_facility`;
		CREATE TABLE `users_facility` (
			  `tablename` varchar(64) NOT NULL,
			  `table_id` int(11) NOT NULL,
			  `facility_id` int(11) NOT NULL,
			  PRIMARY KEY (`tablename`,`table_id`,`facility_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='joins users or patient_data to facility table';


		DROP TABLE IF EXISTS `users_secure`;
		CREATE TABLE `users_secure` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `username` varchar(255) DEFAULT NULL,
			  `password` varchar(255) DEFAULT NULL,
			  `salt` varchar(255) DEFAULT NULL,
			  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  `password_history1` varchar(255) DEFAULT NULL,
			  `salt_history1` varchar(255) DEFAULT NULL,
			  `password_history2` varchar(255) DEFAULT NULL,
			  `salt_history2` varchar(255) DEFAULT NULL,
			  `last_challenge_response` datetime DEFAULT NULL,
			  `login_work_area` text,
			  `login_fail_counter` int(11) DEFAULT '0',
			  `email` varchar(255) DEFAULT NULL,
			  `role` varchar(255) DEFAULT NULL,
			  `tenant` varchar(255) DEFAULT NULL,
			  `fname` varchar(255) DEFAULT NULL,
			  `lname` varchar(255) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  UNIQUE KEY `USERNAME_ID` (`id`,`username`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `user_patient_map`;
		CREATE TABLE `user_patient_map` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `user_uuid` varchar(255) NOT NULL,
			  `patient_uuid` varchar(255) NOT NULL,
			  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  `active` tinyint(4) NOT NULL,
			  `archive` smallint(6) NOT NULL,
			  `role` varchar(255) NOT NULL,
			  `pid` varchar(255) NOT NULL,
			  `date` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `user_settings`;
		CREATE TABLE `user_settings` (
			  `setting_user` bigint(20) NOT NULL DEFAULT '0',
			  `setting_label` varchar(100) NOT NULL,
			  `setting_value` varchar(255) NOT NULL DEFAULT '',
			  PRIMARY KEY (`setting_user`,`setting_label`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `uuid`;
		CREATE TABLE `uuid` (
			  `uuid` varchar(400) NOT NULL COMMENT 'with the uuidType',
			  `tenant_uuid` varchar(255) NOT NULL,
			  PRIMARY KEY (`uuid`,`tenant_uuid`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `valueset`;
		CREATE TABLE `valueset` (
			  `nqf_code` varchar(255) NOT NULL DEFAULT '',
			  `code` varchar(255) NOT NULL DEFAULT '',
			  `code_system` varchar(255) NOT NULL DEFAULT '',
			  `code_type` varchar(255) DEFAULT NULL,
			  `valueset` varchar(255) NOT NULL DEFAULT '',
			  `description` varchar(255) DEFAULT NULL,
			  `valueset_name` varchar(500) DEFAULT NULL,
			  PRIMARY KEY (`nqf_code`,`code`,`valueset`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `version`;
		CREATE TABLE `version` (
			  `v_major` int(11) NOT NULL DEFAULT '0',
			  `v_minor` int(11) NOT NULL DEFAULT '0',
			  `v_patch` int(11) NOT NULL DEFAULT '0',
			  `v_realpatch` int(11) NOT NULL DEFAULT '0',
			  `v_tag` varchar(31) NOT NULL DEFAULT '',
			  `v_database` int(11) NOT NULL DEFAULT '0',
			  `v_acl` int(11) NOT NULL DEFAULT '0'
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `vital_threshold`;
		CREATE TABLE `vital_threshold` (
			  `id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `pid` varchar(255) NOT NULL,
			  `min_temp` float(5,2) DEFAULT NULL,
			  `max_temp` float(5,2) DEFAULT NULL,
			  `min_hr` float(5,2) DEFAULT NULL,
			  `max_hr` float(5,2) DEFAULT NULL,
			  `min_rr` float(5,2) DEFAULT NULL,
			  `max_rr` float(5,2) DEFAULT NULL,
			  `min_spo2` float(5,2) DEFAULT NULL,
			  `max_spo2` float(5,2) DEFAULT NULL,
			  `tenant_uuid` varchar(255) NOT NULL,
			  `createdAt` datetime NOT NULL,
			  `updatedAt` datetime NOT NULL,
			  `weight_min` varchar(20) DEFAULT NULL,
			  `weight_max` varchar(20) DEFAULT NULL,
			  `bps_min` varchar(20) DEFAULT NULL,
			  `bps_max` varchar(20) DEFAULT NULL,
			  `bpd_min` varchar(20) DEFAULT NULL,
			  `bpd_max` varchar(20) DEFAULT NULL,
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `voids`;
		CREATE TABLE `voids` (
			  `void_id` bigint(20) NOT NULL AUTO_INCREMENT,
			  `patient_id` bigint(20) NOT NULL COMMENT 'references patient_data.pid',
			  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references form_encounter.encounter',
			  `what_voided` varchar(31) NOT NULL COMMENT 'checkout,receipt and maybe other options later',
			  `date_original` datetime DEFAULT NULL COMMENT 'time of original action that is now voided',
			  `date_voided` datetime NOT NULL COMMENT 'time of void action',
			  `user_id` bigint(20) NOT NULL COMMENT 'references users.id',
			  `amount1` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'for checkout,receipt total voided adjustments',
			  `amount2` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'for checkout,receipt total voided payments',
			  `other_info` text COMMENT 'for checkout,receipt the old invoice refno',
			  PRIMARY KEY (`void_id`),
			  KEY `datevoided` (`date_voided`),
			  KEY `pidenc` (`patient_id`,`encounter_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


		DROP TABLE IF EXISTS `x12_partners`;
		CREATE TABLE `x12_partners` (
			  `id` int(11) NOT NULL DEFAULT '0',
			  `name` varchar(255) DEFAULT NULL,
			  `id_number` varchar(255) DEFAULT NULL,
			  `x12_sender_id` varchar(255) DEFAULT NULL,
			  `x12_receiver_id` varchar(255) DEFAULT NULL,
			  `processing_format` enum('standard','medi-cal','cms','proxymed','oa_eligibility','availity_eligibility') DEFAULT NULL,
			  `x12_isa01` varchar(2) NOT NULL DEFAULT '00' COMMENT 'User logon Required Indicator',
			  `x12_isa02` varchar(10) NOT NULL DEFAULT '          ' COMMENT 'User Logon',
			  `x12_isa03` varchar(2) NOT NULL DEFAULT '00' COMMENT 'User password required Indicator',
			  `x12_isa04` varchar(10) NOT NULL DEFAULT '          ' COMMENT 'User Password',
			  `x12_isa05` char(2) NOT NULL DEFAULT 'ZZ',
			  `x12_isa07` char(2) NOT NULL DEFAULT 'ZZ',
			  `x12_isa14` char(1) NOT NULL DEFAULT '0',
			  `x12_isa15` char(1) NOT NULL DEFAULT 'P',
			  `x12_gs02` varchar(15) NOT NULL DEFAULT '',
			  `x12_per06` varchar(80) NOT NULL DEFAULT '',
			  `x12_dtp03` char(1) NOT NULL DEFAULT 'A',
			  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;



