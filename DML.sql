	INSERT INTO public.profile (id, profile_name,description) VALUES (1, 'ADMINISTRADOR','Administrator');
	INSERT INTO public.profile (id, profile_name,description) VALUES (3, 'LOAN','Loan');
	INSERT INTO public.profile (id, profile_name,description) VALUES (4, 'REALTOR','Realtor');

	INSERT INTO public.broker_company (id,"name",phone,physical_add,web_site) VALUES
	 (1,'DGPinnacle Home Loans','3053080000','171 nw','https://dgpinnacle.com');
	
	INSERT INTO public.users (id, social_security_number ,fullname,mail,business_position,username,pass,id_profile) VALUES (1, '26873611-5','Noel veitia','nveitia@dgpinnacle.com','LOAN','jesus.garcia','$2a$10$Ood6ka2EnrwXrd4XqF4DUeMZghaFw6va.wnO1noxkIglFCVcyUWJm',1);
	INSERT INTO public.loan_officer (cellphone,email,last_name,mailing_add,"name",nmls,id) VALUES ('fgbhfgh','jesusmanuel garcia@gmail.com','Garcia','fghfgh','Jesus','fghfgh',1);

	INSERT INTO public.users (id, social_security_number ,fullname,mail,business_position,username,pass,id_profile) VALUES (2, '26873611-5','joanna Miro Mayor','joannamiro@nauta.cu','Lider Técnico','joanna','$2a$10$Ood6ka2EnrwXrd4XqF4DUeMZghaFw6va.wnO1noxkIglFCVcyUWJm',1);
	INSERT INTO public.users (id, social_security_number ,fullname,mail,business_position,username,pass,id_profile) VALUES (3, '26873611-5','joan Miro Mayor','joannamiro@nauta.cu','Lider Técnico','joan','$2a$10$Ood6ka2EnrwXrd4XqF4DUeMZghaFw6va.wnO1noxkIglFCVcyUWJm',1);

	INSERT INTO public.realtor (cellphone,email,last_name,license_number,mailing_add,"name",notes,id,broker_company_id) VALUES
	 ('+5353334545','joannamiro@nauta.cu','Miro','91060722273','joannamiro@nauta.cu','Joanna','notes',2,1),
	 ('305555555','joanmiro@gmail.com','Miro','91060722273','joanmiro@gmail.com','Joan','notes',3,1);


	INSERT INTO public.client (id,cellphone,email,last_name,mailing_add,"name")
	VALUES (1,'11111','test@test.cl','Gonzales','SW Miami','Juana');


	INSERT INTO public.loan_client (id,client_id,loan_id)
	VALUES (1,1,1);

	INSERT INTO public.operation (id,"name",loan_id)
	VALUES (1,'Letter',1);

	INSERT INTO public.client_operation (id,client_id,operation_id)
	VALUES (1,1,1);

	INSERT INTO public.realtor_operation (id,realtor_id,operation_id)
	VALUES (1,2,1);
	INSERT INTO public.realtor_operation (id,realtor_id,operation_id)
	VALUES (2,3,1);

	INSERT INTO public.letter_fixdata (id,conditions,deleted,finaltext,subject) VALUES
	 (1,'Comditions',false,'finaltext','subject');

	 INSERT INTO public.letter_config (id,active,deleted,hoa,insurance,interest,loan_amount,loan_term,loan_type,"location",ltv,max_pay,mi,price,taxes,unique_key,letter_fix_data_id,operation_id) VALUES
	 (4,true,false,0.0,200.0,3.0,383000.0,360,'FHA','Miramar, 33025',94.0,15000.0,1.5,400000,450.0,'jo8x3hmd',1,1);