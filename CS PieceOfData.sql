
USE FULLDATABASE;

-- Piece of Data subclass (Data class)
-- 01
CREATE TABLE Supplied_Material_Dimensions (
    piece_of_data_id      INT NOT NULL,
    dimension_id          VARCHAR(50),
    material_id			  VARCHAR(50),
	product_form          VARCHAR(50),
    outer_diameter        NUMERIC(10,3),
    inner_diameter        NUMERIC(10,3),
    wall_thickness        NUMERIC(10,3),
    length                NUMERIC(10,3),
    width                 NUMERIC(10,3),
    thickness             NUMERIC(10,3),
    diameter              NUMERIC(10,3),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 02
CREATE TABLE Chemical_Composition_Data (
    piece_of_data_id  INT NOT NULL,
    material_id       VARCHAR(50),
    C_wt              NUMERIC(6,4),
    Mn_wt             NUMERIC(6,4),
    Si_wt             NUMERIC(6,4),
    P_wt              NUMERIC(6,4),
    S_wt              NUMERIC(6,4),
    Mo_wt             NUMERIC(6,4),
    Cr_wt             NUMERIC(6,4),
    Ni_wt             NUMERIC(6,4),
    N_wt              NUMERIC(6,4),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);


-- 03
CREATE TABLE Ferrite_Data (
    piece_of_data_id            INT NOT NULL,
    material_id       			VARCHAR(50),
    measurement_method          VARCHAR(100),
    ferrite_content_measured    NUMERIC(6,2),
    calculation_method			VARCHAR(100),
    ferrite_content_calculated  NUMERIC(6,2),
    ferrite_spacing             NUMERIC(10,3),
    calibration_reference       VARCHAR(100),
    ferrite_morphology          VARCHAR(100),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);


-- 04
CREATE TABLE Hardness_Data (
    piece_of_data_id  INT NOT NULL,
    material_id       VARCHAR(50),
    hardness_scale    VARCHAR(20),
    hardness_value    NUMERIC(10,3),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);


-- 05
CREATE TABLE Grain_Structure_Data (
    piece_of_data_id        INT NOT NULL,
    material_id       		VARCHAR(50),
    grain_structure_type    VARCHAR(100),
    grain_size_distribution VARCHAR(100),
    image_reference         VARCHAR(255),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 06
CREATE TABLE Tensile_Specimen_Dimensions (
    piece_of_data_id       INT NOT NULL,
    dimension_id           VARCHAR(50),
    material_id			   VARCHAR(100),
    specimen_id       	   VARCHAR(50),
    overall_length         NUMERIC(10,3),
    gauge_length           NUMERIC(10,3),
    gauge_diameter         NUMERIC(10,3),
    cross_sectional_area   NUMERIC(10,3),
    grip_section_diameter  NUMERIC(10,3),
    fillet_radius          NUMERIC(10,3),
    thread_spec            VARCHAR(50),
    lab					   VARCHAR(50),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 07
CREATE TABLE Aging_Record (
    piece_of_data_id    INT NOT NULL,
    specimen_id         VARCHAR(50),
    material_id			VARCHAR(50),
    ageing_id			VARCHAR(50),
    orientation         VARCHAR(20),
    aging_temperature   NUMERIC(6,2),
    aging_time          NUMERIC(10,2),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 08
CREATE TABLE Reannealing_Record (
    piece_of_data_id    INT NOT NULL,
    specimen_id         VARCHAR(50),
    material_id         VARCHAR(100),
    reannealing_id      VARCHAR(50),
    orientation         VARCHAR(20),
    aging_temperature   VARCHAR(50),
    aging_time          NUMERIC(10,2),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 09
CREATE TABLE Tensile_Test_Results (
    piece_of_data_id          INT NOT NULL,
    specimen_id               VARCHAR(50),
    material_id				  VARCHAR(50),
    yield_strength            NUMERIC(10,3),
    ultimate_tensile_strength NUMERIC(10,3),
    fracture_stress           NUMERIC(10,3),
    elongation                NUMERIC(6,2),
    reduction_in_area         NUMERIC(6,2),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 10
CREATE TABLE Post_Test_Specimen_Dimensions (
    piece_of_data_id            INT NOT NULL,
    dimension_id                VARCHAR(50),
    final_cross_sectional_area  NUMERIC(10,3),
    final_gauge_length          NUMERIC(10,3),
    extensometer_displacement   NUMERIC(10,3),
    PRIMARY KEY (dimension_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- 11
CREATE TABLE Engineering_Stress_Strain_Data (
    piece_of_data_id            INT NOT NULL,
    specimen_id                 VARCHAR(50),
    engineering_stress_reading  NUMERIC(10,3),
    engineering_strain_reading  NUMERIC(10,6),
    critical_elongation         NUMERIC(6,2),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);










