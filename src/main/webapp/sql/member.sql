-- member 테이블
create table member(
	id varchar(10) not null,
	password varchar(10) not null,
	name varchar(20) not null,
	gender varchar(4),
	birth varchar(20),
	mail varchar(30),
	phone varchar(20),
	address varchar(50),
	regist_day varchar(30),
	primary key(id)
);

insert into member values ('cloud', 'm123456@', '구름이', '여', '1995-10-09',
	'cloud@naver.com', '010-1234-5678', '서울시 구로구', '2022-08-17');
	
drop table member;

select * from member;