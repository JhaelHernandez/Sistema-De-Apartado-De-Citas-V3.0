
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/21/2015 19:33:10
-- Generated from EDMX file: C:\Users\Jhael\Documents\GitHub\Sistema-Apartado-Citas\CS\Datos\Coordinacion.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Coordinacion];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Carrera_Reticula]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carrera] DROP CONSTRAINT [FK_Carrera_Reticula];
GO
IF OBJECT_ID(N'[dbo].[FK_CarreraMaestro_Carrera]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CarreraMaestro] DROP CONSTRAINT [FK_CarreraMaestro_Carrera];
GO
IF OBJECT_ID(N'[dbo].[FK_CarreraMaestro_Maestro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CarreraMaestro] DROP CONSTRAINT [FK_CarreraMaestro_Maestro];
GO
IF OBJECT_ID(N'[dbo].[FK_Cita_Coordinador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cita] DROP CONSTRAINT [FK_Cita_Coordinador];
GO
IF OBJECT_ID(N'[dbo].[FK_DiaMateria_MateriaDelGrupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DiaMateria] DROP CONSTRAINT [FK_DiaMateria_MateriaDelGrupo];
GO
IF OBJECT_ID(N'[dbo].[FK_Grupo_MateriaDelGrupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Grupo] DROP CONSTRAINT [FK_Grupo_MateriaDelGrupo];
GO
IF OBJECT_ID(N'[dbo].[FK_HorarioAlumno_Alumno]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HorarioAlumno] DROP CONSTRAINT [FK_HorarioAlumno_Alumno];
GO
IF OBJECT_ID(N'[dbo].[FK_MateriasSemestre_SemestreHorario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MateriasSemestre] DROP CONSTRAINT [FK_MateriasSemestre_SemestreHorario];
GO
IF OBJECT_ID(N'[dbo].[FK_ReticulaMateria_Materia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReticulaMateria] DROP CONSTRAINT [FK_ReticulaMateria_Materia];
GO
IF OBJECT_ID(N'[dbo].[FK_ReticulaMateria_Reticula]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReticulaMateria] DROP CONSTRAINT [FK_ReticulaMateria_Reticula];
GO
IF OBJECT_ID(N'[dbo].[FK_ReticulaMateria_ReticulaMateria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReticulaMateria] DROP CONSTRAINT [FK_ReticulaMateria_ReticulaMateria];
GO
IF OBJECT_ID(N'[dbo].[FK_Semestre_Grupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Semestre] DROP CONSTRAINT [FK_Semestre_Grupo];
GO
IF OBJECT_ID(N'[dbo].[FK_SemestreHorario_Coordinador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SemestreHorario] DROP CONSTRAINT [FK_SemestreHorario_Coordinador];
GO
IF OBJECT_ID(N'[dbo].[FK_SemestreHorario_Semestre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SemestreHorario] DROP CONSTRAINT [FK_SemestreHorario_Semestre];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_Carrera]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Carrera];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Alumno]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Alumno];
GO
IF OBJECT_ID(N'[dbo].[Carrera]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carrera];
GO
IF OBJECT_ID(N'[dbo].[CarreraMaestro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CarreraMaestro];
GO
IF OBJECT_ID(N'[dbo].[Cita]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cita];
GO
IF OBJECT_ID(N'[dbo].[Coordinador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Coordinador];
GO
IF OBJECT_ID(N'[dbo].[DiaMateria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DiaMateria];
GO
IF OBJECT_ID(N'[dbo].[Grupo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grupo];
GO
IF OBJECT_ID(N'[dbo].[HorarioAlumno]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HorarioAlumno];
GO
IF OBJECT_ID(N'[dbo].[Maestro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Maestro];
GO
IF OBJECT_ID(N'[dbo].[Materia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Materia];
GO
IF OBJECT_ID(N'[dbo].[MateriaDelGrupo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MateriaDelGrupo];
GO
IF OBJECT_ID(N'[dbo].[MateriasSemestre]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MateriasSemestre];
GO
IF OBJECT_ID(N'[dbo].[Reticula]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reticula];
GO
IF OBJECT_ID(N'[dbo].[ReticulaMateria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReticulaMateria];
GO
IF OBJECT_ID(N'[dbo].[Semestre]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Semestre];
GO
IF OBJECT_ID(N'[dbo].[SemestreHorario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SemestreHorario];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Alumno'
CREATE TABLE [dbo].[Alumno] (
    [AlumnoID] nchar(15)  NOT NULL,
    [CitaID] int  NULL
);
GO

-- Creating table 'Carrera'
CREATE TABLE [dbo].[Carrera] (
    [CarreraID] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [ReticulaID] nchar(15)  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'CarreraMaestro'
CREATE TABLE [dbo].[CarreraMaestro] (
    [CarreraMaestroID] int IDENTITY(1,1) NOT NULL,
    [CarreraID] int  NOT NULL,
    [MaestroID] nchar(20)  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Cita'
CREATE TABLE [dbo].[Cita] (
    [CitaID] int IDENTITY(1,1) NOT NULL,
    [CoordinadorID] nchar(15)  NOT NULL,
    [Hora] time  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Estado] int  NOT NULL,
    [Mensaje] nvarchar(150)  NULL,
    [AlumnoID] nchar(15)  NULL
);
GO

-- Creating table 'Coordinador'
CREATE TABLE [dbo].[Coordinador] (
    [CoordinadorID] nchar(15)  NOT NULL
);
GO

-- Creating table 'DiaMateria'
CREATE TABLE [dbo].[DiaMateria] (
    [DiaID] int IDENTITY(1,1) NOT NULL,
    [MateriaGrupoID] int  NULL,
    [Dia] nchar(10)  NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Grupo'
CREATE TABLE [dbo].[Grupo] (
    [GrupoID] int IDENTITY(1,1) NOT NULL,
    [Grupo1] nchar(10)  NOT NULL,
    [Turno] nvarchar(50)  NOT NULL,
    [MateriaGrupoID] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'HorarioAlumno'
CREATE TABLE [dbo].[HorarioAlumno] (
    [HorarioAlumnoID] int IDENTITY(1,1) NOT NULL,
    [AlumnoID] nchar(15)  NULL,
    [MateriaGrupoID] int  NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Maestro'
CREATE TABLE [dbo].[Maestro] (
    [MaestroID] nchar(20)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellidos] nvarchar(50)  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Materia'
CREATE TABLE [dbo].[Materia] (
    [MateriaID] nchar(10)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Creditos] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'MateriaDelGrupo'
CREATE TABLE [dbo].[MateriaDelGrupo] (
    [MateriaGrupoID] int IDENTITY(1,1) NOT NULL,
    [MateriaID] nchar(10)  NULL,
    [MaestroID] nchar(20)  NULL,
    [HoraInicio] int  NULL,
    [HoraFinal] int  NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'MateriasSemestre'
CREATE TABLE [dbo].[MateriasSemestre] (
    [MateriaID] nchar(10)  NOT NULL,
    [SemestreHorarioID] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Reticula'
CREATE TABLE [dbo].[Reticula] (
    [ReticulaID] nchar(15)  NOT NULL,
    [Creditos] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'ReticulaMateria'
CREATE TABLE [dbo].[ReticulaMateria] (
    [ReiticulaMateriaID] int IDENTITY(1,1) NOT NULL,
    [ReticulaID] nchar(15)  NOT NULL,
    [MateriaID] nchar(10)  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Semestre'
CREATE TABLE [dbo].[Semestre] (
    [SemestreID] int  NOT NULL,
    [GrupoID] int  NOT NULL,
    [Semestre1] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'SemestreHorario'
CREATE TABLE [dbo].[SemestreHorario] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CoordinadorID] nchar(15)  NOT NULL,
    [SemestreID] int  NOT NULL,
    [Año] varchar(20)  NOT NULL,
    [Activo] bit  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [NoControl] nchar(15)  NOT NULL,
    [Contraseña] nvarchar(50)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellidos] nvarchar(50)  NOT NULL,
    [CarreraID] int  NOT NULL,
    [Activo] bit  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AlumnoID] in table 'Alumno'
ALTER TABLE [dbo].[Alumno]
ADD CONSTRAINT [PK_Alumno]
    PRIMARY KEY CLUSTERED ([AlumnoID] ASC);
GO

-- Creating primary key on [CarreraID] in table 'Carrera'
ALTER TABLE [dbo].[Carrera]
ADD CONSTRAINT [PK_Carrera]
    PRIMARY KEY CLUSTERED ([CarreraID] ASC);
GO

-- Creating primary key on [CarreraMaestroID] in table 'CarreraMaestro'
ALTER TABLE [dbo].[CarreraMaestro]
ADD CONSTRAINT [PK_CarreraMaestro]
    PRIMARY KEY CLUSTERED ([CarreraMaestroID] ASC);
GO

-- Creating primary key on [CitaID] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [PK_Cita]
    PRIMARY KEY CLUSTERED ([CitaID] ASC);
GO

-- Creating primary key on [CoordinadorID] in table 'Coordinador'
ALTER TABLE [dbo].[Coordinador]
ADD CONSTRAINT [PK_Coordinador]
    PRIMARY KEY CLUSTERED ([CoordinadorID] ASC);
GO

-- Creating primary key on [DiaID] in table 'DiaMateria'
ALTER TABLE [dbo].[DiaMateria]
ADD CONSTRAINT [PK_DiaMateria]
    PRIMARY KEY CLUSTERED ([DiaID] ASC);
GO

-- Creating primary key on [GrupoID] in table 'Grupo'
ALTER TABLE [dbo].[Grupo]
ADD CONSTRAINT [PK_Grupo]
    PRIMARY KEY CLUSTERED ([GrupoID] ASC);
GO

-- Creating primary key on [HorarioAlumnoID] in table 'HorarioAlumno'
ALTER TABLE [dbo].[HorarioAlumno]
ADD CONSTRAINT [PK_HorarioAlumno]
    PRIMARY KEY CLUSTERED ([HorarioAlumnoID] ASC);
GO

-- Creating primary key on [MaestroID] in table 'Maestro'
ALTER TABLE [dbo].[Maestro]
ADD CONSTRAINT [PK_Maestro]
    PRIMARY KEY CLUSTERED ([MaestroID] ASC);
GO

-- Creating primary key on [MateriaID] in table 'Materia'
ALTER TABLE [dbo].[Materia]
ADD CONSTRAINT [PK_Materia]
    PRIMARY KEY CLUSTERED ([MateriaID] ASC);
GO

-- Creating primary key on [MateriaGrupoID] in table 'MateriaDelGrupo'
ALTER TABLE [dbo].[MateriaDelGrupo]
ADD CONSTRAINT [PK_MateriaDelGrupo]
    PRIMARY KEY CLUSTERED ([MateriaGrupoID] ASC);
GO

-- Creating primary key on [MateriaID] in table 'MateriasSemestre'
ALTER TABLE [dbo].[MateriasSemestre]
ADD CONSTRAINT [PK_MateriasSemestre]
    PRIMARY KEY CLUSTERED ([MateriaID] ASC);
GO

-- Creating primary key on [ReticulaID] in table 'Reticula'
ALTER TABLE [dbo].[Reticula]
ADD CONSTRAINT [PK_Reticula]
    PRIMARY KEY CLUSTERED ([ReticulaID] ASC);
GO

-- Creating primary key on [ReiticulaMateriaID] in table 'ReticulaMateria'
ALTER TABLE [dbo].[ReticulaMateria]
ADD CONSTRAINT [PK_ReticulaMateria]
    PRIMARY KEY CLUSTERED ([ReiticulaMateriaID] ASC);
GO

-- Creating primary key on [SemestreID] in table 'Semestre'
ALTER TABLE [dbo].[Semestre]
ADD CONSTRAINT [PK_Semestre]
    PRIMARY KEY CLUSTERED ([SemestreID] ASC);
GO

-- Creating primary key on [ID] in table 'SemestreHorario'
ALTER TABLE [dbo].[SemestreHorario]
ADD CONSTRAINT [PK_SemestreHorario]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [NoControl] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([NoControl] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AlumnoID] in table 'HorarioAlumno'
ALTER TABLE [dbo].[HorarioAlumno]
ADD CONSTRAINT [FK_HorarioAlumno_Alumno]
    FOREIGN KEY ([AlumnoID])
    REFERENCES [dbo].[Alumno]
        ([AlumnoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HorarioAlumno_Alumno'
CREATE INDEX [IX_FK_HorarioAlumno_Alumno]
ON [dbo].[HorarioAlumno]
    ([AlumnoID]);
GO

-- Creating foreign key on [ReticulaID] in table 'Carrera'
ALTER TABLE [dbo].[Carrera]
ADD CONSTRAINT [FK_Carrera_Reticula]
    FOREIGN KEY ([ReticulaID])
    REFERENCES [dbo].[Reticula]
        ([ReticulaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Carrera_Reticula'
CREATE INDEX [IX_FK_Carrera_Reticula]
ON [dbo].[Carrera]
    ([ReticulaID]);
GO

-- Creating foreign key on [CarreraID] in table 'CarreraMaestro'
ALTER TABLE [dbo].[CarreraMaestro]
ADD CONSTRAINT [FK_CarreraMaestro_Carrera]
    FOREIGN KEY ([CarreraID])
    REFERENCES [dbo].[Carrera]
        ([CarreraID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarreraMaestro_Carrera'
CREATE INDEX [IX_FK_CarreraMaestro_Carrera]
ON [dbo].[CarreraMaestro]
    ([CarreraID]);
GO

-- Creating foreign key on [CarreraID] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [FK_Usuario_Carrera]
    FOREIGN KEY ([CarreraID])
    REFERENCES [dbo].[Carrera]
        ([CarreraID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_Carrera'
CREATE INDEX [IX_FK_Usuario_Carrera]
ON [dbo].[Usuario]
    ([CarreraID]);
GO

-- Creating foreign key on [MaestroID] in table 'CarreraMaestro'
ALTER TABLE [dbo].[CarreraMaestro]
ADD CONSTRAINT [FK_CarreraMaestro_Maestro]
    FOREIGN KEY ([MaestroID])
    REFERENCES [dbo].[Maestro]
        ([MaestroID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarreraMaestro_Maestro'
CREATE INDEX [IX_FK_CarreraMaestro_Maestro]
ON [dbo].[CarreraMaestro]
    ([MaestroID]);
GO

-- Creating foreign key on [CoordinadorID] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [FK_Cita_Coordinador]
    FOREIGN KEY ([CoordinadorID])
    REFERENCES [dbo].[Coordinador]
        ([CoordinadorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cita_Coordinador'
CREATE INDEX [IX_FK_Cita_Coordinador]
ON [dbo].[Cita]
    ([CoordinadorID]);
GO

-- Creating foreign key on [CoordinadorID] in table 'SemestreHorario'
ALTER TABLE [dbo].[SemestreHorario]
ADD CONSTRAINT [FK_SemestreHorario_Coordinador]
    FOREIGN KEY ([CoordinadorID])
    REFERENCES [dbo].[Coordinador]
        ([CoordinadorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SemestreHorario_Coordinador'
CREATE INDEX [IX_FK_SemestreHorario_Coordinador]
ON [dbo].[SemestreHorario]
    ([CoordinadorID]);
GO

-- Creating foreign key on [MateriaGrupoID] in table 'DiaMateria'
ALTER TABLE [dbo].[DiaMateria]
ADD CONSTRAINT [FK_DiaMateria_MateriaDelGrupo]
    FOREIGN KEY ([MateriaGrupoID])
    REFERENCES [dbo].[MateriaDelGrupo]
        ([MateriaGrupoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DiaMateria_MateriaDelGrupo'
CREATE INDEX [IX_FK_DiaMateria_MateriaDelGrupo]
ON [dbo].[DiaMateria]
    ([MateriaGrupoID]);
GO

-- Creating foreign key on [MateriaGrupoID] in table 'Grupo'
ALTER TABLE [dbo].[Grupo]
ADD CONSTRAINT [FK_Grupo_MateriaDelGrupo]
    FOREIGN KEY ([MateriaGrupoID])
    REFERENCES [dbo].[MateriaDelGrupo]
        ([MateriaGrupoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Grupo_MateriaDelGrupo'
CREATE INDEX [IX_FK_Grupo_MateriaDelGrupo]
ON [dbo].[Grupo]
    ([MateriaGrupoID]);
GO

-- Creating foreign key on [SemestreID] in table 'Semestre'
ALTER TABLE [dbo].[Semestre]
ADD CONSTRAINT [FK_Semestre_Grupo]
    FOREIGN KEY ([SemestreID])
    REFERENCES [dbo].[Grupo]
        ([GrupoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MateriaID] in table 'ReticulaMateria'
ALTER TABLE [dbo].[ReticulaMateria]
ADD CONSTRAINT [FK_ReticulaMateria_Materia]
    FOREIGN KEY ([MateriaID])
    REFERENCES [dbo].[Materia]
        ([MateriaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReticulaMateria_Materia'
CREATE INDEX [IX_FK_ReticulaMateria_Materia]
ON [dbo].[ReticulaMateria]
    ([MateriaID]);
GO

-- Creating foreign key on [SemestreHorarioID] in table 'MateriasSemestre'
ALTER TABLE [dbo].[MateriasSemestre]
ADD CONSTRAINT [FK_MateriasSemestre_SemestreHorario]
    FOREIGN KEY ([SemestreHorarioID])
    REFERENCES [dbo].[SemestreHorario]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MateriasSemestre_SemestreHorario'
CREATE INDEX [IX_FK_MateriasSemestre_SemestreHorario]
ON [dbo].[MateriasSemestre]
    ([SemestreHorarioID]);
GO

-- Creating foreign key on [ReticulaID] in table 'ReticulaMateria'
ALTER TABLE [dbo].[ReticulaMateria]
ADD CONSTRAINT [FK_ReticulaMateria_Reticula]
    FOREIGN KEY ([ReticulaID])
    REFERENCES [dbo].[Reticula]
        ([ReticulaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReticulaMateria_Reticula'
CREATE INDEX [IX_FK_ReticulaMateria_Reticula]
ON [dbo].[ReticulaMateria]
    ([ReticulaID]);
GO

-- Creating foreign key on [SemestreID] in table 'SemestreHorario'
ALTER TABLE [dbo].[SemestreHorario]
ADD CONSTRAINT [FK_SemestreHorario_Semestre]
    FOREIGN KEY ([SemestreID])
    REFERENCES [dbo].[Semestre]
        ([SemestreID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SemestreHorario_Semestre'
CREATE INDEX [IX_FK_SemestreHorario_Semestre]
ON [dbo].[SemestreHorario]
    ([SemestreID]);
GO

-- Creating foreign key on [ReiticulaMateriaID] in table 'ReticulaMateria'
ALTER TABLE [dbo].[ReticulaMateria]
ADD CONSTRAINT [FK_ReticulaMateria_ReticulaMateria]
    FOREIGN KEY ([ReiticulaMateriaID])
    REFERENCES [dbo].[ReticulaMateria]
        ([ReiticulaMateriaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------