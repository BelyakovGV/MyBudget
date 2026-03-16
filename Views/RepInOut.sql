CREATE VIEW [dbo].[RepInOut] AS
with a as (
	SELECT
		-o.[Summ]			[Summ]
		, o.[CreatedDate]	[Dt]
		, o.[Type]			[Type]
		, o.[Comment]		[Comment]
	FROM  [dbo].[Out] o

	union all

	select
		i.[Summ]
		, [Dt]
		, [Src]
		, null
	from [dbo].[In] i
), b as (
	select a.[Summ], a.[Dt], a.[Type], a.[Comment]
		, sum(a.[Summ]) over ( order by a.Dt) Sm
	from a
)
select
	b.[Summ], b.[Dt], b.[Type], b.[Comment], sum(b.Sm) as  Balance
from b
group by grouping sets(EOMONTH(b.Dt), (b.[Summ], b.[Dt], b.[Type], b.[Comment]))
having GROUPING(b.[Summ]) = 0;
--order by GROUPING(Dt) desc, Dt desc