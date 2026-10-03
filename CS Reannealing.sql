USE FULLDATABASE;

CREATE TABLE Reannealing_Protocol (
    protocol_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_id),
    FOREIGN KEY (protocol_id) REFERENCES Protocol(protocol_id)
        ON DELETE CASCADE
);

-- 02
-- Protocol Application Subclass (one per protocol type)
CREATE TABLE Reannealing_ProtocolApplication (
    protocol_application_id  VARCHAR(50) NOT NULL,
    PRIMARY KEY (protocol_application_id),
    FOREIGN KEY (protocol_application_id)
        REFERENCES ProtocolApplication(protocol_application_id)
        ON DELETE CASCADE
);