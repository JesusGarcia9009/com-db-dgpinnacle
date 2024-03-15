CREATE TABLE public.profile (
	id serial NOT NULL,
	profile_name varchar(100) NOT NULL,
	description varchar(200) NULL,
	primary key (id)
);


CREATE TABLE public.users (
	id serial NOT NULL,
	rut varchar(50) NOT NULL,
	names varchar(50) NOT NULL,
	middle_name varchar(50) NOT NULL,
	last_name varchar(50) NULL,
	mail varchar(50) NULL,
	business_position varchar(50) NULL,
	username varchar(200) NOT NULL,
	pass varchar(200) NOT NULL,
	id_profile int8 NOT NULL,
	primary key (id) 
);

alter table public.users add constraint fk_users_profile foreign key (id_profile)  references public.profile(id);