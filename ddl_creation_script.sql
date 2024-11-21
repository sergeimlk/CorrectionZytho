drop table if exists "user", brewerie, "category", ingredient, beer, "favorite", review, flavor, photo;

create table "user" (
	email varchar(100) primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	"password" varchar(50) not null,
	constraint valid_email check (email ~ '^.+@.+\.(com|fr|us|org|io)$'),
	constraint valid_password check ("password" ~ '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
);

create table brewerie (
	id serial primary key,
	name varchar(50) not null,
	address varchar(100) not null,
	country varchar(50) not null,
	description varchar(300)
);

create table "category" (
	id serial primary key,
	name varchar(50) not null
);

create table ingredient (
	id serial primary key,
	name varchar(50) not null,
	"type" varchar(50) 
);

create table beer (
	id serial primary key,
	name varchar(50) unique not null,
	color varchar(50),
	origin varchar(100) not null,
	use_by_date date,
	abv real not null check (abv >= 0.0 and abv <= 20.0),
	size smallint not null check (size > 250),
	packaging varchar(50),
	img_profile text[2],
	description varchar(300),
	id_brewerie integer references brewerie(id),
	id_category integer references category(id)
);

create table "favorite" (
	user_email varchar(100) references "user"(email),
	id_beer integer references beer(id),
	constraint pk_favorite primary key (user_email, id_beer)
);

create table review (
	user_email varchar(100) references "user"(email),
	id_beer integer references beer(id),
	"date" date default CURRENT_DATE,
	content varchar(300),
	rating real not null,
	constraint pk_review primary key (user_email, id_beer)
);

create table flavor (
	id_ingredient integer references ingredient(id),
	id_beer integer references beer(id),
	quantity real check(quantity > 0.0),
	constraint pk_ingredient primary key (id_ingredient, id_beer)
);

create table photo (
	id serial primary key,
	url_small varchar(200) unique,
	url_big varchar(200) unique,
	id_beer integer references beer(id)
);
