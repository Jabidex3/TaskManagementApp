create database planner;

use planner;

create table tasks(
	task_id int primary key auto_increment,
    title varchar(45),
    message varchar(255),
    importance_scale  varchar(15)
);


insert into tasks values(null,'Grocery Shopping', 'Buy a gallon of milk and some orange juice', 'Not Important' );
insert into tasks values(null,'Doctor Appt', 'Go to Doctor office on wednesday', 'Urgent');
insert into tasks values(null,'Laundry', 'do laundry', 'Important');
insert into tasks values(null,'Cook', 'Cook pasta for dinner', 'Urgent');