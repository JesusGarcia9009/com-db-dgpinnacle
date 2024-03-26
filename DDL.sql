CREATE TABLE public.profile (
	id serial NOT NULL,
	profile_name varchar(100) NOT NULL,
	description varchar(200) NULL,
	primary key (id)
);


CREATE TABLE public.users (
	id serial NOT NULL,
	social_security_number varchar(50) NULL,
	fullname varchar(50) NOT NULL,
	mail varchar(50) NOT NULL,
	business_position varchar(50) NULL,
	username varchar(200) NOT NULL,
	pass varchar(200) NOT NULL,
	id_profile int8 NOT NULL,
	primary key (id) 
);

alter table public.users add constraint fk_users_profile foreign key (id_profile)  references public.profile(id);


-- business model


CREATE TABLE public.broker_company (
	id SERIAL NOT NULL,
	"name" varchar(40) NOT NULL,
	phone varchar(50) NOT NULL,
	physical_add varchar(50) NOT NULL,
	web_site varchar(500) NULL,
	primary key (id)
);

CREATE TABLE public.client (
	id SERIAL NOT NULL,
	cellphone varchar(40) NOT NULL,
	email varchar(50) NOT NULL,
	last_name varchar(40) NOT NULL,
	mailing_add varchar(500) NULL,
	"name" varchar(40) NOT NULL,
	primary key (id)
);

CREATE TABLE public.loan_officer (
	id SERIAL NOT NULL,
	cellphone varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	last_name varchar(36) NOT NULL,
	mailing_add varchar(75) NOT NULL,
	"name" varchar(36) NOT NULL,
	nmls varchar(50) NOT NULL,
	primary key (id),
	CONSTRAINT loan_officer_users FOREIGN KEY (id) REFERENCES public.users(id)
);

CREATE TABLE public.loan_client (
	id SERIAL NOT NULL,
	client_id int8 NOT NULL,
	loan_id int8 NOT NULL,
	primary key (id)
);

alter table public.loan_client add constraint fk_loan_client_loan_officer foreign key (loan_id)  references public.loan_officer(id);
alter table public.loan_client add constraint fk_loan_client_client foreign key (client_id)  references public.client(id);

CREATE TABLE public.realtor (
	id SERIAL NOT NULL,
	cellphone varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	last_name varchar(40) NOT NULL,
	license_number varchar(20) NOT NULL,
	mailing_add varchar(500) NULL,
	"name" varchar(40) NOT NULL,
	notes varchar(500) NOT NULL,
	broker_company_id int8 NULL,
	primary key (id),
	CONSTRAINT realtor_users FOREIGN KEY (id) REFERENCES public.users(id)
);
alter table public.realtor add constraint fk_realtor_broker_company foreign key (broker_company_id)  references public.broker_company(id);

CREATE TABLE public.operation (
	id SERIAL NOT NULL,
	"name" varchar(36) NOT NULL,
	loan_id int8 NOT NULL,
	primary key (id)
);

alter table public.operation add constraint fk_operation_loan_officer foreign key (loan_id)  references public.loan_officer(id);

CREATE TABLE public.realtor_operation (
	id SERIAL NOT NULL,
	realtor_id int8 NOT NULL,
	operation_id int8 NOT NULL,
	primary key (id)
);

alter table public.realtor_operation add constraint fk_realtor_operation_realtor foreign key (realtor_id)  references public.realtor(id);
alter table public.realtor_operation add constraint fk_realtor_operation_operation foreign key (operation_id)  references public.operation(id);



CREATE TABLE public.client_operation (
	id SERIAL NOT NULL,
	client_id int8 NOT NULL,
	operation_id int8 NOT NULL,
	primary key (id)
);

alter table public.client_operation add constraint fk_client_operation_operation foreign key (operation_id)  references public.operation(id);
alter table public.client_operation add constraint fk_client_operation_client foreign key (client_id)  references public.client(id);

CREATE TABLE public.letter_fixdata (
	id SERIAL NOT NULL,
	conditions varchar(1000) NOT NULL,
	deleted bool NOT NULL,
	finaltext varchar(1000) NOT NULL,
	subject varchar(1000) NOT NULL,
	primary key (id)
);

CREATE TABLE public.letter_config (
	id SERIAL NOT NULL,
	active bool NULL,
	deleted bool NULL,
	hoa float8 NOT NULL,
	insurance float8 NOT NULL,
	interest float8 NOT NULL,
	loan_amount float8 NULL,
	loan_term int4 NOT NULL,
	loan_type varchar(500) NOT NULL,
	"location" varchar(500) NOT NULL,
	ltv float8 NOT NULL,
	max_pay float8 NOT NULL,
	mi float8 NULL,
	price int4 NOT NULL,
	taxes float8 NOT NULL,
	unique_key varchar(250) NULL,
	letter_fix_data_id int8 NULL,
	operation_id int8 NULL,
	primary key (id),
	CONSTRAINT letter_config_hoa_check CHECK ((hoa >= (0)::double precision)),
	CONSTRAINT letter_config_insurance_check CHECK ((insurance >= (0)::double precision)),
	CONSTRAINT letter_config_interest_check CHECK ((interest >= (0)::double precision)),
	CONSTRAINT letter_config_ltv_check CHECK ((ltv >= (0)::double precision)),
	CONSTRAINT letter_config_max_pay_check CHECK ((max_pay >= (0)::double precision)),
	CONSTRAINT letter_config_mi_check CHECK ((mi >= (0)::double precision)),
	CONSTRAINT letter_config_taxes_check CHECK ((taxes >= (0)::double precision))
);

alter table public.letter_config add constraint fk_letter_config_operation foreign key (operation_id)  references public.operation(id);
alter table public.letter_config add constraint fk_letter_config_letter_fix_data foreign key (letter_fix_data_id)  references public.letter_fixdata(id);












