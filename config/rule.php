<?php
/*
|--------------------------------------------------------------------------
| Common Validation Rules
|--------------------------------------------------------------------------
|
| Use the same validation rule both in creating and updating.
|
*/
const STR_REQUIRED = 'required|';
const ARR_REQUIRED = 'required';
const ID = 'required|integer';
const USERNAME = 'alpha_dash|min:6|max:30';
const EMAIL = 'email|min:6|max:30';
const PASSWORD = 'min:6|max:20';
const IMAGE = 'mimes:png,gif,jpeg,jpg';
const ROLES = 'required';
const HUMAN_NAME = 'min:2|max:20';
const ICON = 'min:0|max:50';
const URI = 'min:0|max:255';
const SORT = 'regex:/^[0-9]{0,10}$/';
const ZERO_AND_ONE = 'regex:/^[01]$/';
const CLASSICAL_VARCHAR_LENGTH = 'min:1|max:255';
const NUMERIC = 'numeric';
const INTEGER = 'integer';
const MORE_THAN_ZERO = 'min:1';
const EN_NAME = 'min:2|max:64';
const VOICE = ['regex:/^[0-9]{0,3}\|[0-9]{3,4}\|[0-9]{6,8}$|[0-9]{0,3}\|[0-9]{3,5}\|[0-9]{6,8}\|[0-9]{1,4}$/'];
const MOBILE = ['regex:/^[0-9]{0,3}\|1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$/'];
const EN_COUNTRY = 'string|min:1|max:64';
const CN_PROVINCE = 'string|min:1|max:64';
const EN_PROVINCE = 'string|min:1|max:64';
const CN_CITY = 'string|min:1|max:64';
const EN_CITY = 'string|min:1|max:64';
const CN_STREET = 'string|min:1|max:64';
const EN_STREET = 'string|min:1|max:400';
const CN_ORG = 'string|min:2|max:64';
const EN_ORG = 'string|min:2|max:64';
const UPSTREAM_DOMAIN_STATUS = ['regex:/^\b(ok|clientDeleteProhibited|clientHold|clientRenewProhibited|clientTransferProhibited|clientUpdateProhibited|serverHold)\b(\,\b(ok|clientDeleteProhibited|clientHold|clientRenewProhibited|clientTransferProhibited|clientUpdateProhibited|serverHold)\b)*$/'];
const DOMAIN_PASSWORD = 'regex:/^(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{10,16}$/';
const DNS = 'regex:/^[A-z0-9]+((\.)[A-z0-9]+)+(\,[A-z0-9]+((\.)[A-z0-9]+)+)*$/';
const DOMAIN = 'regex:/^[\x{4e00}-\x{9fa5}A-z0-9\-]+\.[\x{4e00}-\x{9fa5}A-z0-9]+(\.[\x{4e00}-\x{9fa5}A-z0-9]+)*$/u';
const UPSTREAM_CONTACT_ID = 'min:16|max:16';
const PC = 'max:6';
const ADDRESS_ID = 'integer';
const LIMIT = 'integer|min:0|max:100';
const OFFSET = 'integer|min:0';
const ORDER = 'regex:/^[0-1](\,[0-1])*$/';
const ANALYSIS_RECORD_TYPE = 'in:A,AAAA,CNAME,MX,NS,SRV,TXT,显性URL,隐性URL';
const ANALYSIS_RECORD_TTL = 'integer|min:600|max:604800';
const ANALYSIS_RECORD_MX = 'integer|min:1|max:20';
const YEAR_MONTH_DAY = 'regex:/^\d{4}-\d{2}-\d{2}$/';
const YEAR_MONTH_DAY_HOUR_MINUTE_SECOND = 'regex:/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/';
const IDS = 'regex:/^\d+(?:,\d+)*$/';
return [
    'api-auth' => [
        'agent' => [
            'api-key' => 'required|exists:agent,apiKey',
            'timestamp' => 'required|regex:/^[0-9]{10}$/',
            'signature' => 'required|alpha_num|size:40',
        ],
    ],
    'api'=>[
        'postmsg'=>[
            'template_code' => 'required|min:4|max:20',
            'mobile' => 'required|regex:/^(1[3-9]{1}\d{9})*(1[3-9]{1}\d{9},)*$/',
            'sign_name' => STR_REQUIRED,
            'params' => STR_REQUIRED,
            'request_id' => 'required|size:40',
        ],
        'getmsg'=>[
            'request_id' => STR_REQUIRED
        ],
        'template'=>[
            'search_content' => 'string|min:0|max:120',
            'sms_type' => 'string|min:1|max:20',
            'limit' => 'numeric|min:1|max:50',
            'offset' => 'numeric|min:1|max:20',
        ]
    ],
    'staff' => [
        'creation' => [
            'username' => STR_REQUIRED . USERNAME . '|unique:staff,username,',
            'email' => STR_REQUIRED . EMAIL . '|unique:staff,email,',
            'password' => STR_REQUIRED . PASSWORD,
            'name' => STR_REQUIRED . HUMAN_NAME,
            'roles' => ROLES,
        ],
        'update' => [
            'id' => ID,
            'username' => STR_REQUIRED . USERNAME . '|unique:staff,username,',
            'email' => STR_REQUIRED . EMAIL . '|unique:staff,email,',
            'password' => PASSWORD,
            'name' => STR_REQUIRED . HUMAN_NAME,
            'roles' => ROLES,
        ],
        'avatar' => [
            'id' => ID,
            'file' => STR_REQUIRED . IMAGE
        ],
        'password' => [
            'old_password' => STR_REQUIRED . PASSWORD,
            'new_password' => STR_REQUIRED . PASSWORD
        ],
        'id' => [
            'id' => ID
        ],
        'login' => [
            'username' => 'required|max:50',
            'password' => 'required|min:6',
        ],
        'we-chat-staff' => [
            'userId' => 'required|alpha_dash'
        ]
    ],
    'agent' => [
        'creation' => [
            'user_name'=>'required|alpha_num|min:4|max:30',
            'password' => PASSWORD,
            'secretKey'=>PASSWORD,
            'cn_name'=>STR_REQUIRED . HUMAN_NAME,
            'mobile'=>'regex:/^1[3-9]{1}\d{9}$/',
            'email'=>STR_REQUIRED . EMAIL,
            'mobile_channel'=>STR_REQUIRED . NUMERIC,
            'telecom_channel'=>STR_REQUIRED . NUMERIC,
            'unicom_channel'=>STR_REQUIRED . NUMERIC,
        ],
        'update' => [
            'user_name'=>'required|alpha_num|min:4|max:30',
            'password' => PASSWORD,
            'secretKey'=>PASSWORD,
            'cn_name'=>STR_REQUIRED . HUMAN_NAME,
            'mobile'=>'regex:/^1[3-9]{1}\d{9}$/',
            'email'=>STR_REQUIRED . EMAIL,
            'mobile_channel'=>STR_REQUIRED . NUMERIC,
            'telecom_channel'=>STR_REQUIRED . NUMERIC,
            'unicom_channel'=>STR_REQUIRED . NUMERIC,
            'ip_list' => STR_REQUIRED
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'role' => [
        'creation' => [
            'name' => 'required|alpha_dash|max:30|unique:role',
            'display_name' => 'required|min:6|max:30',
        ],
        'update' => [
            'name' => 'required|alpha_dash|max:30|unique:role,name,',
            'display_name' => 'required|min:6|max:30',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'permission' => [
        'creation' => [
            'parent' => CLASSICAL_VARCHAR_LENGTH,
            'display_name' => 'min:0|max:30',
            'icon' => ICON,
            'uri' => STR_REQUIRED . URI,
            'action' => STR_REQUIRED . CLASSICAL_VARCHAR_LENGTH . '|unique:permission',
            'is_menu' => STR_REQUIRED . ZERO_AND_ONE,
            'sort' => STR_REQUIRED . SORT,
            'description' => CLASSICAL_VARCHAR_LENGTH,
        ],
        'update' => [
            'parent' => CLASSICAL_VARCHAR_LENGTH,
            'display_name' => 'min:0|max:30',
            'icon' => ICON,
            'uri' => STR_REQUIRED . URI,
            'action' => STR_REQUIRED . CLASSICAL_VARCHAR_LENGTH . '|unique:permission,action,',
            'is_menu' => STR_REQUIRED . ZERO_AND_ONE,
            'sort' => STR_REQUIRED . SORT,
            'description' => CLASSICAL_VARCHAR_LENGTH,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'task' => [
        'creation' => [
            'name' => 'required|alpha_num|min:4|max:30',
            'keyword' => 'required|unique:task|max:50',
            'enable' => STR_REQUIRED . ZERO_AND_ONE,
            'cron' => 'required|min:6|max:30',
        ],
        'update' => [
            'name' => 'required|alpha_num|min:4|max:30',
            'keyword' => 'required|max:50|unique:task,keyword,',
            'enable' => STR_REQUIRED . ZERO_AND_ONE,
            'cron' => 'required|min:6|max:30',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'product_node' => [
        'creation' => [
            'keyword' => 'required|max:30|unique:product_node',
            'name' => 'required|max:50',
            'type' => 'required',
            'default_upstream_id' => 'required',
            'default_transfer_upstream_id' => 'required',
        ],
        'update' => [
            'type' => 'required',
            'default_upstream_id' => 'required',
            'default_transfer_upstream_id' => 'required',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'limit_of_product_count_for_node' => [
        'creation' => [
            'total_count' => 'required|numeric',
            'product_node_id' => 'required|numeric',
            'upstream_id' => 'required|numeric',
            'start_time' => 'required|date_format:Y-m-d H:i:s',
            'end_time' => 'required|date_format:Y-m-d H:i:s',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'limit_of_product_count_for_agent' => [
        'creation' => [
            'limit_of_product_count_for_node_id' => 'required|min:1',
            'agent_id' => 'required|numeric',
            'total_count' => 'required|numeric',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'product_log' => [
        'id' => [
            'id' => STR_REQUIRED
        ]
    ],
    'registry-plugin' => [
        'id' => [
            'id' => STR_REQUIRED
        ]
    ],
    'validate_server' => [
        'creation' => [
            'validate_server_name' => STR_REQUIRED . 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'keyword' => STR_REQUIRED . 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'internal_upstream_id' => STR_REQUIRED . INTEGER,
            'icann_id' => 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'realname_upload_type' => STR_REQUIRED . INTEGER . '|in:0,1,2'
        ],
        'update' => [
            'id' => ID,
            'validate_server_name' => 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'keyword' => 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'internal_upstream_id' => INTEGER,
            'icann_id' => 'string|' . CLASSICAL_VARCHAR_LENGTH,
            'realname_upload_type' => INTEGER
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'dictionary' => [
        'creation' => [
            'keyword' => 'required|max:50|unique:dictionary',
            'name' => 'required|max:100',
            'status' => STR_REQUIRED . ZERO_AND_ONE
        ],
        'update' => [
            'keyword' => 'required|max:50|unique:dictionary,keyword,',
            'name' => 'required|max:100',
            'status' => STR_REQUIRED . ZERO_AND_ONE
        ],
        'id' => [
            'id' => INTEGER . '|' . MORE_THAN_ZERO,
            'parent_id' => INTEGER . '|' . MORE_THAN_ZERO
        ]
    ],
    'product' => [
        // for api
        'creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'period' => STR_REQUIRED . INTEGER . '|min:1|max:10',
            'contact_template_id' => STR_REQUIRED . INTEGER,
            'dns' => 'string',
            'fee' => NUMERIC
        ],
        'update' => [
            'status' => 'required|in:0,1,2,3',
            'created_at' => 'required|date_format:Y-m-d H:i:s',
            'expire_at' => 'required|date_format:Y-m-d H:i:s',
            'upstream_id' => 'required|exists:upstream,id',
            'product_type_id' => 'required|exists:dictionary,id'
        ],
        'dns-api' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'dns' => STR_REQUIRED . DNS
        ],
        'status-api' => [
            'keyword' => STR_REQUIRED . DOMAIN,
        ],
        'id' => [
            'id' => ID
        ],
        'update-contact' => [
            'cn_name' => STR_REQUIRED . HUMAN_NAME,
            'en_name' => STR_REQUIRED . EN_NAME,
            'email' => STR_REQUIRED . EMAIL,
            'pc' => 'required|max:6',
            'cn_street' => STR_REQUIRED . CN_STREET,
            'en_street' => STR_REQUIRED . EN_STREET
        ],
        // for web
        'update-status' => [
            'id' => ID,
        ],
        'update-password' => [
            'id' => ID,
            'password' => STR_REQUIRED . DOMAIN_PASSWORD
        ],
        'update-dns' => [
            'id' => ID,
            'ns_list' => STR_REQUIRED . DNS
        ],
        'change-contact' => [
            'keyword' => STR_REQUIRED,
            'new_contact_template_id' => STR_REQUIRED . INTEGER . '|' . MORE_THAN_ZERO,
            'new_agent_id' => STR_REQUIRED . INTEGER . '|' . MORE_THAN_ZERO
        ],
        'ack-change-contact' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'operation' => 'required|in:agree,disagree'
        ],
        'quick-creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'period' => STR_REQUIRED . INTEGER,
            'contact_template_id' => STR_REQUIRED . INTEGER,
            'dns' => DNS,
        ],
        'quick-upstream-creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'period' => STR_REQUIRED . INTEGER,
        ],
        'check' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'fee_period' => INTEGER,
        ],
        'renew' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'period' => STR_REQUIRED . INTEGER . '|min:1|max:10',
            'expiry' => STR_REQUIRED
        ],
        'list' => [
            'limit' => LIMIT,
            'offset' => OFFSET,
            'order' => ORDER
        ],
        'change-contact-list' => [
            'status' => 'in:STATUS_APPLICATION,STATUS_TRANSFER,STATUS_REFUSED',
            'limit' => LIMIT,
            'offset' => OFFSET,
            'order' => ORDER
        ],
        'add-transfer-in' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'password' => STR_REQUIRED,
            'contact_template_id' => STR_REQUIRED
        ],
        'add-transfer-out' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'agent_id' => ARR_REQUIRED
        ],
        'internal-transfer-in' => [
            'keyword' => STR_REQUIRED,
            'upstream_id' => STR_REQUIRED,
            'agent_contact_template_id' => STR_REQUIRED
        ]
    ],
    'change_contact' => [
        'agreement' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'product_id' => STR_REQUIRED . MORE_THAN_ZERO
        ],
        'disagreement' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'fail_reason' => 'required|max:100',
            'product_id' => STR_REQUIRED . MORE_THAN_ZERO
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'deleted_product' =>[
        'id' => [
            'id' => ID
        ],
    ],
    'compared_product' => [
        'update-status' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'fail_reason' => 'max:100'
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'product_transfer_in' => [
        // for api
        'creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'password' => STR_REQUIRED,
        ],
        // for web
        'application' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'agent_id' => STR_REQUIRED,
            'password' => STR_REQUIRED,
            'agent_contact_template_id' => STR_REQUIRED
        ],
        'id' => [
            'id' => ID
        ],
        'log' => [
            'product_transfer_in_id' => ID
        ]
    ],
    'product_transfer_out' => [
        // for api
        'creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
        ],
        'agreement' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'fail_reason' => MORE_THAN_ZERO,
            'password' => STR_REQUIRED . MORE_THAN_ZERO,
            'keyword' => 'required|max:50'
        ],
        'disagreement' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'fail_reason' => 'required|max:100',
            'password' => STR_REQUIRED . MORE_THAN_ZERO,
            'keyword' => 'required|max:50'
        ],
        'application' => [
            'keyword' => STR_REQUIRED,
            'agent_id' => STR_REQUIRED
        ],
        'id' => [
            'id' => ID,
        ],
        'list' => [
            'limit' => LIMIT,
            'offset' => OFFSET,
            'order' => ORDER
        ]
    ],
    'redemption_product' => [
        'status' => [
            'id' => ID,
            'status' => STR_REQUIRED,
            'keyword' => STR_REQUIRED,
            'fail_reason' => 'max:100'
        ],
        'creation' => [
            'keyword' => STR_REQUIRED . DOMAIN
        ]
    ],
    'poll' =>[
        'read' => [
            'ids' => ['required', IDS],
            'is_read'=> STR_REQUIRED,
        ],
        'list' => [
            'count' => 'numeric|max:100',
        ]
    ],
    'contact' => [
        'info' => [
            'upstream_contact_id' => STR_REQUIRED . UPSTREAM_CONTACT_ID
        ],
        'upstream-info' => [
            'upstream_id' => STR_REQUIRED,
            'upstream_contact_id' => STR_REQUIRED . UPSTREAM_CONTACT_ID
        ],
        'update-for-person' => [
            'type' => STR_REQUIRED,
            'cn_name' => STR_REQUIRED . HUMAN_NAME,
            'en_name' => STR_REQUIRED . EN_NAME,
            'email' => EMAIL,
            'pc' => PC,
            'country_id' => ADDRESS_ID,
            'province_id' => ADDRESS_ID,
            'city_id' => ADDRESS_ID,
            'cn_street' => CN_STREET,
            'en_province' => EN_STREET,
            'en_city' => EN_CITY,
            'en_street' => EN_STREET
        ],
        'update-for-org' => [
            'type' => STR_REQUIRED,
            'cn_name' => STR_REQUIRED . HUMAN_NAME,
            'en_name' => STR_REQUIRED . EN_NAME,
            'email' => EMAIL,
            'pc' => PC,
            'country_id' => ADDRESS_ID,
            'province_id' => ADDRESS_ID,
            'city_id' => ADDRESS_ID,
            'cn_street' => CN_STREET,
            'en_province' => EN_STREET,
            'en_city' => EN_CITY,
            'en_street' => EN_STREET,
            'cn_org' => STR_REQUIRED . CN_ORG,
            'en_org' => STR_REQUIRED . EN_ORG
        ],
        'update-for-upstream-person' => [
            'upstream_id' => STR_REQUIRED,
            'upstream_contact_id' => STR_REQUIRED . UPSTREAM_CONTACT_ID,
            'type' => STR_REQUIRED,
            'cn_name' => STR_REQUIRED . HUMAN_NAME,
            'en_name' => STR_REQUIRED . EN_NAME,
            'voice' => ['required'],
            'mobile' => ['required'],
            'email' => EMAIL,
            'pc' => PC,
            'en_country' => EN_COUNTRY,
            'cn_province' => CN_PROVINCE,
            'en_province' => EN_STREET,
            'cn_city' => CN_CITY,
            'en_city' => EN_CITY,
            'cn_street' => CN_STREET,
            'en_street' => EN_STREET
        ],
        'update-for-upstream-org' => [
            'upstream_id' => STR_REQUIRED,
            'upstream_contact_id' => STR_REQUIRED . UPSTREAM_CONTACT_ID,
            'type' => STR_REQUIRED,
            'cn_name' => STR_REQUIRED . HUMAN_NAME,
            'en_name' => STR_REQUIRED . EN_NAME,
            'voice' => ['required'],
            'mobile' => ['required'],
            'email' => EMAIL,
            'pc' => PC,
            'en_country' => EN_COUNTRY,
            'cn_province' => CN_PROVINCE,
            'en_province' => EN_STREET,
            'cn_city' => CN_CITY,
            'en_city' => EN_CITY,
            'cn_street' => CN_STREET,
            'en_street' => EN_STREET,
            'cn_org' => STR_REQUIRED . CN_ORG,
            'en_org' => STR_REQUIRED . EN_ORG
        ]
    ],
    'contact_template' => [
        'id' => [
            'id' => ID
        ],
        'list' => [
            'limit' => LIMIT,
            'offset' => OFFSET,
            'order' => ORDER
        ],
        'manual_auditing'=>[
            'id'=> ID,
            'auditingData' => ZERO_AND_ONE
        ],
        'refresh'=>[
            'id' => ID,
            'upstream_id' => ID,
            'contact_template_id' => ID,
        ]
    ],
    'analysis_record' => [
        'creation' => [
            'keyword' => STR_REQUIRED . DOMAIN,
            'record_type' => STR_REQUIRED . ANALYSIS_RECORD_TYPE,
            'record_value' => STR_REQUIRED,
            'ttl' => ANALYSIS_RECORD_TTL,
            'mx' => ANALYSIS_RECORD_MX
        ],
        'update' => [
            'id' => STR_REQUIRED,
            'keyword' => STR_REQUIRED . DOMAIN,
            'record_type' => STR_REQUIRED . ANALYSIS_RECORD_TYPE,
            'record_value' => STR_REQUIRED,
            'ttl' => ANALYSIS_RECORD_TTL,
            'mx' => ANALYSIS_RECORD_MX
        ],
        'id' => [
            'id' => ID
        ],
        'list' => [
            'keyword' => STR_REQUIRED,
            'limit' => LIMIT,
            'offset' => OFFSET,
            'order' => ORDER
        ],
        'deletion' => [
            'id' => ID,
            'keyword' => STR_REQUIRED . DOMAIN
        ],
        'line' => [
            'keyword' => STR_REQUIRED . DOMAIN
        ]
    ],
    'log' => [
        'list' => [
            'start' => INTEGER,
            'requestId' => INTEGER,
            'startTime' => YEAR_MONTH_DAY_HOUR_MINUTE_SECOND,
            'endTime' => YEAR_MONTH_DAY_HOUR_MINUTE_SECOND,
            'request_type' => 'alpha',
            'registrar_id' => 'alpha_dash'
        ]
    ],
    'department' => [
        'elevation' => [
            'ids' => ['required', IDS]
        ]
    ],
    'sms_template' => [
        'creation' => [
            'upstream_id'=>NUMERIC,
            'local_code' => 'required|min:4|max:20',
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'sms_type'=>STR_REQUIRED.NUMERIC,
            'status'=>STR_REQUIRED.NUMERIC,
            'enable'=>ZERO_AND_ONE,
            'content'=> STR_REQUIRED,
            'params'=>STR_REQUIRED,
        ],
        'update' => [
            'id' => ID,
            'upstream_id'=>NUMERIC,
            'local_code' => 'required|min:4|max:20',
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'sms_type'=>STR_REQUIRED.NUMERIC,
            'status'=>STR_REQUIRED.NUMERIC,
            'enable'=>ZERO_AND_ONE,
            'content'=> STR_REQUIRED,
            'params'=>STR_REQUIRED,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'blacklist' => [
        'creation' => [
            'mobile' => 'regex:/^1[3-9]{1}\d{9}$/',
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'mobilechannel' => [
        'creation' => [
            'precode' =>STR_REQUIRED.NUMERIC,
            'opid'=> STR_REQUIRED.NUMERIC,
        ],
        'update' => [
            'id' => ID,
            'precode' =>STR_REQUIRED.NUMERIC,
            'opid'=> STR_REQUIRED.NUMERIC,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'recharge' => [
        'creation' => [
            'agent_id' => STR_REQUIRED.NUMERIC,
            'order_no' => STR_REQUIRED,
        ],
        'update' => [
            'id'=>ID,
            'agent_id' => STR_REQUIRED.NUMERIC,
            'order_no' => STR_REQUIRED,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'rechargeinfo' => [
        'creation' => [
            'recharge_id' => STR_REQUIRED.NUMERIC,
            'sms_type_id' => STR_REQUIRED.NUMERIC,
            'sms_count'=>STR_REQUIRED.NUMERIC,
        ],
        'update' => [
            'id' => ID,
            'recharge_id' => STR_REQUIRED.NUMERIC,
            'sms_type_id' => STR_REQUIRED.NUMERIC,
            'sms_count'=>STR_REQUIRED.NUMERIC,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'sensitiveword' => [
        'creation' => [
            'name' =>STR_REQUIRED,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'sign' => [
        'creation' => [
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'company' =>STR_REQUIRED,
            'sign_name' =>STR_REQUIRED,
            'sign_type'=>NUMERIC,
            'sign_purpose'=>NUMERIC,
            'certificate_type'=>NUMERIC,
            'memo'=>STR_REQUIRED,
        ],
        'update' => [
            'id' => ID,
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'company' =>STR_REQUIRED,
            'sign_name' =>STR_REQUIRED,
            'sign_type'=>NUMERIC,
            'sign_purpose'=>NUMERIC,
            'certificate_type'=>NUMERIC,
            'memo'=>STR_REQUIRED,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'smslog' => [
        'creation' => [
            'sms_type_cn_name' =>STR_REQUIRED,
            'cn_name' =>STR_REQUIRED,
            'sign_name'=>STR_REQUIRED,
            'mobile' => 'regex:/^1[3-9]{1}\d{9}$/',
            'content'=>STR_REQUIRED,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'upstream' => [
        'creation' => [
            'cn_name' =>STR_REQUIRED.HUMAN_NAME,
            'keyword' =>STR_REQUIRED.HUMAN_NAME,
            'descrption'=>STR_REQUIRED,
            'enable'=>ZERO_AND_ONE,
        ],
        'update' => [
            'id' => ID,
            'cn_name' =>STR_REQUIRED.HUMAN_NAME,
            'keyword' =>STR_REQUIRED.HUMAN_NAME,
            'descrption'=>STR_REQUIRED,
            'enable'=>ZERO_AND_ONE,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'smsflow' => [
        'creation' => [
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'sms_type_id' =>STR_REQUIRED.NUMERIC,
            'success_count'=>STR_REQUIRED.NUMERIC,
            'false_count'=>STR_REQUIRED.NUMERIC,
        ],
        'update' => [
            'id' => ID,
            'agent_id'=>STR_REQUIRED.NUMERIC,
            'sms_type_id' =>STR_REQUIRED.NUMERIC,
            'success_count'=>STR_REQUIRED.NUMERIC,
            'false_count'=>STR_REQUIRED.NUMERIC,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'smstype' => [
        'creation' => [
            'type'=>STR_REQUIRED.NUMERIC,
            'cn_name' =>STR_REQUIRED.HUMAN_NAME,
            'keyword'=>STR_REQUIRED.HUMAN_NAME,
        ],
        'update' => [
            'id' => ID,
            'type'=>STR_REQUIRED.NUMERIC,
            'cn_name' =>STR_REQUIRED.HUMAN_NAME,
            'keyword'=>STR_REQUIRED.HUMAN_NAME,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'signcertificate' => [
        'creation' => [
            'type'=>STR_REQUIRED.NUMERIC,
            'local_url' =>STR_REQUIRED,
            'public_url'=>STR_REQUIRED,
            'sign_id'=>STR_REQUIRED.NUMERIC,
        ],
        'update' => [
            'id' => ID,
            'type'=>STR_REQUIRED.NUMERIC,
            'local_url' =>STR_REQUIRED,
            'public_url'=>STR_REQUIRED,
            'sign_id'=>STR_REQUIRED.NUMERIC,
        ],
        'id' => [
            'id' => ID
        ]
    ],
    'sign_name' => [
        'manual_auditing'=>[
            'id'=> ID,
            'auditingData' => 'regex:/^[012]$/'
        ],
        'id' => [
            'id' => ID
        ]
    ],
];