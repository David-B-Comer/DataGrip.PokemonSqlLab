#PART2:
USE Pokemon;

#What are all the types of pokemon that a pokemon can have?
SELECT * FROM types;

#What is the name of the pokemon with id 45?
SELECT * FROM pokemons WHERE id = 45;

#How many pokemon are there?
SELECT COUNT(id) FROM pokemons;

#How many types are there?
SELECT COUNT(id) FROM types;

#How many pokemon have a secondary type?
SELECT COUNT(*) FROM pokemons WHERE secondary_type IS NOT NULL;


#PART3:
USE Pokemon;

#What is each pokemon's primary type?
SELECT pokemons.name, types.name FROM types INNER JOIN pokemons ON types.id = pokemons.primary_type;

#What is Rufflet's secondary type?
SELECT pokemons.name, types.name FROM pokemons JOIN types ON pokemons.secondary_type = types.id WHERE pokemons.name = 'Rufflet';

#What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT pokemons.name, pokemon_trainer.trainerID FROM pokemons INNER JOIN pokemon_trainer ON pokemons.id = pokemon_trainer.pokemon_id WHERE trainerID = 303;

#How many pokemon have a secondary type Poison
SELECT COUNT(*) FROM pokemons WHERE secondary_type = 7;

#What are all the primary types and how many pokemon have that type?
SELECT primary_type, COUNT(*) FROM pokemons GROUP BY primary_type;

#How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT trainers.trainername, COUNT(*) FROM pokemon_trainer, trainers WHERE pokelevel = 100 AND pokemon_trainer.trainerID GROUP BY trainers.trainerID;

#How many pokemon only belong to one trainer and no other?
SELECT pokemon_id FROM pokemon_trainer GROUP BY pokemon_id HAVING COUNT(*) = 1;


#PART4:
USE Pokemon;

#Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type

SELECT p.name AS "Pokemon Name", t.trainername AS "Trainer Name", pt.pokelevel AS "Level", ptype.name AS "Primary Type", stype.name AS "Secondary Type", (attack + spatk + speed) AS "Attack-Spatk-Speed" FROM pokemons AS p JOIN pokemon_trainer AS pt ON p.id = pt.pokemon_id JOIN trainers AS t ON pt.trainerID = t.trainerID RIGHT JOIN types AS ptype ON p.primary_type = ptype.id LEFT JOIN types AS stype ON p.secondary_type = stype.id ORDER BY Attack-Spatk-Speed DESC;