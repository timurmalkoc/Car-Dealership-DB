-- **************************************** Test add_customer procedure ***********************************
CALL add_customer('Sandara', 'Martin', 'sandra.martin@sakilacustomer.org', '123456789', '47 MySakila Drive');
CALL add_customer('Sharon', 'Robinson', 'sharon.robinson@sakilacustomer.org', '123234239', '28 MySQL Boulevard');
CALL add_customer('Michelle', 'Clark', 'michelle.clark@sakilacustomer.org', '1234234789', '23 Workhaven Lane');
CALL add_customer('Sarah', 'Lewis', 'sarah.lewis@sakilacustomer.org', '122343789', '1411 Lillydale Drive');
CALL add_customer('Deborah', 'Walker', 'deborah.walker@sakilacustomer.org', '12234589', '1913 Hanoi Way');
CALL add_customer('Jessica', 'Hall', 'jessica.hall@sakilacustomer.org', '122342349', '1121 Loja Avenue');
CALL add_customer('Shirley', 'Allen', 'shirley.allen@sakilacustomer.org', '123422289', '692 Joliet Street');
CALL add_customer('Cynthia', 'Young', 'cynthia.young@sakilacustomer.org', '1234234289', '1566 Inegl Manor');
-----------------------------------------------------------------------------------------------------------
-- ***************************************** Test add_manager procedure ***********************************
CALL add_manager('Martha', 'Green', 'martha.gonzalez@sakilacustomer.org', '443456789', '808 Bhopal Manor');
CALL add_manager('Robin', 'Nelson', 'robin.hayes@sakilacustomer.org', '443234239', '770 Bydgoszcz Avenue');
-----------------------------------------------------------------------------------------------------------
-- *************************************** Test add_salesperson procedure **********************************
CALL add_salesperson('Angela', 'Hernandez', 'angela.hernandez@sakilacustomer.org', '443456789', '1795 Santiago de Compostela Way', 1);
CALL add_salesperson('Melissa', 'King', 'melissa.king@sakilacustomer.org', '443234239', '900 Santiago de Compostela Parkway', 2);
CALL add_salesperson('Brenda', 'Wright', 'brenda.wright@sakilacustomer.org', '4434234789', '478 Joliet Way', 1);
-----------------------------------------------------------------------------------------------------------
-- *************************************** Test add_mechanics procedure **********************************
CALL add_mechanics('Johnny', 'Olivier', 'angela.hernandez@sakilacustomer.org', '443456789', '1795 Santiago de Compostela Way', 1);
CALL add_mechanics('Kevin', 'Costner', 'melissa.king@sakilacustomer.org', '443234239', '900 Santiago de Compostela Parkway', 2);
CALL add_mechanics('Milla', 'Voight', 'brenda.wright@sakilacustomer.org', '4434234789', '478 Joliet Way', 1);
-----------------------------------------------------------------------------------------------------------
-- *************************************** Test add_part procedure ****************************************
CALL add_part('75-DLG', 'Duralast Gold Battery 75-DLG Group Size 75 700 CCA', 140.99, 199.99);
CALL add_part('H6-EFB', 'Duralast Platinum EFB Battery H6-EFB Group Size H6 750 CCA', 150.99, 219.99);
CALL add_part('MKD326', 'Duralast Semi-Metallic Brake Pads MKD326', 5.99, 19.99);
CALL add_part('K4718', 'PowerStop Performance Brake Pads Rotors Kit K4718', 300.99, 475.99);
CALL add_part('KC5875-36', 'PowerStop Performance Brake Pads Rotors Kit KC5875-36', 320.99, 495.99);
CALL add_part('96311', 'Bosch Double Iridium Spark Plug 96311', 4.99, 8.49);
CALL add_part('4469', 'NGK IX Iridium Spark Plug 4469', 7.99, 11.99);
CALL add_part('4040K', 'ACCEL Performance Wireset 4040K', 40.99, 59.99);
CALL add_part('1629-16-7', 'Valucraft Alternator 1629-16-7', 65.99, 94.99);
CALL add_part('S45028XL', 'STP Extended Life Oil Filter S45028XL', 4.99, 9.99);
-----------------------------------------------------------------------------------------------------------
-- *************************************** Test add_car procedure *****************************************
CALL add_car('Nissan', 'Versa Note S Plus', 'Silver', '2014', FALSE, 12895.00);
CALL add_car('Chevrolet', 'Sonic LT', 'Black', '2016', FALSE, 14295.50);
CALL add_car('RAM', 'Tradesman', 'White', '2019', TRUE, 50998.00);
CALL add_car('Lexus', 'RX 350', 'Black', '2021', TRUE, 59998.00);
CALL add_car('Jeep', 'Compass Latitude', 'Red', '2019', FALSE, 29998.00);
-- *************************************** Test add_service_ticket procedure ******************************
-- car, customer
CALL add_service_ticket(1,1,'2022-08-23','2022-08-25','Battery and oil fileter change');
CALL add_service_ticket(2,5,'2022-08-23','2022-08-24','Change brake');
CALL add_service_ticket(5,1,'2022-08-25','2022-08-26','Change sparks');
-- *************************************** Test add_parts_used procedure **********************************
CALL add_parts_used(1,1,1,'Battery replacement');
CALL add_parts_used(1,10, 1, 'Oil fileter change'); 
CALL add_parts_used(5,4,1, 'Break bad change');
CALL add_parts_used(6,7,4, 'Spark plug change'); 
-- ********************************** Test add_service_mechanics procedure ********************************
CALL add_service_mechanic(1,1,1,30.50,'Battery replacament: Changed and tested'); 
CALL add_service_mechanic(1,2,1,20.99,'Oil fileter replacement: Changed and tested');
CALL add_service_mechanic(5,3,2,35.00,'Break pad replacement: Changed and tested 4 of them');
CALL add_service_mechanic(6,2,2,30.00,'Spark plug replacement: Changed and tested 4 of them'); 
-- ***************************************** Test add_invoice procedure ***********************************
-- customer, salesperson, car_id, (new update ticket_id if not null)
CALL add_invoice(1,3,1,'repair'); 
CALL add_invoice(5,3,2,'repair');
CALL add_invoice(1,5,5,'repair');
CALL add_invoice(9,4,4,'sell');
CALL add_invoice(11,5,3,'finance');



