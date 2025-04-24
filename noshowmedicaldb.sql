CREATE DATABASE noshows_db;
USE noshows_db;
CREATE TABLE appointments (
    PatientId BIGINT,
    AppointmentID BIGINT,
    Gender VARCHAR(10),
    ScheduledDay DATETIME,
    AppointmentDay DATETIME,
    Age INT,
    Neighbourhood VARCHAR(100),
    Scholarship BOOLEAN,
    Hipertension BOOLEAN,
    Diabetes BOOLEAN,
    Alcoholism BOOLEAN,
    Handcap INT,
    SMS_received BOOLEAN,
    No_show VARCHAR(5)
);
SELECT * FROM appointments LIMIT 10;
SELECT * FROM appointments
WHERE Age > 60
ORDER BY Age DESC;
SELECT No_show, COUNT(*) AS total
FROM appointments
GROUP BY No_show;
SELECT AVG(Age) AS avg_age
FROM appointments
WHERE No_show = 'Yes';
SELECT *
FROM appointments
WHERE Age > (SELECT AVG(Age) FROM appointments);
-- View of no-show rates by neighborhood
CREATE VIEW no_show_by_neighborhood AS
SELECT Neighbourhood, 
       COUNT(*) AS total_appointments,
       SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) AS missed_appointments
FROM appointments
GROUP BY Neighbourhood;
SELECT * FROM no_show_by_neighborhood
ORDER BY missed_appointments DESC;
CREATE INDEX idx_age ON appointments (Age);
CREATE INDEX idx_no_show ON appointments (No_show);