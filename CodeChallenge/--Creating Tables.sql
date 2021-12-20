--Creating Tables
CREATE TABLE Pokemon
(
    Id INT Identity(1, 1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Height VARCHAR(50) NOT NULL,
    Weight VARCHAR(50) NOT NULL
);

CREATE TABLE Type
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE PokemonType
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    PokemonId INT NOT NULL,
    TypeId INT NOT NULL
);


--Adding records to Tables
INSERT Pokemon(Id, Name, Height, Weight)
Values
(1, 'Bulbasaur', 'Seven', 70),
(2, 'Ditto', 'Three', 40);

INSERT Type(Id, Name)
Values
(1, 'Grass'),
(2, 'Normal');

INSERT PokemonType(Id, PokemonId, TypeId)
Values
(1, 1, 'Grass'),
(2, 2, 'Normal');

--Foreign keys
ALTER TABLE PokemonType ADD FOREIGN KEY (PokemonId) REFERENCES Pokemon(Id);
ALTER TABLE PokemonType Add FOREIGN Key (TypeId) REFERENCES Type(Name);

--Query
SELECT * 
FROM Pokemon
INNER JOIN Type ON Pokemon.Id = Type.Id
INNER JOIN PokemonType ON Pokemon.Id = PokemonType.PokemonId;