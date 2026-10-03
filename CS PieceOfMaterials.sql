
USE FULLDATABASE;

-- Piece of Material subclass (Material class)
-- 01
CREATE TABLE Supplied_Material (
    piece_of_material_id  INT NOT NULL,
    material_id			  VARCHAR(50),
    product_form          VARCHAR(50),
    heat    			  VARCHAR(50),
    grade                 VARCHAR(100),
    foundry               VARCHAR(100),
    service_history       VARCHAR(255),
    section_thickness     NUMERIC(10,3),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

-- 02
CREATE TABLE Characterized_Material (
    piece_of_material_id                  INT NOT NULL,
    chemical_characterization_status      VARCHAR(50),
    ferrite_characterization_status       VARCHAR(50),
    hardness_characterization_status      VARCHAR(50),
    grain_structure_characterization_status VARCHAR(50),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

-- 03
CREATE TABLE Tensile_Specimen (
    piece_of_material_id  INT NOT NULL,
    specimen_id           VARCHAR(100),
    material_id           VARCHAR(100),
    test_block_id         VARCHAR(100),
    sub_block_id          VARCHAR(100),
    test_blank_id         VARCHAR(100),
    specimen_type         VARCHAR(50),
    specimen_geometry     VARCHAR(100),
    orientation           VARCHAR(20),
    location_region		  VARCHAR(20),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

-- 04
CREATE TABLE Aged_Specimen (
    piece_of_material_id   INT NOT NULL,
    specimen_id            VARCHAR(100),
	material_id            VARCHAR(100),
    aging_id               VARCHAR(50),
    aging_type             VARCHAR(50),
    aging_record_status    VARCHAR(50),
    aging_plant            VARCHAR(100),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

CREATE TABLE Reannealed_Specimen (
    piece_of_material_id   INT NOT NULL,
    specimen_id            VARCHAR(100),
	material_id            VARCHAR(100),
    aging_type             VARCHAR(50),
    aging_record_status    VARCHAR(50),
    aging_plant            VARCHAR(100),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

-- 05
CREATE TABLE Post_Test_Specimen (
    piece_of_material_id          INT NOT NULL,
    specimen_id                   VARCHAR(100),
    material_id                   VARCHAR(100),
    fracture_location             VARCHAR(100),
    fracture_cross_section_shape  VARCHAR(100),
    fracture_surface_appearance   VARCHAR(100),
    post_test_observations        TEXT,
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);
