	INSERT INTO public.profile (id, profile_name,description) VALUES (1, 'ADMINISTRADOR','Administrator');
	INSERT INTO public.profile (id, profile_name,description) VALUES (3, 'LOAN','Loan');
	INSERT INTO public.profile (id, profile_name,description) VALUES (4, 'REALTOR','Realtor');
	
	INSERT INTO public.users (id, rut,names,middle_name,last_name,mail,business_position,username,pass,id_profile) VALUES (1, '26873611-5','Jesús Manuel','García','Hernandez','jesus.garcia@open2000.cl','Lider Técnico','jesus.garcia','$2a$10$Ood6ka2EnrwXrd4XqF4DUeMZghaFw6va.wnO1noxkIglFCVcyUWJm',1);