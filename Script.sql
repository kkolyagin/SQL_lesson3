-- 1. Создать таблицу с основной информацией о сотрудниках: ФИО, дата рождения, дата начала работы, должность, уровень сотрудника (jun, middle, senior, lead), уровень зарплаты, идентификатор отдела, наличие/отсутствие прав(True/False). При этом в таблице обязательно должен быть уникальный номер для каждого сотрудника.
drop table customers;
drop table departments;
drop table bonuses;

CREATE TABLE customers (
	id serial4 NOT NULL,
	fio varchar(90) NULL,
	birthday date NULL,
	firstday date NULL,
	title varchar(50) NULL,
	titlelevel varchar(30) NULL,
	salary float4 NULL,
	departmentid int4 NULL,
	driverslicense bool NULL,
	CONSTRAINT customers_pkey PRIMARY KEY (id)
);

--2. Для будущих отчетов аналитики попросили вас создать еще одну таблицу с информацией по отделам – в таблице должен быть идентификатор для каждого отдела, название отдела (например. Бухгалтерский или IT отдел), ФИО руководителя и количество сотрудников.
CREATE TABLE departments (
	id serial4 NOT NULL,
	title varchar(50) NULL,
	fiochief varchar(90) NULL,
	customerscount int4 NULL,
	CONSTRAINT departments_pkey PRIMARY KEY (id)
);
--3. На кону конец года и необходимо выплачивать сотрудникам премию. Премия будет выплачиваться по совокупным оценкам, которые сотрудники получают в каждом квартале года. Создайте таблицу, в которой для каждого сотрудника будут его оценки за каждый квартал. Диапазон оценок от A – самая высокая, до E – самая низкая.
CREATE TABLE bonuses (
	id serial4 NOT NULL,
	customerid integer,
	quarterofyear integer, 
	value varchar(1),
	CONSTRAINT bonuses_pkey PRIMARY KEY (id)
);

--4. Несколько уточнений по предыдущим заданиям – в первой таблице должны быть записи как минимум о 5 сотрудниках, которые работают как минимум в 2-х разных отделах. Содержимое соответствующих атрибутов остается на совесть вашей фантазии, но, желательно соблюдать осмысленность и правильно выбирать типы данных (для зарплаты – числовой тип, для ФИО – строковый и т.д.)
insert into departments (title, fiochief, customerscount) values
('Руководство','Алексеев Борис Владимирович', 3),
('Отдел кадров','Боброва Вера Сергеевна', 5),
('Отдел информационных систем', 'Веников Дмитрий Геннадьевич',5);

INSERT INTO public.customers
(fio, birthday, firstday, title, titlelevel, salary, departmentid, driverslicense)
values
('Алексеев Борис Владимирович', '1975-01-01', '2017-01-09', 'Директор', 'lead', 4000.0, 1, true),
('Брилева Анна Дмитриевна', '1961-01-02', '2010-10-21', 'Заместитель директорр', 'lead', 3000.0, 1, true),
('Вознесенский Кирил Аркадьевич', '1980-05-09', '2010-10-21', 'Заместитель директора', 'lead', 3000.0, 1, true),
('Боброва Вера Сергеевна', '1965-01-08', '2004-01-18', 'Начальник отдела', 'senior', 2000.0, 2, false),
('Самойлов Игорь Николаевич', '1965-01-08', '2004-01-12', 'Заместитель начальника отдела', 'middle', 1200.0, 2, false),
('Карбышев Александр Иванович', '1965-09-08', '2000-01-13', 'Главный специалист-эксперт', 'middle', 1000.0, 2, false),
('Тутенкова Лидия Афанасьевна', '1965-07-08', '1999-03-17', 'Ведущий специалист-эксперт', 'junior', 700.0, 2, false),
('Храбров Евгений Алексеевич', '1965-04-08', '2002-05-16', 'Специалист 1 разряда', 'junior', 500.0, 2, false),
('Веников Дмитрий Геннадьевич', '1977-08-13', '2012-07-08', 'Начальник отдела', 'middle', 1300.0, 3, true),
('Самойлов Игорь Николаевич', '1967-08-08', '2011-06-14', 'Заместитель начальника отдела', 'middle', 1100.0, 2, true),
('Карбышев Александр Иванович', '1977-06-08', '2008-04-21', 'Главный специалист', 'middle', 880.0, 2, true),
('Тутенкова Лидия Афанасьевна', '1972-04-08', '2001-02-13', 'Ведущий специалист', 'junior', 600.0, 2, false),
('Храбров Евгений Алексеевич', '1973-02-08', '2002-03-02', 'Специалист 1 разряда', 'junior', 400.0, 2, false);

INSERT INTO public.bonuses
(customerid, quarterofyear,value)
values
(1,1,'A'), (2,1,'B'), (3,1,'A'), (4,1,'A'), (5,1,'B'), (6,1,'A'), (7,1,'A'), (8,1,'D'), (9,1,'A'), (10,1,'A'), (11,1,'B'), (12,1,'E'), (13,1,'C'),
(1,2,'B'), (2,2,'B'), (3,2,'A'), (4,2,'A'), (5,2,'B'), (6,2,'C'), (7,2,'A'), (8,2,'C'), (9,2,'A'), (10,2,'A'), (11,2,'B'), (12,2,'E'), (13,2,'B'),
(1,3,'A'), (2,3,'B'), (3,3,'A'), (4,3,'C'), (5,3,'B'), (6,3,'A'), (7,3,'A'), (8,3,'D'), (9,3,'A'), (10,3,'D'), (11,3,'B'), (12,3,'E'), (13,3,'C'),
(1,4,'B'), (2,4,'B'), (3,4,'A'), (4,4,'A'), (5,4,'B'), (6,4,'C'), (7,4,'A'), (8,4,'C'), (9,4,'A'), (10,4,'A'), (11,4,'B'), (12,4,'A'), (13,4,'B');

 --5. Ваша команда расширяется и руководство запланировало открыть новый отдел – отдел Интеллектуального анализа данных. На начальном этапе в команду наняли одного руководителя отдела и двух сотрудников. Добавьте необходимую информацию в соответствующие таблицы.
insert into departments (title, fiochief, customerscount) values
('Отдел интеллектуального анализа данных','Хашин Вадим Самуилович', 3);

INSERT INTO public.customers
(fio, birthday, firstday, title, titlelevel, salary, departmentid, driverslicense)
values
('Хашин Вадим Самуилович', '1980-02-13', '2022-11-01', 'Начальник отдела', 'lead', 1500.0, 1, true),
('Голованов Иван Иванович', '1979-05-17', '2022-11-01', 'Заместитель начальника отдела', 'senior', 1200.0, 1, true),
('Заходулин Максим Максимович', '1985-02-18', '2022-11-01', 'Главный специалист-экперт', 'senior', 1000.0, 1, true);

--6. Теперь пришла пора анализировать наши данные – напишите запросы для получения следующей информации:
-- Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании
select id, fio, (date_part('year', current_date)- date_part('year',firstday)) as stage  from customers --order by stage desc;

--Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников
select id, fio, (date_part('year', current_date)- date_part('year',firstday)) as stage  from customers fetch first 3 rows only;
--Уникальный номер сотрудников - водителей
select id from customers where driverslicense=true;
--Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E
select customerid from bonuses where value = 'D' or value ='E';
--Выведите самую высокую зарплату в компании.
select max(salary) from customers;
--Выведите название самого крупного отдела
select title from departments order by customerscount desc fetch first 1 rows only; 
--Выведите номера сотрудников от самых опытных до вновь прибывших
 select id, (date_part('year', current_date)- date_part('year',firstday)) as stage  from customers order by stage desc;
--Рассчитайте среднюю зарплату для каждого уровня сотрудников
select titlelevel, sum(salary) from customers group by titlelevel;
/*Добавьте столбец с информацией о коэффициенте годовой премии к основной таблице. 
 Коэффициент рассчитывается по такой схеме: базовое значение коэффициента – 1, каждая оценка действует на коэффициент так:
         Е – минус 20%
         D – минус 10%
         С – без изменений
         B – плюс 10%
         A – плюс 20%
Соответственно, сотрудник с оценками А, В, С, D – должен получить коэффициент 1.2.*/
alter table customers add column ratio float4;
update customers set ratio = 1;

update customers set ratio = ratio + 0.2 where id in (select customerid from bonuses where value = 'A' and quarterofyear=1);
update customers set ratio = ratio + 0.2 where id in (select customerid from bonuses where value = 'A' and quarterofyear=2);
update customers set ratio = ratio + 0.2 where id in (select customerid from bonuses where value = 'A' and quarterofyear=3);
update customers set ratio = ratio + 0.2 where id in (select customerid from bonuses where value = 'A' and quarterofyear=4);

update customers set ratio = ratio + 0.1 where id in (select customerid from bonuses where value = 'B' and quarterofyear=1);
update customers set ratio = ratio + 0.1 where id in (select customerid from bonuses where value = 'B' and quarterofyear=2);
update customers set ratio = ratio + 0.1 where id in (select customerid from bonuses where value = 'B' and quarterofyear=3);
update customers set ratio = ratio + 0.1 where id in (select customerid from bonuses where value = 'B' and quarterofyear=4);

update customers set ratio = ratio - 0.1 where id in (select customerid from bonuses where value = 'D' and quarterofyear=1);
update customers set ratio = ratio - 0.1 where id in (select customerid from bonuses where value = 'D' and quarterofyear=2);
update customers set ratio = ratio - 0.1 where id in (select customerid from bonuses where value = 'D' and quarterofyear=3);
update customers set ratio = ratio - 0.1 where id in (select customerid from bonuses where value = 'D' and quarterofyear=4); 

update customers set ratio = ratio - 0.2 where id in (select customerid from bonuses where value = 'E' and quarterofyear=1);
update customers set ratio = ratio - 0.2 where id in (select customerid from bonuses where value = 'E' and quarterofyear=2);
update customers set ratio = ratio - 0.2 where id in (select customerid from bonuses where value = 'E' and quarterofyear=3);
update customers set ratio = ratio - 0.2 where id in (select customerid from bonuses where value = 'E' and quarterofyear=4); 

--select customerid, count(quarterofyear)*0.2 as delta  from bonuses where value = 'A' group by customerid order by customerid