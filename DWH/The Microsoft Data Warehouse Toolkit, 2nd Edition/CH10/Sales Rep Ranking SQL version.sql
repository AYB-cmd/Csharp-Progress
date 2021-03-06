USE AdventureWorksDW2008R2;
-- This is hard coded to work for Calendar year 2008 versus 2007.

SELECT   CurrentOrderYear, CurrentYear.EmployeeKey, CurrentYear.FirstName, 
         CurrentYear.LastName, SalesAmnt, CurrentRank, PriorSalesAmnt, 
         PriorRank, PriorRank - CurrentRank AS RankChange
FROM      
(
SELECT    CalendarYear CurrentOrderYear, Emp.EmployeeKey, 
          FirstName, LastName, 
          SUM(SalesAmount*AverageRate) SalesAmnt,
          RANK() OVER (ORDER BY SUM(Sales.SalesAmount*AverageRate) DESC) AS 
          CurrentRank
FROM      dbo.DimEmployee Emp JOIN dbo.FactResellerSales Sales on 
          Emp.EmployeeKey = Sales.EmployeeKey
          JOIN DimDate on Sales.OrderDateKey = DimDate.DateKey
          JOIN dbo.FactCurrencyRate Rate on 
              Sales.CurrencyKey = Rate.CurrencyKey
              AND Sales.OrderDateKey = Rate.DateKey
WHERE     CalendarYear='2008' 
GROUP BY  CalendarYear, Emp.EmployeeKey, FirstName, LastName
) CurrentYear
FULL OUTER JOIN
(
SELECT    CalendarYear PriorOrderYear, Emp.EmployeeKey, 
          FirstName, LastName, 
          SUM(SalesAmount*AverageRate) PriorSalesAmnt,
          RANK() OVER (ORDER BY SUM(Sales.SalesAmount*AverageRate) DESC) AS 
          PriorRank
FROM      dbo.DimEmployee Emp JOIN dbo.FactResellerSales Sales on 
          Emp.EmployeeKey = Sales.EmployeeKey
          JOIN DimDate on Sales.OrderDateKey = DimDate.DateKey
          JOIN dbo.FactCurrencyRate Rate on 
              Sales.CurrencyKey = Rate.CurrencyKey
              AND Sales.OrderDateKey = Rate.DateKey
WHERE     CalendarYear = '2007' 
GROUP BY  CalendarYear, Emp.EmployeeKey, FirstName, LastName
) PriorYear
ON CurrentYear.EmployeeKey = PriorYear.EmployeeKey
ORDER BY CurrentRank