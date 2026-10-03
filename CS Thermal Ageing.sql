USE FULLDATABASE;

-- Protocol subclass - holds the two protocol-level attributes
CREATE TABLE Thermal_Ageing_Protocol (
    protocol_id       VARCHAR(50) NOT NULL,
    environment_spec  VARCHAR(100),
    pressure_spec     VARCHAR(100),
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);


-- Level 1 — structural marker (no attributes)
CREATE TABLE Thermal_Ageing_Action (
    action_id  INT NOT NULL,
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Heat_Ramp_Action
CREATE TABLE Heat_Ramp_Action (
    action_id         INT NOT NULL,
    start_temperature NUMERIC(6,2),
    end_temperature   NUMERIC(6,2),
    ramp_rate         NUMERIC(10,3),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Thermal_Ageing_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Soak_Action
CREATE TABLE Soak_Action (
    action_id    INT NOT NULL,
    temperature  NUMERIC(6,2),
    duration     NUMERIC(10,2),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Thermal_Ageing_Action(action_id)
        ON DELETE CASCADE
);


-- Level 2 — Cool_Down_Action
CREATE TABLE Cool_Down_Action (
    action_id       INT NOT NULL,
    cooling_method  VARCHAR(100),
    cooling_rate    NUMERIC(10,3),
    PRIMARY KEY (action_id),
    FOREIGN KEY (action_id) REFERENCES Thermal_Ageing_Action(action_id)
        ON DELETE CASCADE
);




-- Protocol application subclass
CREATE TABLE Thermal_Ageing_ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    actual_environment_spec  VARCHAR(100),
    actual_pressure_spec     VARCHAR(100),
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);


-- Level 1 — structural marker
CREATE TABLE Thermal_Ageing_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Heat_Ramp_Action_Application
CREATE TABLE Heat_Ramp_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_start_temperature NUMERIC(6,2),
    actual_end_temperature   NUMERIC(6,2),
    actual_ramp_rate         NUMERIC(10,3),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Thermal_Ageing_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Soak_Action_Application
CREATE TABLE Soak_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_temperature     NUMERIC(6,2),
    actual_duration        NUMERIC(10,2),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Thermal_Ageing_ActionApplication(action_application_id)
        ON DELETE CASCADE
);


-- Level 2 — Cool_Down_Action_Application
CREATE TABLE Cool_Down_ActionApplication (
    action_application_id  VARCHAR(50) NOT NULL,
    actual_cooling_method  VARCHAR(100),
    actual_cooling_rate    NUMERIC(10,3),
    PRIMARY KEY (action_application_id),
    FOREIGN KEY (action_application_id)
        REFERENCES Thermal_Ageing_ActionApplication(action_application_id)
        ON DELETE CASCADE
);





