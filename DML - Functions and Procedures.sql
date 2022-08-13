-- ********************************** creating add_personal_info procedure *****************************
CREATE OR REPLACE FUNCTION add_personal_info(
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255),
	roles roles)
RETURNS integer
LANGUAGE plpgsql
AS $$
	DECLARE personal_id integer;
BEGIN
	INSERT INTO personal_info(first_name, last_name, email, phone, address, roles)
	VALUES(first_name, last_name, email, phone, address, roles);
	
	SELECT personal_info_id INTO personal_id FROM personal_info
	ORDER BY personal_info_id DESC
	LIMIT 1;
	
	RETURN personal_id;
END;
$$;

-- ************************************** add_customer procedure **************************************
CREATE OR REPLACE PROCEDURE add_customer(
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(personal_info_id)
	VALUES(add_personal_info(first_name, last_name, email, phone, address, 'customer'));
END
$$;


-- **************************************** add_manager procedure *****************************************
CREATE OR REPLACE PROCEDURE add_manager(
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO manager(personal_info_id)
	VALUES(add_personal_info(first_name, last_name, email, phone, address, 'manager'));
END
$$;

-- *************************************** add_salesperson prosedure **************************************
CREATE OR REPLACE PROCEDURE add_salesperson(
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255),
	manager_id integer)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(personal_info_id, manager_id)
	VALUES(add_personal_info(first_name, last_name, email, phone, address, 'salesperson'), manager_id);
END
$$;

-- *************************************** add_mechanics prosedure **************************************
CREATE OR REPLACE PROCEDURE add_mechanics(
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone varchar(10),
	address varchar(255),
	manager_id integer)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanics(personal_info_id, manager_id)
	VALUES(add_personal_info(first_name, last_name, email, phone, address, 'mechanics'), manager_id);
END
$$;

-- **************************************** add_part procedure *******************************************
CREATE OR REPLACE PROCEDURE add_part(
	part_number varchar(50),
	description varchar(400),
	purchase_price decimal(5,2),
	retail_price decimal(5,2))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO part(part_number, description, purchase_price, retail_price)
	VALUES(part_number, description, purchase_price, retail_price);
END
$$;

-- ****************************************** add_car procedure ******************************************
CREATE OR REPLACE PROCEDURE add_car(
	make varchar(20),
	model varchar(20),
	color varchar(20),
	make_year varchar(4),
	new_old boolean,
	value decimal(10,2))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(make, model, color, make_year, new_old, value)
	VALUES(make, model, color, make_year, new_old, value);
END
$$;


-- ****************************************** service_ticket ***********************************************
CREATE OR REPLACE PROCEDURE add_service_ticket(
	car_serial_num integer,
	customer_id integer,
	date_received date,
	date_returned date,
	issue varchar(400))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_ticket(car_serial_num, customer_id, date_received, date_returned, issue)
	VALUES(car_serial_num, customer_id, date_received, date_returned, issue);
END
$$;

-- **************************************** add_parts_used procedure ***************************************
CREATE OR REPLACE PROCEDURE add_parts_used(
	ticket_id integer,
	part_id integer,
	quantity integer,
	description varchar(400))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO parts_used(ticket_id, part_id, quantity, description)
	VALUES(ticket_id, part_id, quantity, description);
END
$$;

-- **************************************** add_service_mechanic procedure **********************************
CREATE OR REPLACE PROCEDURE add_service_mechanic(
	ticket_id integer,
	mechanics_id integer,
	hours integer,
	hourly_rate decimal(5,2),
	description varchar(400))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sevice_mechanic(ticket_id, mechanics_id, hours, hourly_rate, description)
	VALUES (ticket_id, mechanics_id, hours, hourly_rate, description);
END
$$;










