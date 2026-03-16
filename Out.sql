CREATE TABLE [dbo].[Out](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](150) NULL,
	[Summ] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Dt]  AS (CONVERT([date],[CreatedDate])) PERSISTED NOT NULL,
	CONSTRAINT [PK_Out] PRIMARY KEY NONCLUSTERED ([Id] ASC,[Dt] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Out_PS]([Dt])
) ON [Out_PS]([Dt])
GO

ALTER TABLE [dbo].[Out] ADD  CONSTRAINT [DF_Out_CreatedDate]  DEFAULT (sysdatetime()) FOR [CreatedDate]
GO

