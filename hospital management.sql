create database hospital_management;
use hospital_management;
create table staff_details(staff_id int primary key,staff_name varchar(60),salary int,experience int);
insert into staff_details(staff_id,staff_name,salary,experience)values(201,'malini',40000,1),
(202,'mala',45000,2),
(203,'sasi',45000,3),
(204,'harish',50000,1),
(205,'yash',30000,5);
select*from staff_details;
create table patient_details(patient_id int,staff_name varchar(50),patient_dept varchar(50),billing_amount int,staff_id int,constraint a_foreignkey foreign key (staff_id) references staff_details(staff_id) on delete set null);
insert into patient_details (patient_id,staff_name,patient_dept,billing_amount,staff_id)values(11,'malini','neuro',80000,201),
(12,'mala','ortho',30000,202),
(14,'sasi','oncology',2000,203),
(15,'harish','uro',10000,204),
(16,'yash','nephro',30000,205);
select* from patient_details;
delete from staff_details where staff_id =202;
select staff_details.staff_id,staff_details.staff_name,staff_details.salary,staff_details.experience from staff_details inner join patient_details on staff_details.staff_id=patient_details.staff_id;
select staff_details.staff_id,staff_details.staff_name,staff_details.salary,staff_details.experience from staff_details left join patient_details on staff_details.staff_id=patient_details.staff_id;
select staff_details.staff_id,staff_details.staff_name,staff_details.salary,staff_details.experience from staff_details right join patient_details on staff_details.staff_id=patient_details.staff_id;
select*from staff_details where staff_id=(select staff_id from staff_details where staff_id=205);
select* from patient_details where patient_id=(select patient_id from patient_details where staff_name = 'yash');