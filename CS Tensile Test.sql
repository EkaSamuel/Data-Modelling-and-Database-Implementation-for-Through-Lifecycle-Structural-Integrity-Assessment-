USE FULLDATABASE;

-- 01
-- Protocol Subclass (one per protocol type)
CREATE TABLE Tensile_Test_Protocol (
    protocol_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);

-- 02
-- Protocol Application Subclass (one per protocol type)
CREATE TABLE Tensile_Test_ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);




-- tensile test action class and its subclasses

-- Level 1 (for reference — already defined)

CREATE TABLE Tensile_Test_Action (
    action_id        INT NOT NULL,
    action_category  VARCHAR(50),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Pre_Test_Details
CREATE TABLE Pre_Test_Details (
    action_id             INT NOT NULL,
    specimen_id           VARCHAR(100),
    material_id           VARCHAR(100),
    aging_id              VARCHAR(100),
    test_temperature	  NUMERIC(6,2),
    test_laboratory       VARCHAR(100),
    test_standard         VARCHAR(100),
    specimen_geometry     VARCHAR(100),
    pre_test_observation  TEXT,
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Tensile_Test_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Test_Settings
CREATE TABLE Test_Settings (
    action_id                  INT NOT NULL,
    temperature_control        VARCHAR(100),
    heating_method             VARCHAR(50),
    test_machine               VARCHAR(100),
    machine_capacity           NUMERIC(10,3),
    extensometer_type          VARCHAR(100),
    extensometer_gauge_length  NUMERIC(10,3),
    clip_gauge_used            BOOLEAN,
    crosshead_speed            NUMERIC(10,3),
    strain_rate                NUMERIC(10,6),
    data_acquisition           VARCHAR(255),
    correlation_factor         NUMERIC(10,6),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Tensile_Test_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Test_Loading
CREATE TABLE Test_Loading (
    action_id                INT NOT NULL,
    load_cell_used           VARCHAR(100),
    initial_load             NUMERIC(10,3),
    load_cell_capacity		 VARCHAR(50),
    control_type             VARCHAR(50),
    control_rate_unit        VARCHAR(20),
    duration                 NUMERIC(10,2),
    true_stress_calculation  VARCHAR(100),
    maximum_load             NUMERIC(10,3),
    fracture_load            NUMERIC(10,3),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Tensile_Test_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Post_Test_Examination
CREATE TABLE Post_Test_Examination (
    action_id          INT NOT NULL,
    fracture_type      VARCHAR(100),
    fracture_location  VARCHAR(100),
    fracture_material  VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Tensile_Test_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Test_Finish
CREATE TABLE Test_Finish (
    action_id      INT NOT NULL,
    acceptance     VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Tensile_Test_Action(action_id)
        ON DELETE CASCADE
);




-- tensile test action applications and their subclasses


-- Level 1 — Tensile_Test_Action_Application
CREATE TABLE Tensile_Test_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    action_category        VARCHAR(50),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Pre_Test_Details_Application
CREATE TABLE Pre_Test_Details_Application (
    action_application_id   VARCHAR(50) NOT NULL,
    specimen_id             VARCHAR(50),
    material_id             VARCHAR(50),
    aging_id                VARCHAR(50),
    test_laboratory         VARCHAR(100),
    test_standard           VARCHAR(100),
    specimen_geometry       VARCHAR(100),
    pre_test_observation    TEXT,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Tensile_Test_ActionApplication(action_application_id)
        ON DELETE CASCADE
);
















-- Level 2 — Test_Settings_Application
CREATE TABLE Test_Settings_Application (
    action_application_id      VARCHAR(50) NOT NULL,
    actual_test_temperature    NUMERIC(6,2),
    actual_temperature_control VARCHAR(100),
    actual_heating_method      VARCHAR(50),
    actual_test_machine		   VARCHAR(100),
    actual_machine_capacity    NUMERIC(10,3),
    actual_extensometer_type   VARCHAR(100),
    actual_extensometer_gauge_length NUMERIC(10,3),
    actual_clip_gauge_used     BOOLEAN,
    actual_crosshead_speed     NUMERIC(10,3),
    actual_strain_rate         NUMERIC(10,6),
    actual_data_acquisition    VARCHAR(255),
    actual_correlation_factor  NUMERIC(10,6),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Tensile_Test_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Test_Loading_Application
CREATE TABLE Test_Loading_Application (
    action_application_id       VARCHAR(50) NOT NULL,
    actual_load_cell_used       VARCHAR(100),
    actual_load_capacity		VARCHAR(100),
    actual_initial_load         NUMERIC(10,3),
    actual_control_type         VARCHAR(50),
    actual_control_rate_unit    VARCHAR(20),
    actual_duration             NUMERIC(10,2),
    actual_true_stress_method   VARCHAR(100),
    actual_maximum_load         NUMERIC(10,3),
    actual_fracture_load        NUMERIC(10,3),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Tensile_Test_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Post_Test_Examination_Application
CREATE TABLE Post_Test_Examination_Application (
    action_application_id      VARCHAR(50) NOT NULL,
    actual_fracture_type       VARCHAR(100),
    actual_fracture_location   VARCHAR(100),
    actual_fracture_material   VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Tensile_Test_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Test_Finish_Application
CREATE TABLE Test_Finish_Application (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_acceptance      VARCHAR(100),
    completion_notes       TEXT,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Tensile_Test_ActionApplication(action_application_id)
        ON DELETE CASCADE
);
