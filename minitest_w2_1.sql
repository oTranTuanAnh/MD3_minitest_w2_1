create database tour_management;
use tour_management;

create table categorytour  (
id int not null primary key,
category_code varchar(255),
category_name varchar(255));
create table city(
id int not null primary key,
city_name varchar(255));
create table clients (
id int not null primary key,
name_clients varchar(255),
id_number varchar(255),
date_of_birth date, 
city_id int,
foreign key (city_id) references city(id));
create table destination (
id int not null primary key,
destination_name varchar(255),
describes varchar(255),
cost int,
city_id int, 
foreign key (city_id) references city(id));
create table tour(
id int not null primary key,
tour_code varchar(255),
category_id int,
destination_id int,
date_start date,
date_end date,
foreign key (category_id) references categorytour(id),
foreign key (destination_id) references destination(id));
create table ordertour(
id int not null primary key,
tour_id int, 
clients_id int,
statuss varchar(255),
foreign key (tour_id) references tour(id),
foreign key (clients_id) references clients(id));

insert into city values (1, "HN"), (2, "SG");
insert into city values (3, "DN"), (4, "HP"), (5, "DL");
insert into categorytour values (1, "HK101", "Du lich Ha Noi"),
(3, "XB22", "Buffe xien ban");
insert into categorytour values (2, "HKJWJ", "Du lich linh tinh");
insert into clients values (1, "nguyen van a", "76854496", '2000-6-15', 1),
(2, "le van tuan", "3423455", '1990-5-6', 1),
(3, "nguyen thi linh", "233144", '1995-9-2', 1),
(4, "nguyen van trung", "4757683", '1999-7-2', 2),
(5, "nguyen thanh thao", "467558495", '1996-1-22', 2),
(6, "truong ngoc anh", "878787956", '2002-6-10', 1),
(7, "tran van viet", "898989898", '1995-8-6', 2),
(8, "pham thanh trung", "5454363", '2000-10-25', 1),
(9, "le thi thuy", "2345689", '1999-4-18', 2),
(10, "trinh van quan", "3343325", '2001-2-4', 2);
insert into destination values (1, "ha noi", "pho di bo", 500, 1),
(2, "sai gon", "bar club", 2500, 2),
(3, "lake cafe", "cafe", 1000, 5),
(4, "hai phong", "di tam bien", 320, 4),
(5, "restaurant", "di an lau nuong", 1500, 3);
insert into tour values (1,'HH325', 1, 3, '2024-5-15', '2024-5-20'),
(2,'BC12', 2, 1, '2024-3-10', '2024-3-12'),
(3,'JK787', 3, 5, '2024-4-5', '2024-4-7'),
(4,'POL82', 1, 1, '2024-6-15', '2024-6-20'),
(5,'AQ003', 2, 5, '2024-3-20', '2024-3-22'),
(6,'XZ112', 3, 4, '2024-8-10', '2024-8-12'),
(7,'HHH15', 2, 3, '2024-8-25', '2024-8-27'),
(8,'XKK11', 1, 4, '2024-10-20', '2024-10-22'),
(9,'MX435', 1, 5, '2024-11-5', '2024-11-12'),
(10,'BXK', 3, 3, '2024-7-19', '2024-7-20'),
(11,'095UHT', 1, 2, '2024-5-19', '2024-5-22'),
(12,'112TXT', 2, 5, '2024-5-19', '2024-5-20'),
(13,'3SF4GT', 1, 4, '2024-8-15', '2024-8-17'),
(14, '21DFT', 1, 1, '2024-7-22', '2024-7-25'),
(15,'MMNYT', 3, 5, '2024-9-7', '2024-9-10');

insert into ordertour values (1, 1, 3, "done"),
(2, 1, 3, "oderring"),
(3, 5, 5, "oderring"),
(4, 10, 1, "oderring"),
(5, 4, 8, "done"),
(6, 8, 1, "done"),
(7, 10, 2, "oderring"),
(8, 15, 3, "done"),
(9, 6, 5, "oderring"),
(10, 8, 8, "oderring");

-- thong ke so luong tour cua cac thanh pho
select c.city_name, count(c.city_name) as counts
from city c left join destination d on c.id = d.city_id
join tour t on d.id = t.destination_id group by c.city_name; 
-- tinh so tour co ngay bat dau trong thang 3 nam 2024
select count(t.id)
from tour t where datediff(t.date_start, '2024-3-1') >= 0 and  
datediff('2024-3-31', t.date_start) >= 0;
-- tinh so tour co ngay ket thuc trong thang 4 nam 2024
select count(t.id)
from tour t where datediff(t.date_end,'2024-4-1') >= 0 and  
datediff('2024-4-30', t.date_end) >= 0;
