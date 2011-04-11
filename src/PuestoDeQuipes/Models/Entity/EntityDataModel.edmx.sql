
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/10/2011 00:02:27
-- Generated from EDMX file: C:\Users\jliranz\Documents\Visual Studio 2010\Projects\WIP\PDQProject\PuestoDeQuipes\PuestoDeQuipes\Models\Entity\EntityDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [pdqdb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClienteOrden]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FK_ClienteOrden];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoOrden]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FK_ProductoOrden];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoEspecial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Especiales] DROP CONSTRAINT [FK_ProductoEspecial];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoIngrediente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ingredientes] DROP CONSTRAINT [FK_ProductoIngrediente];
GO
IF OBJECT_ID(N'[dbo].[FK_InventarioIngrediente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ingredientes] DROP CONSTRAINT [FK_InventarioIngrediente];
GO
IF OBJECT_ID(N'[dbo].[FK_UnidadIngrediente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ingredientes] DROP CONSTRAINT [FK_UnidadIngrediente];
GO
IF OBJECT_ID(N'[dbo].[FK_UnidadInventario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Inventarios] DROP CONSTRAINT [FK_UnidadInventario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Ordenes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ordenes];
GO
IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO
IF OBJECT_ID(N'[dbo].[Especiales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Especiales];
GO
IF OBJECT_ID(N'[dbo].[Ingredientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ingredientes];
GO
IF OBJECT_ID(N'[dbo].[Inventarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Inventarios];
GO
IF OBJECT_ID(N'[dbo].[Unidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Unidades];
GO
IF OBJECT_ID(N'[dbo].[Configuraciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Configuraciones];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [ClienteId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ordenes'
CREATE TABLE [dbo].[Ordenes] (
    [OrdenId] int IDENTITY(1,1) NOT NULL,
    [Cantidad] int  NOT NULL,
    [Ordenado] datetime  NOT NULL,
    [ClienteClienteId] int  NOT NULL,
    [ProductoProductoId] int  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [ProductoId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Precio] float  NOT NULL,
    [Visible] bit  NOT NULL,
    [ImagePath] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Especiales'
CREATE TABLE [dbo].[Especiales] (
    [EspecialId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [FechaTermino] datetime  NOT NULL,
    [Precio] float  NOT NULL,
    [ProductoProductoId] int  NOT NULL
);
GO

-- Creating table 'Ingredientes'
CREATE TABLE [dbo].[Ingredientes] (
    [IngredienteId] int IDENTITY(1,1) NOT NULL,
    [Cantidad] int  NOT NULL,
    [ProductoProductoId] int  NOT NULL,
    [InventarioInventarioId] int  NOT NULL,
    [UnidadUnidadId] int  NOT NULL
);
GO

-- Creating table 'Inventarios'
CREATE TABLE [dbo].[Inventarios] (
    [InventarioId] int IDENTITY(1,1) NOT NULL,
    [CantidadTotal] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [UnidadUnidadId] int  NOT NULL
);
GO

-- Creating table 'Unidades'
CREATE TABLE [dbo].[Unidades] (
    [UnidadId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Configuraciones'
CREATE TABLE [dbo].[Configuraciones] (
    [ConfiguracionId] int IDENTITY(1,1) NOT NULL,
    [Config1] nvarchar(max)  NOT NULL,
    [Config2] nvarchar(max)  NOT NULL,
    [Config3] nvarchar(max)  NOT NULL,
    [Config4] nvarchar(max)  NOT NULL,
    [Config5] nvarchar(max)  NOT NULL,
    [Config6] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ClienteId] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([ClienteId] ASC);
GO

-- Creating primary key on [OrdenId] in table 'Ordenes'
ALTER TABLE [dbo].[Ordenes]
ADD CONSTRAINT [PK_Ordenes]
    PRIMARY KEY CLUSTERED ([OrdenId] ASC);
GO

-- Creating primary key on [ProductoId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([ProductoId] ASC);
GO

-- Creating primary key on [EspecialId] in table 'Especiales'
ALTER TABLE [dbo].[Especiales]
ADD CONSTRAINT [PK_Especiales]
    PRIMARY KEY CLUSTERED ([EspecialId] ASC);
GO

-- Creating primary key on [IngredienteId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [PK_Ingredientes]
    PRIMARY KEY CLUSTERED ([IngredienteId] ASC);
GO

-- Creating primary key on [InventarioId] in table 'Inventarios'
ALTER TABLE [dbo].[Inventarios]
ADD CONSTRAINT [PK_Inventarios]
    PRIMARY KEY CLUSTERED ([InventarioId] ASC);
GO

-- Creating primary key on [UnidadId] in table 'Unidades'
ALTER TABLE [dbo].[Unidades]
ADD CONSTRAINT [PK_Unidades]
    PRIMARY KEY CLUSTERED ([UnidadId] ASC);
GO

-- Creating primary key on [ConfiguracionId] in table 'Configuraciones'
ALTER TABLE [dbo].[Configuraciones]
ADD CONSTRAINT [PK_Configuraciones]
    PRIMARY KEY CLUSTERED ([ConfiguracionId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClienteClienteId] in table 'Ordenes'
ALTER TABLE [dbo].[Ordenes]
ADD CONSTRAINT [FK_ClienteOrden]
    FOREIGN KEY ([ClienteClienteId])
    REFERENCES [dbo].[Clientes]
        ([ClienteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteOrden'
CREATE INDEX [IX_FK_ClienteOrden]
ON [dbo].[Ordenes]
    ([ClienteClienteId]);
GO

-- Creating foreign key on [ProductoProductoId] in table 'Ordenes'
ALTER TABLE [dbo].[Ordenes]
ADD CONSTRAINT [FK_ProductoOrden]
    FOREIGN KEY ([ProductoProductoId])
    REFERENCES [dbo].[Productos]
        ([ProductoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoOrden'
CREATE INDEX [IX_FK_ProductoOrden]
ON [dbo].[Ordenes]
    ([ProductoProductoId]);
GO

-- Creating foreign key on [ProductoProductoId] in table 'Especiales'
ALTER TABLE [dbo].[Especiales]
ADD CONSTRAINT [FK_ProductoEspecial]
    FOREIGN KEY ([ProductoProductoId])
    REFERENCES [dbo].[Productos]
        ([ProductoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoEspecial'
CREATE INDEX [IX_FK_ProductoEspecial]
ON [dbo].[Especiales]
    ([ProductoProductoId]);
GO

-- Creating foreign key on [ProductoProductoId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [FK_ProductoIngrediente]
    FOREIGN KEY ([ProductoProductoId])
    REFERENCES [dbo].[Productos]
        ([ProductoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoIngrediente'
CREATE INDEX [IX_FK_ProductoIngrediente]
ON [dbo].[Ingredientes]
    ([ProductoProductoId]);
GO

-- Creating foreign key on [InventarioInventarioId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [FK_InventarioIngrediente]
    FOREIGN KEY ([InventarioInventarioId])
    REFERENCES [dbo].[Inventarios]
        ([InventarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InventarioIngrediente'
CREATE INDEX [IX_FK_InventarioIngrediente]
ON [dbo].[Ingredientes]
    ([InventarioInventarioId]);
GO

-- Creating foreign key on [UnidadUnidadId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [FK_UnidadIngrediente]
    FOREIGN KEY ([UnidadUnidadId])
    REFERENCES [dbo].[Unidades]
        ([UnidadId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UnidadIngrediente'
CREATE INDEX [IX_FK_UnidadIngrediente]
ON [dbo].[Ingredientes]
    ([UnidadUnidadId]);
GO

-- Creating foreign key on [UnidadUnidadId] in table 'Inventarios'
ALTER TABLE [dbo].[Inventarios]
ADD CONSTRAINT [FK_UnidadInventario]
    FOREIGN KEY ([UnidadUnidadId])
    REFERENCES [dbo].[Unidades]
        ([UnidadId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UnidadInventario'
CREATE INDEX [IX_FK_UnidadInventario]
ON [dbo].[Inventarios]
    ([UnidadUnidadId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------