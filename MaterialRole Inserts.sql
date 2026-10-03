



-- Material Characterization Material Role entries

INSERT INTO MaterialRole
    (material_role_id, protocol_application_id, piece_of_material_id, material_role)
VALUES
-- MC0001: SLAB69
(1,  'MC0001', 1,  'input'),
(2,  'MC0001', 15, 'output'),
-- MC0002: SLAB73
(3,  'MC0002', 2,  'input'),
(4,  'MC0002', 16, 'output'),
-- MC0003: SLAB68
(5,  'MC0003', 3,  'input'),
(6,  'MC0003', 17, 'output'),
-- MC0004: SLAB70
(7,  'MC0004', 4,  'input'),
(8,  'MC0004', 18, 'output'),
-- MC0005: SLAB74
(9,  'MC0005', 5,  'input'),
(10, 'MC0005', 19, 'output'),
-- MC0006: SLAB75
(11, 'MC0006', 6,  'input'),
(12, 'MC0006', 20, 'output'),
-- MC0007: PIPEP3
(13, 'MC0007', 7,  'input'),
(14, 'MC0007', 21, 'output'),
-- MC0008: PIPEP2
(15, 'MC0008', 8,  'input'),
(16, 'MC0008', 22, 'output'),
-- MC0009: IMPELI
(17, 'MC0009', 9,  'input'),
(18, 'MC0009', 23, 'output'),
-- MC0010: CASEC1
(19, 'MC0010', 10, 'input'),
(20, 'MC0010', 24, 'output'),
-- MC0011: PIPEP1
(21, 'MC0011', 11, 'input'),
(22, 'MC0011', 25, 'output'),
-- MC0012: PIPE205
(23, 'MC0012', 12, 'input'),
(24, 'MC0012', 26, 'output'),
-- MC0013: ELBO758
(25, 'MC0013', 13, 'input'),
(26, 'MC0013', 27, 'output'),
-- MC0014: COVKBR
(27, 'MC0014', 14, 'input'),
(28, 'MC0014', 28, 'output');

-- verify
SELECT COUNT(*) FROM MaterialRole;
-- Expected: 28

SELECT * FROM MaterialRole WHERE protocol_application_id = 'MC0001';
-- Expected: 2 rows (input = 1, output = 15)






-- Specimen Extraction Material Role addition

INSERT INTO MaterialRole
    (material_role_id, protocol_application_id, piece_of_material_id, material_role)
WITH tensile_order AS (
    SELECT
        piece_of_material_id,
        material_id,
        ROW_NUMBER() OVER (ORDER BY piece_of_material_id) AS idx
    FROM Tensile_Specimen
),
mapped AS (
    SELECT
        idx,
        piece_of_material_id AS tensile_id,
        CASE
            WHEN material_id LIKE 'SLAB69-C%'  THEN 15
            WHEN material_id LIKE 'SLAB73-C%'  THEN 16
            WHEN material_id LIKE 'SLAB68-C%'  THEN 17
            WHEN material_id LIKE 'SLAB74-C%'  THEN 19
            WHEN material_id LIKE 'SLAB75-C%'  THEN 20
            WHEN material_id LIKE 'PIPEP2-C%'  THEN 22
            WHEN material_id LIKE 'IMPELI-C%'  THEN 23
            WHEN material_id LIKE 'PIPEP1-C%'  THEN 25
            WHEN material_id LIKE 'PIPE205-C%' THEN 26
            WHEN material_id LIKE 'COVKBR-S%'  THEN 28
        END AS parent_id
    FROM tensile_order
)
SELECT
    ROW_NUMBER() OVER (ORDER BY idx, role_order) + 28 AS material_role_id,
    CONCAT('SE', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_material_id,
    material_role
FROM (
    SELECT idx, parent_id  AS piece_of_material_id, 'input'  AS material_role, 1 AS role_order FROM mapped
    UNION ALL
    SELECT idx, tensile_id AS piece_of_material_id, 'output' AS material_role, 2 AS role_order FROM mapped
) roles
ORDER BY idx, role_order;





-- Thermal Ageing Material Extraction entries
INSERT INTO MaterialRole
    (material_role_id, protocol_application_id, piece_of_material_id, material_role)
WITH ta_mapped AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY asp.piece_of_material_id) AS idx,
        asp.piece_of_material_id AS aged_id,
        ts.piece_of_material_id AS tensile_id
    FROM Aged_Specimen asp
    JOIN Tensile_Specimen ts
        ON ts.specimen_id = asp.specimen_id
        AND (asp.material_id LIKE CONCAT(ts.material_id, '%')
             OR asp.material_id = REPLACE(ts.material_id, '-E', '-C-E'))
)
SELECT
    ROW_NUMBER() OVER (ORDER BY idx, role_order) + 774 AS material_role_id,
    CONCAT('TA', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_material_id,
    material_role
FROM (
    SELECT idx, tensile_id AS piece_of_material_id, 'input'  AS material_role, 1 AS role_order FROM ta_mapped
    UNION ALL
    SELECT idx, aged_id    AS piece_of_material_id, 'output' AS material_role, 2 AS role_order FROM ta_mapped
) roles
ORDER BY idx, role_order;




-- Reannealing Entries

INSERT INTO MaterialRole
   (material_role_id, protocol_application_id, piece_of_material_id, material_role)
 VALUES
-- RA0001: 13–12
 (1433, 'RA0001', 503, 'input'),
 (1434, 'RA0001', 731, 'output'),
-- RA0002: 13–21
 (1435, 'RA0002', 504, 'input'),
 (1436, 'RA0002', 732, 'output'),
-- RA0003: 13–22
 (1437, 'RA0003', 505, 'input'),
 (1438, 'RA0003', 733, 'output'),
-- RA0004: 16–21
 (1439, 'RA0004', 510, 'input'),
 (1440, 'RA0004', 734, 'output'),
-- RA0005: 17–21
 (1441, 'RA0005', 511, 'input'),
 (1442, 'RA0005', 735, 'output');

 SELECT COUNT(*) FROM MaterialRole WHERE protocol_application_id LIKE 'RA%';
-- Expected: 10

 SELECT * FROM MaterialRole WHERE protocol_application_id = 'RA0001';
-- Expected: 2 rows




-- tensile entries
INSERT INTO MaterialRole
    (material_role_id, protocol_application_id, piece_of_material_id, material_role)
WITH tensile_order AS (
    SELECT
        ts.piece_of_material_id,
        ts.specimen_id,
        ts.material_id,
        ROW_NUMBER() OVER (ORDER BY ts.piece_of_material_id) AS idx
    FROM Tensile_Specimen ts
),
classified AS (
    SELECT
        t.idx,
        COALESCE(
            rs.piece_of_material_id,
            asp.piece_of_material_id,
            t.piece_of_material_id
        ) AS input_id,
        735 + t.idx AS t1_id,
        1108 + t.idx AS t2_id
    FROM tensile_order t
    LEFT JOIN Reannealed_Specimen rs
        ON rs.specimen_id = t.specimen_id
    LEFT JOIN Aged_Specimen asp
        ON asp.specimen_id = t.specimen_id
        AND (asp.material_id LIKE CONCAT(t.material_id, '%')
             OR asp.material_id = REPLACE(t.material_id, '-E', '-C-E'))
)
SELECT
    ROW_NUMBER() OVER (ORDER BY idx, role_order) + 1442 AS material_role_id,
    CONCAT('TT', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_material_id,
    material_role
FROM (
    SELECT idx, input_id AS piece_of_material_id, 'input'  AS material_role, 1 AS role_order FROM classified
    UNION ALL
    SELECT idx, t1_id    AS piece_of_material_id, 'output' AS material_role, 2 AS role_order FROM classified
    UNION ALL
    SELECT idx, t2_id    AS piece_of_material_id, 'output' AS material_role, 3 AS role_order FROM classified
) roles
ORDER BY idx, role_order;

SELECT COUNT(*) FROM MaterialRole WHERE protocol_application_id LIKE 'TT%';
-- Expected: 1,119

SELECT * FROM MaterialRole WHERE protocol_application_id = 'TT0001';
-- Expected: 3 rows (input + T1 + T2)
