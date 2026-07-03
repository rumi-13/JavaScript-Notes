DROP TABLE IF EXISTS Students;

CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    course VARCHAR(50),
    class_year VARCHAR(20),
    city VARCHAR(50),
    age INT,
    cgpa DECIMAL(3,2)
);

INSERT INTO Students VALUES (1001,'Aisha','Sharma','Female','9433218196','aisha1@college.edu','BCA','1st Year','Srinagar',21,6.52);
INSERT INTO Students VALUES (1002,'Nisha','Sharma','Female','9838637940','nisha2@college.edu','BSc CS','4th Year','Jaipur',22,6.18);
INSERT INTO Students VALUES (1003,'Aditya','Khan','Male','9161559407','aditya3@college.edu','MCA','4th Year','Srinagar',22,9.15);
INSERT INTO Students VALUES (1004,'Nisha','Patel','Female','9931034131','nisha4@college.edu','MBA','3rd Year','Chandigarh',23,6.22);
INSERT INTO Students VALUES (1005,'Fatima','Singh','Female','9419283276','fatima5@college.edu','BCom','2nd Year','Jaipur',18,6.51);
INSERT INTO Students VALUES (1006,'Zara','Patel','Female','9641395376','zara6@college.edu','MSc IT','2nd Year','Bengaluru',20,6.59);
INSERT INTO Students VALUES (1007,'Sana','Das','Female','9496965328','sana7@college.edu','MSc IT','1st Year','Delhi',19,6.17);
INSERT INTO Students VALUES (1008,'Meera','Bhat','Female','9916697848','meera8@college.edu','BCA','1st Year','Bengaluru',23,5.99);
INSERT INTO Students VALUES (1009,'Priya','Gupta','Female','9704828148','priya9@college.edu','BTech CSE','2nd Year','Jaipur',20,7.87);
INSERT INTO Students VALUES (1010,'Aryan','Sharma','Male','9957015430','aryan10@college.edu','BTech CSE','1st Year','Srinagar',25,9.09);
INSERT INTO Students VALUES (1011,'Sana','Gupta','Female','9278248963','sana11@college.edu','BTech CSE','3rd Year','Lucknow',23,7.43);
INSERT INTO Students VALUES (1012,'Aryan','Malik','Male','9133150983','aryan12@college.edu','BTech CSE','1st Year','Srinagar',18,6.51);
INSERT INTO Students VALUES (1013,'Zara','Patel','Female','9183473829','zara13@college.edu','MSc IT','2nd Year','Chandigarh',24,6.34);
INSERT INTO Students VALUES (1014,'Aisha','Bhat','Female','9566701065','aisha14@college.edu','MCA','2nd Year','Pune',21,7.86);
INSERT INTO Students VALUES (1015,'Kabir','Bhat','Male','9247317810','kabir15@college.edu','BCA','1st Year','Pune',20,7.29);
INSERT INTO Students VALUES (1016,'Noor','Singh','Female','9602606474','noor16@college.edu','MBA','4th Year','Mumbai',21,6.81);
INSERT INTO Students VALUES (1017,'Zara','Joshi','Female','9805009788','zara17@college.edu','BSc CS','1st Year','Srinagar',20,5.8);
INSERT INTO Students VALUES (1018,'Rohan','Singh','Male','9619399091','rohan18@college.edu','MBA','3rd Year','Bengaluru',21,8.45);
INSERT INTO Students VALUES (1019,'Aditya','Singh','Male','9462475107','aditya19@college.edu','MCA','1st Year','Pune',22,6.08);
INSERT INTO Students VALUES (1020,'Fatima','Khan','Female','9354278498','fatima20@college.edu','BCA','3rd Year','Srinagar',20,6.66);
INSERT INTO Students VALUES (1021,'Aisha','Das','Female','9244935348','aisha21@college.edu','MSc IT','3rd Year','Delhi',19,8.29);
INSERT INTO Students VALUES (1022,'Rehan','Sharma','Male','9052427868','rehan22@college.edu','BCA','1st Year','Srinagar',20,7.9);
INSERT INTO Students VALUES (1023,'Fatima','Joshi','Female','9826204505','fatima23@college.edu','BTech CSE','2nd Year','Srinagar',23,8.93);
INSERT INTO Students VALUES (1024,'Priya','Joshi','Female','9232260256','priya24@college.edu','BTech CSE','3rd Year','Mumbai',19,7.18);
INSERT INTO Students VALUES (1025,'Zara','Malik','Female','9337543303','zara25@college.edu','MBA','3rd Year','Bengaluru',19,9.75);
INSERT INTO Students VALUES (1026,'Rehan','Patel','Male','9868501429','rehan26@college.edu','BCom','1st Year','Srinagar',24,7.02);
INSERT INTO Students VALUES (1027,'Aditya','Bhat','Male','9981693406','aditya27@college.edu','BCA','2nd Year','Jaipur',24,5.81);
INSERT INTO Students VALUES (1028,'Aditya','Joshi','Male','9514846564','aditya28@college.edu','BSc CS','2nd Year','Lucknow',24,8.48);
INSERT INTO Students VALUES (1029,'Meera','Joshi','Female','9946804436','meera29@college.edu','BA','4th Year','Chandigarh',25,8.47);
INSERT INTO Students VALUES (1030,'Aryan','Malik','Male','9214895134','aryan30@college.edu','BTech CSE','2nd Year','Mumbai',18,5.7);
INSERT INTO Students VALUES (1031,'Noor','Joshi','Female','9176936763','noor31@college.edu','BSc CS','1st Year','Srinagar',24,6.46);
INSERT INTO Students VALUES (1032,'Aryan','Malik','Male','9083172788','aryan32@college.edu','BA','4th Year','Lucknow',25,9.45);
INSERT INTO Students VALUES (1033,'Noor','Malik','Female','9434873471','noor33@college.edu','BCom','2nd Year','Bengaluru',23,6.91);
INSERT INTO Students VALUES (1034,'Sana','Khan','Female','9223623166','sana34@college.edu','BA','4th Year','Lucknow',18,6.41);
INSERT INTO Students VALUES (1035,'Priya','Bhat','Female','9909670546','priya35@college.edu','MBA','2nd Year','Chandigarh',21,6.7);
INSERT INTO Students VALUES (1036,'Noor','Sharma','Female','9656272980','noor36@college.edu','MBA','1st Year','Srinagar',24,6.1);
INSERT INTO Students VALUES (1037,'Vihaan','Gupta','Male','9046537556','vihaan37@college.edu','BCom','4th Year','Bengaluru',19,7.57);
INSERT INTO Students VALUES (1038,'Sana','Sharma','Female','9531003309','sana38@college.edu','BSc CS','2nd Year','Mumbai',25,8.45);
INSERT INTO Students VALUES (1039,'Rahul','Singh','Male','9745299124','rahul39@college.edu','MCA','1st Year','Bengaluru',24,7.25);
INSERT INTO Students VALUES (1040,'Arjun','Khan','Male','9931491905','arjun40@college.edu','MBA','3rd Year','Srinagar',23,5.56);
INSERT INTO Students VALUES (1041,'Priya','Malik','Female','9165726284','priya41@college.edu','MSc IT','4th Year','Lucknow',22,6.92);
INSERT INTO Students VALUES (1042,'Sara','Khan','Female','9473799650','sara42@college.edu','MSc IT','3rd Year','Mumbai',25,6.43);
INSERT INTO Students VALUES (1043,'Rehan','Patel','Male','9494808313','rehan43@college.edu','MBA','4th Year','Pune',25,8.34);
INSERT INTO Students VALUES (1044,'Noor','Malik','Female','9014363495','noor44@college.edu','MSc IT','3rd Year','Lucknow',23,7.05);
INSERT INTO Students VALUES (1045,'Vihaan','Verma','Male','9443135182','vihaan45@college.edu','BTech CSE','2nd Year','Chandigarh',22,8.69);
INSERT INTO Students VALUES (1046,'Aryan','Joshi','Male','9413435240','aryan46@college.edu','BSc CS','3rd Year','Delhi',18,7.93);
INSERT INTO Students VALUES (1047,'Kabir','Malik','Male','9109477752','kabir47@college.edu','BCA','3rd Year','Chandigarh',19,9.12);
INSERT INTO Students VALUES (1048,'Ishaan','Malik','Male','9190229413','ishaan48@college.edu','MCA','4th Year','Pune',24,7.48);
INSERT INTO Students VALUES (1049,'Vihaan','Verma','Male','9964990913','vihaan49@college.edu','BTech CSE','3rd Year','Srinagar',20,6.56);
INSERT INTO Students VALUES (1050,'Sana','Khan','Female','9206797403','sana50@college.edu','BCom','3rd Year','Chandigarh',19,8.52);
INSERT INTO Students VALUES (1051,'Rehan','Joshi','Male','9361832421','rehan51@college.edu','BCA','2nd Year','Bengaluru',22,7.43);
INSERT INTO Students VALUES (1052,'Vihaan','Verma','Male','9648877190','vihaan52@college.edu','MBA','3rd Year','Bengaluru',18,5.9);
INSERT INTO Students VALUES (1053,'Rahul','Joshi','Male','9049027874','rahul53@college.edu','BSc CS','4th Year','Chandigarh',19,7.57);
INSERT INTO Students VALUES (1054,'Priya','Patel','Female','9512567468','priya54@college.edu','BCA','4th Year','Srinagar',23,6.61);
INSERT INTO Students VALUES (1055,'Aisha','Bhat','Female','9808760385','aisha55@college.edu','MSc IT','4th Year','Delhi',21,6.68);
INSERT INTO Students VALUES (1056,'Kabir','Verma','Male','9771093248','kabir56@college.edu','BCA','4th Year','Srinagar',21,9.87);
INSERT INTO Students VALUES (1057,'Aisha','Malik','Female','9127484677','aisha57@college.edu','BTech CSE','4th Year','Mumbai',24,6.34);
INSERT INTO Students VALUES (1058,'Nisha','Das','Female','9214658404','nisha58@college.edu','BCom','4th Year','Mumbai',25,7.87);
INSERT INTO Students VALUES (1059,'Fatima','Patel','Female','9886753396','fatima59@college.edu','BTech CSE','4th Year','Delhi',23,8.78);
INSERT INTO Students VALUES (1060,'Ishaan','Bhat','Male','9270289517','ishaan60@college.edu','MCA','4th Year','Delhi',20,7.3);
INSERT INTO Students VALUES (1061,'Kabir','Khan','Male','9745961586','kabir61@college.edu','BA','4th Year','Delhi',19,6.53);
INSERT INTO Students VALUES (1062,'Ananya','Singh','Female','9161172400','ananya62@college.edu','BA','1st Year','Bengaluru',23,7.15);
INSERT INTO Students VALUES (1063,'Kabir','Singh','Male','9869222196','kabir63@college.edu','BTech CSE','4th Year','Mumbai',21,7.53);
INSERT INTO Students VALUES (1064,'Rehan','Malik','Male','9407482175','rehan64@college.edu','BCom','4th Year','Bengaluru',25,9.22);
INSERT INTO Students VALUES (1065,'Arjun','Bhat','Male','9713695944','arjun65@college.edu','BCA','4th Year','Bengaluru',18,7.99);
INSERT INTO Students VALUES (1066,'Zara','Joshi','Female','9743953394','zara66@college.edu','BSc CS','1st Year','Delhi',22,8.97);
INSERT INTO Students VALUES (1067,'Zara','Joshi','Female','9521456232','zara67@college.edu','BA','3rd Year','Mumbai',22,9.52);
INSERT INTO Students VALUES (1068,'Noor','Verma','Female','9517123685','noor68@college.edu','MCA','4th Year','Delhi',22,7.86);
INSERT INTO Students VALUES (1069,'Vihaan','Patel','Male','9496513709','vihaan69@college.edu','BA','2nd Year','Srinagar',25,9.5);
INSERT INTO Students VALUES (1070,'Ananya','Bhat','Female','9120047113','ananya70@college.edu','BSc CS','4th Year','Chandigarh',23,8.45);
INSERT INTO Students VALUES (1071,'Sana','Bhat','Female','9926179640','sana71@college.edu','BA','2nd Year','Chandigarh',25,9.68);
INSERT INTO Students VALUES (1072,'Fatima','Khan','Female','9585064317','fatima72@college.edu','MCA','2nd Year','Delhi',18,8.96);
INSERT INTO Students VALUES (1073,'Sara','Gupta','Female','9931839335','sara73@college.edu','BSc CS','1st Year','Bengaluru',20,9.85);
INSERT INTO Students VALUES (1074,'Sana','Verma','Female','9210205395','sana74@college.edu','BCA','2nd Year','Bengaluru',18,6.06);
INSERT INTO Students VALUES (1075,'Priya','Das','Female','9117758917','priya75@college.edu','BTech CSE','1st Year','Bengaluru',25,8.33);
INSERT INTO Students VALUES (1076,'Ayaan','Sharma','Male','9766177115','ayaan76@college.edu','BSc CS','1st Year','Mumbai',22,8.25);
INSERT INTO Students VALUES (1077,'Rahul','Das','Male','9569847896','rahul77@college.edu','MCA','1st Year','Pune',24,7.49);
INSERT INTO Students VALUES (1078,'Sara','Bhat','Female','9576615654','sara78@college.edu','BA','2nd Year','Chandigarh',19,5.9);
INSERT INTO Students VALUES (1079,'Rohan','Khan','Male','9615280988','rohan79@college.edu','BA','1st Year','Lucknow',23,9.34);
INSERT INTO Students VALUES (1080,'Priya','Sharma','Female','9494519832','priya80@college.edu','MSc IT','2nd Year','Srinagar',23,9.22);
INSERT INTO Students VALUES (1081,'Fatima','Khan','Female','9493689980','fatima81@college.edu','BCom','1st Year','Mumbai',22,8.59);
INSERT INTO Students VALUES (1082,'Ananya','Patel','Female','9502296120','ananya82@college.edu','MCA','2nd Year','Lucknow',24,7.5);
INSERT INTO Students VALUES (1083,'Meera','Patel','Female','9459910229','meera83@college.edu','BCA','1st Year','Bengaluru',25,8.41);
INSERT INTO Students VALUES (1084,'Noor','Joshi','Female','9764381561','noor84@college.edu','BCom','4th Year','Bengaluru',18,6.47);
INSERT INTO Students VALUES (1085,'Nisha','Sharma','Female','9034324451','nisha85@college.edu','BCA','4th Year','Lucknow',20,6.07);
INSERT INTO Students VALUES (1086,'Sana','Singh','Female','9885160607','sana86@college.edu','MCA','3rd Year','Lucknow',24,8.62);
INSERT INTO Students VALUES (1087,'Priya','Verma','Female','9160529751','priya87@college.edu','MBA','1st Year','Pune',24,8.09);
INSERT INTO Students VALUES (1088,'Aryan','Khan','Male','9645352181','aryan88@college.edu','BTech CSE','3rd Year','Jaipur',20,6.54);
INSERT INTO Students VALUES (1089,'Kabir','Verma','Male','9329212779','kabir89@college.edu','MSc IT','3rd Year','Jaipur',20,7.43);
INSERT INTO Students VALUES (1090,'Noor','Malik','Female','9449058147','noor90@college.edu','MSc IT','1st Year','Delhi',23,9.16);
INSERT INTO Students VALUES (1091,'Rohan','Khan','Male','9998679807','rohan91@college.edu','BTech CSE','3rd Year','Chandigarh',20,9.71);
INSERT INTO Students VALUES (1092,'Vihaan','Khan','Male','9518203778','vihaan92@college.edu','BSc CS','3rd Year','Jaipur',22,7.2);
INSERT INTO Students VALUES (1093,'Aditya','Joshi','Male','9051518644','aditya93@college.edu','BSc CS','3rd Year','Srinagar',20,9.53);
INSERT INTO Students VALUES (1094,'Ananya','Bhat','Female','9291486528','ananya94@college.edu','MCA','4th Year','Jaipur',18,7.1);
INSERT INTO Students VALUES (1095,'Meera','Singh','Female','9573322141','meera95@college.edu','BCA','3rd Year','Mumbai',24,6.18);
INSERT INTO Students VALUES (1096,'Meera','Joshi','Female','9270653794','meera96@college.edu','MSc IT','2nd Year','Pune',22,9.75);
INSERT INTO Students VALUES (1097,'Noor','Singh','Female','9597746886','noor97@college.edu','BSc CS','2nd Year','Mumbai',22,5.73);
INSERT INTO Students VALUES (1098,'Noor','Patel','Female','9818141247','noor98@college.edu','BSc CS','4th Year','Srinagar',21,9.09);
INSERT INTO Students VALUES (1099,'Fatima','Sharma','Female','9606853615','fatima99@college.edu','BTech CSE','1st Year','Jaipur',19,9.19);
INSERT INTO Students VALUES (1100,'Aditya','Gupta','Male','9204727790','aditya100@college.edu','MCA','1st Year','Bengaluru',21,9.17);