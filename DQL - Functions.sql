-- *************************** get invoice detail by customer id **************************
CREATE OR REPLACE FUNCTION get_invoice_details_by_customer_id(c_id integer)
RETURNS TABLE(
	first_name varchar(50),
	last_name varchar(50),
	address varchar(255),
	invoice_type invoice_type,
	invoice_date timestamp,
	total decimal(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
RETURN QUERY
	SELECT p.first_name, p.last_name, p.address, i.invoice_type, i.invoice_date,
		CASE i.invoice_type
			WHEN 'sell'
				THEN get_car_value(i.car_serial_num) 
			WHEN 'repair'
				THEN get_service_total(s.ticket_id)
				ELSE 0.00
		END AS total
	FROM personal_info p
	JOIN customer c 
	ON c.personal_info_id = p.personal_info_id
	JOIN invoice i
	ON c.customer_id = i.customer_id
	LEFT JOIN service_ticket s
	ON s.ticket_id = i.ticket_id
	WHERE c.customer_id = c_id;
END;
$$;

-- ******************************************************* <get car value>
CREATE OR REPLACE FUNCTION get_car_value(car_id integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
	DECLARE value integer;
BEGIN 
	SELECT c.value INTO value FROM car c
	WHERE c.car_serial_num = car_id;
	RETURN value;
END
$$;

-- ******************************************************* <get service ticket>
CREATE OR REPLACE FUNCTION get_service_total(ticket integer)
RETURNS decimal(5,2)
LANGUAGE plpgsql
AS $$
	DECLARE total decimal(5,2);
BEGIN
	SELECT sum(pu.quantity*p.purchase_price) INTO total FROM parts_used pu
	JOIN part p
	ON p.part_id = pu.part_id
	WHERE pu.ticket_id = ticket
	GROUP BY ticket_id;
	RETURN total;
END 
$$


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  TEST INVOICE DEATILS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT * FROM get_invoice_details_by_customer_id(9);
SELECT * FROM get_invoice_details_by_customer_id(1);
SELECT * FROM get_invoice_details_by_customer_id(5);


----------------------------------------------------------------------------------------------------------------




-- ************************************ get a car service history **********************************************
CREATE OR REPLACE FUNCTION get_car_service_history(car_id integer)
RETURNS TABLE(
	car_serial_num integer,
	make varchar(20),
	model varchar(20),
	color varchar(20),
	make_year varchar(4),
	date_received date,
	date_retured date,
	issue varchar(400))
LANGUAGE plpgsql
AS $$
BEGIN
RETURN QUERY
	SELECT c.car_serial_num ,c.make, c.model, c.color, c.make_year, s.date_received, s.date_returned, s.issue FROM car c
	LEFT JOIN service_ticket s
	ON c.car_serial_num = s.car_serial_num
	WHERE c.car_serial_num = car_id;
END;
$$;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  TEST CAR SERVICE HISTORY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT * FROM get_car_service_history(2);
SELECT * FROM get_car_service_history(1);
SELECT * FROM get_car_service_history(5);







