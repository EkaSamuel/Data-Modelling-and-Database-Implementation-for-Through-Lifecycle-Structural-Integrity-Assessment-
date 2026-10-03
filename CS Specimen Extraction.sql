
USE FULLDATABASE;

-- Protocol subclass (if any protocol-level attributes)
-- For now, leave empty (markers only) unless you identify protocol-level attributes

CREATE TABLE Specimen_Extraction_Protocol (
    protocol_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);


-- Level 1 — structural marker
CREATE TABLE Specimen_Extraction_Action (
    action_id  INT NOT NULL,
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Planning
CREATE TABLE Planning (
    action_id                  INT NOT NULL,
    extraction_plan_reference  VARCHAR(100),
    planned_specimen_count     INT,
    planned_orientation        VARCHAR(20),
    planned_location           VARCHAR(100),
    planning_standard          VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Marking_and_Layout
CREATE TABLE Marking_and_Layout (
    action_id           INT NOT NULL,
    marking_number      VARCHAR(50),
    extract_type        VARCHAR(50),
    extract_orientation VARCHAR(20),
    extract_id          VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);


-- Level 3 — Single_Point_Cylindrical_Marking
CREATE TABLE Single_Point_Cylindrical_Marking (
    action_id             INT NOT NULL,
    axial_position        NUMERIC(10,3),
    angle                 NUMERIC(6,2),
    radius                NUMERIC(10,3),
    penetration_length    NUMERIC(10,3),
    penetration_direction VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Marking_and_Layout(action_id)
        ON DELETE CASCADE
);


-- Level 3 — Single_Point_Cartesian_Marking
CREATE TABLE Single_Point_Cartesian_Marking (
    action_id             INT NOT NULL,
    x_point               NUMERIC(10,3),
    y_point               NUMERIC(10,3),
    z_point               NUMERIC(10,3),
    z_penetration         NUMERIC(10,3),
    penetration_direction VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Marking_and_Layout(action_id)
        ON DELETE CASCADE
);


-- Level 3 — Multi_Point_Cylindrical_Marking
CREATE TABLE Multi_Point_Cylindrical_Marking (
    action_id             INT NOT NULL,
    axial_position_1      NUMERIC(10,3),
    angle_1               NUMERIC(6,2),
    axial_position_2      NUMERIC(10,3),
    angle_2               NUMERIC(6,2),
    axial_position_3      NUMERIC(10,3),
    angle_3               NUMERIC(6,2),
    axial_position_4      NUMERIC(10,3),
    angle_4               NUMERIC(6,2),
    penetration_length    NUMERIC(10,3),
    penetration_direction VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Marking_and_Layout(action_id)
        ON DELETE CASCADE
);


-- Level 3 — Multi_Point_Cartesian_Marking
CREATE TABLE Multi_Point_Cartesian_Marking (
    action_id             INT NOT NULL,
    x_point_1             NUMERIC(10,3),
    y_point_1             NUMERIC(10,3),
    x_point_2             NUMERIC(10,3),
    y_point_2             NUMERIC(10,3),
    x_point_3             NUMERIC(10,3),
    y_point_3             NUMERIC(10,3),
    x_point_4             NUMERIC(10,3),
    y_point_4             NUMERIC(10,3),
    z_penetration         NUMERIC(10,3),
    penetration_direction VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Marking_and_Layout(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Sectioning_and_Cutting
CREATE TABLE Sectioning_and_Cutting (
    action_id         INT NOT NULL,
    cutting_method    VARCHAR(100),
    equipment_used    VARCHAR(100),
    cutting_speed     NUMERIC(10,3),
    feed_rate         NUMERIC(10,3),
    coolant           VARCHAR(50),
    blade_type        VARCHAR(50),
    cutting_standard  VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Blank_Identification
CREATE TABLE Blank_Identification (
    action_id                INT NOT NULL,
    blank_id                 VARCHAR(50),
    blank_label              VARCHAR(100),
    marking_method           VARCHAR(100),
    label_location           VARCHAR(100),
    identification_standard  VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Inspection
CREATE TABLE Inspection (
    action_id            INT NOT NULL,
    inspection_method    VARCHAR(100),
    inspection_criteria  VARCHAR(100),
    inspection_result    VARCHAR(50),
    defect_type          VARCHAR(100),
    defect_location      VARCHAR(100),
    inspector            VARCHAR(100),
    inspection_date      DATE,
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Documentation_of_Extraction
CREATE TABLE Documentation_of_Extraction (
    action_id                INT NOT NULL,
    document_reference       VARCHAR(100),
    drawing_reference        VARCHAR(100),
    report_reference         VARCHAR(100),
    photograph_reference     VARCHAR(100),
    documentation_standard   VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Specimen_Extraction_Action(action_id)
        ON DELETE CASCADE
);

CREATE TABLE Specimen_Extraction_ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Specimen_Extraction_Action_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES ActionApplication(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Planning_Application (
    action_application_id      VARCHAR(50) NOT NULL,
    actual_plan_reference      VARCHAR(100),
    actual_specimen_count      INT,
    actual_orientation         VARCHAR(20),
    actual_location            VARCHAR(100),
    actual_planning_standard   VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Marking_and_Layout_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_marking_number  VARCHAR(50),
    actual_extract_type    VARCHAR(50),
    actual_extract_orientation VARCHAR(20),
    actual_extract_id      VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);

-- Level 3 application subclasses
CREATE TABLE Single_Point_Cylindrical_Marking_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_axial_position  NUMERIC(10,3),
    actual_angle           NUMERIC(6,2),
    actual_radius          NUMERIC(10,3),
    actual_penetration_length NUMERIC(10,3),
    actual_penetration_direction VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Marking_and_Layout_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Single_Point_Cartesian_Marking_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_x_point         NUMERIC(10,3),
    actual_y_point         NUMERIC(10,3),
    actual_z_point         NUMERIC(10,3),
    actual_z_penetration   NUMERIC(10,3),
    actual_penetration_direction VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Marking_and_Layout_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Multi_Point_Cylindrical_Marking_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_axial_position_1 NUMERIC(10,3),
    actual_angle_1         NUMERIC(6,2),
    actual_axial_position_2 NUMERIC(10,3),
    actual_angle_2         NUMERIC(6,2),
    actual_axial_position_3 NUMERIC(10,3),
    actual_angle_3         NUMERIC(6,2),
    actual_axial_position_4 NUMERIC(10,3),
    actual_angle_4         NUMERIC(6,2),
    actual_penetration_length NUMERIC(10,3),
    actual_penetration_direction VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Marking_and_Layout_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Multi_Point_Cartesian_Marking_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_x_point_1       NUMERIC(10,3),
    actual_y_point_1       NUMERIC(10,3),
    actual_x_point_2       NUMERIC(10,3),
    actual_y_point_2       NUMERIC(10,3),
    actual_x_point_3       NUMERIC(10,3),
    actual_y_point_3       NUMERIC(10,3),
    actual_x_point_4       NUMERIC(10,3),
    actual_y_point_4       NUMERIC(10,3),
    actual_z_penetration   NUMERIC(10,3),
    actual_penetration_direction VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Marking_and_Layout_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Sectioning_and_Cutting_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_cutting_method  VARCHAR(100),
    actual_equipment_used  VARCHAR(100),
    actual_cutting_speed   NUMERIC(10,3),
    actual_feed_rate       NUMERIC(10,3),
    actual_coolant         VARCHAR(50),
    actual_blade_type      VARCHAR(50),
    actual_cutting_standard VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Blank_Identification_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_blank_id        VARCHAR(50),
    actual_blank_label     VARCHAR(100),
    actual_marking_method  VARCHAR(100),
    actual_label_location  VARCHAR(100),
    actual_identification_standard VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Inspection_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_inspection_method VARCHAR(100),
    actual_inspection_criteria VARCHAR(100),
    actual_inspection_result VARCHAR(50),
    actual_defect_type     VARCHAR(100),
    actual_defect_location VARCHAR(100),
    actual_inspector       VARCHAR(100),
    actual_inspection_date DATE,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);

CREATE TABLE Documentation_of_Extraction_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_document_reference VARCHAR(100),
    actual_drawing_reference VARCHAR(100),
    actual_report_reference VARCHAR(100),
    actual_photograph_reference VARCHAR(100),
    actual_documentation_standard VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Specimen_Extraction_Action_Application(action_application_id)
        ON DELETE CASCADE
);