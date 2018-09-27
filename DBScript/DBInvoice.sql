USE [Invoice]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbCustomer](
	[idCustomer] [int] IDENTITY(1,1) NOT NULL,
	[nameCustomer] [varchar](100) NOT NULL,
	[phoneCustomer] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbOrder](
	[idOrder] [int] NOT NULL,
	[dataOrder] [datetime] NOT NULL,
	[idCustomer] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbOrderPayment](
	[idOrder] [int] NOT NULL,
	[amountOrder] [int] NOT NULL,
	[idTypePayment] [int] NOT NULL,
	[dataPayment] [datetime] NOT NULL,
	[valuePayment] [money] NOT NULL,
 CONSTRAINT [PK_OrderPayment] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC,
	[amountOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbOrderProduct](
	[idOrder] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[priceProduct] [money] NOT NULL,
	[quantityProduct] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC,
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbProduct](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[nameProduct] [varchar](100) NOT NULL,
	[priceProduct] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbTypePayment](
	[idTypePayment] [int] IDENTITY(1,1) NOT NULL,
	[nameTypePayment] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypePayment] PRIMARY KEY CLUSTERED 
(
	[idTypePayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbUser](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[nameFirst] [varchar](50) NOT NULL,
	[nameLast] [varchar](50) NOT NULL,
	[nameUser] [varchar](50) NOT NULL,
	[passUser] [varchar](50) NOT NULL,
	[activeUser] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[tbCustomer] ([idCustomer])
GO

ALTER TABLE [dbo].[tbOrder] CHECK CONSTRAINT [FK_Order_Customer]
GO

ALTER TABLE [dbo].[tbOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[tbUser] ([idUser])
GO

ALTER TABLE [dbo].[tbOrder] CHECK CONSTRAINT [FK_Order_User]
GO

ALTER TABLE [dbo].[tbOrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[tbOrder] ([idOrder])
GO

ALTER TABLE [dbo].[tbOrderPayment] CHECK CONSTRAINT [FK_OrderPayment_Order]
GO

ALTER TABLE [dbo].[tbOrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_TypePayment] FOREIGN KEY([idTypePayment])
REFERENCES [dbo].[tbTypePayment] ([idTypePayment])
GO

ALTER TABLE [dbo].[tbOrderPayment] CHECK CONSTRAINT [FK_OrderPayment_TypePayment]
GO

ALTER TABLE [dbo].[tbOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[tbOrder] ([idOrder])
GO

ALTER TABLE [dbo].[tbOrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO

ALTER TABLE [dbo].[tbOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[tbProduct] ([idProduct])
GO

ALTER TABLE [dbo].[tbOrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO


