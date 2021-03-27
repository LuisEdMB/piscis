create database piscis;
use piscis;

create table configuration (
	id int auto_increment primary key not null,
    description varchar(200) not null,
    value varchar(100) not null,
    date_register datetime not null default now()
);

create table system_app (
	id int auto_increment primary key not null,
    description varchar(50) not null,
    date_register datetime not null default now()
);

create table document (
	id int auto_increment primary key not null,
    description varchar(100) not null,
    date_register datetime not null default now()
);

create table country (
	id int auto_increment primary key not null,
    description varchar(100) not null,
    code_telephone char(2) not null,
    active bit not null default 1,
    date_register datetime not null default now()
);

create table vehicle (
	id int auto_increment primary key not null,
    description varchar(50) not null,
    active bit not null default 1,
    date_register datetime not null default now()
);

create table payment (
	id int auto_increment primary key not null,
    description varchar(50) not null,
    logo_image_path varchar(500) not null,
    active bit not null default 1,
    date_register datetime not null default now()
);

create table delivery_status (
	id int auto_increment primary key not null,
    description varchar(50) not null,
    date_register datetime not null default now()
);

create table delivery_type (
	id int auto_increment primary key not null,
    description varchar(50) not null,
    date_register datetime not null default now()
);

create table delivery_reason (
	id int auto_increment primary key not null,
    description varchar(200) not null,
    active bit not null default 1,
    date_register datetime not null default now()
);

create table company_category (
	id int auto_increment primary key not null,
    description varchar(200) not null,
    active bit not null default 1,
    date_register datetime not null default now()
);

create table system_app_user (
	id int auto_increment primary key not null,
    id_system int not null references system_app(id),
    user varchar(15) not null,
    password varchar(100) not null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table client (
	id int auto_increment primary key not null,
    id_document_type int null references document(id),
    document varchar(15) not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    id_country int not null references country(id),
    telephone varchar(9) not null,
    profile_image_path varchar(500) null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table client_address (
	id int auto_increment primary key not null,
    id_client int not null references client(id),
    address varchar(500) not null,
    reference varchar(500) null,
    latitude decimal not null,
    longitude decimal not null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table client_code_validation (
	id int auto_increment primary key not null,
    id_client int not null references client(id),
    code int not null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table dealer (
	id int auto_increment primary key not null,
    id_document_type int null references document(id),
    document varchar(15) not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    id_country int not null references country(id),
    telephone varchar(9) not null,
    mac_telephone varchar(17) not null,
    imei_telephone varchar(16) not null,
    id_vehicle_type int not null references vehicle(id),
    plate varchar(7) null,
    profile_image_path varchar(500) null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table company (
	id int auto_increment primary key not null,
    id_document_type int null references document(id),
    id_user int not null references system_app_user(id),
    id_category int not null references company_category(id),
    ruc varchar(11) not null,
    social_reason varchar(500) not null,
    company_name varchar(500) not null,
    email varchar(200) not null,
    owner_name varchar(200) not null,
    telephone varchar(9) not null,
    logo_image_path varchar(500) null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table company_product_category (
	id int auto_increment primary key not null,
    id_company int not null references company(id),
    description varchar(200) not null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table company_product (
	id int auto_increment primary key not null,
    id_company int not null references company(id),
    id_category int not null references company_category(id),
    product varchar(200) not null,
    description varchar(500) not null,
    stock int not null default 0,
    flag_stock bit not null,
    image_path varchar(500) null,
    active bit not null default 1,
    date_register datetime not null default now(),
    date_update datetime null
);

create table delivery (
	id int auto_increment primary key not null,
    id_client int not null references client(id),
    id_dealer int not null references dealer(id),
    id_status int not null references delivery_status(id),
    id_type int not null references delivery_type(id),
    subtotal decimal not null,
    delivery_cost decimal not null,
    total decimal not null,
    date_register datetime not null default now(),
    date_update datetime null
);

create table delivery_info (
	id int auto_increment primary key not null,
    id_delivery int not null references delivery(id),
    comment varchar(500) null,
    id_origin_address int not null,
    id_destination_address int not null references client_address(id),
    id_payment int not null references payment(id),
    amount_pay_cash decimal not null default 0,
    date_register datetime not null default now()
);

create table delivery_detail (
	id int auto_increment primary key not null,
    id_delivery int not null references delivery(id),
    id_product int not null references company_product(id),
    quantity int not null,
    total decimal not null,
    date_register datetime not null default now()
);

create table delivery_log (
	id int auto_increment primary key not null,
    id_delivery int not null references delivery(id),
    id_status int not null references delivery_status(id),
    id_reason int not null default 1 references delivery_reason(id),
    reason varchar(500) null,
    date_register datetime not null default now()
);