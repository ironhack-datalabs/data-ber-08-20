-- Challenge 1

select a.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", t.title as TITLE, p.pub_name as PUBLISHER
from authors a
inner join titleauthor ta on a.au_id=ta.au_id
inner join titles t on ta.title_id=t.title_id
inner join publishers p on t.pub_id=p.pub_id;

-- Challenge 2

select a.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", p.pub_name as PUBLISHER, count(t.title_id) as "TITLE COUNT"
from authors a
inner join titleauthor ta on a.au_id=ta.au_id
inner join titles t on ta.title_id=t.title_id
inner join publishers p on t.pub_id=p.pub_id
group by a.au_id, p.pub_id;

-- Challenge 3

select a.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", sum(s.qty) as TOTAL
from authors a
inner join titleauthor ta on ta.au_id = a.au_id
inner join titles t on t.title_id = ta.title_id
inner join sales s on s.title_id = t.title_id
group by a.au_id
order by TOTAL desc
limit 3

-- Challenge 4

select a.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", COALESCE(sum(s.qty), 0) as TOTAL
from authors a
left join titleauthor ta on ta.au_id = a.au_id
left join titles t on t.title_id = ta.title_id
left join sales s on s.title_id = t.title_id
group by a.au_id
order by TOTAL desc;

-- Bonus Challenge

select au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", sum(advance + ROYALTIES) as PROFITS from (
	select title_id, au_id, au_lname, au_fname, advance, sum(ROYALTIES) as ROYALTIES from (
		select t.title_id, t.price, t.advance * (ta.royaltyper / 100) as advance, t.royalty, s.qty, a.au_id, au_lname, au_fname, ta.royaltyper, (t.price * s.qty * t.royalty * ta.royaltyper / 10000) as ROYALTIES
		from titles t
		inner join sales s on s.title_id = t.title_id
		inner join titleauthor ta on ta.title_id = s.title_id
		inner join authors a on a.au_id = ta.au_id
	) as tmp
	group by au_id, title_id
) as tmp2
group by au_id
order by PROFITS desc
limit 3;

-- Alternative Solution

WITH profit_per_title AS (
    SELECT
        s.title_id,
        t.advance,
        t.price * (t.royalty / 100) AS royalty_per_sale,
        SUM(s.qty)                  AS titles_sold
    FROM sales s
        JOIN titles t
        ON s.title_id = t.title_id
    GROUP BY 1,2,3)
SELECT
    t.au_id,
    a.au_lname,
    a.au_fname,
    SUM((ept.advance * (t.royaltyper / 100)) +
    (ept.royalty_per_sale * ept.titles_sold * (t.royaltyper / 100)))  AS profit
FROM titleauthor t
    JOIN profit_per_title ept
    ON t.title_id = ept.title_id
    JOIN authors a
    ON t.au_id = a.au_id
GROUP BY 1,2,3
ORDER BY profit DESC;
