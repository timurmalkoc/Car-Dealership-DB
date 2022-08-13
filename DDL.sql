-- Create roles
CREATE TYPE roles AS ENUM ('salesperson', 'customer', 'manager', 'mechanics');

-- Printing roles
SELECT unnest(enum_range(NULL::roles)); 

-- ******************** Personal Info Table ***************************
CREATE TABLE personal_info(
	personal_info_id SERIAL PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255),
	roles roles
);

-- ******************* Customer Table **************************
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	personal_info_id integer NOT NULL,
	FOREIGN KEY(personal_info_id) REFERENCES personal_info(personal_info_id)
);

-- ******************* Manager Table ********************************
CREATE TABLE manager(
	manager_id SERIAL PRIMARY KEY,
	personal_info_id integer NOT NULL,
	FOREIGN KEY(personal_info_id) REFERENCES personal_info(personal_info_id)
);

-- ******************* Salesperson Table **********************
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	personal_info_id integer NOT NULL,
	manager_id integer NOT NULL,
	FOREIGN KEY(personal_info_id) REFERENCES personal_info(personal_info_id),
	FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);


-- ******************* Mechanics Table ****************************
CREATE TABLE mechanics(
	mechanics_id SERIAL PRIMARY KEY,
	personal_info_id integer NOT NULL,
	manager_id integer NOT NULL,
	FOREIGN KEY(personal_info_id) REFERENCES personal_info(personal_info_id),
	FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);


-- ********************** Car Table *****************************
CREATE TABLE car(
	car_serial_num SERIAL PRIMARY KEY,
	make varchar(20),
	model varchar(20),
	color varchar(20),
	make_year DATE,
	new_old boolean,
	value integer
);


-- create types for invoice
CREATE TYPE invoice_type AS ENUM('sell', 'rent', 'finance', 'repair');

-- Printing roles
SELECT unnest(enum_range(NULL::invoice_type)); 
------------------------------------------------------------------------

-- ******************* Invoice Table *************************
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	customer_id integer NOT NULL,
	salesperson_id integer NOT NULL,
	car_serial_num integer NOT NULL,
	invoice_type invoice_type,
	sale_date timestamp DEFAULT current_timestamp,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(car_serial_num) REFERENCES car(car_serial_num)
);


-- ******************** Part Table **************************
CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	part_number varchar(50),
	description varchar(400),
	purchase_price integer,
	retail_price integer	
);

-- ****************** Parts Used Table **********************
CREATE TABLE parts_used(
	parts_used_id SERIAL PRIMARY KEY,
	part_id integer NOT NULL,
	quantity integer,
	price integer,
	description varchar(400),
	FOREIGN KEY(part_id) REFERENCES part(part_id)
);


-- ****************** Service Ticket Table *******************
CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	car_serial_num integer NOT NULL,
	customer_id integer NOT NULL,
	parts_used_id integer NOT NULL,
	date_received date,
	date_returned date,
	FOREIGN KEY(car_serial_num) REFERENCES car(car_serial_num),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(parts_used_id) REFERENCES parts_used(parts_used_id) 
);


-- ***************** Service Mechanics Table ********************
CREATE TABLE sevice_mechanic(
	service_mechanics_id SERIAL PRIMARY KEY,
	ticket_id integer NOT NULL,
	mechanics_id integer NOT NULL,
	hours integer,
	hourly_rate integer,
	description varchar(400),
	FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
	FOREIGN KEY(mechanics_id) REFERENCES mechanics(mechanics_id)
);






