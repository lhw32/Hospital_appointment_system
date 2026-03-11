-- hospital_pkg.sql
CREATE OR REPLACE PROCEDURE create_appointment(
  p_patient_id IN NUMBER,
  p_doctor_id  IN NUMBER,
  p_start_time IN TIMESTAMP,
  p_end_time   IN TIMESTAMP,
  p_appt_id    OUT NUMBER
) AS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM APPOINTMENT a
  WHERE a.DOCTOR_ID = p_doctor_id
    AND a.STATUS = '예약'
    AND NOT (p_end_time <= a.START_TIME OR p_start_time >= a.END_TIME);
END;
