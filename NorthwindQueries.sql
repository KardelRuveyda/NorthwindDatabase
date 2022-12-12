--Where koşulu kullanımı
select * from Products
where UnitPrice > 53

--Where koşulu ( iki condition ve sıralama)
select * from Products
where UnitPrice>53 and UnitsInStock < 42
order by ProductID desc 

-- Where koşulu ( üç condition,sıralama ve top ile sayı belirleme.)
select top 5 * from Products
where UnitPrice>53 and UnitsInStock < 42 and Discontinued = 0
order by ProductID desc 

--Tablodaki kayıt sayısını getirme.
select count(*) from Products
where UnitPrice>53 and UnitsInStock < 42


-- Tablodaki ortalama fiyatı getirme işlemi.

select AVG(UnitPrice) from Products

-- Tablodaki Stock oranlarının toplamını getirme işlemi. 

select SUM(UnitsInStock) from Products

--Tabloda aynı olan verilerin, tekrarlı verilerin getirilmesini engelleme
select DISTINCT SupplierID from Products

-- Tabloda olmayan kayıtları getir. ( Discounted 0 olmayanları getir gibi. )

select * from Products
where Discontinued !=0

select * from Products
where Discontinued <> 0

-- Tabloda içerisinde "x" değeri geçen kayıtları getir. veya getirme. 
--Alice Mutton
-- Alice ile başlayan, Alice ile biten ve içerisinde Alice geçen
--Alice ile başlayan
select * from Products
where ProductName like 'Alice%'

-- Alice ile biten
select * from Products
where ProductName like '%Alice'

-- İçerisinde Alice geçen
select * from Products
where ProductName like '%Alice%'

-- Birden fazla OR yapmak için ? "IN" sorgusu. 

select * from Products
where CategoryID in(1,2,3)

select * from Products
where CategoryID=1 or CategoryID=2 or CategoryID=3
-- Bazı sayılar arasında  getir işlemi ( Between)

--18 ile 40 arasındakileri getirsin.
SELECT * FROM Products
where UnitPrice >= 18 and UnitPrice <= 40

select * from Products
where UnitPrice BETWEEN 18 and 40

--Aliases kavramı
 
select * from Products
where Products.UnitPrice > 18

select * from Products p
where p.UnitPrice > 18

select * from Products as p
where p.UnitPrice > 18

--Join işlemleri 
-- Inner join , Left Join , Right Join, Union
select o.ShipName,o.ShipAddress,od.UnitPrice,* from Orders o
left join [Order Details] od on o.OrderID = od.OrderID
where od.Quantity > 10 and od.UnitPrice > 40
order by o.OrderDate desc 

select * from Orders
union all
select * from [Order Details]

-- Daha karmaşık sorgular için Subquery kavramı.
-- Veri tabanın bağlandıktan sonra kod tarafında sql ile ilgili işlemler yapmak mümkün
-- Linq 
-- Karmaşık sorgular için ? SP'lerden yararlanıyoruz. View'lardan yararlanırız.
-- Code First 

--Otomatik bir Job kurulumu için 
-- Öncelikle benden istenen rapor için Sp veya View yazarım. ( Veri tabanında yazdım. ) 
-- SP 'yi çekecek Excel'i mail olarak kişilere atacak bir servis yazdım. ( Backend) 
-- Her sabah 8.00'da atmak kimin işi? MSSQL "JOB" kavramı denilir.
