
-- Supplied_Material_Dimensions for SLAB69
-- Chemical_Composition_Data
-- Ferrite_Data
-- Hardness_Data
-- Grain_Structure_Data


INSERT INTO DataRole
    (data_role_id, protocol_application_id, piece_of_data_id, data_role)
VALUES
-- MC0001: SLAB69
(1,  'MC0001', 1,  'input'),   -- Supplied_Material_Dimensions for SLAB69
(2,  'MC0001', 15, 'output'),  -- Chemical_Composition_Data
(3,  'MC0001', 29, 'output'),  -- Ferrite_Data
(4,  'MC0001', 43, 'output'),  -- Hardness_Data
(5,  'MC0001', 57, 'output'),  -- Grain_Structure_Data
-- MC0002: SLAB73
(6,  'MC0002', 2,  'input'),
(7,  'MC0002', 16, 'output'),
(8,  'MC0002', 30, 'output'),
(9,  'MC0002', 44, 'output'),
(10, 'MC0002', 58, 'output'),
-- MC0003: SLAB68
(11, 'MC0003', 3,  'input'),
(12, 'MC0003', 17, 'output'),
(13, 'MC0003', 31, 'output'),
(14, 'MC0003', 45, 'output'),
(15, 'MC0003', 59, 'output'),
-- MC0004: SLAB70
(16, 'MC0004', 4,  'input'),
(17, 'MC0004', 18, 'output'),
(18, 'MC0004', 32, 'output'),
(19, 'MC0004', 46, 'output'),
(20, 'MC0004', 60, 'output'),
-- MC0005: SLAB74
(21, 'MC0005', 5,  'input'),
(22, 'MC0005', 19, 'output'),
(23, 'MC0005', 33, 'output'),
(24, 'MC0005', 47, 'output'),
(25, 'MC0005', 61, 'output'),
-- MC0006: SLAB75
(26, 'MC0006', 6,  'input'),
(27, 'MC0006', 20, 'output'),
(28, 'MC0006', 34, 'output'),
(29, 'MC0006', 48, 'output'),
(30, 'MC0006', 62, 'output'),
-- MC0007: PIPEP3
(31, 'MC0007', 7,  'input'),
(32, 'MC0007', 21, 'output'),
(33, 'MC0007', 35, 'output'),
(34, 'MC0007', 49, 'output'),
(35, 'MC0007', 63, 'output'),
-- MC0008: PIPEP2
(36, 'MC0008', 8,  'input'),
(37, 'MC0008', 22, 'output'),
(38, 'MC0008', 36, 'output'),
(39, 'MC0008', 50, 'output'),
(40, 'MC0008', 64, 'output'),
-- MC0009: IMPELI
(41, 'MC0009', 9,  'input'),
(42, 'MC0009', 23, 'output'),
(43, 'MC0009', 37, 'output'),
(44, 'MC0009', 51, 'output'),
(45, 'MC0009', 65, 'output'),
-- MC0010: CASEC1
(46, 'MC0010', 10, 'input'),
(47, 'MC0010', 24, 'output'),
(48, 'MC0010', 38, 'output'),
(49, 'MC0010', 52, 'output'),
(50, 'MC0010', 66, 'output'),
-- MC0011: PIPEP1
(51, 'MC0011', 11, 'input'),
(52, 'MC0011', 25, 'output'),
(53, 'MC0011', 39, 'output'),
(54, 'MC0011', 53, 'output'),
(55, 'MC0011', 67, 'output'),
-- MC0012: PIPE205
(56, 'MC0012', 12, 'input'),
(57, 'MC0012', 26, 'output'),
(58, 'MC0012', 40, 'output'),
(59, 'MC0012', 54, 'output'),
(60, 'MC0012', 68, 'output'),
-- MC0013: ELBO758
(61, 'MC0013', 13, 'input'),
(62, 'MC0013', 27, 'output'),
(63, 'MC0013', 41, 'output'),
(64, 'MC0013', 55, 'output'),
(65, 'MC0013', 69, 'output'),
-- MC0014: COVKBR
(66, 'MC0014', 14, 'input'),
(67, 'MC0014', 28, 'output'),
(68, 'MC0014', 42, 'output'),
(69, 'MC0014', 56, 'output'),
(70, 'MC0014', 70, 'output');


-- Tensile_Specimen_Dimensions

INSERT INTO DataRole
    (data_role_id, protocol_application_id, piece_of_data_id, data_role)
WITH se_mapped AS (
    SELECT
        tsd.piece_of_data_id,
        ROW_NUMBER() OVER (ORDER BY tsd.piece_of_data_id) AS idx
    FROM Tensile_Specimen_Dimensions tsd
)
SELECT
    idx + 70 AS data_role_id,
    CONCAT('SE', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_data_id,
    'output' AS data_role
FROM se_mapped
ORDER BY idx;

-- verify
SELECT COUNT(*) FROM DataRole WHERE protocol_application_id LIKE 'SE%';
-- Expected: 373

SELECT * FROM DataRole WHERE protocol_application_id = 'SE0001';
-- Expected: 1 row (piece_of_data_id = 71)




-- Thermal Ageing Record

INSERT INTO DataRole
    (data_role_id, protocol_application_id, piece_of_data_id, data_role)
WITH ta_mapped AS (
    SELECT
        ar.piece_of_data_id,
        ROW_NUMBER() OVER (ORDER BY ar.piece_of_data_id) AS idx
    FROM Aging_Record ar
)
SELECT
    idx + 443 AS data_role_id,
    CONCAT('TA', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_data_id,
    'output' AS data_role
FROM ta_mapped
ORDER BY idx;

-- verify
SELECT COUNT(*) FROM DataRole WHERE protocol_application_id LIKE 'TA%';
-- Expected: 329



-- Reannealing Record

INSERT INTO DataRole
    (data_role_id, protocol_application_id, piece_of_data_id, data_role)
VALUES
(773, 'RA0001', 1146, 'output'),
(774, 'RA0002', 1147, 'output'),
(775, 'RA0003', 1148, 'output'),
(776, 'RA0004', 1149, 'output'),
(777, 'RA0005', 1150, 'output');

-- Tensile Test Record

INSERT INTO DataRole
    (data_role_id, protocol_application_id, piece_of_data_id, data_role)
WITH tt_mapped AS (
    SELECT
        ttr.piece_of_data_id,
        ROW_NUMBER() OVER (ORDER BY ttr.piece_of_data_id) AS idx
    FROM Tensile_Test_Results ttr
)
SELECT
    idx + 777 AS data_role_id,
    CONCAT('TT', LPAD(idx, 4, '0')) AS protocol_application_id,
    piece_of_data_id,
    'output' AS data_role
FROM tt_mapped
ORDER BY idx;


-- verify total

SELECT COUNT(*) AS total_rows FROM DataRole;
-- Expected: 1150
