USE FULLDATABASE;

-- Protocol subclass — holds protocol-level attributes
CREATE TABLE Material_Characterization_Protocol (
    protocol_id  VARCHAR(50) NOT NULL,
    laboratory   VARCHAR(100),
    heat         VARCHAR(50),
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);


-- Level 1 — structural marker
CREATE TABLE Material_Characterization_Action (
    action_id  INT NOT NULL,
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Chemical_Composition_Action
CREATE TABLE Chemical_Composition_Action (
    action_id              INT NOT NULL,
    measurement_method     VARCHAR(100),
    elements_measured      VARCHAR(255),
    analysis_standard      VARCHAR(100),
    calibration_reference  VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Material_Characterization_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Ferrite_Content_Action
CREATE TABLE Ferrite_Content_Action (
    action_id                  INT NOT NULL,
    instrument                 VARCHAR(100),
    probe_type                 VARCHAR(100),
    calibration_standard       VARCHAR(100),
    calibration_date           DATE,
    measurement_location       VARCHAR(100),
    number_of_readings         INT,
    measurement_method         VARCHAR(100),
    ferrite_calculation_method VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Material_Characterization_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Grain_Structure_Examination_Action
CREATE TABLE Grain_Structure_Examination_Action (
    action_id       INT NOT NULL,
    microscope_type VARCHAR(100),
    magnification   VARCHAR(50),
    etchant         VARCHAR(100),
    grain_distribution VARCHAR(100),
    image_reference VARCHAR(255),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Material_Characterization_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Hardness_Measurement_Action
CREATE TABLE Hardness_Measurement_Action (
    action_id              INT NOT NULL,
    indenter_type          VARCHAR(50),
    applied_load           NUMERIC(10,3),
    dwell_time             NUMERIC(10,2),
    measurement_location   VARCHAR(100),
    number_of_indentations INT,
    hardness_value         NUMERIC(10,3),
    hardness_std_dev       NUMERIC(10,3),
    test_standard          VARCHAR(100),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Material_Characterization_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Ferrite_Distribution_and_Morphology_Action
CREATE TABLE Ferrite_Distribution_and_Morphology_Action (
    action_id                     INT NOT NULL,
    distribution_measurement      VARCHAR(100),
    microscope_type               VARCHAR(100),
    magnification                 VARCHAR(50),
    etchant                       VARCHAR(100),
    examination_location          VARCHAR(100),
    number_of_fields_analyzed     INT,
    image_reference               VARCHAR(255),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Material_Characterization_Action(action_id)
        ON DELETE CASCADE
);


-- Protocol application subclass
CREATE TABLE Material_Characterization_ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    actual_laboratory        VARCHAR(100),
    actual_heat              VARCHAR(50),
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);


-- Level 1 — structural marker
CREATE TABLE Material_Characterization_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Chemical_Composition_Action_Application
CREATE TABLE Chemical_Composition_ActionApplication (
    action_application_id  		  VARCHAR(50) NOT NULL,
    actual_measurement_method     VARCHAR(100),
    actual_elements_measured      VARCHAR(255),
    actual_analysis_standard      VARCHAR(100),
    actual_calibration_reference  VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Material_Characterization_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Ferrite_Content_Action_Application
CREATE TABLE Ferrite_Content_ActionApplication (
    action_application_id      VARCHAR(50) NOT NULL,
    actual_instrument          VARCHAR(100),
    actual_probe_type          VARCHAR(100),
    actual_calibration_standard VARCHAR(100),
    actual_calibration_date    DATE,
    actual_measurement_location VARCHAR(100),
    actual_number_of_readings  INT,
    actual_measurement_method  VARCHAR(100),
    actual_ferrite_calculation_method VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Material_Characterization_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Grain_Structure_Examination_Action_Application
CREATE TABLE Grain_Structure_Examination_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_microscope_type VARCHAR(100),
    actual_magnification   VARCHAR(50),
    actual_etchant         VARCHAR(100),
    actual_image_reference VARCHAR(255),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Material_Characterization_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Hardness_Measurement_Action_Application
CREATE TABLE Hardness_Measurement_ActionApplication (
    action_application_id      VARCHAR(50) NOT NULL,
    actual_indenter_type       VARCHAR(50),
    actual_load                NUMERIC(10,3),
    actual_dwell_time          NUMERIC(10,2),
    actual_measurement_location VARCHAR(100),
    actual_number_of_indentations INT,
    actual_hardness_value      NUMERIC(10,3),
    actual_hardness_std_dev    NUMERIC(10,3),
    actual_test_standard       VARCHAR(100),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Material_Characterization_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Ferrite_Distribution_and_Morphology_Action_Application
CREATE TABLE Ferrite_Distribution_and_Morphology_ActionApplication (
    action_application_id         VARCHAR(50) NOT NULL,
    actual_distribution_measurement VARCHAR(100),
    actual_microscope_type        VARCHAR(100),
    actual_magnification          VARCHAR(50),
    actual_etchant                VARCHAR(100),
    actual_examination_location   VARCHAR(100),
    actual_number_of_fields_analyzed INT,
    actual_image_reference        VARCHAR(255),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Material_Characterization_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


