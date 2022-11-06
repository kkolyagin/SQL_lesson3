CREATE TABLE public.customers (
	id serial4 NOT NULL,
	fio varchar(90) NULL,
	birthday date NULL,
	firstday date NULL,
	title varchar(50) NULL,
	titlelevel varchar(30) NULL,
	salarylevel varchar(30) NULL,
	departmentid int4 NULL,
	driverslicense bool NULL,
	CONSTRAINT customers_pkey PRIMARY KEY (id)
);