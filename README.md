# SQL GROUP BY and Aggregate Functions: Code Program Guide
## Introduction

This guide provides an overview of how to use GROUP BY and aggregate functions in SQL. We will also cover how to filter grouped data using the HAVING clause.
Examples of SQL queries will be provided to demonstrate various aggregate functions like COUNT(), SUM(), AVG(), MIN(), and MAX().

## GROUP BY in SQL: Explanation

The GROUP BY clause in SQL is used to arrange identical data into groups based on one or more columns. It’s often used along with aggregate functions such as COUNT(), SUM(), AVG(), MAX(), or MIN() to perform calculations on these groups.

## Key Points about GROUP BY:

**Group Rows**: GROUP BY groups rows that have the same values in specified columns into summary rows.

**Aggregate Functions**: It is typically used with aggregate functions to perform calculations like counting the number of rows, summing values, calculating averages, and finding the maximum or minimum values in a group.

**Order of Execution**: GROUP BY is applied after the WHERE clause filters rows but before the final selection of rows.

**Syntax**

SELECT column_name, AGGREGATE_FUNCTION(column_name)

FROM table_name

WHERE conditions

GROUP BY column_name;

column_name: The column(s) on which you want to group your data.

AGGREGATE_FUNCTION: Any aggregate function like COUNT(), SUM(), AVG(), MAX(), or MIN().

WHERE conditions: Optional. Used to filter records before applying the grouping.

GROUP BY column_name: Specifies the column(s) to group rows by.

## How GROUP BY Works

Before Aggregation: SQL first retrieves all rows matching the conditions (if a WHERE clause is used).
Grouping: SQL then groups the rows that shares the same value in the specified column(s).
Apply Aggregate Functions: SQL applies the aggregate functions (like SUM(), AVG()) on each group and returns a single value for each group.

## Using HAVING with GROUP BY

Sometimes, you want to filter the results of a grouped query. In such cases, the HAVING clause is used. While WHERE filters rows before grouping, HAVING filters after the grouping is done, based on aggregate results.







