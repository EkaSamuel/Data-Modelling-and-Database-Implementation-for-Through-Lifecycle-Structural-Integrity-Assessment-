DROP DATABASE FULLDATABASE;

CREATE DATABASE FULLDATABASE;

USE FULLDATABASE;


-- MAIN CLASSES

-- 01
CREATE TABLE Protocol (
protocol_id VARCHAR(50) NOT NULL,
protocol_name VARCHAR(100) NOT NULL,
PRIMARY KEY (protocol_id)
);

-- 02
CREATE TABLE Action (
    action_id           INT NOT NULL,
    action_ordinal      INT NOT NULL,
    protocol_id         VARCHAR(50) NOT NULL,
    action_name         VARCHAR(100) NOT NULL,
    action_description  TEXT,
    PRIMARY KEY (action_id),
    UNIQUE (protocol_id, action_ordinal),
    FOREIGN KEY (protocol_id) REFERENCES Protocol (protocol_id)
        ON DELETE RESTRICT
);
CREATE INDEX idx_action_protocol ON Action(protocol_id);

-- 03
CREATE TABLE ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    protocol_id              VARCHAR(50) NOT NULL,
    protocol_sequence_number INT NOT NULL,
    protocol_datetime        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status                   VARCHAR(50) NOT NULL DEFAULT 'pending',
    started_at               TIMESTAMP,
    ended_at                 TIMESTAMP,
    PRIMARY KEY (protocol_application_id),
    UNIQUE (protocol_id, protocol_sequence_number),
    FOREIGN KEY (protocol_id) REFERENCES Protocol (protocol_id)
        ON DELETE RESTRICT,
    CHECK (status IN ('pending','running','paused','completed','aborted'))
);
CREATE INDEX idx_protocol_application_protocol
    ON ProtocolApplication(protocol_id);
CREATE INDEX idx_protocol_application_datetime
    ON ProtocolApplication(protocol_datetime);

-- 04
CREATE TABLE ActionApplication (
    action_application_id    VARCHAR(50) NOT NULL,
    protocol_application_id  VARCHAR(50) NOT NULL,
    action_id                INT NOT NULL,
    execution_order          INT,
    status                   VARCHAR(20) NOT NULL DEFAULT 'pending',
    started_at               TIMESTAMP,
    ended_at                 TIMESTAMP,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (action_id) REFERENCES Action (action_id)
        ON DELETE RESTRICT,
    CHECK (status IN ('pending','running','paused','completed','aborted'))
);
CREATE INDEX idx_action_application_protocol_app
    ON ActionApplication(protocol_application_id);
CREATE INDEX idx_action_application_action
    ON ActionApplication(action_id);


-- 05
CREATE TABLE PieceOfMaterial (
    piece_of_material_id  INT NOT NULL,
    material_type         VARCHAR(100) NOT NULL,
    material_name         VARCHAR(100),
    PRIMARY KEY (piece_of_material_id)
);


-- 06
CREATE TABLE MaterialRole (
    material_role_id         INT NOT NULL,
    protocol_application_id  VARCHAR(50) NOT NULL,
    piece_of_material_id     INT NOT NULL,
    material_role            VARCHAR(20) NOT NULL,
    PRIMARY KEY (material_role_id),
    UNIQUE (protocol_application_id, piece_of_material_id, material_role),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE RESTRICT,
    CHECK (material_role IN ('input','output'))
);

CREATE INDEX idx_material_role_protocol_app
    ON MaterialRole(protocol_application_id);
CREATE INDEX idx_material_role_piece
    ON MaterialRole(piece_of_material_id);
CREATE INDEX idx_material_role_role         
    ON MaterialRole(material_role);


-- 07
CREATE TABLE PieceOfData (
    piece_of_data_id  INT NOT NULL,
    data_type         VARCHAR(100) NOT NULL,
    data_name         VARCHAR(100),
    PRIMARY KEY (piece_of_data_id)
);

-- 08
CREATE TABLE DataRole (
    data_role_id             INT NOT NULL,
    protocol_application_id  VARCHAR(50) NOT NULL,
    piece_of_data_id         INT NOT NULL,
    data_role                VARCHAR(20) NOT NULL,
    PRIMARY KEY (data_role_id),
    UNIQUE (protocol_application_id, piece_of_data_id, data_role),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE RESTRICT,
    CHECK (data_role IN ('input','output'))
);

CREATE INDEX idx_data_role_protocol_app
    ON DataRole(protocol_application_id);
CREATE INDEX idx_data_role_piece
    ON DataRole(piece_of_data_id);
CREATE INDEX idx_data_role_role             
    ON DataRole(data_role);

-- 9
CREATE TABLE Equipment (
    equipment_id    INT NOT NULL,
    equipment_name  VARCHAR(100) NOT NULL,
    equipment_type  VARCHAR(50),
    manufacturer    VARCHAR(100),
    model           VARCHAR(100),
    PRIMARY KEY (equipment_id)
);


-- 10
CREATE TABLE Software (
    software_id     INT NOT NULL,
    software_name   VARCHAR(100) NOT NULL,
    software_type   VARCHAR(50),
    version         VARCHAR(50),
    vendor          VARCHAR(100),
    PRIMARY KEY (software_id)
);


-- 11
CREATE TABLE ProtocolEquipment (
    protocol_id     VARCHAR(50) NOT NULL,
    equipment_id    INT NOT NULL,
    PRIMARY KEY (protocol_id, equipment_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
        ON DELETE RESTRICT
);


-- 12
CREATE TABLE ProtocolSoftware (
    protocol_id     VARCHAR(50) NOT NULL,
    software_id     INT NOT NULL,
    PRIMARY KEY (protocol_id, software_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (software_id) REFERENCES Software(software_id)
        ON DELETE RESTRICT
);


-- 13
CREATE TABLE EquipmentApplication (
    equipment_application_id  INT NOT NULL,
    protocol_application_id   VARCHAR(50) NOT NULL,
    equipment_id              INT NOT NULL,
    started_at                TIMESTAMP,
    ended_at                  TIMESTAMP,
    PRIMARY KEY (equipment_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (equipment_id)
        REFERENCES Equipment(equipment_id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_equipment_application_protocol_app
    ON EquipmentApplication(protocol_application_id);
CREATE INDEX idx_equipment_application_equipment
    ON EquipmentApplication(equipment_id);
    

-- 14
CREATE TABLE SoftwareApplication (
    software_application_id  INT NOT NULL,
    protocol_application_id  VARCHAR(50) NOT NULL,
    software_id              INT NOT NULL,
    started_at               TIMESTAMP,
    ended_at                 TIMESTAMP,
    PRIMARY KEY (software_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (software_id)
        REFERENCES Software(software_id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_software_application_protocol_app
    ON SoftwareApplication(protocol_application_id);
CREATE INDEX idx_software_application_software
    ON SoftwareApplication(software_id);
    
