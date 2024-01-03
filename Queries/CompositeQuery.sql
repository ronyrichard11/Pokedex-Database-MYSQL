-- Composite Query
-- Transform Variables to Values Query 

SELECT p.Id,
       p.Pokedex_id,
       p.Pokemon_name,
       p.Pokemon_Weight,
       p.Pokemon_Height,
       s.Stage_id AS Stage,
       p.Evolve_Level,
       g.Generation,
       t1.type1 AS Type1,
       t2.type2 AS Type2,
       r.Region,
       p.Devolution,
       p.Evolution,
       a.Ability1,
       a.Ability2,
       a.Hidden_Ability
FROM Pokemon p
JOIN Stage s ON p.Stage_id = s.Stage_id
JOIN Generation g ON p.Generation_id = g.Generation_id
JOIN Type t1 ON p.Type_Set_id = t1.type_set_id
LEFT JOIN Type t2 ON p.Type_Set_id = t2.type_set_id
JOIN Region r ON p.Region_id = r.Region_id
JOIN Abilities a ON p.Abilities_Set_id = a.Abilities_Set_id;