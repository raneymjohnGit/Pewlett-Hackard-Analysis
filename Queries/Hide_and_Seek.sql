Create table wordassociation(
	author int not null,
	word1 varchar(200) not null,
	word2 varchar(200) not null,
	source char(2) not null
);

	
Select * from wordassociation Where word1 = 'stone';
Select * from wordassociation Where author between 0 and 10;
Select * from wordassociation Where (word1 like '%pie%' or word2 like '%pie%');
Select * from wordassociation Where source = 'BC';
Select * from wordassociation Where source = 'BC' and author between 333 and 335;