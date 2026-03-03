-- Blood Donation Coordination System
-- PostgreSQL DDL

CREATE TABLE zip (
    zip         VARCHAR(10)  PRIMARY KEY,
    city        VARCHAR(100) NOT NULL
);

CREATE TABLE clinic (
    id          SERIAL       PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    zip         VARCHAR(10)  REFERENCES zip(zip),
    address_line VARCHAR(200)
);

CREATE TABLE doctor_home_clinic (
    id          SERIAL       PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    zip         VARCHAR(10)  REFERENCES zip(zip),
    address_line VARCHAR(200)
);

CREATE TABLE blood_recipient_clinic (
    id          SERIAL       PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    zip         VARCHAR(10)  REFERENCES zip(zip),
    address_line VARCHAR(200),
    demand      NUMERIC(6,2)
);

CREATE TABLE doctor (
    id              SERIAL       PRIMARY KEY,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    home_clinic_id  INT          REFERENCES doctor_home_clinic(id)
);

CREATE TABLE donor (
    id                      SERIAL       PRIMARY KEY,
    first_name              VARCHAR(100) NOT NULL,
    last_name               VARCHAR(100) NOT NULL,
    blood_type              VARCHAR(5)   NOT NULL,
    last_health_check_date  DATE,
    is_eligible_for_donation BOOLEAN     NOT NULL DEFAULT TRUE
);

CREATE TABLE donation (
    id          SERIAL       PRIMARY KEY,
    date        DATE         NOT NULL,
    donor_id    INT          NOT NULL REFERENCES donor(id),
    doctor_id   INT          NOT NULL REFERENCES doctor(id),
    clinic_id   INT          NOT NULL REFERENCES clinic(id),
    amount_ml   NUMERIC(6,2) NOT NULL
);

CREATE TABLE delivery (
    id                      SERIAL       PRIMARY KEY,
    date                    DATE         NOT NULL,
    donation_id             INT          UNIQUE REFERENCES donation(id),
    blood_recipient_clinic_id INT        REFERENCES blood_recipient_clinic(id)
);


-- Requests from recipient clinics (extra needed by HW1 rubric)

CREATE TABLE blood_request (
    id                      SERIAL PRIMARY KEY,
    request_date            DATE         NOT NULL,
    blood_recipient_clinic_id INT        NOT NULL REFERENCES blood_recipient_clinic(id),
    blood_type              VARCHAR(5)   NOT NULL,
    amount_ml               NUMERIC(6,2) NOT NULL CHECK (amount_ml > 0),
    status                  VARCHAR(10)  NOT NULL CHECK (status IN ('OPEN','FULFILLED','CANCELLED')),
    fulfilled_by_donation_id INT         UNIQUE REFERENCES donation(id)  -- NULL if unfulfilled
);