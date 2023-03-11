CREATE Database clinic;

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    data_of_birth Date,
    PRIMARY KEY(id)
);

CREATE TABLE treatments (
     id INT GENERATED ALWAYS AS IDENTITY,
     type VARCHAR(100),
     name VARCHAR(100),
     PRIMARY KEY(id)
)

CREATE TABLE medical_histories (
     id INT GENERATED ALWAYS AS IDENTITY,
     admitted_at timestamp,
     patients_id INT,
     status VARCHAR(100),
     PRIMARY KEY(id),
     CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
)

CREATE TABLE invoices (
     id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
)

CREATE TABLE invoice_items (
     id INT GENERATED ALWAYS AS IDENTITY,
     unit_price DECIMAL,
     quantity INT,
     total_price DECIMAL,
     invoice_id INT,
     treatment_id INT,
     PRIMARY KEY(id)
     CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE,
     CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE
)

CREATE TABLE medical_treatment_histories (
    medical_id INT NOT NULL REFERENCES medical_histories(id),
    treatment_id INT NOT NULL REFERENCES treatments(id),
    PRIMARY KEY (medical_id, treatment_id)
)