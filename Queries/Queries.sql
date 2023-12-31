--MASTER KEY QUERY

SELECT
    P.Pokedex_id,
    P.Pokemon_name,
    P.Pokemon_weight,
    P.Pokemon_height,
    P.Stage_id,
    P.Evolve_level,
    G.Generation,
    R.Region,
    P.Devolution,
    P.Evolution,
    Rar.Rarity,
    AB.Ability1,
    AB.Ability2,
    AB.Hidden_Ability,
    T.Type1,
    T.Type2,
    FA.Appearance,
    FA.Platform
FROM
    Pokemon AS P
    LEFT JOIN First_Appearance AS FA ON P.Pokedex_id = FA.Appearance_id
    LEFT JOIN Pokemon_has_rarity AS PR ON P.Pokedex_id = PR.Pokedex_id
    LEFT JOIN Rarity AS Rar ON PR.Rarity_id = Rar.Rarity_id
    LEFT JOIN Pokemon_has_ability AS PA ON P.Pokedex_id = PA.Pokedex_id
    LEFT JOIN Abilities AS AB ON PA.Abilities_Set_id = AB.Abilities_Set_id
    LEFT JOIN Pokemon_has_type AS PT ON P.Pokedex_id = PT.Pokedex_id
    LEFT JOIN Type AS T ON PT.Type_Set_id = T.Type_Set_id
    LEFT JOIN Generation AS G ON P.Generation_id = G.Generation_id
    LEFT JOIN Region AS R ON P.Region_id = R.Region_id;



Shows All Relevant information, Turns all Variables into Values.

---------------------------------------------------------------------------

Show Appearance

SELECT
    P.Pokemon_name,
    FA.Appearance,
    FA.Platform
FROM
    Pokemon AS P
    LEFT JOIN Pokemon_has_appearance AS PHA ON P.Pokedex_id = PHA.Pokedex_id
    LEFT JOIN First_appearance AS FA ON PHA.Appearance_id = FA.Appearance_id

---------------------------------------------------------------------------

Stats

SELECT
    P.Pokemon_name,
    P.Pokemon_weight,
    P.Pokemon_height,
    P.Stage_id,
    AB.Ability1,
    AB.Ability2,
    AB.Hidden_Ability,
    T.Type1,
    T.Type2
FROM
    Pokemon AS P
    LEFT JOIN Pokemon_has_ability AS PA ON P.Pokedex_id = PA.Pokedex_id
    LEFT JOIN Abilities AS AB ON PA.Abilities_Set_id = AB.Abilities_Set_id
    LEFT JOIN Pokemon_has_type AS PT ON P.Pokedex_id = PT.Pokedex_id
    LEFT JOIN Type AS T ON PT.Type_Set_id = T.Type_Set_id

---------------------------------------------------------------------------

Type1 = Grass

SELECT
    P.Pokemon_name,
    P.Pokemon_weight,
    P.Pokemon_height,
    P.Stage_id,
    AB.Ability1,
    AB.Ability2,
    AB.Hidden_Ability,
    T.Type1,
    T.Type2
FROM
    Pokemon AS P
    LEFT JOIN Pokemon_has_ability AS PA ON P.Pokedex_id = PA.Pokedex_id
    LEFT JOIN Abilities AS AB ON PA.Abilities_Set_id = AB.Abilities_Set_id
    LEFT JOIN Pokemon_has_type AS PT ON P.Pokedex_id = PT.Pokedex_id
    LEFT JOIN Type AS T ON PT.Type_Set_id = T.Type_Set_id

WHERE T.type1 = 'Grass'

---------------------------------------------------------------------------

Ability 2 =/= NULL

SELECT
    P.Pokemon_name,
    P.Pokemon_weight,
    P.Pokemon_height,
    P.Stage_id,
    AB.Ability1,
    AB.Ability2,
    AB.Hidden_Ability,
    T.Type1,
    T.Type2
FROM
    Pokemon AS P
    LEFT JOIN Pokemon_has_ability AS PA ON P.Pokedex_id = PA.Pokedex_id
    LEFT JOIN Abilities AS AB ON PA.Abilities_Set_id = AB.Abilities_Set_id
    LEFT JOIN Pokemon_has_type AS PT ON P.Pokedex_id = PT.Pokedex_id
    LEFT JOIN Type AS T ON PT.Type_Set_id = T.Type_Set_id
    
WHERE
    AB.Ability2 IS NOT NULL;

