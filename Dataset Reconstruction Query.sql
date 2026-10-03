USE FULLDATABASE;



-- ANCHOR QUERY
SELECT
    ts.piece_of_material_id,
    ts.specimen_id,
    ts.orientation,
    ts.material_id
FROM Tensile_Specimen ts
ORDER BY ts.piece_of_material_id;
-- 373 rows 

-- check 2
-- add material & heat information (grade, heat, product_form
SELECT
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                           				AS heat,
    sm.product_form                                 AS product_form
FROM Tensile_Specimen ts

LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

ORDER BY ts.piece_of_material_id;

-- row count 373
-- null values are 0


-- STEP 2
-- adding treatment type
SELECT
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                                         AS heat,
    sm.product_form                                 AS product_form,
    COALESCE(
        CASE WHEN rs.piece_of_material_id IS NOT NULL THEN 'Reannealed' END,
        asp.aging_type,
        'Unaged'
    )                                               AS treatment_type
FROM Tensile_Specimen ts

LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

LEFT JOIN MaterialRole mr_ta_in
    ON mr_ta_in.piece_of_material_id = ts.piece_of_material_id
    AND mr_ta_in.material_role = 'input'
    AND mr_ta_in.protocol_application_id LIKE 'TA%'

LEFT JOIN MaterialRole mr_ta_out
    ON mr_ta_out.protocol_application_id = mr_ta_in.protocol_application_id
    AND mr_ta_out.material_role = 'output'

LEFT JOIN Aged_Specimen asp
    ON asp.piece_of_material_id = mr_ta_out.piece_of_material_id

LEFT JOIN MaterialRole mr_ra_in
    ON mr_ra_in.piece_of_material_id = asp.piece_of_material_id
    AND mr_ra_in.material_role = 'input'
    AND mr_ra_in.protocol_application_id LIKE 'RA%'

LEFT JOIN MaterialRole mr_ra_out
    ON mr_ra_out.protocol_application_id = mr_ra_in.protocol_application_id
    AND mr_ra_out.material_role = 'output'

LEFT JOIN Reannealed_Specimen rs
    ON rs.piece_of_material_id = mr_ra_out.piece_of_material_id

ORDER BY ts.piece_of_material_id;



-- STEP 3
-- adding chemical composition
-- first filter out the composition, then join it to table
SELECT
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                                         AS heat,
    sm.product_form                                 AS product_form,
    COALESCE(
        CASE WHEN rs.piece_of_material_id IS NOT NULL THEN 'Reannealed' END,
        asp.aging_type,
        'Unaged'
    )                                               AS treatment_type,
    cc.Mn_wt                                        AS mn_wt_pct,
    cc.Si_wt                                        AS si_wt_pct,
    cc.P_wt                                         AS p_wt_pct,
    cc.S_wt                                         AS s_wt_pct,
    cc.Mo_wt                                        AS mo_wt_pct,
    cc.Cr_wt                                        AS cr_wt_pct,
    cc.Ni_wt                                        AS ni_wt_pct,
    cc.N_wt                                         AS n_wt_pct,
    cc.C_wt                                         AS c_wt_pct
FROM Tensile_Specimen ts

LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ccd.C_wt, ccd.Mn_wt, ccd.Si_wt, ccd.P_wt, ccd.S_wt,
        ccd.Mo_wt, ccd.Cr_wt, ccd.Ni_wt, ccd.N_wt
    FROM DataRole dr
    JOIN Chemical_Composition_Data ccd
        ON ccd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) cc
    ON cc.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN MaterialRole mr_ta_in
    ON mr_ta_in.piece_of_material_id = ts.piece_of_material_id
    AND mr_ta_in.material_role = 'input'
    AND mr_ta_in.protocol_application_id LIKE 'TA%'

LEFT JOIN MaterialRole mr_ta_out
    ON mr_ta_out.protocol_application_id = mr_ta_in.protocol_application_id
    AND mr_ta_out.material_role = 'output'

LEFT JOIN Aged_Specimen asp
    ON asp.piece_of_material_id = mr_ta_out.piece_of_material_id

LEFT JOIN MaterialRole mr_ra_in
    ON mr_ra_in.piece_of_material_id = asp.piece_of_material_id
    AND mr_ra_in.material_role = 'input'
    AND mr_ra_in.protocol_application_id LIKE 'RA%'

LEFT JOIN MaterialRole mr_ra_out
    ON mr_ra_out.protocol_application_id = mr_ra_in.protocol_application_id
    AND mr_ra_out.material_role = 'output'

LEFT JOIN Reannealed_Specimen rs
    ON rs.piece_of_material_id = mr_ra_out.piece_of_material_id

ORDER BY ts.piece_of_material_id;



-- STEP 4
-- adding microstructural information
SELECT
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                                         AS heat,
    sm.product_form                                 AS product_form,
    COALESCE(
        CASE WHEN rs.piece_of_material_id IS NOT NULL THEN 'Reannealed' END,
        asp.aging_type,
        'Unaged'
    )                                               AS treatment_type,
    cc.Mn_wt                                        AS mn_wt_pct,
    cc.Si_wt                                        AS si_wt_pct,
    cc.P_wt                                         AS p_wt_pct,
    cc.S_wt                                         AS s_wt_pct,
    cc.Mo_wt                                        AS mo_wt_pct,
    cc.Cr_wt                                        AS cr_wt_pct,
    cc.Ni_wt                                        AS ni_wt_pct,
    cc.N_wt                                         AS n_wt_pct,
    cc.C_wt                                         AS c_wt_pct,
    fd.ferrite_content_calculated                   AS calculated_ferrite_pct,
    fd.ferrite_content_measured                     AS measured_ferrite_pct,
    fd.ferrite_spacing                              AS ferrite_spacing_um,
    fd.ferrite_morphology                           AS morphology,
    hd.hardness_value                               AS hardness_rb,
    gsd.grain_structure_type                        AS grain_structure
FROM Tensile_Specimen ts

LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ccd.C_wt, ccd.Mn_wt, ccd.Si_wt, ccd.P_wt, ccd.S_wt,
        ccd.Mo_wt, ccd.Cr_wt, ccd.Ni_wt, ccd.N_wt
    FROM DataRole dr
    JOIN Chemical_Composition_Data ccd
        ON ccd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) cc
    ON cc.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        fd.ferrite_content_calculated,
        fd.ferrite_content_measured,
        fd.ferrite_spacing,
        fd.ferrite_morphology
    FROM DataRole dr
    JOIN Ferrite_Data fd
        ON fd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) fd
    ON fd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        hd.hardness_value
    FROM DataRole dr
    JOIN Hardness_Data hd
        ON hd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) hd
    ON hd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        gsd.grain_structure_type
    FROM DataRole dr
    JOIN Grain_Structure_Data gsd
        ON gsd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) gsd
    ON gsd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN MaterialRole mr_ta_in
    ON mr_ta_in.piece_of_material_id = ts.piece_of_material_id
    AND mr_ta_in.material_role = 'input'
    AND mr_ta_in.protocol_application_id LIKE 'TA%'

LEFT JOIN MaterialRole mr_ta_out
    ON mr_ta_out.protocol_application_id = mr_ta_in.protocol_application_id
    AND mr_ta_out.material_role = 'output'

LEFT JOIN Aged_Specimen asp
    ON asp.piece_of_material_id = mr_ta_out.piece_of_material_id

LEFT JOIN MaterialRole mr_ra_in
    ON mr_ra_in.piece_of_material_id = asp.piece_of_material_id
    AND mr_ra_in.material_role = 'input'
    AND mr_ra_in.protocol_application_id LIKE 'RA%'

LEFT JOIN MaterialRole mr_ra_out
    ON mr_ra_out.protocol_application_id = mr_ra_in.protocol_application_id
    AND mr_ra_out.material_role = 'output'

LEFT JOIN Reannealed_Specimen rs
    ON rs.piece_of_material_id = mr_ra_out.piece_of_material_id

ORDER BY ts.piece_of_material_id;


-- Step 5
-- adding ageing temp, ageing time, test temp, reference lab

SELECT
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                                         AS heat,
    sm.product_form                                 AS product_form,
    COALESCE(
        CASE WHEN rs.piece_of_material_id IS NOT NULL THEN 'Reannealed' END,
        asp.aging_type,
        'Unaged'
    )                                               AS treatment_type,
    cc.Mn_wt                                        AS mn_wt_pct,
    cc.Si_wt                                        AS si_wt_pct,
    cc.P_wt                                         AS p_wt_pct,
    cc.S_wt                                         AS s_wt_pct,
    cc.Mo_wt                                        AS mo_wt_pct,
    cc.Cr_wt                                        AS cr_wt_pct,
    cc.Ni_wt                                        AS ni_wt_pct,
    cc.N_wt                                         AS n_wt_pct,
    cc.C_wt                                         AS c_wt_pct,
    fd.ferrite_content_calculated                   AS calculated_ferrite_pct,
    fd.ferrite_content_measured                     AS measured_ferrite_pct,
    fd.ferrite_spacing                              AS ferrite_spacing_um,
    fd.ferrite_morphology                           AS morphology,
    hd.hardness_value                               AS hardness_rb,
    gsd.grain_structure_type                        AS grain_structure,
    ar.aging_temperature                            AS aging_temperature_c,
    ar.aging_time                                   AS aging_time_h,
    ptd.test_temperature                            AS test_temperature_c,
    ptd.test_laboratory                             AS reference_laboratory
FROM Tensile_Specimen ts

-- Step 1: material chain (SE → characterized → MC → supplied)
LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

-- Step 3: chemical composition
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ccd.C_wt, ccd.Mn_wt, ccd.Si_wt, ccd.P_wt, ccd.S_wt,
        ccd.Mo_wt, ccd.Cr_wt, ccd.Ni_wt, ccd.N_wt
    FROM DataRole dr
    JOIN Chemical_Composition_Data ccd
        ON ccd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) cc
    ON cc.protocol_application_id = mr_mc_out.protocol_application_id

-- Step 4: ferrite, hardness, grain
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        fd.ferrite_content_calculated,
        fd.ferrite_content_measured,
        fd.ferrite_spacing,
        fd.ferrite_morphology
    FROM DataRole dr
    JOIN Ferrite_Data fd ON fd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) fd
    ON fd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        hd.hardness_value
    FROM DataRole dr
    JOIN Hardness_Data hd ON hd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) hd
    ON hd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        gsd.grain_structure_type
    FROM DataRole dr
    JOIN Grain_Structure_Data gsd ON gsd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) gsd
    ON gsd.protocol_application_id = mr_mc_out.protocol_application_id

-- Step 2: TA and RA chain
LEFT JOIN MaterialRole mr_ta_in
    ON mr_ta_in.piece_of_material_id = ts.piece_of_material_id
    AND mr_ta_in.material_role = 'input'
    AND mr_ta_in.protocol_application_id LIKE 'TA%'

LEFT JOIN MaterialRole mr_ta_out
    ON mr_ta_out.protocol_application_id = mr_ta_in.protocol_application_id
    AND mr_ta_out.material_role = 'output'

LEFT JOIN Aged_Specimen asp
    ON asp.piece_of_material_id = mr_ta_out.piece_of_material_id

LEFT JOIN MaterialRole mr_ra_in
    ON mr_ra_in.piece_of_material_id = asp.piece_of_material_id
    AND mr_ra_in.material_role = 'input'
    AND mr_ra_in.protocol_application_id LIKE 'RA%'

LEFT JOIN MaterialRole mr_ra_out
    ON mr_ra_out.protocol_application_id = mr_ra_in.protocol_application_id
    AND mr_ra_out.material_role = 'output'

LEFT JOIN Reannealed_Specimen rs
    ON rs.piece_of_material_id = mr_ra_out.piece_of_material_id

-- Step 5: aging record (via TA data role)
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ar.aging_temperature,
        ar.aging_time
    FROM DataRole dr
    JOIN Aging_Record ar ON ar.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) ar
    ON ar.protocol_application_id = mr_ta_in.protocol_application_id

-- Step 5: test temperature and lab (via TT action chain)
LEFT JOIN MaterialRole mr_tt_in
    ON mr_tt_in.piece_of_material_id = COALESCE(
        rs.piece_of_material_id,
        asp.piece_of_material_id,
        ts.piece_of_material_id
    )
    AND mr_tt_in.material_role = 'input'
    AND mr_tt_in.protocol_application_id LIKE 'TT%'

LEFT JOIN ActionApplication aa
    ON aa.protocol_application_id = mr_tt_in.protocol_application_id
LEFT JOIN Tensile_Test_ActionApplication ttaa
    ON ttaa.action_application_id = aa.action_application_id
LEFT JOIN Pre_Test_Details_Application ptd
    ON ptd.action_application_id = ttaa.action_application_id

ORDER BY ts.piece_of_material_id;







-- step 6 - complete query
-- adds the target propeties
SELECT
    -- Material & Heat Information
    ts.piece_of_material_id,
    ts.specimen_id                                  AS specimen_number,
    ts.orientation                                  AS orientation,
    sm.grade                                        AS grade,
    sm.heat                                         AS heat,
    sm.product_form                                 AS product_form,
    COALESCE(
        CASE WHEN rs.piece_of_material_id IS NOT NULL THEN 'Reannealed' END,
        asp.aging_type,
        'Unaged'
    )                                               AS treatment_type,

    -- Chemical Composition
    cc.Mn_wt                                        AS mn_wt_pct,
    cc.Si_wt                                        AS si_wt_pct,
    cc.P_wt                                         AS p_wt_pct,
    cc.S_wt                                         AS s_wt_pct,
    cc.Mo_wt                                        AS mo_wt_pct,
    cc.Cr_wt                                        AS cr_wt_pct,
    cc.Ni_wt                                        AS ni_wt_pct,
    cc.N_wt                                         AS n_wt_pct,
    cc.C_wt                                         AS c_wt_pct,

    -- Microstructural Information
    fd.ferrite_content_calculated                   AS calculated_ferrite_pct,
    fd.ferrite_content_measured                     AS measured_ferrite_pct,
    fd.ferrite_spacing                              AS ferrite_spacing_um,
    fd.ferrite_morphology                           AS morphology,
    hd.hardness_value                               AS hardness_rb,
    gsd.grain_structure_type                        AS grain_structure,

    -- Test Conditions
    ar.aging_temperature                            AS aging_temperature_c,
    ar.aging_time                                   AS aging_time_h,
    ptd.test_temperature                            AS test_temperature_c,
    ptd.test_laboratory                             AS reference_laboratory,

    -- Tensile Properties
    ttr.yield_strength                              AS yield_stress_mpa,
    ttr.ultimate_tensile_strength                   AS ultimate_stress_mpa,
    ttr.fracture_stress                             AS fracture_stress_mpa,
    ttr.elongation                                  AS pct_elongation,
    ttr.reduction_in_area                           AS pct_reduction_area

FROM Tensile_Specimen ts

-- =========================================================
-- Step 1: Material chain (SE → characterized → MC → supplied)
-- =========================================================
LEFT JOIN MaterialRole mr_se
    ON mr_se.piece_of_material_id = ts.piece_of_material_id
    AND mr_se.material_role = 'output'
    AND mr_se.protocol_application_id LIKE 'SE%'

LEFT JOIN MaterialRole mr_se_in
    ON mr_se_in.protocol_application_id = mr_se.protocol_application_id
    AND mr_se_in.material_role = 'input'

LEFT JOIN Characterized_Material cm
    ON cm.piece_of_material_id = mr_se_in.piece_of_material_id

LEFT JOIN MaterialRole mr_mc_out
    ON mr_mc_out.piece_of_material_id = cm.piece_of_material_id
    AND mr_mc_out.material_role = 'output'
    AND mr_mc_out.protocol_application_id LIKE 'MC%'

LEFT JOIN MaterialRole mr_mc_in
    ON mr_mc_in.protocol_application_id = mr_mc_out.protocol_application_id
    AND mr_mc_in.material_role = 'input'

LEFT JOIN Supplied_Material sm
    ON sm.piece_of_material_id = mr_mc_in.piece_of_material_id

-- =========================================================
-- Step 3: Chemical composition (MC data output)
-- =========================================================
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ccd.C_wt, ccd.Mn_wt, ccd.Si_wt, ccd.P_wt, ccd.S_wt,
        ccd.Mo_wt, ccd.Cr_wt, ccd.Ni_wt, ccd.N_wt
    FROM DataRole dr
    JOIN Chemical_Composition_Data ccd
        ON ccd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) cc
    ON cc.protocol_application_id = mr_mc_out.protocol_application_id

-- =========================================================
-- Step 4: Ferrite, hardness, grain (MC data outputs)
-- =========================================================
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        fd.ferrite_content_calculated,
        fd.ferrite_content_measured,
        fd.ferrite_spacing,
        fd.ferrite_morphology
    FROM DataRole dr
    JOIN Ferrite_Data fd ON fd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) fd
    ON fd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        hd.hardness_value
    FROM DataRole dr
    JOIN Hardness_Data hd ON hd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) hd
    ON hd.protocol_application_id = mr_mc_out.protocol_application_id

LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        gsd.grain_structure_type
    FROM DataRole dr
    JOIN Grain_Structure_Data gsd ON gsd.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) gsd
    ON gsd.protocol_application_id = mr_mc_out.protocol_application_id

-- =========================================================
-- Step 2: TA and RA chain
-- =========================================================
LEFT JOIN MaterialRole mr_ta_in
    ON mr_ta_in.piece_of_material_id = ts.piece_of_material_id
    AND mr_ta_in.material_role = 'input'
    AND mr_ta_in.protocol_application_id LIKE 'TA%'

LEFT JOIN MaterialRole mr_ta_out
    ON mr_ta_out.protocol_application_id = mr_ta_in.protocol_application_id
    AND mr_ta_out.material_role = 'output'

LEFT JOIN Aged_Specimen asp
    ON asp.piece_of_material_id = mr_ta_out.piece_of_material_id

LEFT JOIN MaterialRole mr_ra_in
    ON mr_ra_in.piece_of_material_id = asp.piece_of_material_id
    AND mr_ra_in.material_role = 'input'
    AND mr_ra_in.protocol_application_id LIKE 'RA%'

LEFT JOIN MaterialRole mr_ra_out
    ON mr_ra_out.protocol_application_id = mr_ra_in.protocol_application_id
    AND mr_ra_out.material_role = 'output'

LEFT JOIN Reannealed_Specimen rs
    ON rs.piece_of_material_id = mr_ra_out.piece_of_material_id

-- =========================================================
-- Step 5a: Aging record (TA data output)
-- =========================================================
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ar.aging_temperature,
        ar.aging_time
    FROM DataRole dr
    JOIN Aging_Record ar ON ar.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) ar
    ON ar.protocol_application_id = mr_ta_in.protocol_application_id

-- =========================================================
-- Step 5b: TT action chain → pre-test details
-- =========================================================
LEFT JOIN MaterialRole mr_tt_in
    ON mr_tt_in.piece_of_material_id = COALESCE(
        rs.piece_of_material_id,
        asp.piece_of_material_id,
        ts.piece_of_material_id
    )
    AND mr_tt_in.material_role = 'input'
    AND mr_tt_in.protocol_application_id LIKE 'TT%'

LEFT JOIN ActionApplication aa
    ON aa.protocol_application_id = mr_tt_in.protocol_application_id
LEFT JOIN Tensile_Test_ActionApplication ttaa
    ON ttaa.action_application_id = aa.action_application_id
LEFT JOIN Pre_Test_Details_Application ptd
    ON ptd.action_application_id = ttaa.action_application_id

-- =========================================================
-- Step 6: Tensile results (TT data output)
-- =========================================================
LEFT JOIN (
    SELECT
        dr.protocol_application_id,
        ttr.yield_strength,
        ttr.ultimate_tensile_strength,
        ttr.fracture_stress,
        ttr.elongation,
        ttr.reduction_in_area
    FROM DataRole dr
    JOIN Tensile_Test_Results ttr
        ON ttr.piece_of_data_id = dr.piece_of_data_id
    WHERE dr.data_role = 'output'
) ttr
    ON ttr.protocol_application_id = mr_tt_in.protocol_application_id

ORDER BY ts.piece_of_material_id;
