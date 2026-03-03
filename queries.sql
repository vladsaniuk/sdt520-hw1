-- =========================
-- HW1: Blood Donation Queries
-- =========================

-- Q1 (Required): Active donors who donated in the last 7 days (Operational)
SELECT
  d.id,
  d.first_name,
  d.last_name,
  d.blood_type,
  dn.date AS donation_date
FROM donor d
JOIN donation dn ON dn.donor_id = d.id
WHERE d.is_eligible_for_donation = TRUE
  AND dn.date >= current_date - 7
ORDER BY dn.date DESC, d.last_name ASC;


-- Q2 (Required): Blood centers/recipient clinics with highest number of requests in last 3 days (Analytical)
SELECT
  brc.id AS recipient_clinic_id,
  brc.name AS recipient_clinic_name,
  COUNT(*) AS requests_last_3_days
FROM blood_request r
JOIN blood_recipient_clinic brc ON brc.id = r.blood_recipient_clinic_id
WHERE r.request_date >= current_date - 3
GROUP BY brc.id, brc.name
ORDER BY requests_last_3_days DESC, brc.name ASC;


-- Q3 (Required): Donation statistics per blood type (Analytical)
SELECT
  d.blood_type,
  COUNT(*) AS donation_count,
  SUM(dn.amount_ml) AS total_volume_ml,
  AVG(dn.amount_ml) AS avg_volume_ml
FROM donation dn
JOIN donor d ON d.id = dn.donor_id
GROUP BY d.blood_type
ORDER BY donation_count DESC, d.blood_type ASC;


-- Q4 (Required): Donors with the rarest blood type (Window function)
WITH blood_counts AS (
  SELECT blood_type, COUNT(*) AS cnt
  FROM donor
  GROUP BY blood_type
),
ranked AS (
  SELECT
    blood_type,
    cnt,
    RANK() OVER (ORDER BY cnt ASC) AS rarity_rank
  FROM blood_counts
)
SELECT
  d.id,
  d.first_name,
  d.last_name,
  d.blood_type
FROM donor d
JOIN ranked r ON r.blood_type = d.blood_type
WHERE r.rarity_rank = 1
ORDER BY d.last_name ASC, d.first_name ASC;


-- Q5 (Required): Match requests to donations and show which requests are unfulfilled (Operational)
SELECT
  r.id AS request_id,
  r.request_date,
  brc.name AS recipient_clinic,
  r.blood_type AS requested_blood_type,
  r.amount_ml AS requested_amount_ml,
  r.status,
  r.fulfilled_by_donation_id,
  dn.date AS donation_date,
  dnr.first_name || ' ' || dnr.last_name AS donor_name,
  dnr.blood_type AS donor_blood_type
FROM blood_request r
JOIN blood_recipient_clinic brc ON brc.id = r.blood_recipient_clinic_id
LEFT JOIN donation dn ON dn.id = r.fulfilled_by_donation_id
LEFT JOIN donor dnr ON dnr.id = dn.donor_id
WHERE r.status = 'OPEN'
   OR r.fulfilled_by_donation_id IS NULL
ORDER BY r.request_date DESC, r.id ASC;


-- Q6 (Required): Identify donors eligible to donate again (CTE rule)
-- Medical/business rule used: eligible if last donation was >= 56 days ago AND donor flag is true.
WITH last_donation AS (
  SELECT
    d.id AS donor_id,
    MAX(dn.date) AS last_donation_date
  FROM donor d
  LEFT JOIN donation dn ON dn.donor_id = d.id
  GROUP BY d.id
)
SELECT
  d.id,
  d.first_name,
  d.last_name,
  d.blood_type,
  ld.last_donation_date
FROM donor d
JOIN last_donation ld ON ld.donor_id = d.id
WHERE d.is_eligible_for_donation = TRUE
  AND (ld.last_donation_date IS NULL OR ld.last_donation_date <= current_date - 56)
ORDER BY ld.last_donation_date NULLS FIRST, d.last_name ASC;


-- Q7 (Extra, satisfies "JOIN across 3+ tables" strongly): Delivered donations full trace (3+ tables)
SELECT
  del.id AS delivery_id,
  del.date AS delivery_date,
  dn.id AS donation_id,
  dn.date AS donation_date,
  dn.amount_ml,
  donor.first_name || ' ' || donor.last_name AS donor_name,
  donor.blood_type,
  doc.first_name || ' ' || doc.last_name AS doctor_name,
  c.name AS donation_center,
  brc.name AS recipient_clinic,
  z.city AS recipient_city
FROM delivery del
JOIN donation dn ON dn.id = del.donation_id
JOIN donor ON donor.id = dn.donor_id
JOIN doctor doc ON doc.id = dn.doctor_id
JOIN clinic c ON c.id = dn.clinic_id
JOIN blood_recipient_clinic brc ON brc.id = del.blood_recipient_clinic_id
LEFT JOIN zip z ON z.zip = brc.zip
ORDER BY del.date DESC, del.id ASC;