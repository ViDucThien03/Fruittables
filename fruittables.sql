create database fruittables;
use fruittables;
create table category 
(
	cate_id int AUTO_INCREMENT not null primary key,
    cate_name varchar(255) not null,
    cate_enable bit not null,
    cate_image text not null
);
create table supplier
(
	supplier_id int auto_increment not null primary key,
    sup_name text not null,
    sup_address text not null,
    awards text not null,
    sup_img text not null
);
create table roles
(
	id int auto_increment not null primary key,
    roles text not null
);
create table customer
(
	id int auto_increment not null primary key,
    cus_name varchar(255) null,
    username text not null,
    password text not null,
    cus_phone text null,
    cus_email text null,
    cus_address text null,
    gender bit null,
    role_id int,
    cus_enable text,
    foreign key (role_id) references roles(id)
);
create table product (
    id int auto_increment not null primary key,
    product_name varchar(255) not null,
    product_desc text not null,
    product_price double not null,
    quantity int not null,
    product_sales int null,
    product_hot bit null,
    exp_date date not null,
    create_date date not null,
    product_img text not null,
    sell_quantity int not null,
    supplier_id int,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    cate_id int,
    FOREIGN KEY (cate_id) REFERENCES category(cate_id)
);
create table orders
(
	id int auto_increment not null primary key,
    createDay date not null,
    total_price double not null,
    total_product double not null,
    address text not null,
    desc_order text not null,
    phone text not null,
    email text not null,
    customer_id int,
    status double not null,
    payment_method text,
    status_payment text,
    foreign key (customer_id) references customer(id)
);
create table order_detail
(
	id int auto_increment not null primary key,
    total_piad double not null,
    product_id int,
    order_id int,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references product(id),
    quantity int
);

create table feedback 
(
	fb_id int auto_increment not null primary key,
    content text not null,
    rate int not null,
    product_id int,
    id int,
    foreign key (product_id) references product(id),
    foreign key (id) references customer(id)
);


create table contact 
(
	id int auto_increment not null primary key,
    contact_email text not null,
    contact_phone char(20) not null,
    contact_address text not null
);

create table blog_type
(
	id int auto_increment not null primary key,
    type_name text not null
);

create table blog_detail
(
	id int auto_increment not null primary key,
    title text not null,
    content text not null,
    blog_img text not null,
    create_at date not null,
    blog_id int,
    customer_id int,
    foreign key (blog_id) references blog_type(id),
    foreign key (customer_id) references customer(id)
)