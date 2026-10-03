-- GENERIC PROTOCOLS LEVEL 1 Subclasses

-- 01
-- Protocol Subclass (one per protocol type)
CREATE TABLE ProtocolSubclassName (
    protocol_id      INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);

-- 02
-- Protocol Application Subclass (one per protocol type)
CREATE TABLE ProtocolSubclassNameApplication (
    protocol_application_id  INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);

-- 03
-- Action subclass (one per protocol type)
CREATE TABLE ProtocolSubclassNameAction (
    action_id        INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Action(action_id)
        ON DELETE CASCADE
);

-- 04
-- Action Application subclass (one per protocol application type)
CREATE TABLE ProtocolSubclassNameActionApplication (
    action_application_id  INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES ActionApplication(action_application_id)
        ON DELETE CASCADE
);

-- 05
-- Piece of Material subclass (Material class)
CREATE TABLE MaterialSubclassName (
    piece_of_material_id  INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (piece_of_material_id),
    FOREIGN KEY (piece_of_material_id)
        REFERENCES PieceOfMaterial(piece_of_material_id)
        ON DELETE CASCADE
);

-- 06
-- Piece of Data subclass (Data class)
CREATE TABLE DataSubclassName (
    piece_of_data_id  INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (piece_of_data_id),
    FOREIGN KEY (piece_of_data_id)
        REFERENCES PieceOfData(piece_of_data_id)
        ON DELETE CASCADE
);

-- GENERIC PROTOCOLS LEVEL 2

-- 01
-- Individual actions (subclass level 2)
CREATE TABLE IndividualActionName (
    action_id        INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id)
        REFERENCES <ProtocolSubclassName>Action(action_id)
        ON DELETE CASCADE
);

-- 02
-- Individual action applications (subclass level 2)
CREATE TABLE IndividualActionNameApplication (
    action_application_id  INT NOT NULL,
    attribute_1       VARCHAR(100),
    attribute_2       NUMERIC(10,3),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES <ProtocolSubclassName>ActionApplication(action_application_id)
        ON DELETE CASCADE
);


