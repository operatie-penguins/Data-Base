use ITA_Support
go

declare @courceNumber int;

set @courceNumber = 1;

while @courceNumber < 500
begin

insert into Cources values(@courceNumber, CAST ((1000-@courceNumber) as varchar(3)) + 'A', 'Реализация баз данных в Microsoft SQL Server 2008', 'Проводимый под руководством инструктора пятидневный курс предлагает слушателям знания и навыки в области внедрения СУБД Microsoft SQL Server 2008. Целью курса является обучить слушателей использованию возможностей и средств продукта SQL Server 2008, предназначенных для внедрения СУБД.');

set @courceNumber = @courceNumber + 1;

end;


set @courceNumber = 1;

while @courceNumber < 500
begin


delete from Cources where Id = @courceNumber;

set @courceNumber = @courceNumber + 3;

end;
